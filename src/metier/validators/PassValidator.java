package metier.validators;

/*import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import dao.DaoImpl;
import dao.model.Message;
import dao.model.UserManagement;
*/
public class PassValidator { //implements Validator {
/*
	public void validate(FacesContext arg0, UIComponent arg1, Object arg2)	throws ValidatorException {
		
		String text = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[-+!*$@%_])([-+!*$@%_\\w]{8,20})$";		
		Pattern mask =  Pattern.compile(text);
		Matcher matcher = mask.matcher(arg2.toString());
		if (!matcher.find()){
			throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"password invalid", "Password invalid"));
		}
		else{	 
			 DaoImpl userdao = new DaoImpl();
			 UserManagement user = new UserManagement();
			 user = (UserManagement) userdao.findById("UserManagement", arg2.toString());
			 if(user != null){
				 DaoImpl msgdao;
				 Message message;
				
				 msgdao = new DaoImpl();
				 message = new Message();
				 message = (Message)msgdao.findById("Message",5);
				 
				 throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
							message.getFrMessage(), message.getFrMessage()));
			 }
		}
	}*/

}
