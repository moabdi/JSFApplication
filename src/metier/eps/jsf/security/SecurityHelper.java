/*
 * SecureHelper.java
 *
 * Created on July 24, 2007, 6:32 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package metier.eps.jsf.security;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.logging.Logger;
import javax.faces.context.FacesContext;
import javax.faces.el.ValueBinding;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vinicius
 */
public class SecurityHelper {
  public static final String LOGIN_NAV_ID = "login";
  //public static String AUTHENTICATION_EXPRESSION = "#{LoginMB.login}";
  
  static Logger logger = Logger.getLogger("SECURITY-JSF");
  
  public static boolean isMethodAnnotated(String expFullAction, java.lang.Class<? extends Annotation> annotation) {
    String beanName = expFullAction.substring(
        expFullAction.indexOf("{")+1,
        expFullAction.indexOf(".")
        );
    String methodName = expFullAction.substring(
        expFullAction.indexOf(".")+1,
        expFullAction.indexOf("}")
        );
    ValueBinding vb = FacesContext.getCurrentInstance().getApplication().createValueBinding( "#{" + beanName + "}");
    FacesContext ctx = FacesContext.getCurrentInstance();
    Object bean = vb.getValue(ctx);
    Method metodo;
    try {
      metodo = bean.getClass().getMethod(methodName);
    } catch (Exception ex) {
      ex.printStackTrace();
      return false;
    }
    return metodo.isAnnotationPresent(annotation);
  }
  
  public static boolean checkMethodPermission(String expFullAction, User user) {
    String beanName = expFullAction.substring(
        expFullAction.indexOf("{")+1,
        expFullAction.indexOf(".")
        );
    String methodName = expFullAction.substring(
        expFullAction.indexOf(".")+1,
        expFullAction.indexOf("}")
        );
    FacesContext context = FacesContext.getCurrentInstance();
    ValueBinding vb = FacesContext.getCurrentInstance().getApplication().createValueBinding( "#{" + beanName + "}");
    Object bean = vb.getValue(context);
    Method metodo;
    try {
      metodo = bean.getClass().getMethod(methodName);
    } catch (Exception ex) {
      ex.printStackTrace();
      return false;
    }
    //Caso não tenha a annotation de segurança, ok da o acesso.
    if(!metodo.isAnnotationPresent(SecurityRoles.class)) {
      return true;
    }
    Annotation annotationObj = metodo.getAnnotation(SecurityRoles.class);
    //Lendo as roles da annotation do método protegido
    String rolesString = annotationObj.toString();
    rolesString = rolesString.substring(rolesString.indexOf("value=")+6, rolesString.length()-1);
    //Não tenho certeza se na espec Java EE 5 permitem nome de roles com espaco.
    //TODO: confirmar.
    rolesString.replaceAll(" ", "");
    String roles[] = rolesString.split(",");
    //Obter usuário
    boolean granted = false;
    //Check user roles Vs. method roles
    for(String role : roles) {
      if(user.isUserInRole(role)) {
        granted = true;
      }
    }
    return granted;
  }
  
  public static boolean checkPageAccessPermission(String pageRoles, User user) {
	    
	  	pageRoles.replaceAll(" ", "");
	    String roles[] = pageRoles.split(",");
	    
	    boolean granted = false;
	    
	    for(String role : roles) {
	      if(user.isUserInRole(role)) {
	        granted = true;
	      }
	    }
	    return granted;
	  }
  
  public static String getOldActionMethod() {
    HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null) return null;
    else return (String) session.getAttribute("jsf-sec-old-action-method");
  }
  public static String getOldActionView() {
    HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null) return null;
    else return (String) session.getAttribute("jsf-sec-old-action-view");
  }
  public static void setOldActionView(String m) {
    HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null) return;
    else session.setAttribute("jsf-sec-old-action-view",m);
  }
  public static boolean getAuthenticationRequired() {
    HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null || session.getAttribute("jsf-sec-auth-req")==null) return false;
    else return (Boolean) session.getAttribute("jsf-sec-auth-req");
  }
  public static void setAuthenticationRequired(Boolean b ) {
    HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null) return;
    else session.setAttribute("jsf-sec-auth-req",b);
    
  }
  public static void setOldActionMethod(String m) {
    HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null) return;
    else session.setAttribute("jsf-sec-old-action-method",m);
  }
  public static void setOldEvent(ActionEvent event) {
    HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null) return;
    else session.setAttribute("jsf-old-event",event);
    
  }
  public static ActionEvent getOldEvent() {
    HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null || session.getAttribute("jsf-old-event")==null) return null;
    else return (ActionEvent) session.getAttribute("jsf-old-event");
  }
  public static void login(User user) {
    SecurityHelper.setAuthenticationRequired(false);
    ((HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true)).setAttribute("user", user);
    
  }
  public static void logout() {
    ((HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true)).removeAttribute("user");
  }
  
}
