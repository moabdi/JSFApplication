package metier.eps.utils;

public class StringUtils {

	public static String trim(String c) {
		if (c != null) {
			if (c.length() > 0) {
				c = c.trim();
				return c;
			}
		}

		return "";
	}

}
