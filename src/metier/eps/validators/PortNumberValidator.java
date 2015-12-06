package metier.eps.validators;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.ConverterException;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;
import javax.xml.bind.ValidationException;

import com.sun.faces.util.MessageFactory;

import metier.eps.messages.BuildMessage;

public class PortNumberValidator implements Validator{
	
	private static final String text = "(\\d){1,9}";
	
	public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
		String MessageBundle = "Validator_int";
		String MessageBundle2 = "Port_length";
		Object params[] = null;
		List test = new ArrayList();
		test.add(value);
		params = test.toArray();
		
		//String text = "^[0-9]*[1-9]+$|^[1-9]+[0-9]*$";
		
		Pattern mask =  Pattern.compile(text);
		Matcher matcher = mask.matcher(value.toString());
		
		if(!matcher.find()){
			
				throw new ValidatorException(new FacesMessage(BuildMessage.getMessageResourceString(context.getApplication()
					.getMessageBundle(), MessageBundle, params, context.getViewRoot()
					.getLocale()) ));
			
		}else{
			
			if (value.toString().length() < 4){
				
				throw new ValidatorException(new FacesMessage(BuildMessage.getMessageResourceString(context.getApplication()
						.getMessageBundle(), MessageBundle2, params, context.getViewRoot()
						.getLocale()) ));
			}
		}
	}

}
