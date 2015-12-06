package metier.validators;

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

public class PourcentValidator implements Validator{

	public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
		String MessageBundle = "Validator_Pourcent";
		Object params[] = null;
		List test = new ArrayList();
		test.add(value);
		params = test.toArray();
		String text = "^([0-9]{1,3})$" +
		"|^([0-9]{1,3})+(\\.)+([0-9]{1,6})$";
		Pattern mask 	=  Pattern.compile(text);
		Matcher matcher = mask.matcher(value.toString());
		
		if(!matcher.find()){
			
			throw new ValidatorException(new FacesMessage(BuildMessage.getMessageResourceString(context.getApplication()
					.getMessageBundle(), MessageBundle, params, context.getViewRoot()
					.getLocale()) ));
		}
	}

}
