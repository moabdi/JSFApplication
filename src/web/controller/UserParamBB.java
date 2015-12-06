package web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.connection.UserSuppliedConnectionProvider;
import org.hibernate.validator.Length;
import org.richfaces.component.html.HtmlRichMessage;

import metier.eps.jsf.security.AbstractBakingBean;
import metier.eps.jsf.security.EpsEncrypter;
import metier.eps.jsf.security.LoginSecurity;
import metier.eps.messages.BuildMessage;

import dao.Hibernate.Model.EpsHabilitationParam;
import dao.Hibernate.Model.UserHabilitationParam;
import dao.Hibernate.Model.UserManagement;

import metier.appLists.ApplicationLists;
import dao.DAO;
import metier.finder.UserFinder;

public class UserParamBB extends AbstractBakingBean implements LoginSecurity {

	@Length(min = 3, message = "userCode " + "{length}")
	private String userCode;

	private String userName;

	private String userType = "O";

	private String userPassword;

	private String userBankCode;

	private String userBranchCode;

	private Long numberOfTries;

	private Long numberOfTriesAllowed = Long.valueOf(1);

	private Character firstConnection;

	private Integer nbreSessionAllowed = 1;

	private Integer nbreSeesionConnected;

	private Integer lengthPassword;
	
	private String languageCode = "ENG";

	private Character complexityFlag = UserParamSearchBB.complexity;

	private Long expirationPassword;

	private Date dateStartPass;

	private Date dateEndPass;

	private Character blockAccess = 'N';

	private String ipAddressMang = "Y";

	private String connected;

	private String ipAddress;

	private String passValue;

	private String passStyle;

	private List<SelectItem> uiBranchSelectedItems = new ArrayList<SelectItem>();

	public static String newPassword = null;

	HtmlRichMessage messageConfirmPassword = new HtmlRichMessage();

	public String backPanel = "Richfaces.showModalPanel('backPanel')";

	public static boolean pollEnabled = false; // A ajouter pour standardisation

	public static String BACK_TO_SEARCH = "BackToSearchUserManagement";

	public boolean validate = true;

	public static boolean immediate = true; // A ajouter pour standardisation

	private Character expirationMang = 'Y';

	private boolean offcal;

	private boolean offIp;

	public static boolean addStatus = true;

	public static boolean modifyStatus = false;

	private boolean render = false;

	public static UserManagement userManagementAPasser = UserParamSearchBB.userManagementAPasser;

	private String accessRoles = "AdminRole,UserParamParamRole";

	public UserParamBB() {
		if (modifyStatus) {
			init(UserParamSearchBB.userManagementAPasser);
		}
	}

	public void init(UserManagement userManagement) {
		this.userCode = userManagement.getUserCode();
		this.userName = userManagement.getUserName();
		this.ipAddressMang = userManagement.getIpAddressMang();
		this.userBankCode = userManagement.getUserBankCode();
		this.userBranchCode = userManagement.getUserBranchCode();
		this.userPassword = userManagement.getUserPassword();
		this.ipAddress = userManagement.getIpAddress();
		this.languageCode = userManagement.getLanguageCode();

		this.userType = userManagement.getUserType();
		this.connected = userManagement.getConnected();
		this.complexityFlag = userManagement.getComplexityFlag();
		this.lengthPassword = userManagement.getLengthPassword();

		this.firstConnection = userManagement.getFirstConnection();
		this.blockAccess = userManagement.getBlockAccess();
		this.numberOfTriesAllowed = userManagement.getNumberOfTriesAllowed();
		this.nbreSessionAllowed = userManagement.getNbreSessionAllowed();
		this.nbreSeesionConnected = userManagement.getNbreSessionConnected();
		this.numberOfTries = userManagement.getNumberOfTries();

		this.expirationPassword = userManagement.getExpirationPassword();
		if (expirationPassword != 0 && expirationPassword != null) {
			setExpirationMang('Y');
		} else {
			setExpirationMang('N');
		}
		this.dateStartPass = userManagement.getDateStartPass();
		this.dateEndPass = userManagement.getDateEndPass();
	}

	public void construct(UserManagement userManagement) {
		userManagement.setUserCode(this.userCode);
		userManagement.setUserName(this.userName);
		userManagement.setIpAddressMang(this.ipAddressMang);
		userManagement.setIpAddress(this.ipAddress);
		userManagement.setUserBankCode(this.userBankCode);
		userManagement.setUserBranchCode(this.userBranchCode);

		if (this.languageCode.equals("ALL")){
			this.languageCode = "ENG";
		}
		userManagement.setLanguageCode(this.languageCode);
		userManagement.setUserPassword(EpsEncrypter
				.hashPassword(this.userPassword));
		userManagement.setUserType(this.userType);

		userManagement.setBlockAccess(this.blockAccess);
		userManagement.setNbreSessionAllowed(this.nbreSessionAllowed);
		userManagement.setNumberOfTriesAllowed(this.numberOfTriesAllowed);

		userManagement.setFirstConnection(this.firstConnection);

		if (expirationMang == 'Y' && dateEndPass != null) {
			Long diff;
			diff = dateEndPass.getTime()
					- Calendar.getInstance().getTimeInMillis();
			userManagement.setExpirationPassword(diff / (1000 * 60 * 60 * 24));
			userManagement.setDateStartPass(Calendar.getInstance().getTime());
			userManagement.setDateEndPass(this.dateEndPass);
		} else {
			userManagement.setExpirationPassword(Long.valueOf(0));
			userManagement.setDateStartPass(Calendar.getInstance().getTime());
		}

		if (modifyStatus) {
			userManagement.setLengthPassword(this.lengthPassword);
			userManagement.setConnected(this.connected);
			userManagement.setNumberOfTries(this.numberOfTries);
			userManagement.setNbreSessionConnected(this.nbreSeesionConnected);
		} else {
			userManagement.setLengthPassword(userPassword.length());
			userManagement.setConnected("N");
			userManagement.setNumberOfTries(Long.valueOf(0));
			userManagement.setNbreSessionConnected(0);
		}
		userManagement.setComplexityFlag(this.complexityFlag);

	}

	public void buildUserWithoutPassword(UserManagement userManagement) {

		userManagement.setUserCode(this.userCode);
		userManagement.setUserName(this.userName);
		userManagement.setIpAddressMang(this.ipAddressMang);
		userManagement.setIpAddress(this.ipAddress);
		userManagement.setUserBankCode(this.userBankCode);
		userManagement.setUserBranchCode(this.userBranchCode);
		userManagement.setLanguageCode(this.languageCode);

		userManagement.setUserType(this.userType);

		userManagement.setBlockAccess(this.blockAccess);
		userManagement.setNbreSessionAllowed(this.nbreSessionAllowed);
		userManagement.setNumberOfTriesAllowed(this.numberOfTriesAllowed);

		userManagement.setFirstConnection(this.firstConnection);

		if (expirationMang == 'Y' && dateEndPass != null) {
			Long diff;
			diff = dateEndPass.getTime() - this.dateStartPass.getTime();
			userManagement.setExpirationPassword(diff / (1000 * 60 * 60 * 24));
			userManagement.setDateStartPass(this.dateStartPass);
			userManagement.setDateEndPass(this.dateEndPass);
		} else {
			userManagement.setExpirationPassword(Long.valueOf(0));
			userManagement.setDateStartPass(this.dateStartPass);
		}
		userManagement.setNumberOfTries(Long.valueOf(0));
		userManagement.setNbreSessionConnected(this.nbreSeesionConnected);
		userManagement.setLengthPassword(this.lengthPassword);
		userManagement.setComplexityFlag(this.complexityFlag);
		userManagement.setConnected(this.connected);
		if (userManagement.getUserType().equals("S")) {
			attributeSupervisorRole1(userManagement);
			attributeSupervisorRole2(userManagement);
		}
		/*if (userManagement.getUserType().equals("O")) {
			UserFinder userFinder = new UserFinder();
			List<UserHabilitationParam> userHabilitationParamListS = userFinder
				.findRolesByUserAndRole(userManagement.getUserCode(),
					"R_SEC_PARAM_USR_MANAG_S");
			List<UserHabilitationParam> userHabilitationParamListU = userFinder
			.findRolesByUserAndRole(userManagement.getUserCode(),
				"R_SEC_PARAM_USR_MANAG_U");
			 Set<UserHabilitationParam> userHabilitationParamsSet;
			 userHabilitationParamsSet = userManagement.getUserHabilitationParams();
			
			for (UserHabilitationParam userHabilitationParam : userHabilitationParamListS) {
				UserHabilitationParam userHabilitationParamTemp = new UserHabilitationParam();
				
				userHabilitationParamTemp = userHabilitationParam;
				userHabilitationParamsSet.remove(userHabilitationParamTemp);

			}
			for (UserHabilitationParam userHabilitationParam : userHabilitationParamListU) {
				UserHabilitationParam userHabilitationParamTemp = new UserHabilitationParam();
				
				userHabilitationParamTemp = userHabilitationParam;
				userHabilitationParamsSet.remove(userHabilitationParamTemp);

			}
			userManagement.setUserHabilitationParams(userHabilitationParamsSet);
			
			
		}*/
	}
	
	public String resetSession(){
		DAO dao = new DAO();
		UserManagement userTmp = new UserManagement();
		UserManagement userToModify = new UserManagement();
		userTmp.setUserCode(userToModify.getUserCode());
		UserManagement userFromDB = new UserManagement();
		userFromDB = (UserManagement) dao.load(UserManagement.class,
				UserParamSearchBB.userManagementAPasser.getUserCode(), userTmp);
		
		userFromDB.setNbreSessionConnected(0);
		userFromDB.setConnected("N");
		
		dao.saveOrUpdate(userFromDB);
		returnMessageBeforeTrx("userManagement", userFromDB.getUserCode(),
				userFromDB.getUserName(), dao.isSuccessOperation(), 'U');
		dao.getSession().flush();
		UserParamSearchBB.actionDone =false;
			
		return null;
	}
	
	public String lockAccount (){
		DAO dao = new DAO();
		UserManagement userTmp = new UserManagement();
		UserManagement userToModify = new UserManagement();
		userTmp.setUserCode(userToModify.getUserCode());
		UserManagement userFromDB = new UserManagement();
		userFromDB = (UserManagement) dao.load(UserManagement.class,
				UserParamSearchBB.userManagementAPasser.getUserCode(), userTmp);
		if (userFromDB.getBlockAccess().equals('Y')){
			userFromDB.setBlockAccess('N');
		}else{
			if (userFromDB.getBlockAccess().equals('N')){
				userFromDB.setBlockAccess('Y');
			}
		}
		userFromDB.setNbreSessionConnected(0);
		
		dao.saveOrUpdate(userFromDB);
		returnMessageBeforeTrx("userManagement", userFromDB.getUserCode(),
				userFromDB.getUserName(), dao.isSuccessOperation(), 'U');
		dao.getSession().flush();
		UserParamSearchBB.actionDone =false;
		
		return null;
	}
	
	public String resetPass(){
		DAO dao = new DAO();
		UserManagement userTmp = new UserManagement();
		UserManagement userToModify = new UserManagement();
		userTmp.setUserCode(userToModify.getUserCode());
		UserManagement userFromDB = new UserManagement();
		userFromDB = (UserManagement) dao.load(UserManagement.class,
				UserParamSearchBB.userManagementAPasser.getUserCode(), userTmp);
		
		userFromDB.setUserPassword(EpsEncrypter
				.hashPassword(userFromDB.getUserCode()));
		userFromDB.setFirstConnection('Y');
		userFromDB.setComplexityFlag('L');
		
		dao.saveOrUpdate(userFromDB);
		returnMessageBeforeTrx("userManagement", userFromDB.getUserCode(),
				userFromDB.getUserName(), dao.isSuccessOperation(), 'U');
		dao.getSession().flush();
		UserParamSearchBB.actionDone =false;
		
		return null;
	}

	public String modify() {
		// actually, uses just for account access reset
		DAO dao = new DAO();
		UserManagement userTmp = new UserManagement();
		UserManagement userToModify = new UserManagement();
		userTmp.setUserCode(userToModify.getUserCode());
		UserManagement userFromDB = new UserManagement();
		userFromDB = (UserManagement) dao.load(UserManagement.class,
				UserParamSearchBB.userManagementAPasser.getUserCode(), userTmp);
		if (userFromDB.getNbreSessionConnected() != 0) {

			BuildMessage.addMessage(null, "User activity detected: ",
					"  he can't be updated", FacesMessage.SEVERITY_ERROR);

			return null;

		}

		if (!(userName.length() > 0)) {

			BuildMessage.addMessage(null, "User validation: ",
					" User name is required", FacesMessage.SEVERITY_ERROR);
			return null;

		}

		if (ipAddress != null && ipAddress.trim() == ""
				&& ipAddressMang.equals("Y")) {

			BuildMessage
					.addMessage(null, "IP management: ",
							" User IP address is required",
							FacesMessage.SEVERITY_ERROR);
			return null;
		}

		if (!(dateEndPass != null) && expirationMang.equals('Y')) {

			BuildMessage.addMessage(null, "Password management: ",
					" Expiry date for password is required",
					FacesMessage.SEVERITY_ERROR);
			return null;
		}

		buildUserWithoutPassword(userFromDB);
		
		dao.saveOrUpdate(userFromDB);
		//dao.delete(userFromDB.getUserHabilitationParams());
		returnMessageBeforeTrx("userManagement", userFromDB.getUserCode(),
				userFromDB.getUserName(), dao.isSuccessOperation(), 'U');
		dao.getSession().flush();
		UserParamSearchBB.actionDone = false;
		return null;

	}

	public String delete() {
		// actually, uses just for account access reset
		DAO dao = new DAO();
		UserManagement userTmp = new UserManagement();
		UserManagement userToModify = new UserManagement();
		userTmp.setUserCode(userToModify.getUserCode());
		UserManagement userFromDB = new UserManagement();
		userFromDB = (UserManagement) dao.load(UserManagement.class,
				UserParamSearchBB.userManagementAPasser.getUserCode(), userTmp);
		if (userFromDB.getNbreSessionConnected() != 0) {

			BuildMessage.addMessage(null, "User activity detected: ",
					"  he can't be deleted", FacesMessage.SEVERITY_ERROR);
			UserParamBB.pollEnabled = true;
			UserParamSearchBB.actionDone = true;

			return null;

		} else {
			dao.delete(userFromDB);
			returnMessageBeforeTrx("userManagement", userFromDB.getUserCode(),
					userFromDB.getUserName(), dao.isSuccessOperation(), 'D');

			UserParamBB.pollEnabled = true;
			UserParamSearchBB.actionDone = true;
		}

		return null;

	}

	public void refreshBranch(javax.faces.event.ActionEvent event) {
		// userRolesPickList.getValue();
		// retrieveSelectUsrRoles((String) getUserCode());
		if (userBankCode != "") {
			ApplicationLists.initBranchList(userBankCode);
			uiBranchSelectedItems = ApplicationLists.brachListSI;
		}
	}

	public String valider() {
		FacesContext facesContext = FacesContext.getCurrentInstance();
		FacesMessage facesMessage = new FacesMessage();
		String message = null;
		DAO dao = new DAO();
		UserManagement userManagement = new UserManagement();
		construct(userManagement);

		if (userPassword != null && userPassword.trim() != "") {

			if (!(userName.length() > 0)) {

				BuildMessage.addMessage(null, "User validation: ",
						"Sorry, user name is required",
						FacesMessage.SEVERITY_ERROR);
				return null;

			}
			if (userPassword.length() < 8) {

				BuildMessage.addMessage(null, "Password validation: ",
						"Sorry, user password is invalid",
						FacesMessage.SEVERITY_ERROR);
				return null;

			}
			if (ipAddress != null && ipAddress.trim() == ""
					&& ipAddressMang.equals("Y")) {

				BuildMessage.addMessage(null, "IP management: ",
						"Sorry, User IP address is required",
						FacesMessage.SEVERITY_ERROR);
				return null;
			}

			if (!(dateEndPass != null) && expirationMang.equals('Y')) {

				BuildMessage.addMessage(null, "Password management: ",
						"Sorry, Expiry date for password is required",
						FacesMessage.SEVERITY_ERROR);
				return null;
			}

			if (validate) {

				if (checkExistRecord(UserManagement.class, userManagement
						.getUserCode())) {
					returnMessageIfExistRecord("UserManagement ",
							userManagement.getUserCode(), userManagement
									.getUserName());
				} else {
					dao.save(userManagement);
					facesContext.getMessages();
					returnMessageBeforeTrx("User ", userManagement
							.getUserCode(), userManagement.getUserName(), dao
							.isSuccessOperation(), 'I');
					attributeConnecteRole(userManagement);
					if (userManagement.getUserType().equals("S")) {
						attributeSupervisorRole1(userManagement);
						attributeSupervisorRole2(userManagement);
					}
				}

				dao.getSession().flush();
				UserParamSearchBB.actionDone = true;

			}

		} else {

			BuildMessage.addMessage(null, "Password validation: ",
					"Sorry, user password is invalid",
					FacesMessage.SEVERITY_ERROR);
			return null;
		}
		return null;
	}

	public void controlCal() {

		if (expirationMang == 'N') {
			setOffcal(true);
		}
		if (expirationMang == 'Y') {
			setOffcal(false);
		}
	}

	public void controlIP() {

		if (ipAddressMang.equals("N")) {
			setOffIp(true);
		}
		if (ipAddressMang.equals("Y")) {
			setOffIp(false);
		}
	}

	public void checkpassvalue(ActionEvent ev) {

		String pass_regex = "^([\\p{Alnum}]*)([@?!:*=$]{1,})([0-9]{1,})([\\p{Alnum}]*)$"
				+ "|^([\\p{Alnum}]*)([0-9]{1,})([@?!:*=$]{1,})([\\p{Alnum}]*)$"
				+ "|^([\\p{Alnum}]*)([0-9]{1,})([@?!:*=$]{1,})([\\p{Alnum}]*)([@?!:*=$]{1,})$"
				+ "|^([\\p{Alnum}]*)([@?!:*=$]{1,})([0-9]{1,})([\\p{Alnum}]*)([@?!:*=$]{1,})$"
				+ "|^([\\p{Alnum}]*)([@?!:*=$]{1,})([0-9]{1,})([@?!:*=$]{1,})([\\p{Alnum}]*)([@?!:*=$]{1,})$"
				+ "|^([\\p{Alnum}]*)([@?!:*=$]{1,})([0-9]{1,})([@?!:*=$]{1,})([\\p{Alnum}]*)([@?!:*=$]{1,})([\\p{Alnum}]*)$";

		Pattern mask = Pattern.compile(pass_regex);
		Matcher matcher = mask.matcher(userPassword);

		System.out.println("Password validator");
		if (!matcher.find()) {

			setPassStyle("cursor:pointer; color:red; font-weight:bold;");
			setPassValue("Invalid Password");

		} else {

			if (userPassword.length() < 8) {

				setPassStyle("cursor:pointer; color:red; font-weight:bold;");
				setPassValue("Invalid Password");
			}

			if (userPassword.length() >= 8 && userPassword.length() <= 10) {

				setPassStyle("cursor:pointer; color:red; font-weight:bold;");
				setPassValue("Low secure");
				UserParamSearchBB.complexity = 'L';
			}
			if (userPassword.length() <= 14 && userPassword.length() > 10) {

				setPassStyle("cursor:pointer; color:blue; font-weight:bold;");
				setPassValue("Average secure");
				UserParamSearchBB.complexity = 'A';
			}
			if (userPassword.length() <= 20 && userPassword.length() > 14) {

				setPassStyle("cursor:pointer; color:green; font-weight:bold;");
				setPassValue("High secure");
				UserParamSearchBB.complexity = 'H';
			}
		}

		if (userPassword == "" || userPassword == null) {

			setPassStyle("");
			setPassValue("");

		}
	}

	public String refresh() {

		this.userCode = "";
		this.userName = "";
		this.firstConnection = 'Y';
		this.userBankCode = "";
		this.dateEndPass = null;
		this.ipAddressMang = "Y";
		this.blockAccess = 'N';
		this.expirationMang = 'Y';
		this.userType = "";
		this.nbreSessionAllowed = 1;
		this.numberOfTriesAllowed = Long.valueOf(1);
		this.uiBranchSelectedItems = new ArrayList<SelectItem>();
		return null;
	}

	public void checkChanges(ActionEvent ev) {

		if (addStatus) {
			if (UserParamSearchBB.actionDone) {
				setBackPanel("Richfaces.showModalPanel('backPanel')");
			} else {
				setBackPanel("");
			}
		}
		if (modifyStatus) {
			if (UserParamSearchBB.actionDone) {
				setBackPanel("");
			} else {
				setBackPanel("Richfaces.showModalPanel('backPanel')");
			}
		}

	}

	public String back() {

		if (backPanel != "") {
			return null;
		} else {
			return BACK_TO_SEARCH;
		}
	}

	public String ToAddRecord() { // A ajouter pour standardisation
		refresh();
		setAddStatus(true);
		setModifyStatus(false);
		UserParamSearchBB.actionDone = true;

		return null;
	}

	public String ToDuplicateRecord() { // A ajouter pour standardisation
		setAddStatus(true);
		setModifyStatus(false);
		UserParamSearchBB.actionDone = true;

		return null;
	}

	public void attributeConnecteRole(UserManagement userManagement) {
		DAO dao = new DAO();
		UserHabilitationParam userHabilitationParam = new UserHabilitationParam();
		EpsHabilitationParam epsHabilitationParam = new EpsHabilitationParam();
		epsHabilitationParam.setCode("ConnectRole");

		userHabilitationParam.setUserManagement(userManagement);
		userHabilitationParam.setStartDate(Calendar.getInstance().getTime());
		userHabilitationParam.setEndDate(Calendar.getInstance().getTime());
		userHabilitationParam.setEpsHabilitationParam(epsHabilitationParam);
		dao.save(userHabilitationParam);

	}

	public void attributeSupervisorRole1(UserManagement userManagement) {
		DAO dao = new DAO();
		UserHabilitationParam userHabilitationParam = new UserHabilitationParam();
		EpsHabilitationParam epsHabilitationParam = new EpsHabilitationParam();
		epsHabilitationParam.setCode("R_SEC_PARAM_USR_MANAG_S");

		userHabilitationParam.setUserManagement(userManagement);
		userHabilitationParam.setStartDate(Calendar.getInstance().getTime());
		userHabilitationParam.setEndDate(Calendar.getInstance().getTime());
		userHabilitationParam.setEpsHabilitationParam(epsHabilitationParam);
		dao.save(userHabilitationParam);

	}

	public void attributeSupervisorRole2(UserManagement userManagement) {
		DAO dao = new DAO();
		UserHabilitationParam userHabilitationParam = new UserHabilitationParam();
		EpsHabilitationParam epsHabilitationParam = new EpsHabilitationParam();
		epsHabilitationParam.setCode("R_SEC_PARAM_USR_MANAG_U");

		userHabilitationParam.setUserManagement(userManagement);
		userHabilitationParam.setStartDate(Calendar.getInstance().getTime());
		userHabilitationParam.setEndDate(Calendar.getInstance().getTime());
		userHabilitationParam.setEpsHabilitationParam(epsHabilitationParam);
		dao.save(userHabilitationParam);

	}

	public void validateSecondPassword(FacesContext context,
			UIComponent toValidate, Object value) {
		String RetapePassword = (String) value;

		if (!RetapePassword.equals(newPassword)) {
			validate = false;
			BuildMessage
					.addMessage(
							null,
							"Password validation: ",
							"Please, check password confirmation is diferent from password",
							FacesMessage.SEVERITY_ERROR);
		}
	}

	public boolean isOffIp() {
		return offIp;
	}

	public void setOffIp(boolean offIp) {
		this.offIp = offIp;
	}

	public boolean isOffcal() {
		return offcal;
	}

	public void setOffcal(boolean offcal) {
		this.offcal = offcal;
	}

	public Character getExpirationMang() {
		return expirationMang;
	}

	public void setExpirationMang(Character expirationMang) {
		this.expirationMang = expirationMang;
	}

	public String getPassStyle() {
		return passStyle;
	}

	public void setPassStyle(String passStyle) {
		this.passStyle = passStyle;
	}

	public String getPassValue() {
		return passValue;
	}

	public void setPassValue(String passValue) {
		this.passValue = passValue;
	}

	public void getNewPassword(ValueChangeEvent evt) {
		newPassword = (String) evt.getNewValue();
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserBankCode() {
		return userBankCode;
	}

	public void setUserBankCode(String userBankCode) {
		this.userBankCode = userBankCode;
	}

	public String getUserBranchCode() {
		return userBranchCode;
	}

	public void setUserBranchCode(String userBranchCode) {
		this.userBranchCode = userBranchCode;
	}

	public Long getNumberOfTries() {
		return numberOfTries;
	}

	public void setNumberOfTries(Long numberOfTries) {
		this.numberOfTries = numberOfTries;
	}

	public String getIpAddressMang() {
		return ipAddressMang;
	}

	public void setIpAddressMang(String ipAddressMang) {
		this.ipAddressMang = ipAddressMang;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public Long getNumberOfTriesAllowed() {
		return numberOfTriesAllowed;
	}

	public void setNumberOfTriesAllowed(Long numberOfTriesAllowed) {
		this.numberOfTriesAllowed = numberOfTriesAllowed;
	}

	public Character getFirstConnection() {
		return firstConnection;
	}

	public void setFirstConnection(Character firstConnection) {
		this.firstConnection = firstConnection;
	}

	public Integer getNbreSessionAllowed() {
		return nbreSessionAllowed;
	}

	public void setNbreSessionAllowed(Integer nbreSessionAllowed) {
		this.nbreSessionAllowed = nbreSessionAllowed;
	}

	public Integer getNbreSeesionConnected() {
		return nbreSeesionConnected;
	}

	public void setNbreSessionConnected(Integer nbreSeesionConnected) {
		this.nbreSeesionConnected = nbreSeesionConnected;
	}

	public Integer getLengthPassword() {
		return lengthPassword;
	}

	public void setLengthPassword(Integer lengthPassword) {
		this.lengthPassword = lengthPassword;
	}

	public Character getComplexityFlag() {
		return complexityFlag;
	}

	public void setComplexityFlag(Character complexityFlag) {
		this.complexityFlag = complexityFlag;
	}

	public Long getExpirationPassword() {
		return expirationPassword;
	}

	public void setExpirationPassword(Long expirationPassword) {
		this.expirationPassword = expirationPassword;
	}

	public Date getDateStartPass() {
		return dateStartPass;
	}

	public void setDateStartPass(Date dateStartPass) {
		this.dateStartPass = dateStartPass;
	}

	public Date getDateEndPass() {
		return dateEndPass;
	}

	public void setDateEndPass(Date dateEndPass) {
		this.dateEndPass = dateEndPass;
	}

	public Character getBlockAccess() {
		return blockAccess;
	}

	public void setBlockAccess(Character blockAccess) {
		this.blockAccess = blockAccess;
	}

	public List<SelectItem> getUiBranchSelectedItems() {
		return uiBranchSelectedItems;
	}

	public void setUiBranchSelectedItems(List<SelectItem> uiBranchSelectedItems) {
		this.uiBranchSelectedItems = uiBranchSelectedItems;
	}

	public HtmlRichMessage getMessageConfirmPassword() {
		return messageConfirmPassword;
	}

	public void setMessageConfirmPassword(HtmlRichMessage messageConfirmPassword) {
		this.messageConfirmPassword = messageConfirmPassword;
	}

	public String getBackPanel() {
		return backPanel;
	}

	public void setBackPanel(String backPanel) {
		this.backPanel = backPanel;
	}

	public boolean isPollEnabled() {
		return pollEnabled;
	}

	public void setPollEnabled(boolean pollEnabled) {
		UserParamBB.pollEnabled = pollEnabled;
	}

	public boolean isImmediate() {
		return immediate;
	}

	public void setImmediate(boolean immediate) {
		UserParamBB.immediate = immediate;
	}

	public boolean isValidate() {
		return validate;
	}

	public void setValidate(boolean validate) {
		this.validate = validate;
	}

	public void onPageLoad() {
		initUserContext();
		if (!checkUserAccess(userContext.getUserCode(), this.getClass()
				.getName())) {
			FacesContext fctx = FacesContext.getCurrentInstance();
			ExternalContext ectx = fctx.getExternalContext();
			String url = ((HttpServletRequest) ectx.getRequest())
					.getContextPath()
					+ "/pages/common/restrictionAccess.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
		;

	}

	public String getConnected() {
		return connected;
	}

	public void setConnected(String connected) {
		this.connected = connected;
	}

	public boolean isAddStatus() {
		return addStatus;
	}

	public void setAddStatus(boolean addStatus) {
		UserParamBB.addStatus = addStatus;
	}

	public boolean isModifyStatus() {
		return modifyStatus;
	}

	public void setModifyStatus(boolean modifyStatus) {
		UserParamBB.modifyStatus = modifyStatus;
	}

	public boolean isRender() {
		return render;
	}

	public void setRender(boolean render) {
		this.render = render;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

}
