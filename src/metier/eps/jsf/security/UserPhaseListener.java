package metier.eps.jsf.security;
import java.util.logging.Logger;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;

import metier.epsEnum.BakingBeanEnum;

import org.apache.commons.lang.StringUtils;


public class UserPhaseListener implements PhaseListener{
	
	public static Logger logger = Logger.getLogger(UserPhaseListener.class.toString());
	
	public void afterPhase(PhaseEvent pe) {
		FacesContext facesContext = pe.getFacesContext();
		String viewId = pe.getFacesContext().getViewRoot().getViewId();
		//if (viewId.endsWith(".jsp")&& !viewId.contains("welcomePage")) {
		if (viewId.endsWith(".jsp")) {
		String managedBeanName = getManagedBeanNameFromView(viewId);
		Object object = facesContext.getApplication().createValueBinding("#{" +
		managedBeanName + "}").getValue(facesContext);
		if (object == null)
		logger.info("OnPageLoad cannot be executed, no such managed bean:"+
		managedBeanName);
		else {
		LoginSecurity loginBean = (LoginSecurity) object;
		loginBean.onPageLoad();

		}
		}
	}
	public String getManagedBeanNameFromView(String viewId) {
		StringUtils.lastIndexOf(viewId, "/");
		String viewName	=	StringUtils.substring(viewId, StringUtils.lastIndexOf(viewId, "/")+1, viewId.length()-4);
		String pageName	=	BakingBeanEnum.valueOf(viewName).getCode();		
		System.out.println("Name="+StringUtils.capitalize(pageName));
		return pageName;
		}
	public void beforePhase(PhaseEvent arg0) {
		logger.info("beforePhase");
		FacesContext.getCurrentInstance().getExternalContext().log("BEFORE - "+
				arg0.getPhaseId());

		
	}

	public PhaseId getPhaseId() {
		logger.info("getPhaseId :"+PhaseId.ANY_PHASE);
		return PhaseId.ANY_PHASE;
		
	}

}
