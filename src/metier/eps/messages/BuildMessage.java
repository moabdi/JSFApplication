package metier.eps.messages;

import java.text.MessageFormat;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;

public class BuildMessage {

	
	public static void addMessage(String id,String summary,String 	detail,FacesMessage.Severity severity){
		FacesContext facesContext = FacesContext.getCurrentInstance();
		FacesMessage facesMessage = new FacesMessage();
		facesMessage.setSeverity(severity);
		facesMessage.setSummary(summary);
		facesMessage.setDetail(detail);
		facesContext.addMessage(id, facesMessage);
		}
	
	@SuppressWarnings("unused")
	public static void addMessageFromBundle(String id,String summary,String detail,FacesMessage.Severity severity,Object params[]){
		FacesContext facesContext = FacesContext.getCurrentInstance();
		FacesMessage facesMessage = new FacesMessage();
		
		
		String summaryText = getMessageResourceString(facesContext.getApplication()
				.getMessageBundle(), summary, params, facesContext.getViewRoot()
				.getLocale());
		String detailText = getMessageResourceString(facesContext.getApplication()
				.getMessageBundle(), detail, params, facesContext.getViewRoot()
				.getLocale());
		
		facesMessage.setSeverity(severity);
		facesMessage.setSummary(summaryText);
		facesMessage.setDetail(detailText);
		facesContext.addMessage(id, facesMessage);
		}
	
	protected static ClassLoader getCurrentClassLoader(Object defaultObject){
		
		ClassLoader loader = Thread.currentThread().getContextClassLoader();
		
		if(loader == null){
			loader = defaultObject.getClass().getClassLoader();
		}
		
		return loader;
	}

	public static String getMessageResourceString(
							String bundleName, 
							String key, 
							Object params[], 
							Locale locale){
		
		String text = null;
		
		ResourceBundle bundle = 
				ResourceBundle.getBundle(bundleName, locale, 
										getCurrentClassLoader(params));
		
		try{
			text = bundle.getString(key);
		} catch(MissingResourceException e){
			text = "?? key " + key + " not found ??";
		}
		
		if(params != null){
			MessageFormat mf = new MessageFormat(text, locale);
			text = mf.format(params, new StringBuffer(), null).toString();
		}
		
		return text;
	}
}
