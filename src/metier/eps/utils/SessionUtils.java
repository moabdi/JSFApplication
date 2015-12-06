package metier.eps.utils;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

public final class SessionUtils {

	public static void setAttribute(String name, Object value) {
		Object session = FacesContext.getCurrentInstance().getExternalContext()
				.getSession(true);
		((HttpSession) session).setAttribute(name, value);
	}

	public static Object getAttribute(String name) {
		Object session = FacesContext.getCurrentInstance().getExternalContext()
				.getSession(true);
		return ((HttpSession) session).getAttribute(name);
	}

	public static void removeAttribute(String name) {
		Object session = FacesContext.getCurrentInstance().getExternalContext()
				.getSession(true);
		((HttpSession) session).removeAttribute(name);
	}
}
