package metier.eps.jsf.security.usersession;

import java.util.ArrayList;
import java.util.List;

import metier.epsTools.EpsParameter;

import metier.eps.jsf.security.AbstractBakingBean;
import metier.eps.jsf.security.user.UserContext;
import metier.eps.utils.SessionUtils;

public class UserSessionRegistry {
	
	public UserContext uContext;
	public String beanName;
	public List hib_sessions;
	public boolean addStatus;
	public boolean modifyStatus;
	public Object objAPasser;
	public List<EpsParameter> userVars;
	
		
	public UserSessionRegistry() {
		
		//initUserContext();
		
		//this.uContext = getUserContext();
		this.addStatus = true;
		this.modifyStatus = false;
		this.objAPasser = null;
		this.beanName = "";
		this.hib_sessions = new ArrayList();
		this.userVars = new ArrayList<EpsParameter>();
		setRegistry();
	}

	public UserSessionRegistry(UserContext context, boolean addStatus,
			boolean modifyStatus, Object objAPasser, String beanName, List hib_sessions, List<EpsParameter> userVars) {
		this.uContext = context;
		this.addStatus = addStatus;
		this.modifyStatus = modifyStatus;
		this.objAPasser = objAPasser;
		this.beanName = beanName;
		this.hib_sessions = hib_sessions;
		this.userVars = userVars;
	}
	
	public void setRegistry(){
				
		SessionUtils.setAttribute("uContext", this.uContext);
		SessionUtils.setAttribute("addStatus", this.addStatus);
		SessionUtils.setAttribute("modifyStatus", this.modifyStatus);
		SessionUtils.setAttribute("objAPasser", this.objAPasser);
		SessionUtils.setAttribute("beanName", this.beanName);
		SessionUtils.setAttribute("hib_sessions", this.hib_sessions);
		setVars(this.userVars);
		SessionUtils.setAttribute("userVars", this.userVars);
	}
	
	public void loadRegistry(){
		
		this.uContext = (UserContext) SessionUtils.getAttribute("uContext");
		this.addStatus = (Boolean) SessionUtils.getAttribute("addStatus");
		this.modifyStatus = (Boolean) SessionUtils.getAttribute("modifyStatus");
		this.objAPasser = SessionUtils.getAttribute("objAPasser");
		this.beanName = (String) SessionUtils.getAttribute("beanName");
		this.hib_sessions = (List) SessionUtils.getAttribute("hib_sessions");
		this.userVars = (List<EpsParameter>) SessionUtils.getAttribute("userVars");
	}
	
	public void setVars(List<EpsParameter> variables){
		for (EpsParameter obj: variables){
			SessionUtils.setAttribute(obj.nom, obj.value);
		}
	}
	
	public void clearVars(List<EpsParameter> variables){
		for (EpsParameter obj: variables){
			SessionUtils.setAttribute(obj.nom, null);
			SessionUtils.removeAttribute(obj.nom);
		}
	}

	public void clearRegistry(){
		
		SessionUtils.removeAttribute("uContext");
		SessionUtils.removeAttribute("addStatus");
		SessionUtils.removeAttribute("modifyStatus");
		SessionUtils.removeAttribute("objAPasser");
		SessionUtils.removeAttribute("beanName");
		SessionUtils.removeAttribute("hib_sessions");
		SessionUtils.removeAttribute("userVars");
	}
	
}
