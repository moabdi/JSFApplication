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
public @interface SecurityLogin {
	public String value();
}