package web.controller;
// default package
// Generated 31 mars 2010 11:08:08 by Hibernate Tools 3.2.2.GA

import java.io.IOException;
import java.util.List;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpServletRequest;
 
import metier.eps.jsf.security.AbstractBakingBean;
import metier.eps.jsf.security.LoginSecurity;
import metier.epsTools.FacesUtil;
import web.view.CustomerBV;
import web.view.CustomerParamSearch;
import dao.DAO;
import dao.Hibernate.Model.Customers;
import dao.Hibernate.Model.CustomerAccount;


public class CustomerBC extends AbstractBakingBean implements LoginSecurity {

	private CustomerBV cbeanView; // instance du bean lié aux composants de la vue.
	
	private CustomerParamSearch customerParamSearch;
	
	public boolean addStatus = userReg.addStatus;
	
	private String enterModif = "CustomerParamSearch-search"; // variable pour le menu
	
	public boolean modifyStatus = userReg.modifyStatus;
	
	public String backPanel = "Richfaces.showModalPanel('backPanel')";

	public static boolean pollEnabled = false; // A ajouter pour standardisation

	public static String BACK_TO_SEARCH = "BackToSearchCustomer";
	
	public  String FOPWARD_TO_ADD ="ForwardToaddCustomer";
	
	public static boolean immediate = true; 
	
	private Customers customerAPasser = (Customers) userReg.objAPasser;
	
	public  String testCriteria; 
	
	private List criteria = null;

	DAO dao=new DAO();
	
	
	public CustomerBC() {
	}

	public String Toback(){ // A modifier
		CustomerBC.pollEnabled = false;
		
		if(testCriteria!=null){
				initSearch(testCriteria);
			}
			releaseSession();
			return BACK_TO_SEARCH;
	}
	
	
	public String initSearch(String criterion) { // A ajouter
		DAO searchDAO = new DAO();
		criteria = searchDAO.findByGenCriteria("Bank", criterion);
		return null;
	}
	
	
	
	public String back() {

		if (backPanel != "") {
			return null;
		} else {
			return BACK_TO_SEARCH;
		}
	}
	
		
	
	public String ToAddRecord() { // A ajouter pour standardisation
		releaseSession();
		refresh();
		userReg.modifyStatus = false;
		userReg.addStatus = true;
		userReg.setRegistry();
		setModifyStatus(userReg.modifyStatus);
		setAddStatus(userReg.addStatus);
		CustomerParamSearch.actionDone = true;
		
		return null;}
	
	
	public void checkChanges(ActionEvent ev){ 
		
		if (addStatus){
			if(CustomerParamSearch.actionDone){ 
				setBackPanel("Richfaces.showModalPanel('backPanel')");
			}else{
				setBackPanel("");
			}
		}
		if (modifyStatus){
			if(CustomerParamSearch.actionDone){
				setBackPanel("");
			}else{
				setBackPanel("Richfaces.showModalPanel('backPanel')");
			}
		}
		
	}

/*	public String search(){
		DAO searchDAO = new DAO();
	
		String cretiria = null;
		cretiria = " as model where 1=1 ";
		 if (this.msisdn != null && getMsisdn().length()>0) {cretiria = cretiria + " and model.msisdn like '%"+getMsisdn()+"%' " ;}
		if (getEmail().length()>0) {cretiria = cretiria + " and model.email like '%"+getEmail()+"%'" ;} 
		
		setTestCriteria(cretiria);
		criteria = searchDAO.findByGenCriteria("Customers", cretiria);
		
		return null;		
	}*/
	
	public String ToDuplicateRecord() { // A ajouter pour standardisation
		releaseSession();
		
		userReg.modifyStatus = false;
		userReg.addStatus = true;
		userReg.setRegistry();
		setModifyStatus(userReg.modifyStatus);
		setAddStatus(userReg.addStatus);
		CustomerParamSearch.actionDone = true;
		
		return null;	
	}
	
	public String refresh() {

		this.cbeanView.setMsisdn("");
		this.cbeanView.setFirstName("");
		this.cbeanView.setLastName("");
		this.cbeanView.setIdNumber("");
		this.cbeanView.setDob(null);
		this.cbeanView.setEmail("");
		this.cbeanView.setCity("");
		this.cbeanView.setPostalCode("");
		this.cbeanView.setCountry("");
		this.cbeanView.setState("");
		this.cbeanView.setAddress("");
		this.cbeanView.setJobTitle("");
		this.cbeanView.setEmployerName("");
		this.cbeanView.setEmployerNumber("");
		this.cbeanView.setEmployerPhone("");
		this.cbeanView.setEmployerAddress("");
		this.cbeanView.setCreationDate(null);
		this.cbeanView.setAllowedTrxFlags(null ,null ,null);
		this.cbeanView.setStatus("");
		this.cbeanView.setPin("");
		this.cbeanView.setDescription("");
		this.cbeanView.setAccountNumber("");
		this.cbeanView.setSexe("");
	
		//FacesUtil.resetManagedBean("cbeanView"); 
		FacesUtil.resetManagedBean("customerBV"); 
		
		return FOPWARD_TO_ADD;
		
	}
		
	public void construct(Customers customer) {
		
		customer.setMsisdn(this.cbeanView.getMsisdn());
		customer.setFirstName(this.cbeanView.getFirstName());
		customer.setLastName(this.cbeanView.getLastName());
		customer.setIdNumber(this.cbeanView.getIdNumber());
		customer.setDob(this.cbeanView.getDob());
		customer.setEmail(this.cbeanView.getEmail());
		customer.setCity(this.cbeanView.getCity());
		customer.setPostalCode(this.cbeanView.getPostalCode());
		customer.setCountry(this.cbeanView.getCountry());
		customer.setState(this.cbeanView.getState());
		customer.setAddress(this.cbeanView.getAddress());
		customer.setJobTitle(this.cbeanView.getJobTitle());
		customer.setEmployerName(this.cbeanView.getEmployerName());
		customer.setEmployerNumber(this.cbeanView.getEmployerNumber());
		customer.setEmployerPhone(this.cbeanView.getEmployerPhone());
		customer.setEmployerAddress(this.cbeanView.getEmployerAddress());
		customer.setCreationDate(this.cbeanView.getCreationDate());
		customer.setAllowedTrxFlags(this.cbeanView.getAllowedTrxFlags());
		customer.setStatus(this.cbeanView.getStatus());
		customer.setPin(this.cbeanView.getPin());
		customer.setDescription(this.cbeanView.getDescription());
		customer.setAccountNumber(this.cbeanView.getAccountNumber());
		customer.setSexe(this.cbeanView.getSexe());
		
	}
	
	public void account(CustomerAccount account) {
		account.setAccountNumber(this.cbeanView.getAccountNumber());
	}
	
	public String valider() {
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
		DAO dao = new DAO();
		Customers custmers = new Customers();
		CustomerAccount accounts = new CustomerAccount();
		construct(custmers);
		account(accounts);
		if (cbeanView.getMsisdn()!=null){
		dao.save(custmers);
		dao.save(accounts);
		
		
		}
		/*if (checkExistRecord(Customer.class, Customer.)){
			returnMessageIfExistRecord("Customer ",custmers.getBankCode(), custmers.getMsisdn());
		}
		else{
			dao.save(custmers);
			facesContext.getMessages();
			returnMessageBeforeTrx("Bank", custmers.getMsisdn(),  custmers.getFirstName(),
					dao.isSuccessOperation(), 'I');
		}
		*/
		
		//CustomerSearchBB.actionDone = true;
		return null;
	}
	
	public void BuildCustomerWithoutId(Customers cstTo, Customers cstFrom){
		 
		cstTo.setMsisdn(cstFrom.getMsisdn());
		cstTo.setMsisdn(cstFrom.getMsisdn());
		cstTo.setFirstName(cstFrom.getFirstName());
		cstTo.setLastName(cstFrom.getLastName());
		cstTo.setIdNumber(cstFrom.getIdNumber());
		cstTo.setDob(cstFrom.getDob());
		cstTo.setEmail(cstFrom.getEmail());
		cstTo.setCity(cstFrom.getCity());
		cstTo.setPostalCode(cstFrom.getPostalCode());
		cstTo.setCountry(cstFrom.getCountry());
		cstTo.setState(cstFrom.getState());
		cstTo.setAddress(cstFrom.getAddress());
		cstTo.setJobTitle(cstFrom.getJobTitle());
		cstTo.setEmployerName(cstFrom.getEmployerName());
		cstTo.setEmployerNumber(cstFrom.getEmployerNumber());
		cstTo.setEmployerPhone(cstFrom.getEmployerPhone());
		cstTo.setEmployerAddress(cstFrom.getEmployerAddress());
		cstTo.setCreationDate(cstFrom.getCreationDate());
		cstTo.setAllowedTrxFlags(cstFrom.getAllowedTrxFlags());
		cstTo.setStatus(cstFrom.getStatus());
		cstTo.setPin(cstFrom.getPin());
		cstTo.setDescription(cstFrom.getDescription());
		cstTo.setAccountNumber(cstFrom.getAccountNumber());
		cstTo.setSexe(cstFrom.getSexe());
	}
	
	//modify a customer
	public String modify(){
		DAO dao = new DAO();
		Customers cstTmp = new Customers();
		Customers cstToModify = new Customers();
		Customers custFromBd = new Customers();
		cstTmp.setMsisdn(cstToModify.getMsisdn());
		custFromBd = (Customers)dao.findById("Customers",customerAPasser.getMsisdn());
		
		construct(cstToModify);
		BuildCustomerWithoutId(custFromBd, cstToModify);
		dao.saveOrUpdate(custFromBd);
		  if (!custFromBd.getMsisdn().equals(cstToModify.getMsisdn()))
		    {
		    	dao.delete(custFromBd);
		    	custFromBd.setMsisdn(cstToModify.getMsisdn());
		    	dao.save(custFromBd);
		    }
		    returnMessageBeforeTrx("Model", null, null, dao.isSuccessOperation(), 'U');
		    
		    // A ajouter pour standardisation
		    if (dao.isSuccessOperation()){
		    	cbeanView.pollEnabled = true;
		    	CustomerParamSearch.actionDone = true; 
			}
		    
		    return null;
	}
		
	
	//delete customer 
	public String delete(){
		
		DAO dao=new DAO();
		Customers cust = new Customers();
		Customers custToDelete= new Customers();
	    construct(custToDelete);
	    cust.setMsisdn(custToDelete.getMsisdn());
	    Customers custFromBd = new Customers();
	    custFromBd = (Customers) dao.findById("Customers",customerAPasser.getMsisdn());
	    BuildCustomerWithoutId(custFromBd,custToDelete);
	    dao.delete(custFromBd);
		returnMessageBeforeTrx("Model", null, null, dao.isSuccessOperation(), 'D');

		 // A ajouter pour standardisation
		
		if (dao.isSuccessOperation()){
			cbeanView.pollEnabled = true;
			CustomerParamSearch.actionDone = true;
		}
		return null;
		}
	
	
	
	public  boolean isAddStatus() {
		return addStatus;
	}

	public  void setAddStatus(boolean addStatus) {
		this.addStatus = addStatus;
	}

	public  boolean isModifyStatus() {
		return modifyStatus;
	}

	public  void setModifyStatus(boolean modifyStatus) {
		this.modifyStatus = modifyStatus;
	}

	public CustomerBV getCbeanView() {
		return cbeanView;
	}

	public void setCbeanView(CustomerBV beanView) {
		this.cbeanView = beanView;
	}

	public String getBackPanel() {
		return backPanel;
	}

	public void setBackPanel(String backPanel) {
		this.backPanel = backPanel;
	}


	public  boolean isPollEnabled() {
		return pollEnabled;
	}

	public  void setPollEnabled(boolean pollEnabled) {
		CustomerBC.pollEnabled = pollEnabled;
	}

	public  boolean isImmediate() {
		return immediate;
	}

	public  void setImmediate(boolean immediate) {
		CustomerBC.immediate = immediate;
	}

	public String getTestCriteria() {
		return testCriteria;
	}

	public void setTestCriteria(String testCriteria) {
		this.testCriteria = testCriteria;
	}

	public List getCriteria() {
		return criteria;
	}

	public void setCriteria(List criteria) {
		this.criteria = criteria;
	}

	//@Override
public void onPageLoad() { 
		
		initUserContext();
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
		}else{ // pour permettre au menu de suivre l'utilisateur
			// userReg = new UserSessionRegistry();
			userContext.setModifyView("<script language='JavaScript'> var vModif = '"+ enterModif +"'.split('-'); </script>");
			if (userReg.beanName != this.getClass().getName()){
				resetBean();
				initUserRegistry();
				if(criteria!= null && criteria.size()>0){criteria.clear();}
				userReg.beanName = this.getClass().getName();
				userReg.setRegistry();
				if (userReg.userVars.size() == 0){
					// resetSessionVars();
				}
			}
			
			/*if (this.val == null){
				String text = "0";
				userReg.userVars.add(new EpsParameter("val_bankEps", text));
				userReg.setRegistry();
				this.val = (String) SessionUtils.getAttribute("val_bankEps");
			}		*/			
			userReg.loadRegistry();
		};
			
		
	}


}
