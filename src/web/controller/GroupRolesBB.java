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
import dao.Hibernate.Model.BatchGroup;
import dao.Hibernate.Model.BatchGroupId;
import dao.Hibernate.Model.EpsHabilitationParam;
import dao.Hibernate.Model.GroupMenuAccess;
import dao.Hibernate.Model.GroupMenuAccessId;
import dao.Hibernate.Model.UserHabilitationParam;
import dao.Hibernate.Model.UserManagement;

import metier.eps.jsf.security.LoginSecurity;
import metier.eps.jsf.security.user.UserContext;
import metier.eps.jsf.security.user.UserContextManagement;
import metier.eps.messages.BuildMessage;

import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;

public class GroupRolesBB extends AbstractBakingBean implements LoginSecurity {

	private String groupName;
	private String currentGroup;
	private List<String> listValuesRoles;
	private static List<String> listValuesRoles1;
	private ResultSet groupData;
	private String selectedInfo;
			
	private List<SelectItem> grouplistSI = new ArrayList<SelectItem>();
	private List grouplist = new ArrayList();
	
	String BACK_TO_WELCOME_PAGE = "BackToWelcomePage";
	private String accessRoles = "AdminRole,UserRolesParamRole";
	
	private HtmlPickList groupRolesPickList = new HtmlPickList();
	private List currentPickList = new ArrayList();
	private UISelectItems uiSelectedItems;
	
	
	public GroupRolesBB(){
		// ApplicationLists.InitStaticLists();
		loadGroups();
	}
	public String back() {
		return BACK_TO_WELCOME_PAGE;
	}
	
	public void construct(GroupMenuAccess group, String role){
		
		group.setId(new GroupMenuAccessId(this.groupName,role));
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
    	
    	// grouplistSI = new ArrayList<SelectItem>();
	}

	@SuppressWarnings("unchecked")
	
	public String valider() {
		groupRolesPickList.getValue();
		List selectedRoleList = new ArrayList();
		List notSelectedRoleList = new ArrayList<Object>();

		SelectItem selectItem = new SelectItem();
		List TempListSelected = null;
		
		if (groupRolesPickList.getValue() != null){
			TempListSelected = (List) groupRolesPickList.getValue();
			
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
			updateOrInsertOrDeleteRoles(groupName, selectedRoleList,
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
		if(currentGroup != null){
			this.groupName = currentGroup;
			currentGroup = "";
		retrieveSelectUsrRoles(this.groupName);
		// retrieveUserInfos(groupName);
		}
		// (String) getUserCode()

		return null;
	}

	public String Refresh() {
		// this.groupName = "";
		this.listValuesRoles = new ArrayList<String>();
		
		return null;
	}
	
	public String delete() {
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
		DAO dao=new DAO();
		
		Session session = dao.getSession();
		session.getTransaction().begin();
		
    	String sql = "delete from GROUP_MENU_ACCESS where GROUP_NAME like " +
    			"'%"+ groupName + "%'";
    	try{
    		session.createSQLQuery(sql).executeUpdate();
    				    		
    	}catch (Exception e) {
			e.printStackTrace();
		}
    	session.getTransaction().commit();
    	session.flush();
    	
    	returnMessageBeforeTrx("GroupMenuAccess", "",
				"",dao.isSuccessOperation(), 'D');
		
		return null;
	}
	
	public String AddRecord() {
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
		DAO dao=new DAO();
		GroupMenuAccess group = new GroupMenuAccess();
	    construct(group, "ConnectRole");
	    if (checkExistRecord(GroupMenuAccess.class, group.getId())){
			
	    	returnMessageIfExistRecord("GroupMenuAccess",group.getId().getGroupName(), " Exist ");
		}
		else{
			dao.save(group);
			facesContext.getMessages();
			returnMessageBeforeTrx("GroupMenuAccess", group.getId().getGroupName(),
					group.getId().getGroupName(), dao.isSuccessOperation(), 'I');
		}
	    grouplist = new ArrayList();
	    grouplistSI = new ArrayList<SelectItem>();
		loadGroups();
		return null;
	}
	
	public String refreshInfos() {

		this.listValuesRoles = new ArrayList<String>();
		
		return null;
	}

	public void fireUserRoles(ValueChangeEvent evt) {
		evt.getComponent();
		currentGroup = (String) evt.getNewValue();
		if (currentGroup == null) this.currentGroup="";
		setGroupName(currentGroup);
	}
	
	public void updatePickList(javax.faces.event.ActionEvent event) {
		
		currentPickList= (List) groupRolesPickList.getValue();
		System.out.println(currentPickList.size());
	}
	

	public void findt(javax.faces.event.ActionEvent evt) {
		// groupRolesPickList.getValue();
		//retrieveSelectUsrRoles((String) getUserCode());
		// this.userName = UserContextManagement.retrieveUser(currentGroup).getUserName();
	}

	public void findtt(javax.faces.event.ActionEvent evt) {
		// groupRolesPickList.getValue();
		evt.getComponent();
		// groupRolesPickList = getUserRolesPickList();
	}

	public void findtPickList(javax.faces.event.ActionEvent evt) {
		groupRolesPickList.getValue();

	}

	@SuppressWarnings( { "unchecked", "unused" })
	public void updateOrInsertOrDeleteRoles(String groupName, List Afectedroles,
			List deletedRoles) {
		List<GroupMenuAccess> groles; 
		List<String> newroles = new ArrayList();
		DAO dao = new DAO();
		
		for (Object DeletedrolesTmp : deletedRoles) {
			
			ApplicationLists.initRoleListSI(groupName);
			groles = new ArrayList();
			groles = ApplicationLists.roleGroupList;
			
				for (GroupMenuAccess role : groles ){
					
					if(role.getId().getRole().equals(DeletedrolesTmp)){
					Session session = dao.getSession();
					session.getTransaction().begin();
					
			    	String sql = "delete from GROUP_MENU_ACCESS where GROUP_NAME like " +
			    			"'%"+ groupName + "%' and ROLE " +
			    					"like '%"+ DeletedrolesTmp+"%'" ;
			    	try{
			    		session.createSQLQuery(sql).executeUpdate();
			    				    		
			    	}catch (Exception e) {
						e.printStackTrace();
					}
			    	session.getTransaction().commit();
			    	session.flush();
			    	break;
					}
				}
		}
		
		for (Object AfectedrolesTmp : Afectedroles) {
			
			ApplicationLists.initRoleListSI(groupName);
			groles = new ArrayList();
			newroles = new ArrayList();
			groles = ApplicationLists.roleGroupList;
			boolean found = false;
			GroupMenuAccess f_role = new GroupMenuAccess();
			for (GroupMenuAccess role : groles ){
				f_role = role;
				
				if(role.getId().getRole().equals(AfectedrolesTmp)){
					found = true;
					break;
				}
			}
			if (!found){
				newroles.add(AfectedrolesTmp.toString());
			}
			
		}
		
		if (newroles.size() > 0){
			for (String nrole : newroles ){
			
				GroupMenuAccess gm = new GroupMenuAccess();
				construct(gm, nrole);
				dao.save(gm);
			}
		}
		
		
	}
	
	public void retrieveUserInfos(String groupName) {
		
		DAO dao = new DAO();
		UserManagement userManagement = new UserManagement();
		
		userManagement = (UserManagement) dao.findById("UserManagement", groupName);
		
		// this.groupName = userManagement.getUserCode();
		
		
	}

	public void retrieveSelectUsrRoles(String groupName) {
		List<GroupMenuAccess> retrievedValues;
		List temporaryList = new ArrayList();
		EpsHabilitationParam epsHabilitationParam;
		Object[] selectedValues = null;
			
		if (groupName != null) {
			ApplicationLists.initRoleListSI(groupName);
			retrievedValues = ApplicationLists.roleGroupList;
			List<String> listValuesRolesTmp = new ArrayList<String>();
			for (GroupMenuAccess role : retrievedValues) {

				/*
				 * temporaryList.add(retrievedValuesCur.getEpsHabilitationParam()
				 * .getLibelle());
				 */
				listValuesRolesTmp.add(new String(role.getId().getRole()));
			}
			// selectedValues = temporaryList.toArray();
			// groupRolesPickList.getValue();
			setListValuesRoles(listValuesRolesTmp);
			setListValuesRoles1(listValuesRolesTmp);

			groupRolesPickList.setValue(listValuesRoles);
			setGroupRolesPickList(groupRolesPickList);

			// groupRolesPickList.getSubmittedValue();

		}
	}

	public String getUserCode() {
		return groupName;
	}

	public void setUserCode(String groupName) {
		this.groupName = groupName;
	}
	
	public ResultSet getUserData() {
		return groupData;
	}
	public void setUserData(ResultSet groupData) {
		this.groupData = groupData;
	}
	
	public List getCurrentPickList() {
		return currentPickList;
	}
	public void setCurrentPickList(List currentPickList) {
		this.currentPickList = currentPickList;
	}
	public List<SelectItem> getUserlistSI() {
		return grouplistSI;
	}
	public void setUserlistSI(List<SelectItem> userlistSI) {
		this.grouplistSI = userlistSI;
	}
	public List<String> getListValuesRoles() {
		return listValuesRoles;
	}

	public void setListValuesRoles(List<String> listValuesRoles) {
		this.listValuesRoles = listValuesRoles;
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
	// retrieveSelectUsrRoles(groupName);
	
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
		return currentGroup;
	}
	
	public List<SelectItem> getGrouplistSI() {
		return grouplistSI;
	}
	public void setGrouplistSI(List<SelectItem> grouplistSI) {
		this.grouplistSI = grouplistSI;
	}
	public HtmlPickList getGroupRolesPickList() {
		return groupRolesPickList;
	}
	public void setGroupRolesPickList(HtmlPickList groupRolesPickList) {
		this.groupRolesPickList = groupRolesPickList;
	}
	public void setCurrentUser(String currentGroup) {
		this.currentGroup = currentGroup;
	}
	public String getSelectedInfo() {
		return selectedInfo;
	}
	public void setSelectedInfo(String selectedInfo) {
		this.selectedInfo = selectedInfo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	

}
