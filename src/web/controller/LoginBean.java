package web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Locale;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.richfaces.component.html.HtmlModalPanel;

import metier.eps.jsf.security.EpsEncrypter;
import metier.eps.jsf.security.LoginSecurity;
import metier.eps.jsf.security.user.UserContext;
import metier.eps.jsf.security.user.UserContextManagement;
import metier.eps.jsf.security.usersession.UserSessionRegistry;
import metier.eps.messages.BuildMessage;
import metier.eps.utils.SessionUtils;

import dao.Hibernate.Model.UserHabilitationParam;
import dao.Hibernate.Model.UserManagement;
import dao.Hibernate.Model.UserMenuAccess;
import metier.appLists.ApplicationLists;
import web.controller.UserParamSearchBB;
import dao.*;
import metier.epsTools.EpsUtilities;

public class LoginBean implements LoginSecurity {

	private String usercode;
	private String password;
	private UserManagement userManagement;
	private FacesContext fctx;
	private ExternalContext ectx;
	private boolean okToLog = false;

	//add by Jurin
	private Character firstConnect;
	private String oldPassword = "";
	private UserContext userc;

	private String newPassword;
	private String cpassword;
	private String showMsgPanel = "";
	private Character complexityFlag = UserParamSearchBB.complexity;
	public boolean validate = true;

	private String firstConnectPanel = "";
	public HtmlModalPanel modalPanel;
	private String passValue;
	private String passStyle;
	
	public static String Back_To_Welcome_Page="BackToWelcomePage";
	public static boolean conected = false;

	private Map<String, Locale> locales = null;

	public LoginBean() {
		
		locales = new HashMap<String, Locale>(2);
		locales.put("England", Locale.ENGLISH);
		locales.put("France", Locale.FRENCH);
	}

	private String ipAdress;

	public String getIpAdress() {
		return ipAdress;
	}

	public void setIpAdress(String ipAdress) {
		this.ipAdress = ipAdress;
	}

	public UserContext getUserc() {
		return userc;
	}

	public void setUserc(UserContext userc) {
		this.userc = userc;
	}

	public boolean isValidate() {
		return validate;
	}

	public void setValidate(boolean validate) {
		this.validate = validate;
	}

	public Character getFirstConnect() {
		return firstConnect;
	}

	public void setFirstConnect(Character firstConnect) {
		this.firstConnect = firstConnect;
	}

	public String getShowMsgPanel() {
		return showMsgPanel;
	}

	public void setShowMsgPanel(String showMsgPanel) {
		this.showMsgPanel = showMsgPanel;
	}

	public String getCpassword() {
		return cpassword;
	}

	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getFirstConnectPanel() {
		return firstConnectPanel;
	}

	public void setFirstConnectPanel(String firstConnectPanel) {
		this.firstConnectPanel = firstConnectPanel;
	}

	public HtmlModalPanel getModalPanel() {
		return modalPanel;
	}

	public void setModalPanel(HtmlModalPanel modalPanel) {
		this.modalPanel = modalPanel;
	}

	public UserManagement getUserManagement() {
		return userManagement;
	}

	public void setUserManagement(UserManagement userManagement) {
		this.userManagement = userManagement;
	}

	public FacesContext getFctx() {
		return fctx;
	}

	public void setFctx(FacesContext fctx) {
		this.fctx = fctx;
	}

	public ExternalContext getEctx() {
		return ectx;
	}

	public void setEctx(ExternalContext ectx) {
		this.ectx = ectx;
	}

	public boolean isOkToLog() {
		return okToLog;
	}

	public void setOkToLog(boolean okToLog) {
		this.okToLog = okToLog;
	}

	public String loginAction() {

		DAO obj = new DAO();
		
		if (okToLog){
		
		firstConnect = userManagement.getFirstConnection();
		userManagement.setNumberOfTries(userManagement.getNumberOfTries()
				- userManagement.getNumberOfTries());
		
		if (firstConnect == 'Y') {

			// User Connect, retrieve information to fill userContext
			userManagement.setIpAddress(UserContextManagement
					.retrieveUserIpAdress());

			//added for session user probleme 
			//UserContextManagement userContextManagement = new UserContextManagement();
			Object object = fctx.getApplication().createValueBinding(
					"#{" + "userContext" + "}").getValue(fctx);
			setUserc((UserContext) object);
			userc.setUserCode("User");
			initiateUserContextManagement(userc, userManagement);

			try {
				obj.saveOrUpdate(userManagement);// Save
			}catch (Exception e) {
				try {
					String url = ((HttpServletRequest) ectx.getRequest())
							.getContextPath()
							+ "/pages/login.jsf";
					System.out.println(url);
					ectx.redirect(url);
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}

			// changes

			setFirstConnectPanel("Richfaces.showModalPanel('updatePanel')");

		} else {

			// User Connect, retrieve information to fill userContext
			userManagement.setIpAddress(UserContextManagement
					.retrieveUserIpAdress());

			// update user session number
			userManagement.setNbreSessionConnected(userManagement
					.getNbreSessionConnected() + 1);
			
			userManagement.setConnected("Y");
			//added for session user probleme 
			//UserContextManagement userContextManagement = new UserContextManagement();
			Object object = fctx.getApplication().createValueBinding(
					"#{" + "userContext" + "}").getValue(fctx);
			userc = (UserContext) object;
			//userContext.setUserCode("User");
			initiateUserContextManagement(userc, userManagement);
			UserManagement userManagementForSave = new UserManagement();
			constructForSave(userManagementForSave);
			
			obj.saveOrUpdate(userManagementForSave);// Save
			
			}

			try {
				if (userc.getLanguageCode() == null){
					userc.setLanguageCode("ENG");
				}
				setUserLocale(userc.getLanguageCode());
				String url = ((HttpServletRequest) ectx.getRequest())
						.getContextPath()
						+ "/pages/userManagement/customerParamSearch.jsf";
				ectx.redirect(url);
				ApplicationLists.LoadStaticLists();
				initSessionUtils();
				
				setConected(true);

			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else{
			
			obj.getSession().close();
			
		}
		
		
		return null;
	}
	
	public void initSessionUtils (){
		
		// Initialize user registry
		UserSessionRegistry usr = new UserSessionRegistry();
		SessionUtils.setAttribute("userSessionRegistry", usr);
	}

	public void updatePass(ActionEvent ev) {

		fctx = FacesContext.getCurrentInstance();
		ectx = fctx.getExternalContext();
		
		if (usercode != null && password != null && !usercode.equals("")
				&& !password.equals("")) {

			DAO obj = new DAO();
			obj.getSession().getSessionFactory().openSession(); 
			userManagement =  new UserManagement();
			
			userManagement = (UserManagement) obj.findById("UserManagement", usercode);
			
			if ((userManagement == null)) {
				BuildMessage.addMessageFromBundle("LoginMsg",
						"MessageS.userNotFound", "MessageD.userNotFound",
						FacesMessage.SEVERITY_INFO, null);
				setFirstConnectPanel("Richfaces.showModalPanel('msgPanel1')");

			}
			else{
				setIpAdress(UserContextManagement
						.retrieveUserIpAdress());
				
				if(userManagement.getIpAddressMang().equals("Y")){
									
					
					if (userManagement.getIpAddress() != null && !(userManagement.getIpAddress().equals(ipAdress)) ) {
						
						setFirstConnectPanel("Richfaces.showModalPanel('msgPanel8')");
						okToLog = false;
						
					}else{
						
						if(userManagement.getBlockAccess().equals('Y')){
							
							setFirstConnectPanel("Richfaces.showModalPanel('msgPanel3')");
							okToLog = false;
						
						}else {

							password = EpsEncrypter.hashPassword(password);
						
							if (userManagement.getUserPassword().toString().equals(password)) {
															
								if(userManagement.getNbreSessionConnected().equals(userManagement.getNbreSessionAllowed())){
								
									setFirstConnectPanel("Richfaces.showModalPanel('msgPanel2')");
									okToLog = false;
									
								}else{
									if(userManagement.getDateEndPass().getTime() < Calendar.getInstance().getTimeInMillis()){
										
										setFirstConnectPanel("Richfaces.showModalPanel('msgPanel7')");
										okToLog = false;
										
									}else{
										
										((HttpSession) ectx.getSession(false)).setAttribute("isLog",
										"true");
										okToLog = true;
									}
								}
						
							} else {
							
								if(userManagement.getNumberOfTries() == (userManagement.getNumberOfTriesAllowed()-1)){
									userManagement.setBlockAccess('Y');
									userManagement.setNumberOfTries(Long.valueOf(0));
									userManagement.setNbreSessionConnected(0);
									
									okToLog = false;
							
								}else{
													
									userManagement.setNumberOfTries(userManagement
											.getNumberOfTries() + 1);
									
									okToLog = false;
																	
								}
							
								BuildMessage.addMessageFromBundle("LoginMsg",
											"MessageS.WrongPassword", "MessageD.WrongPassword",
											FacesMessage.SEVERITY_INFO, null);
									try {
										String url = ((HttpServletRequest) ectx.getRequest())
										.getContextPath()
										+ "/pages/common/error.jsf";
										System.out.println(url);
										ectx.redirect(url);
									} catch (IOException e) {
									e.printStackTrace();
									}
							}
						}
					}
				} else {

					if (userManagement.getBlockAccess().equals('Y')) {

						setFirstConnectPanel("Richfaces.showModalPanel('msgPanel3')");
						okToLog = false;

					} else {

						password = EpsEncrypter.hashPassword(password);

						if (userManagement.getUserPassword().toString().equals(
								password)) {
							
							if (userManagement.getNbreSessionConnected().equals(userManagement.getNbreSessionAllowed())) {

								setFirstConnectPanel("Richfaces.showModalPanel('msgPanel2')");
								okToLog = false;
								
							} else {
								if (userManagement.getDateEndPass()!= null && userManagement.getDateEndPass().getTime() < Calendar
										.getInstance().getTimeInMillis()) {

									setFirstConnectPanel("Richfaces.showModalPanel('msgPanel7')");
									okToLog = false;
									
								} else {

									((HttpSession) ectx.getSession(false))
									.setAttribute("isLog", "true");
									okToLog = true;
								}
							}

						} else {
							if (userManagement.getNumberOfTries() == (userManagement.getNumberOfTriesAllowed()-1)){
								userManagement.setBlockAccess('Y');
								userManagement
										.setNumberOfTries(Long.valueOf(0));
								userManagement.setNbreSessionConnected(0);
								
								okToLog = false;

							} else {
								
								userManagement.setNumberOfTries(userManagement
										.getNumberOfTries() + 1);
								
								okToLog = false;
								
							}

							BuildMessage.addMessageFromBundle("LoginMsg",
									"MessageS.WrongPassword",
									"MessageD.WrongPassword",
									FacesMessage.SEVERITY_INFO, null);
							try {
								String url = ((HttpServletRequest) ectx
										.getRequest()).getContextPath()
										+ "/pages/common/error.jsf";
								System.out.println(url);
								ectx.redirect(url);
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					}
				}
			}

		} else {
			try {
				String url = ((HttpServletRequest) ectx.getRequest())
						.getContextPath()
						+ "/pages/common/warning.jsf";
				System.out.println(url);
				ectx.redirect(url);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	public void construct(UserManagement userManagement) {

		userManagement.setUserCode(userc.getUserCode());
		userManagement.setUserName(userc.getUserName());
		userManagement.setIpAddressMang(userc.getIpAddressMang());
		userManagement.setIpAddress(userc.getIpAddress());
		userManagement.setUserBankCode(userc.getUserBankCode());
		userManagement.setUserBranchCode(userc.getUserBranchCode());
		userManagement.setLanguageCode(userc.getLanguageCode());

		userManagement.setNumberOfTries(userc.getNumberOfTries());
		userManagement.setNumberOfTriesAllowed(userc.getNumberOfTriesAllowed());
		userManagement.setNbreSessionConnected(userc.getNbreSeesionConnected());
		userManagement.setNbreSessionAllowed(userc.getNbreSessionAllowed());

		userManagement.setDateEndPass(userc.getDateEndPass());
		userManagement.setDateStartPass(userc.getDateStartPass());
		userManagement.setExpirationPassword(userc.getExpirationPassword());
		userManagement.setBlockAccess(userc.getBlockAccess());

		userManagement.setComplexityFlag(this.complexityFlag);
		userManagement.setLengthPassword(newPassword.length());

		userManagement.setUserPassword(EpsEncrypter
				.hashPassword(this.newPassword));
		userManagement.setUserType(userc.getUserType());
		userManagement.setConnected("N");
		userManagement.setFirstConnection('M');
	}
	
	public void constructForSave(UserManagement user) {

		user.setUserCode(userc.getUserCode());
		user.setUserName(userc.getUserName());
		user.setIpAddressMang(userc.getIpAddressMang());
		user.setIpAddress(userc.getIpAddress());
		user.setUserBankCode(userc.getUserBankCode());
		user.setUserBranchCode(userc.getUserBranchCode());
		user.setLanguageCode(userc.getLanguageCode());

		user.setNumberOfTries(userc.getNumberOfTries());
		user.setNumberOfTriesAllowed(userc.getNumberOfTriesAllowed());
		user.setNbreSessionConnected(userc.getNbreSeesionConnected());
		user.setNbreSessionAllowed(userc.getNbreSessionAllowed());

		user.setDateEndPass(userManagement.getDateEndPass());
		user.setDateStartPass(userManagement.getDateStartPass());
		user.setExpirationPassword(userManagement.getExpirationPassword());

		user.setComplexityFlag(userManagement.getComplexityFlag());
		user.setLengthPassword(userManagement.getLengthPassword());
		user.setBlockAccess(userManagement.getBlockAccess());
		
		user.setUserPassword(userManagement.getUserPassword());
		user.setUserType(userManagement.getUserType());
		user.setConnected("Y");
		user.setFirstConnection(userManagement.getFirstConnection());
	}
	
	public void setUserLocale(String langue) {
		
		FacesContext context = FacesContext.getCurrentInstance();
		String key="";
		if (langue.equals("ENG") ){
			key = "England";
			userc.setUserLocale("en");
			context.getViewRoot().setLocale(locales.get(key));
		}
		if (langue.equals("FRA") ){
			key = "France";
			userc.setUserLocale("fr");
			context.getViewRoot().setLocale(locales.get(key));
		}
		if (langue.equals("ARA") ){
			key = "Arabe";
			userc.setUserLocale("ar");
			context.getViewRoot().setLocale(locales.get(key));
		}
	}

	public void validateSecondPassword() {

		String password = cpassword;
		if(passValue != null && !passValue.equals("Invalid Password") && !passValue.equals("Low")){
			
			if (!password.equals(newPassword) && newPassword.trim() != "") {
				validate = false;
				BuildMessage
						.addMessage(
								null,
								"Password validation: ",
								"Please, check password confirmation is diferent from password",
								FacesMessage.SEVERITY_WARN);
				setShowMsgPanel("Richfaces.showModalPanel('msgPanel5')");
			} else {
				setValidate(true);
				DAO dao = new DAO();
				UserManagement userManagement = new UserManagement();
				construct(userManagement);
				if (validate) {

					dao.getSession().clear();
					dao.saveOrUpdate(userManagement);
					BuildMessage.addMessage(null, "Password validation: ",
							"Your password has been updated successfully",
							FacesMessage.SEVERITY_WARN);
					setShowMsgPanel("Richfaces.hideModalPanel('updatePanel'); Richfaces.showModalPanel('msgPanel4')");

				}
			}
		} else {
			setShowMsgPanel("Richfaces.showModalPanel('msgPanel6')");
		}
	}
	
	public void checkpassvalue(ActionEvent ev){
		
		String pass_regex ="^([\\p{Alnum}]*)([@?!:*=$]{1,})([0-9]{1,})([\\p{Alnum}]*)$" +
		"|^([\\p{Alnum}]*)([0-9]{1,})([@?!:*=$]{1,})([\\p{Alnum}]*)$" +
		"|^([\\p{Alnum}]*)([0-9]{1,})([@?!:*=$]{1,})([\\p{Alnum}]*)([@?!:*=$]{1,})$" +
		"|^([\\p{Alnum}]*)([@?!:*=$]{1,})([0-9]{1,})([\\p{Alnum}]*)([@?!:*=$]{1,})$" +
		"|^([\\p{Alnum}]*)([@?!:*=$]{1,})([0-9]{1,})([@?!:*=$]{1,})([\\p{Alnum}]*)([@?!:*=$]{1,})$"+
		"|^([\\p{Alnum}]*)([@?!:*=$]{1,})([0-9]{1,})([@?!:*=$]{1,})([\\p{Alnum}]*)([@?!:*=$]{1,})([\\p{Alnum}]*)$";
				
		Pattern mask = Pattern.compile(pass_regex);
		Matcher matcher = mask.matcher(newPassword);

		System.out.println("Password validator");
		if (!matcher.find()) {

			setPassStyle("cursor:pointer; color:red; font-weight:bold;");
			setPassValue("Invalid Password");

		} else {

			if (newPassword.length() < 8) {

				setPassStyle("cursor:pointer; color:red; font-weight:bold;");
				setPassValue("Invalid Password");
			}
			if(newPassword.length() >= 8 && newPassword.length() <= 10 ){
				
				setPassStyle("cursor:pointer; color:red; font-weight:bold;");
				setPassValue("Low secure level");
				setComplexityFlag('L');
			}
			if(newPassword.length() <= 14 && newPassword.length() > 10 ){
				
				setPassStyle("cursor:pointer; color:blue; font-weight:bold;");
				setPassValue("Average secure level");
				setComplexityFlag('A');
			}
			if(newPassword.length() <= 20 && newPassword.length() > 14 ){
				
				setPassStyle("cursor:pointer; color:green; font-weight:bold;");
				setPassValue("High secure level");
				setComplexityFlag('H');
			}

		}

	}

	public void initiateUserContextManagement(UserContext userContext,
			UserManagement user) {
		List<UserHabilitationParam> userAttributedRoles1;
		List<UserMenuAccess> userMenuAccessList;
		userContext.setUserCode(user.getUserCode());
		userContext.setLanguageCode(user.getLanguageCode());
		userContext.setUserName((String) EpsUtilities.nvl(user.getUserName()));
		userContext.setUserType((String) EpsUtilities.nvl(user.getUserType()));
		userContext.setUserPassword((String) EpsUtilities.nvl(user
				.getUserPassword()));
		userContext.setUserBankCode((String) EpsUtilities.nvl(user
				.getUserBankCode()));
		userContext.setUserBranchCode((String) EpsUtilities.nvl(user
				.getUserBranchCode()));

		userContext.setNumberOfTries(((Long) EpsUtilities.nvl(user
				.getNumberOfTries())));
		userContext.setNumberOfTriesAllowed(((Long) EpsUtilities.nvl(user
				.getNumberOfTriesAllowed())));
		userContext.setNbreSeesionConnected((Integer) EpsUtilities.nvl(user
				.getNbreSessionConnected()));
		userContext.setNbreSessionAllowed((Integer) EpsUtilities.nvl(user
				.getNbreSessionAllowed()));

		userContext.setBlockAccess((Character) EpsUtilities.nvl(user
				.getBlockAccess()));
		userContext.setExpirationPassword(((Long) EpsUtilities.nvl(user
				.getExpirationPassword())));

		userContext.setDateEndPass((user.getDateEndPass()));
		userContext.setDateStartPass((user.getDateStartPass()));

		userContext
				.setIpAddress((String) EpsUtilities.nvl(user.getIpAddress()));
		userContext.setIpAddressMang((String) EpsUtilities.nvl(user
				.getIpAddressMang()));

		userContext.setConnexionDate(EpsUtilities.formater(Calendar
				.getInstance().getTime()));

		userContext.setConnexionTime(EpsUtilities.formaterInPattern(Calendar
				.getInstance().getTime(), EpsUtilities.timePattern));

		userAttributedRoles1 = UserContextManagement
				.retrieveUserAttributedRoles(userContext.getUserCode());
	
		String Tmp = null;
		/*for (UserHabilitationParam iterable_userHabilitationParam : userAttributedRoles1) {
			
			Tmp = Tmp + "," + iterable_userHabilitationParam.getEpsHabilitationParam().getCode();
				
				
			}*/
		
		for (UserHabilitationParam iterable_userHabilitationParam : userAttributedRoles1) {

			userMenuAccessList = findMenusByRole(iterable_userHabilitationParam
							.getEpsHabilitationParam().getCode());
			

			for (UserMenuAccess iterable_userMenuAccessList : userMenuAccessList) {

				Tmp = Tmp + "," + iterable_userMenuAccessList.getId().getMenuName();

			}

		}
		userContext.setModifyView("");
		userContext.setChaineAttributedRoles(Tmp);
		userContext.alert("ee");
		// userContext.setUserRoles((List) user
		// .getUserHabilitationParams().);

	}

	public String quitSession() {
		FacesContext fctx = FacesContext.getCurrentInstance();
		ExternalContext ectx = fctx.getExternalContext();
		String url = ((HttpServletRequest) ectx.getRequest()).getContextPath()
				+ "/login.jsf";

		try {
			ectx.redirect(url);
		} catch (IOException e) {

			e.printStackTrace();
		}
		return "/login.jsf";
	}

	public String pass() {
		FacesContext fctx = FacesContext.getCurrentInstance();
		ExternalContext ectx = fctx.getExternalContext();
		String url = ((HttpServletRequest) ectx.getRequest()).getContextPath()
				+ "/login.jsf";

		try {
			ectx.redirect(url);
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public String welcomePage() {
		FacesContext fctx = FacesContext.getCurrentInstance();
		ExternalContext ectx = fctx.getExternalContext();
		String url = ((HttpServletRequest) ectx.getRequest()).getContextPath()
				+ "/pages/userManagement/customerParamSearch.jsf";

		try {
			ectx.redirect(url);
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public String logout() {
		FacesContext fctx = FacesContext.getCurrentInstance();
		ExternalContext ectx = fctx.getExternalContext();
		HttpSession session = ((HttpSession) ectx.getSession(false));
		if (session != null) {
			try {
				session.invalidate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		try {
			String url = ((HttpServletRequest) ectx.getRequest())
					.getContextPath()
					+ "/pages/userManagement/customerParamSearch.jsf";
			System.out.println(url);
			ectx.redirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "logout";
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getUsercode() {
		return usercode;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void onPageLoad() {
		// TODO Auto-generated method stub

	}

	public String backToWelcomPage(){
		
		return Back_To_Welcome_Page;
	}
	
	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getPassValue() {
		return passValue;
	}

	public void setPassValue(String passValue) {
		this.passValue = passValue;
	}

	public String getPassStyle() {
		return passStyle;
	}

	public void setPassStyle(String passStyle) {
		this.passStyle = passStyle;
	}

	public Character getComplexityFlag() {
		return complexityFlag;
	}

	public void setComplexityFlag(Character complexityFlag) {
		this.complexityFlag = complexityFlag;
	}

	public static List<UserMenuAccess> findMenusByRole(String role) {
		DAO dao = new DAO();
		List<UserMenuAccess> userMenuAccessList = new ArrayList<UserMenuAccess>();
	
		
		String cretiria = null;
		
	    cretiria = " as model where 1=1 and model.id.role like '%"+role+"%'";
	    userMenuAccessList = dao.findByGenCriteria("UserMenuAccess", cretiria);

		return userMenuAccessList;
	}

	public  String getBack_To_Welcome_Page() {
		return Back_To_Welcome_Page;
	}

	public  void setBack_To_Welcome_Page(String back_To_Welcome_Page) {
		Back_To_Welcome_Page = back_To_Welcome_Page;
	}

	public  boolean isConected() {
		return conected;
	}

	public  void setConected(boolean conected) {
		LoginBean.conected = conected;
	}
}
