package metier.eps.jsf.security;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import metier.eps.jsf.security.user.UserContext;
import metier.eps.jsf.security.usersession.UserSessionRegistry;
import metier.eps.messages.BuildMessage;
import metier.eps.utils.Exponent;
import metier.eps.utils.FormatUtils;
import metier.eps.utils.SessionUtils;

import metier.appLists.ApplicationLists;
import dao.DAO;
import metier.epsTools.FacesUtil;
import metier.finder.UserFinder;

public abstract class AbstractBakingBean extends AbstractListSIBakingBean implements Cloneable  {
	
	
	public AbstractBakingBean() {
		 ApplicationLists.InitStaticLists();
		 if (userReg == null){
			 UserSessionRegistry userRegistry = new UserSessionRegistry();
			 SessionUtils.setAttribute("userSessionRegistry",userRegistry);
		 }
		 
		// TODO Auto-generated constructor stub
	}
	DAO dao = new DAO();
	
	
	
	public UserContext userContext;
	
	public UserSessionRegistry userReg = (UserSessionRegistry) SessionUtils.getAttribute("userSessionRegistry");	
	
	public UserContext getUserContext() {
		return userContext;
	}

	public void setUserContext(UserContext userContext) {
		this.userContext = userContext;
	}
    public void initUserContext(){
    	FacesContext fctx = FacesContext.getCurrentInstance();
		ExternalContext ectx = fctx.getExternalContext();
    	Object object = fctx.getApplication().createValueBinding("#{" +
				"userContext" + "}").getValue(fctx);
    	this.userContext= (UserContext) object;
    }
	public boolean checkUserAccess(String userCode,String beanName){
		
		if (userCode==null){
		FacesContext fctx = FacesContext.getCurrentInstance();
		ExternalContext ectx = fctx.getExternalContext();
		String url = ((HttpServletRequest) ectx.getRequest())
				.getContextPath()
				+ "/login.jsf";
		try {
			ectx.redirect(url);
			return true;
		} catch (IOException e) {

			e.printStackTrace();
		}
		}
		String pageAllowedRoles = getAllowedRoles(getManagedBeanNameFromClassName(beanName));
		UserFinder userFinder = new UserFinder();
		if (pageAllowedRoles==null) pageAllowedRoles="X"; 
		String roles[] = pageAllowedRoles.split(",");
	    boolean granted = false;
	    // List<UserHabilitationParam> userHabilitationParam = userFinder.findRolesByUser(userCode);
	    //Check user roles
	    /*for(String role : roles) {
	      if(isUserInRole(userHabilitationParam,role)) {
	        granted = true;
	        break;
	      }
	    }*/
	    //Youness_Just_For_Test
	    granted = true; // Activer pour laisser passer le contrôle des roles.
	    return granted;
		
	}
	private String getAllowedRoles(String beanName){
		String roles = null;
		// RoleFinder roleFinder = new RoleFinder();
		/*List<PageAccessParam> tmp = roleFinder.findRolesByPage(beanName);
		for (PageAccessParam iterable_tmp : tmp) {

			roles =  roles + "," + iterable_tmp.getId().getRole();

		}*/
		return roles;
	}

	private String getManagedBeanNameFromClassName(String className) {
		String viewName	=	StringUtils.substring(className, StringUtils.lastIndexOf(className, ".")+1, className.length());
		return viewName;
		}
	
	public boolean checkExistRecord(Class entity,Object id){
		DAO dao=new DAO();
		boolean exist = true;
		
	    Object object= dao.findByIdObject(entity, id);
		if (object!=null){
			exist=true;
			
		}
		else
		{
			exist=false;
		}
		return exist;
	}
	
	public String releaseSession(){ // Ajoutée pour la gestion multisession
		
		Session session_upd = (Session) SessionUtils.getAttribute("trx_update");
		if (session_upd != null){
			Transaction trx = session_upd.getTransaction();
			if (trx.isActive()){
				trx.rollback();
				session_upd.close();
			}
			SessionUtils.setAttribute("trx_update",null);
		}
		
		return null;
	}
	
	public String releaseSession(String session_index){ // Ajoutée pour la gestion multisession
		
		Session session_upd = (Session) SessionUtils.getAttribute(session_index);
		if (session_upd != null){
			Transaction trx = session_upd.getTransaction();
			if (trx.isActive()){
				trx.rollback();
				session_upd.close();
			}
			SessionUtils.removeAttribute(session_index);
		}
		
		return null;
	}
	
	public void resetBean(){
		String beanName =null;
		if (userReg != null){
			beanName = getManagedBeanNameFromClassName(userReg.beanName);
			if (beanName != null && beanName != ""){
				FacesUtil.resetManagedBean(beanName);
			}
		}
	}
	
	public void initUserRegistry(){
		
		userReg.addStatus=true;
		userReg.modifyStatus=false;
		userReg.uContext = getUserContext();
		userReg.beanName="";
		userReg.objAPasser=null;
		
		List objLocked = (List) SessionUtils.getAttribute("hib_sessions");
		if (objLocked != null && objLocked.size() > 0){
			Iterator it = objLocked.iterator();
			while (it.hasNext()){
				String sessid = (String) it.next();
				releaseSession(sessid);
			}
		}
		
		userReg.clearVars(userReg.userVars);
		userReg.userVars.clear();
		userReg.setRegistry();
	}
	
	/*public boolean isUserInRole(List<UserHabilitationParam> userHabilitationParam,String role){
		boolean granted = false;
		
		for (UserHabilitationParam userHabilitationParamTmp : userHabilitationParam) {
			if (userHabilitationParamTmp.getEpsHabilitationParam().getCode().equals(role)){
				granted=true;
				break;
			}
		}
		return granted;
	}*/
	public void returnMessageIfExistRecord(String objectType,String id,String wording){
		
		
				BuildMessage.addMessage(null,"","Operation failed caused by Duplicate record key",
						FacesMessage.SEVERITY_ERROR);
				
		  }
	public void returnMessageBeforeTrx(String objectType,String id,String wording,boolean successOperation,char operation){
		String operationToPublish = null;
		Integer choiceCase;
		if (operation=='I')
			choiceCase = 1;
			else if (operation=='D')
				choiceCase = 2;
				else choiceCase = 3;
		
		switch (choiceCase) {
		case 1:
 			operationToPublish= BuildMessage.getMessageResourceString("i18n.messages", "Gen_add_success"
					, null, FacesContext.getCurrentInstance().getViewRoot().getLocale());
			break;
		case 2:
			operationToPublish= BuildMessage.getMessageResourceString("i18n.messages", "Gen_del_success"
					, null, FacesContext.getCurrentInstance().getViewRoot().getLocale());
			break;
		case 3:
			operationToPublish= BuildMessage.getMessageResourceString("i18n.messages", "Gen_upd_success"
					, null, FacesContext.getCurrentInstance().getViewRoot().getLocale());
			break;
		default:
			break;
		}
		if (successOperation){
			BuildMessage.addMessage(null, "","Record " + operationToPublish,
					FacesMessage.SEVERITY_INFO);
			}
			else
			{
				
			
				
				BuildMessage.addMessage(null,"","Operation failed caused By " + dao.getFailedOperationError(),
						FacesMessage.SEVERITY_ERROR);
			}
	}
	
	public BigDecimal convertBigDecimal(BigDecimal value, String currency) {
		if (value == null){
			return null;
		}
		if (value != null){
		String stringValue;
		Integer exponent;
		Exponent exp = new Exponent();
		exponent = exp.refreshExponent(currency);
		stringValue = value.toString();
		Double number = Double.parseDouble(stringValue.replace(',', '.'));

		String numberString = FormatUtils.format(number, exponent);
		BigDecimal numberBigDecimal = new BigDecimal(numberString.replace(',', '.'));
		value = numberBigDecimal;
		}
		return(value);
	}
	
}
