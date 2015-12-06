package metier.eps.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import javax.faces.component.UIComponent;

public class FormatUtils {

	public static String format(Float number, Integer exponent) {

		NumberFormat numberFormat;
		if (exponent == null) {

			numberFormat = new DecimalFormat("0");

		} else {
			if (exponent == 0) {

				numberFormat = new DecimalFormat("0");

			}

			else if (exponent == 1) {

				numberFormat = new DecimalFormat("0.0");

			} else if (exponent == 2) {

				numberFormat = new DecimalFormat("0.00");

			} else if (exponent == 3) {

				numberFormat = new DecimalFormat("0.000");

			} else if (exponent == 4) {

				numberFormat = new DecimalFormat("0.0000");

			} else {
				numberFormat = new DecimalFormat("0");
			}
		}
		return numberFormat.format(number);
	}

	public static String format(Double number, Integer exponent) {

		NumberFormat numberFormat;

		if (exponent == null) {

			numberFormat = new DecimalFormat("0");

		} else {
			if (exponent == 0) {

				numberFormat = new DecimalFormat("0");

			}

			else if (exponent == 1) {

				numberFormat = new DecimalFormat("0.0");

			} else if (exponent == 2) {

				numberFormat = new DecimalFormat("0.00");

			} else if (exponent == 3) {

				numberFormat = new DecimalFormat("0.000");

			} else if (exponent == 4) {

				numberFormat = new DecimalFormat("0.0000");

			} else {
				numberFormat = new DecimalFormat("0");
			}
		}
		return numberFormat.format(number);
	}

	public static String format(BigDecimal number, Integer exponent) {

		NumberFormat numberFormat;

		if (exponent == null) {

			numberFormat = new DecimalFormat("0");

		} else {
			if (exponent == 0) {

				numberFormat = new DecimalFormat("0");

			}

			else if (exponent == 1) {

				numberFormat = new DecimalFormat("0.0");

			} else if (exponent == 2) {

				numberFormat = new DecimalFormat("0.00");

			} else if (exponent == 3) {

				numberFormat = new DecimalFormat("0.000");

			} else if (exponent == 4) {

				numberFormat = new DecimalFormat("0.0000");

			} else {
				numberFormat = new DecimalFormat("0");
			}
		}
		return numberFormat.format(number);
	}
	
	public static String format(String number, Integer exponent) {

		NumberFormat numberFormat;

		if (exponent == null) {

			numberFormat = new DecimalFormat("0");

		} else {
			if (exponent == 0) {

				numberFormat = new DecimalFormat("0");

			}

			else if (exponent == 1) {

				numberFormat = new DecimalFormat("0.0");

			} else if (exponent == 2) {

				numberFormat = new DecimalFormat("0.00");

			} else if (exponent == 3) {

				numberFormat = new DecimalFormat("0.000");

			} else if (exponent == 4) {

				numberFormat = new DecimalFormat("0.0000");

			} else {
				numberFormat = new DecimalFormat("0");
			}
		}
		return numberFormat.format(number);
	}

}
