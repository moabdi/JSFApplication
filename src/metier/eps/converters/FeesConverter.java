package metier.eps.converters;

import java.math.BigDecimal;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;

import metier.eps.utils.Exponent;
import metier.eps.utils.FormatUtils;
import metier.eps.utils.SessionUtils;

public class FeesConverter implements Converter {
	public Object getAsObject(FacesContext context, UIComponent component,
			String value) throws ConverterException {
		
		String currency;
		currency = "currency_" + component.getId();
		Exponent exp = new Exponent();
		Integer exponent;
		exponent = exp.refreshExponent((String) SessionUtils
				.getAttribute(currency));
		if (value == null || value.trim().length() == 0) {
			return null;
		}

		try {
			Double number = Double.parseDouble(value.replace(',', '.'));

			String numberString = FormatUtils.format(number, exponent);
			BigDecimal numberBigDecimal = new BigDecimal(numberString.replace(',', '.'));
			return numberBigDecimal;
		} catch (NumberFormatException e) {

			e.printStackTrace();
		}

		return null;
	}

	public String getAsString(FacesContext context, UIComponent component,
			Object value) throws ConverterException {
		String currency;
		currency = "currency_" + component.getId();
		Exponent exp = new Exponent();
		Integer exponent;
		exponent = exp.refreshExponent((String) SessionUtils
				.getAttribute(currency));

		if (value == null) {
			return null;
		}

		try {
			String numberString = FormatUtils.format((BigDecimal)value, exponent);
			return numberString.replace(',', '.');

		} catch (NumberFormatException e) {

			e.printStackTrace();
		}

		return null;
	}


}
