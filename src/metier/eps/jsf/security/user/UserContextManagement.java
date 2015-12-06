package metier.eps.jsf.security.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import metier.eps.jsf.security.AbstractBakingBean;

import dao.DAO;
import metier.epsTools.EpsUtilities;
import metier.finder.UserFinder;
import dao.Hibernate.Model.CurrencyCountryEps;
import dao.Hibernate.Model.EpsHabilitationParam;
import dao.Hibernate.Model.UserHabilitationParam;
import dao.Hibernate.Model.UserManagement;
import dao.Hibernate.Model.UserMenuAccess;

public class UserContextManagement extends AbstractBakingBean{

	private static UserContext userContext;
	public static String userIpAdress;
	public static Set<UserHabilitationParam> userAttributedRoles;
    public static List<UserHabilitationParam> userAttributedRoles1;
	
	public static String getUserIpAdress() {
		return userIpAdress;
	}

	public static void setUserIpAdress(String userIpAdress) {
		UserContextManagement.userIpAdress = userIpAdress;
	}

	public static List<UserHabilitationParam> retrieveUserAttributedRoles(String userCode) {
		DAO obj = new DAO();
		UserFinder userFinder = new UserFinder();
		UserManagement userManagement = (UserManagement) obj.findById(
				"UserManagement", userCode);
		return userFinder.findRolesByUser(userCode);
	}

	public static UserManagement retrieveUser(String userCode) {
		DAO obj = new DAO();
		UserFinder userFinder = new UserFinder();
		UserManagement userManagement = (UserManagement) obj.findById(
				"UserManagement", userCode);
		return userManagement;
	}
	 


	public static String retrieveUserIpAdress() {
		String remoteAddr = null;
		FacesContext fctx = FacesContext.getCurrentInstance();
		ExternalContext ectx = fctx.getExternalContext();
		ectx.getRemoteUser();

		Object reqOb = fctx.getExternalContext().getRequest();
		if (reqOb instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest) reqOb;
			remoteAddr = req.getRemoteAddr();

		}

		userIpAdress = remoteAddr;
		return userIpAdress;
	}

	public String  disconnect() {
		FacesContext context = FacesContext.getCurrentInstance();	
		HttpSession session = (HttpSession) context.getExternalContext().getSession(true);
		//userContext.setUserCode(null);
		initUserContext();
		String usercode = getUserContext().getUserCode();
		
		DAO obj = new DAO();
		UserFinder userFinder = new UserFinder();
		
		if (usercode!= null){
			
			UserManagement userManagement = (UserManagement) obj.findById(
					"UserManagement", usercode);
			
			if (userManagement.getNbreSessionConnected() != null && (userManagement.getNbreSessionConnected() > 0)){
				if (userManagement.getNbreSessionConnected()== 1){
					userManagement.setConnected("N");
				}
				userManagement.setNbreSessionConnected(userManagement.getNbreSessionConnected() - 1);
				
			}
			if (userManagement.getNbreSessionConnected() != null && (userManagement.getNbreSessionConnected() == 0)){
				
				userManagement.setConnected("N");
				userManagement.setNbreSessionConnected(0);
				
			}
			
			// releaseSession();
			obj.getSession().clear();
			obj.saveOrUpdate(userManagement);
			obj.getSession().close();
			session.invalidate();
		}
		
		return "login";
	}
	
	
}
