/*
 * User.java
 *
 * Created on March 19, 2007, 9:33 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package metier.eps.jsf.security;

/**
 *
 * @author Vinicius
 */
public interface User {
  public String getLoginName();
  public boolean isUserInRole(String roleName);
  
}
