/*
 * SecureNaviagationHanlder.java
 *
 * Created on March 14, 2007, 2:39 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package metier.eps.jsf.security;

import static metier.eps.jsf.security.SecurityHelper.*;

import java.util.logging.Logger;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

/**
 *
 * @author Vinicius
 */
public class SecureNavigationHandler extends NavigationHandler{
  static Logger logger = Logger.getLogger("SECURITY-JSF");
  private NavigationHandler handler;
  
  public SecureNavigationHandler(NavigationHandler handler) {
    super();
    this.handler = handler;
  }
  public void handleNavigation(FacesContext fc, String actionMethod, String actionView) {
    logger.info("Globalcode Security Navigation Manager: handleNavigation actionMethod=" + actionMethod
        + " actionView=" + actionView);
    if(getAuthenticationRequired()) {
      logger.info("Globalcode Security Navigation Manager: login required, redirecting to login ...");
      logger.info("Globalcode Security Navigation Manager: keeping old actionMethod: " + actionMethod);
      logger.info("Globalcode Security Navigation Manager: keeping old actionView: " + actionView);
      setOldActionMethod(actionMethod);
      setOldActionView(actionView);
      handler.handleNavigation(fc, "login", "login");
    } else {
      //Caso exista um OldActionMethod significa que
      //a conversação de login ainda não acabou, ou seja,
      //o ActionListener este em fase de login
      //Este é o estado mais dificil de entender,
      //desta maquina de segurança. Cuidado na documentacao.
      if(getOldActionMethod()==null) {
        logger.info("Globalcode Security Navigation Manager: navigating to actionView=" + actionView);
        handler.handleNavigation(fc, actionMethod, actionView);
      }
    }
  }
}
