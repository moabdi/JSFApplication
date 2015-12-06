package web.controller;

import java.awt.AWTException;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.component.html.HtmlOutputText;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.richfaces.component.html.HtmlModalPanel;


import metier.eps.jsf.security.AbstractBakingBean;
import metier.eps.jsf.security.EpsEncrypter;
import metier.eps.jsf.security.LoginSecurity;
import metier.eps.jsf.security.user.UserContext;
import metier.eps.jsf.security.user.UserContextManagement;
import metier.eps.messages.BuildMessage;

import dao.Hibernate.Model.UserHabilitationParam;
import dao.Hibernate.Model.UserManagement;
import dao.Hibernate.Model.UserProfile;

import metier.appLists.ApplicationLists;
import metier.eps.utils.SessionUtils;
import metier.eps.utils.TransferableImage;
import web.controller.UserParamSearchBB;
import dao.*;
import metier.epsTools.EpsUtilities;
import metier.finder.UserFinder;

public class ChangePassBean extends AbstractBakingBean implements LoginSecurity {
	public ChangePassBean() {
	}

	private String oldPassword ="";
	private String newPassword ;
	private String cpassword ;
	
	private UserContext userc;
	private Character firstConnect ;
	
	private String showMsgPanel="";
	private String showUpassPanel="";
	
	private Character complexityFlag = UserParamSearchBB.complexity;
	
	public boolean validate = true;
	public boolean validPass = false;
	public boolean invalidPass = false;
	
	public static boolean showPassPanel = false;
	
	public HtmlModalPanel modalPanel;
	private String passValue;
	private String passStyle;
	
	public void construct(UserManagement userManagement) {
		
		userManagement.setUserCode(userc.getUserCode());
		userManagement.setUserName(userc.getUserName());
		userManagement.setIpAddressMang(userc.getIpAddressMang());
		userManagement.setIpAddress(userc.getIpAddress());
		userManagement.setUserBankCode(userc.getUserBankCode());
		userManagement.setUserBranchCode(userc.getUserBranchCode());
		
		userManagement.setNumberOfTries(userc.getNumberOfTries());
		userManagement.setNumberOfTriesAllowed(userc.getNumberOfTriesAllowed());
		if (userc.getNbreSeesionConnected() != 0){
			userManagement.setNbreSessionConnected(userc.getNbreSeesionConnected() - 1);
		}else{
			userManagement.setNbreSessionConnected(0);
		}
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
	
	public void validateSecondPassword() {
		
		String password = cpassword;
		DAO dao = new DAO();
		UserManagement userManagement = new UserManagement();
		UserContextManagement ucm = new UserContextManagement();
		ucm.initUserContext();
		
		
		if (EpsEncrypter.hashPassword(oldPassword).equals(ucm.getUserContext().getUserPassword().toString()))
		{
			if (passValue != null && !passValue.equals("Invalid Password")
					&& !passValue.equals("Low")) {

				if (!password.equals(newPassword) && newPassword.trim() != "") {
					validate = false;
					setShowUpassPanel("Richfaces.showModalPanel('msgPanel5')");
				} else {
					setValidate(true);

					userc = ucm.getUserContext();

					construct(userManagement);
					if (validate) {

						dao.getSession().clear();
						dao.saveOrUpdate(userManagement);

						setShowPassPanel(false);
						setShowUpassPanel("Richfaces.showModalPanel('upassPanel')");
					}
				}
			} else {
				setShowUpassPanel("Richfaces.showModalPanel('msgPanel6')");
			}
		}else{
			setShowUpassPanel("Richfaces.showModalPanel('msgPanel7')");
		}
	}
	
	public void activePanel (){
		
		if (showPassPanel){
			setShowPassPanel(false);
		}else{
			setShowPassPanel(true);
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
			if (newPassword.length() >= 8 && newPassword.length() <= 10) {

				setPassStyle("cursor:pointer; color:red; font-weight:bold;");
				setPassValue("Low secure level");
				setComplexityFlag('L');
			}
			if (newPassword.length() <= 14 && newPassword.length() > 10) {

				setPassStyle("cursor:pointer; color:blue; font-weight:bold;");
				setPassValue("Average secure level");
				setComplexityFlag('A');
			}
			if (newPassword.length() <= 20 && newPassword.length() > 14) {

				setPassStyle("cursor:pointer; color:green; font-weight:bold;");
				setPassValue("High secure level");
				setComplexityFlag('H');
			}
			
		}
		if (newPassword == "" || newPassword == null){
			
			setPassStyle("");
			setPassValue("");
			
		}
	}
	
	public void initiateUserContextManagement(UserContext userContext,UserManagement user) {
	    List<UserHabilitationParam> userAttributedRoles1;
		userContext.setUserCode(user.getUserCode());
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
		
		userAttributedRoles1 = UserContextManagement.retrieveUserAttributedRoles(userContext.getUserCode());
		String Tmp= null;
		for (UserHabilitationParam iterable_userHabilitationParam : userAttributedRoles1) {
			
			Tmp = Tmp + "," + iterable_userHabilitationParam.getEpsHabilitationParam().getCode();
			
		}
		userContext.setChaineAttributedRoles(Tmp);
		userContext.alert("ee");
		// userContext.setUserRoles((List) user
		// .getUserHabilitationParams().);

	}	
	
public String quitSession(){
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
	
	public String beforeExit(){
		
		releaseSession();
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
					+ "/login.jsf";
			System.out.println(url);
			ectx.redirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "logout";
	}
	
	public String captureScreen(){
		Robot robot;
		try {
			robot = new Robot();
			BufferedImage image = robot.createScreenCapture(
			         new Rectangle(java.awt.Toolkit.getDefaultToolkit().getScreenSize()) );
			image.getMinX();
			image.createGraphics().copyArea(600, 600, 600, 600, 600, 600);
			Toolkit toolKit = Toolkit.getDefaultToolkit();
			Clipboard cb = toolKit.getSystemClipboard();
			cb.setContents(new TransferableImage(image),null);
		} catch (AWTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	public String getShowUpassPanel() {
		return showUpassPanel;
	}

	public void setShowUpassPanel(String showUpassPanel) {
		this.showUpassPanel = showUpassPanel;
	}

	public UserContext getUserc() {
		return userc;
	}
	public void setUserc(UserContext userc) {
		this.userc = userc;
	}
	
	public boolean isShowPassPanel() {
		return showPassPanel;
	}

	public void setShowPassPanel(boolean showPassPanel) {
		ChangePassBean.showPassPanel = showPassPanel;
	}

	public boolean isValidPass() {
		return validPass;
	}

	public void setValidPass(boolean validPass) {
		this.validPass = validPass;
	}

	public boolean isInvalidPass() {
		return invalidPass;
	}

	public void setInvalidPass(boolean invalidPass) {
		this.invalidPass = invalidPass;
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
	public HtmlModalPanel getModalPanel() {
		return modalPanel;
	}
	public void setModalPanel(HtmlModalPanel modalPanel) {
		this.modalPanel = modalPanel;
	}

	public void onPageLoad() { 
		// TODO Auto-generated method stub

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
	
}
