package metier.eps.validators;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import metier.eps.messages.BuildMessage;

public class ListValidator implements Validator {
	
	public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
		
		String MessageBundle = "Validator_List";
		Object params[] = null;
		List test = new ArrayList();
		test.add(value.toString());
		params = test.toArray();
		
		System.out.println("List validator");		
		 
		 if (value != null && value.toString().trim()!=""){
			 	System.out.println("value ok");
		 }else{
			 
			 throw new ValidatorException(new FacesMessage(BuildMessage.getMessageResourceString(context.getApplication()
					.getMessageBundle(), MessageBundle, params, context.getViewRoot()
					.getLocale()) ));
		}
	}
}
