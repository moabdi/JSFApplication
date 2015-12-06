package metier.eps.validators;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import metier.eps.messages.BuildMessage;

public class NumberValidator implements Validator{

	public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
		String MessageBundle = "Validator_Number";
		Object params[] = null;
		List test = new ArrayList();
		test.add(value);
		params = test.toArray();
		
		try {
			Double.parseDouble(value.toString());
		} catch (Exception e) {
			throw new ValidatorException(new FacesMessage(BuildMessage.getMessageResourceString(context.getApplication()
					.getMessageBundle(), MessageBundle, params, context.getViewRoot()
					.getLocale()) ));
		}
	}

}
