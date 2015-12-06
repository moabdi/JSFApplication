package metier.validators;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import dao.DAO;
import dao.Hibernate.Model.Customers;

public class MsisdnValidator implements Validator {

	public void validate(FacesContext arg0, UIComponent arg1, Object arg2) throws ValidatorException {
		
			DAO userdao = new DAO();
			Customers user = new Customers();
			user = (Customers) userdao.findById("Customers", arg2.toString());
			
			if(user != null){												
				
				throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
						"", "Déjà exist?"));
			}
		
	}		
}
