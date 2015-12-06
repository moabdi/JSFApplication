/*
 * ContainerUserProvider.java
 *
 * Created on March 19, 2007, 10:01 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package metier.eps.jsf.security.usersession;

import metier.eps.jsf.security.*;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import metier.eps.jsf.security.User;
import metier.eps.jsf.security.UserProvider;

/**
 *
 * @author Vinicius
 */
public class SessionUserProvider implements UserProvider {
  public User getUser() {
    HttpSession session = 
        (HttpSession) 
        FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    if(session==null) return null;
    else return findUserInSession(session);
  }
  public static User findUserInSession(HttpSession session) {
    User user = null;
    user = (User) session.getAttribute("user");
    return user;
  }
}
