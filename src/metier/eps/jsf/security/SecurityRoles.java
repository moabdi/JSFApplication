/*
 * SecureAction.java
 *
 * Created on March 13, 2007, 5:51 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package metier.eps.jsf.security;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *
 * @author Vinicius
 */
@Retention(RetentionPolicy.RUNTIME)      
@Target(ElementType.METHOD)   
public @interface SecurityRoles {
  public String value();  
}
