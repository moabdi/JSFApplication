package metier.epsTools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EpsUtilities {
	public static String datePattern = "dd/MM/yyyy";
	public static String timePattern = "HH:mm:ss";

	public static Object nvl(Object obj) {
		return obj == null ? null : obj;
	}

	public static String formater(Date date) {
		// String format="MMM dd, yyyy";
		// String format="yyyy-MM-dd";
		SimpleDateFormat formater = new SimpleDateFormat(datePattern);
		if (date == null)
			return null;
		return formater.format(date);
	}
	public static String formaterInPattern(Date date,String pattern) {
		// String format="MMM dd, yyyy";
		// String format="yyyy-MM-dd";
		SimpleDateFormat formater = new SimpleDateFormat(pattern);
		if (date == null)
			return null;
		return formater.format(date);
	}

	public static Long dayBetween(Date date1, Date date2){
		
		Long days;
		Long diff;
		diff = date1.getTime() - date2.getTime();
		days = diff / (1000 * 60 * 60 * 24); 
		
		return days;
	}
}
