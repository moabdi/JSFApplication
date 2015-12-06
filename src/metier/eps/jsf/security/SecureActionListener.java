/*
 * MODELO DE SEGURANÇA BASEADO EM METODOS COM ANOTAÇÕES
 *
 * Este modelo de segurança trabalha com os seguintes
 * estados:
 *
   0. chamou metodo nao protegido
   1. chamou metodo protegido e nao estava logado
   2. chamou metodo protegido e estava logado
   3. estava logado e tem direito de acesso ao metodo protegido
   4. estava logado mas nao tem direito de acesso ao metodo protegido
   5. foi direcionado para login
   6. fez o login com sucesso
   7. nao fez o login com sucesso
   8. fez login com sucesso mas nao tem direito de acesso ao metodo protegido
   9. fez login com sucesso e tem direito de acesso ao metodo protegido
 *
 * No código voce encontrara demarcoes que identificao em
 * qual estado aquele codigo pode ser atingido.
 *
 */
package metier.eps.jsf.security;

import java.util.logging.Logger;
import javax.faces.context.FacesContext;
import javax.faces.event.AbortProcessingException;
import javax.faces.event.ActionEvent;
import javax.faces.event.ActionListener;

/**
 *
 * @author Vinicius
 */
public class SecureActionListener implements ActionListener {
  private ActionListener parent;
  static Logger logger = Logger.getLogger("SECURITY-JSF");
  private UserProvider userProvider;
  
// init code...
  public void processAction(ActionEvent event) throws AbortProcessingException {
    if(! (event.getSource() instanceof javax.faces.component.UICommand)) {
      parent.processAction(event);
      return;
    }
    if(userProvider==null) initUserProvider();
    javax.faces.component.UICommand comando = (javax.faces.component.UICommand) event.getSource();
    SecureNavigationHandler secnav = (SecureNavigationHandler) FacesContext.getCurrentInstance().getApplication().getNavigationHandler();
    User user = userProvider.getUser();
    if(comando==null || comando.getAction()==null) return;
    String expFullAction = comando.getAction().getExpressionString();
    logger.info("SecurityManager: isProtectedMethod? " + expFullAction + " = "+ SecurityHelper.isMethodAnnotated(expFullAction, SecurityRoles.class));
    if(SecurityHelper.isMethodAnnotated(expFullAction, SecurityRoles.class)) {
      if(user == null) { //Login required....
        // ESTADO No. 1:
        // chamou metodo protegido e nao estava logado
        logger.info("Globalcode Security Manager: user not logged. Changing  NavigationHandler");
        // vai guardar o memento da ação desejada pelo usuário
        SecurityHelper.setOldEvent(event);
        
        // ESTADO No. 5:
        // foi direcionado para login
        // o SecureNavigationHandler vai perguntar para o Helper se getAuthenticationRequired
        // sendo true navega para a pagina
        SecurityHelper.setAuthenticationRequired(true);
        secnav.handleNavigation(FacesContext.getCurrentInstance(), expFullAction, "");
        return;
      }
    } else {
      // ESTADO No. 0:
      // chamou metodo nao protegido
      logger.info("Globalcode Security Manager: processAction unprotected method");
      parent.processAction(event);
      
      //if(!expFullAction.equals(SecurityHelper.AUTHENTICATION_EXPRESSION)) {
      if(!SecurityHelper.isMethodAnnotated(expFullAction, SecurityLogin.class)) {
        //Nao esta mais em processo de login...
        logger.info("Globalcode Security Manager: cleaning oldActionMethod, oldActionView and AuthenticationRequired");
        SecurityHelper.setOldActionMethod(null);
        SecurityHelper.setOldActionView(null);
        SecurityHelper.setAuthenticationRequired(false);
      } else {
        logger.info("Globalcode Security Manager: user logged in");
        if(userProvider.getUser()!=null) {
        	//SecurityHelper.setOldActionMethod(expFullAction); //YAA
          // ESTADO No. 6:
          // fez o login com sucesso
          if(SecurityHelper.getOldActionMethod()==null) {
            //ESTADO No. 10:
            //Fez o login ansioso, sem chamar metodo
            logger.info("Globalcode Security Manager: eager login");
          } else {
            logger.info("Globalcode Security Manager: lazy login, checking roles method oldActionMethod=" + SecurityHelper.getOldActionMethod());
            if(SecurityHelper.checkMethodPermission(SecurityHelper.getOldActionMethod(), userProvider.getUser())) {
              // ESTADO No. 9:
              // fez login preguisoço com sucesso e tem direito de acesos ao metodo protegido
              logger.info("Globalcode Security Manager: user logged and has access to protected method");
              SecurityHelper.setOldActionMethod(null);
              SecurityHelper.setOldActionView(null);
              SecurityHelper.setAuthenticationRequired(false);
              parent.processAction(SecurityHelper.getOldEvent());
            } else {
              //Estado No. 8:
              //fez login com sucesso mas nao tem direito de acesso ao metodo protegido
              logger.info("Globalcode Security Manager: user logged but has not required roles to protected method");
            }
          }
        } else {
          //Estado No. 7:
          // não fez login com sucesso
          logger.info("Globalcode Security Manager: user not logged.");
        }
        return;
      }
    }
    //Estado No. 2:
    //chamou metodo protegido e estava logado
    logger.info("Globalcode Security Manager: checando permissões no método.");
    boolean granted = SecurityHelper.checkMethodPermission(expFullAction, user);
    if(granted) {
      //Estado No. 3:
      //estava logado e tem direito de acesso ao metodo protegido
      logger.info("Globalcode Security Manager: permissão encontrada");
      parent.processAction(event);
    } else {
      //Estado No. 4:
      //estava logado mas nao tem direito de acesso ao metodo protegido
      logger.info("Globalcode Security Manager: Permissao nao encontrada...");
      //TODO: permitir configuração de mensagem de erro
      //JSFHelper.addGlobalMessage("Você não tem permissão para acessar esta funcionalidade.");
    }
  }
  
  
  public SecureActionListener() {
  }
  public SecureActionListener(ActionListener parent) {
    this.parent=parent;
  }
  public void initUserProvider() {
    /*String loginExpression = FacesContext.getCurrentInstance().getExternalContext().getInitParameter("jsf-security-login-expression");
    logger.info("Gestor Segurança: jsf-security-login-expression " + loginExpression);
    if(loginExpression!=null && !loginExpression.equals("")){
      SecurityHelper.AUTHENTICATION_EXPRESSION = loginExpression;
    }*/
    String className = FacesContext.getCurrentInstance().getExternalContext().getInitParameter("jsf-security-user-provider");
    if(className==null || className.equals("")) {
      className = "br.com.globalcode.jsf.security.container.ContainerUserProvider";
    }
    logger.info("Gestor Segurança: jsf-security-user-provider " + className);
    try {
      Class classProvider = Class.forName(className);
      userProvider = (UserProvider) classProvider.newInstance();
    } catch(Exception erro) {
      userProvider = null;
      logger.severe("Erro ao inicializar UserProvider. Classe configurada provavelmente não existe.");
    }
    
  }
  
}


