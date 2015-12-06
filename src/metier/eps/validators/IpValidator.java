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

public class IpValidator implements Validator{

	public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
		String MessageBundle = "Validator_IpAdress";
		Object params[] = null;
		List test = new ArrayList();
		test.add(value);
		params = test.toArray();
		String text = "^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\\."+
		"([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$";
		Pattern mask 	=  Pattern.compile(text);
		Matcher matcher = mask.matcher(value.toString());
		
		if(!matcher.find()){
			
			throw new ValidatorException(new FacesMessage(BuildMessage.getMessageResourceString(context.getApplication()
					.getMessageBundle(), MessageBundle, params, context.getViewRoot()
					.getLocale()) ));
		}
	}

}
