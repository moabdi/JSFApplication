package web.controller;

import java.io.IOException;
import java.util.List;

import javax.faces.application.FacesMessage;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.richfaces.component.html.HtmlDataTable;

import javax.faces.event.ActionEvent;

import dao.DAO;
import dao.HibernateSessionFactory;

import dao.Hibernate.Model.UserManagement;

import javax.servlet.http.HttpServletRequest;

///Security
import metier.eps.jsf.security.*;

public class UserParamSearchBB extends AbstractBakingBean implements LoginSecurity {

	private String userCode;

	private String userName;

	private String userType;

	private String userPassword;

	private String userBankCode;

	private String userBranchCode;

	private Long numberOfTries;

	private String ipAddressMang;

	private String connected;

	private String ipAddress;

	private List criteria = null;

	private HtmlDataTable datable;
	
	public static String BACK_TO_SEARCH="BackToSearchUserManagement";

	public static String FOPWARD_TO_MODIFY = "ForwardToAddUserManagement";

	public static String FOPWARD_TO_ADD = "ForwardToAddUserManagement";

	public static String Back_To_Welcome_Page = "BackToWelcomePage";

	public static UserManagement userManagementAPasser;
	
	public static Character complexity;

	private String alertMsg;

	private boolean render = false;
	
	public static boolean  actionDone  = false;
	
	public static String testCriteria; // a ajouter pour standardisation

	private String accessRoles = "UserManagementParamRole,AdminRole,ParametersRoles";
	
	public Character getComplexity() {
		return complexity;
	}

	public void setComplexity(Character complexity) {
		UserParamSearchBB.complexity = complexity;
	}

	public String getAlertMsg() {
		return alertMsg;
	}

	public void setAlertMsg(String alertMsg) {
		this.alertMsg = alertMsg;
	}
	

	public boolean isActionDone() {
		return actionDone;
	}

	public void setActionDone(boolean actionDone) {
		UserParamSearchBB.actionDone = actionDone;
	}

	public boolean isRender() {
		return render;
	}

	public void setRender(boolean render) {
		this.render = render;
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

	public String getConnected() {
		return connected;
	}

	public void setConnected(String connected) {
		this.connected = connected;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public List getCriteria() {
		return criteria;
	}

	public void setCriteria(List criteria) {
		this.criteria = criteria;
	}

	public String getTestCriteria() {
		return testCriteria;
	}

	public void setTestCriteria(String testCriteria) {
		UserParamSearchBB.testCriteria = testCriteria;
	}

	public HtmlDataTable getDatable() {
		return datable;
	}

	public void setDatable(HtmlDataTable datable) {
		this.datable = datable;
	}

	public void onPageLoad() { initUserContext();
		if (!checkUserAccess(userContext.getUserCode(),this.getClass().getName())) {
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

	public String search() {
		DAO searchDAO = new DAO();
		UserManagement userManagement = new UserManagement();
		String cretiria = null;
		cretiria = " as model where 1=1 ";
		if (getUserCode().length() > 0) {
			cretiria = cretiria + " and model.userCode like '%"
					+ getUserCode() + "%' ";
		}
		if (getUserName().length() > 0) {
			cretiria = cretiria + " and model.wording like '%" + getUserName()
					+ "%'";
		}

		setTestCriteria(cretiria);
		criteria = searchDAO.findByGenCriteria("UserManagement", cretiria);

		return null;
	}

	public String Refresh() {
		this.userCode = "";
		this.userName = "";
		return null;
	}

	public String forwardModify() {
		UserParamBB.modifyStatus = true;
		UserParamBB.addStatus = false;
		return FOPWARD_TO_MODIFY;
	}
	public String initSearch(String criterion) { // A ajouter
		DAO searchDAO = new DAO();
		criteria = searchDAO.findByGenCriteria("UserManagement", criterion);
		return null;
	}
	
	public String back(){
		UserParamBB.pollEnabled=false;
		
		if(testCriteria!=null){
			initSearch(testCriteria);
		}
		return BACK_TO_SEARCH;
	}
	
	public String backToWelcomPage(){
		this.criteria = null;
		return Back_To_Welcome_Page;
	}

	public void selectId(ActionEvent evt) {
		DAO dao = new DAO();
		UserManagement userManagement1 = (UserManagement) datable.getRowData();
		UserManagement userManagement = new UserManagement();
		userManagement.setUserCode(userManagement1.getUserCode());
		Criteria criteria = HibernateSessionFactory.currentSession()
				.createCriteria(UserManagement.class);
		criteria.add(Restrictions.eq("id", userManagement.getUserCode()));
		userManagementAPasser = (UserManagement) criteria.uniqueResult();

	}

	public String addRecord() {
		UserParamBB.modifyStatus = false;
		UserParamBB.addStatus = true;
		setActionDone(false);
		return FOPWARD_TO_ADD;
	}

	private void alert(String message) {
		alertMsg = "<script language='JavaScript'> alert(unescape('" + message
				+ "')); </script>";
		render = true;
	}


	public UserManagement getUserManagementAPasser() {
		return userManagementAPasser;
	}

	public void setUserManagementAPasser(UserManagement userManagementAPasser) {
		UserParamSearchBB.userManagementAPasser = userManagementAPasser;
	}

}
