package web.controller;

import java.awt.event.ActionEvent;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.faces.application.FacesMessage;
import javax.faces.component.UISelectItem;
import javax.faces.component.UISelectItems;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

import org.apache.myfaces.custom.date.HtmlInputDate.UserData;
import org.hibernate.Query;
import org.hibernate.Session;
import org.richfaces.component.html.HtmlPickList;

import metier.eps.jsf.security.AbstractBakingBean;
import metier.eps.jsf.security.SecurityRoles;

import metier.appLists.ApplicationLists;
import dao.DAO;
import metier.finder.UserFinder;
import dao.Hibernate.Model.Bank;
import dao.Hibernate.Model.EpsHabilitationParam;
import dao.Hibernate.Model.GroupMenuAccess;
import dao.Hibernate.Model.UserHabilitationParam;
import dao.Hibernate.Model.UserManagement;

import metier.eps.jsf.security.LoginSecurity;
import metier.eps.jsf.security.user.UserContext;
import metier.eps.jsf.security.user.UserContextManagement;
import metier.eps.messages.BuildMessage;

import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;

public class UserRolesBB extends AbstractBakingBean implements LoginSecurity {

	private String userCode;
	private String userName;
	private String currentUser;
	private List<String> listValuesRoles;
	private static List<String> listValuesRoles1;
	private ResultSet userData;
	
	private String userType;

	private String userBankCode;

	private String userBranchCode;

	private Character firstConnection;
	
	private Integer nbreSessionAllowed;
	
	private Integer nbreSeesionConnected;
	
	private Integer lengthPassword;
	
	private Character complexityFlag;
	
	private Long expirationPassword;
	
	private Date dateStartPass;
	
	private Character blockAccess;

	private String ipAddress;

	private String connected;
	
	private String roleType = "R";
	
	private List<SelectItem> grouplistSI = new ArrayList<SelectItem>();
	
	private List<SelectItem> userRolelistSI = new ArrayList<SelectItem>();
	
	
	private List<SelectItem> userlistSI = new ArrayList<SelectItem>();
	
	String BACK_TO_WELCOME_PAGE = "BackToWelcomePage";
	private String accessRoles = "AdminRole,UserRolesParamRole";
	private HtmlPickList userRolesPickList = new HtmlPickList();
	private List currentPickList = new ArrayList();
	private String selectedInfo;
	private UISelectItems uiSelectedItems;
	private UserRolesBB userRoleBB;
	
	
	public UserRolesBB(){
		// ApplicationLists.InitStaticLists();
		userRolelistSI = ApplicationLists.epsHabilitationParamSI;
		loadUsers();
	}
	public String back() {
		return BACK_TO_WELCOME_PAGE;
	}
	
	public void loadUsers(){
    	
		DAO dao = new DAO();
    	Session session = dao.getSession();
    	String sql = session.getNamedQuery("users_retreive").getQueryString();
    	
    	try{
    		
    		Iterator results = session.createSQLQuery(sql).list().iterator();
    		while(results.hasNext()){
    			Object[] row = (Object[]) results.next();
    			String code = (String) row[0];
    			String name = (String) row[1];
    			// System.out.println("usercode = "+ code + "username = "+ name);
    			userlistSI.add(new SelectItem(code.trim(),name.trim()));
    		}
    		
    	}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void loadGroups(){
		
		DAO dao = new DAO();
		Session session = dao.getSession();
    	String sql = session.getNamedQuery("group_retreive").getQueryString();
    	
    	try{
    		int size = session.createSQLQuery(sql).list().size();
    		Iterator results = session.createSQLQuery(sql).list().iterator();
    		while(results.hasNext()){
    			String gname="";
    			gname = (String) results.next();
    		
    			grouplistSI.add(new SelectItem(gname.trim(),gname.trim()));
    		}
    		
    	}catch (Exception e) {
			e.printStackTrace();
		}
    	
	}
	
	public void reload(){
		userRolelistSI = new ArrayList<SelectItem>();
		ApplicationLists.InitStaticLists();
		if (roleType.equals("G")){
			this.listValuesRoles = new ArrayList<String>();
			grouplistSI = new ArrayList<SelectItem>();
			loadGroups();
			userRolelistSI = grouplistSI;
		}
		if (roleType.equals("R")){
			this.listValuesRoles = new ArrayList<String>();
			userRolelistSI = ApplicationLists.epsHabilitationParamSI;
		}
	}

	@SuppressWarnings("unchecked")
	
	public String valider() {
		userRolesPickList.getValue();
		DAO dao = new DAO();
		
		List selectedRoleList = new ArrayList();
		List notSelectedRoleList = new ArrayList<Object>();

		SelectItem selectItem = new SelectItem();
		List TempListSelected = new ArrayList();
		
		if (userRolesPickList.getValue() != null && userCode != null && userCode != "" ){
			
			if (roleType.equals("R")){
				
				TempListSelected = (List) userRolesPickList.getValue();
			
			}else{
				if (roleType.equals("G")){
					List<String> groles = (List<String>) userRolesPickList.getValue();
					List<GroupMenuAccess> roleGroupList;
					GroupMenuAccess rolegroup = new GroupMenuAccess();
					for (String group : groles) {
						roleGroupList = dao.findListByproperty("GroupMenuAccess", "id.role", "id.groupName", group);
						if (roleGroupList.size() != 0) {
							
							Iterator it = roleGroupList.iterator();
							while (it.hasNext()) {
								rolegroup = (GroupMenuAccess) it.next();
								TempListSelected.add(rolegroup.getId().getRole().trim());
							}
						}
					}
				}
			}
			
		}else{
			
			BuildMessage
			.addMessage(
					null,
					"",
					BuildMessage.getMessageResourceString("i18n.messages", "user_sel"
							, null, FacesContext.getCurrentInstance().getViewRoot().getLocale()),
					FacesMessage.SEVERITY_INFO);
			return null;
		}
		
		for (Object temporaryList : TempListSelected) {
			selectedRoleList.add(temporaryList);
		}

		List TempListNotSelected = (List) uiSelectedItems.getValue();

		for (Object temporaryList : TempListNotSelected) {
			selectItem = (SelectItem) temporaryList;
			if (!selectedRoleList.contains(selectItem.getValue())) {
				notSelectedRoleList.add((String) selectItem.getValue());
			}

		}
		
		if (selectedRoleList.size() > 0){
			updateOrInsertOrDeleteRoles(userCode, selectedRoleList,
				notSelectedRoleList);
			BuildMessage
			.addMessage(
					null,
					"",
					BuildMessage.getMessageResourceString("i18n.messages", "roles_upd"
							, null, FacesContext.getCurrentInstance().getViewRoot().getLocale()),
					FacesMessage.SEVERITY_INFO);
		}else{
			BuildMessage
			.addMessage(
					null,
					"",
					BuildMessage.getMessageResourceString("i18n.messages", "roles_warn"
							, null, FacesContext.getCurrentInstance().getViewRoot().getLocale()),
					FacesMessage.SEVERITY_ERROR);
		}
		
		return null;
	}
	
	public String searchRoles() {
		if(userCode != "" && userCode != null){
		retrieveSelectUsrRoles(userCode);
		retrieveUserInfos(userCode);
		}
		// (String) getUserCode()

		return null;
	}

	public String Refresh() {
		this.userCode = "";
		this.userName ="";
		this.userBankCode = "";
		this.userBranchCode = "";
		this.ipAddress = "";
		
		this.userType = "";
		this.connected = "";
		this.complexityFlag = null;
		this.lengthPassword = null;
		
		this.firstConnection = null;
		this.blockAccess = null;
		this.nbreSessionAllowed = null;
		
		this.expirationPassword = null;
		this.dateStartPass = null;
		this.roleType = "R";
		this.listValuesRoles = new ArrayList<String>();
		
		return null;
	}
	
	public String refreshInfos() {
		this.userName ="";
		this.userBankCode = "";
		this.userBranchCode = "";
		this.ipAddress = "";
		
		this.userType = "";
		this.connected = "";
		this.complexityFlag = null;
		this.lengthPassword = null;
		
		this.firstConnection = null;
		this.blockAccess = null;
		this.nbreSessionAllowed = null;
		
		this.expirationPassword = null;
		this.dateStartPass = null;
		this.listValuesRoles = new ArrayList<String>();
		
		return null;
	}

	public void fireUserRoles(ValueChangeEvent evt) {
		evt.getComponent();
		currentUser = (String) evt.getNewValue();
		this.userName = UserContextManagement.retrieveUser(currentUser).getUserName();
	}
	
	public void updatePickList(javax.faces.event.ActionEvent event) {
		
		currentPickList= (List) userRolesPickList.getValue();
		System.out.println(currentPickList.size());
	}
	

	public void findt(javax.faces.event.ActionEvent evt) {
		// userRolesPickList.getValue();
		//retrieveSelectUsrRoles((String) getUserCode());
		this.userName = UserContextManagement.retrieveUser(currentUser).getUserName();
	}

	public void findtt(javax.faces.event.ActionEvent evt) {
		// userRolesPickList.getValue();
		evt.getComponent();
		// userRolesPickList = getUserRolesPickList();
	}

	public void findtPickList(javax.faces.event.ActionEvent evt) {
		userRolesPickList.getValue();

	}

	@SuppressWarnings( { "unchecked", "unused" })
	public void updateOrInsertOrDeleteRoles(String userCode, List Afectedroles,
			List deletedRoles) {
		UserFinder userFinder = new UserFinder();
		DAO dao = new DAO();

		List<UserHabilitationParam> userHabilitationParamSet = userFinder
				.findRolesByUser(userCode);
		UserHabilitationParam userHabilitationParamExample = new UserHabilitationParam();
		EpsHabilitationParam epsHabilitationParam = new EpsHabilitationParam();
		UserManagement userManagement = new UserManagement();
		userManagement = userFinder.findUserManagement(userCode);
		
		/*if (userHabilitationParamSet.size() > 0) {
			for (UserHabilitationParam userHabilitationParam : userHabilitationParamSet) {
				userHabilitationParamExample = userHabilitationParam;
			}
		}
		
		Set<UserHabilitationParam> userHabilitationParamsSet;
		userHabilitationParamsSet = userManagement.getUserHabilitationParams();
		 
		if (userHabilitationParamSet.size() > 0) {
			userHabilitationParamsSet.clear();
		}
			for (Object AfectedrolesTmp : Afectedroles) {
				
				
				List<UserHabilitationParam> userHabilitationParamListS = userFinder
					.findRolesByUserAndRole(userManagement.getUserCode(),
						(String) AfectedrolesTmp);
				
				if(userHabilitationParamListS.size() != 0){
					Session session = dao.getSession();
					session.getTransaction().begin();
					
			    	String sql = "delete from USER_HABILITATION_PARAM where USER_CODE like " +
			    			"'%"+ userManagement.getUserCode() + "%' and HABILITATION_CODE " +
			    					"like '%"+ AfectedrolesTmp+"%'" ;
			    	try{
			    		session.createSQLQuery(sql).executeUpdate();
			    				    		
			    	}catch (Exception e) {
						e.printStackTrace();
					}
			    	session.getTransaction().commit();
			    	session.flush();
				}
				
				if (Afectedroles.size() != 0){
						
										
						UserHabilitationParam userHabilitationParam = new UserHabilitationParam();
						epsHabilitationParam.setCode((String)AfectedrolesTmp);

						userHabilitationParam.setUserManagement(userManagement);
						userHabilitationParam.setStartDate(Calendar.getInstance().getTime());
						userHabilitationParam.setEndDate(Calendar.getInstance().getTime());
						userHabilitationParam.setEpsHabilitationParam(epsHabilitationParam);
						userHabilitationParamsSet.add(userHabilitationParam);
						dao.save(userHabilitationParam);
						
				}else{
					
					if (userHabilitationParamSet.size() > 0) {
						userHabilitationParamsSet.clear();
					}
			
				}
				
			}
			userManagement.setUserHabilitationParams(userHabilitationParamsSet);*/
			// dao.saveOrUpdate(userManagement);
	}
	
	public void retrieveUserInfos(String userCode) {
		
		DAO dao = new DAO();
		UserManagement userManagement = new UserManagement();
		
		userManagement = (UserManagement) dao.findById("UserManagement", userCode);
		
		// this.userCode = userManagement.getUserCode();
		// this.userName = userManagement.getUserName();
		this.userBankCode = userManagement.getUserBankCode();
		this.userBranchCode = userManagement.getUserBranchCode();
		this.ipAddress = userManagement.getIpAddress();
		
		this.userType = userManagement.getUserType();
		this.connected = userManagement.getConnected();
		this.complexityFlag = userManagement.getComplexityFlag();
		this.lengthPassword = userManagement.getLengthPassword();
		
		this.firstConnection = userManagement.getFirstConnection();
		this.blockAccess = userManagement.getBlockAccess();
		this.nbreSessionAllowed = userManagement.getNbreSessionAllowed();
		
		this.expirationPassword = userManagement.getExpirationPassword();
		this.dateStartPass = userManagement.getDateStartPass();
		
	}

	public void retrieveSelectUsrRoles(String userCode) {
		List<UserHabilitationParam> retrievedValues;
		List temporaryList = new ArrayList();
		EpsHabilitationParam epsHabilitationParam;
		Object[] selectedValues = null;
			
		if (userCode != null) {
			retrievedValues = UserContextManagement
					.retrieveUserAttributedRoles(userCode);
			List<String> listValuesRolesTmp = new ArrayList<String>();
			for (UserHabilitationParam retrievedValuesCur : retrievedValues) {

				/*
				 * temporaryList.add(retrievedValuesCur.getEpsHabilitationParam()
				 * .getLibelle());
				 */
				listValuesRolesTmp.add(retrievedValuesCur
						.getEpsHabilitationParam().getCode());
			}
			// selectedValues = temporaryList.toArray();
			// userRolesPickList.getValue();
			setListValuesRoles(listValuesRolesTmp);
			setListValuesRoles1(listValuesRolesTmp);

			userRolesPickList.setValue(listValuesRoles);
			setUserRolesPickList(userRolesPickList);

			// userRolesPickList.getSubmittedValue();

		}
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	
	public ResultSet getUserData() {
		return userData;
	}
	public void setUserData(ResultSet userData) {
		this.userData = userData;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
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
	public void setNbreSeesionConnected(Integer nbreSeesionConnected) {
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
	public Character getBlockAccess() {
		return blockAccess;
	}
	public void setBlockAccess(Character blockAccess) {
		this.blockAccess = blockAccess;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getConnected() {
		return connected;
	}
	public void setConnected(String connected) {
		this.connected = connected;
	}
	public List getCurrentPickList() {
		return currentPickList;
	}
	public void setCurrentPickList(List currentPickList) {
		this.currentPickList = currentPickList;
	}
	public List<SelectItem> getUserlistSI() {
		return userlistSI;
	}
	public void setUserlistSI(List<SelectItem> userlistSI) {
		this.userlistSI = userlistSI;
	}
	public List<String> getListValuesRoles() {
		return listValuesRoles;
	}

	public void setListValuesRoles(List<String> listValuesRoles) {
		this.listValuesRoles = listValuesRoles;
	}

	public HtmlPickList getUserRolesPickList() {
		return userRolesPickList;
	}

	public void setUserRolesPickList(HtmlPickList userRolesPickList) {
		this.userRolesPickList = userRolesPickList;
	}

	public UserRolesBB getUserRoleBB() {
		return userRoleBB;
	}

	public void setUserRoleBB(UserRolesBB userRoleBB) {
		this.userRoleBB = userRoleBB;
	}

	public String getSelectedInfo() {
		return selectedInfo;
	}

	public void setSelectedInfo(String selectedInfo) {
		this.selectedInfo = selectedInfo;
	}

	public List<String> getListValuesRoles1() {
		return listValuesRoles1;
	}

	public void setListValuesRoles1(List<String> listValuesRoles1) {
		this.listValuesRoles1 = listValuesRoles1;
	}

	// NOT USED
	public void selectionChanged(ValueChangeEvent evt) {
		String[] selectedValues = (String[]) evt.getNewValue();

		if (selectedValues.length == 0) {
			selectedInfo = "No selected values";
		} else {

			StringBuffer sb = new StringBuffer("Selected values: ");

			for (int i = 0; i < selectedValues.length; i++) {
				if (i > 0)
					sb.append(", ");
				sb.append(selectedValues[i]);
			}

			selectedInfo = sb.toString();
		}
	}
	
	public void onPageLoad() { initUserContext();
	// retrieveSelectUsrRoles(userCode);
	
	if (!checkUserAccess(userContext.getUserCode(),this.getClass().getName()))
	{
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
	};
}

	public UISelectItems getUiSelectedItems() {
		return uiSelectedItems;
	}

	public void setUiSelectedItems(UISelectItems uiSelectedItems) {
		this.uiSelectedItems = uiSelectedItems;
	}

	public String getCurrentUser() {
		return currentUser;
	}
	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRoleType() {
		return roleType;
	}
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}
	public List<SelectItem> getGrouplistSI() {
		return grouplistSI;
	}
	public void setGrouplistSI(List<SelectItem> grouplistSI) {
		this.grouplistSI = grouplistSI;
	}
	public List<SelectItem> getUserRolelistSI() {
		return userRolelistSI;
	}
	public void setUserRolelistSI(List<SelectItem> userRolelistSI) {
		this.userRolelistSI = userRolelistSI;
	}

}
