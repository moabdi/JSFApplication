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
import web.view.CustomerParamSearch;
import web.view.MerchantBV;
import web.view.MerchantParamSearch;
import dao.DAO;
import dao.Hibernate.Model.MerchantAccount;
import dao.Hibernate.Model.Merchants;


public class MerchantBC extends AbstractBakingBean implements LoginSecurity {

	private MerchantBV merchantBV; // instance du bean lié aux composants de la vue.
	
	private CustomerParamSearch customerParamSearch;

	private String enterModif = "MerchantParamSearch-search"; 
	
	public boolean addStatus = userReg.addStatus;

	public boolean modifyStatus = userReg.modifyStatus;
	
	public String backPanel = "Richfaces.showModalPanel('backPanel')";

	public static boolean pollEnabled = false; // A ajouter pour standardisation

	public static String BACK_TO_SEARCH = "BackToSearchMerchant";
	
	public  String FOPWARD_TO_ADD ="ForwardToaddMerchant";
	
	public static boolean immediate = true; 
	
	private Merchants merchantAPasser = (Merchants) userReg.objAPasser;
	
	public  String testCriteria; 
	
	private List criteria = null;

	DAO dao=new DAO();
		
	
	public MerchantBC() {
	}

	public String Toback(){ // A modifier
		MerchantBC.pollEnabled = false;
			
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
		MerchantParamSearch.actionDone = true;
		
		return null;}
	
	
	public void checkChanges(ActionEvent ev){ 
		
		if (addStatus){
			if(MerchantParamSearch.actionDone){ 
				setBackPanel("Richfaces.showModalPanel('backPanel')");
			}else{
				setBackPanel("");
			}
		}
		if (modifyStatus){
			if(MerchantParamSearch.actionDone){
				setBackPanel("");
			}else{
				setBackPanel("Richfaces.showModalPanel('backPanel')");
			}
		}
		
	}


	public String ToDuplicateRecord() { // A ajouter pour standardisation
		releaseSession();
		
		userReg.modifyStatus = false;
		userReg.addStatus = true;
		userReg.setRegistry();
		setModifyStatus(userReg.modifyStatus);
		setAddStatus(userReg.addStatus);
		MerchantParamSearch.actionDone = true;
		
		return null;	
	}
	
	public String refresh() {

		this.merchantBV.setMsisdn("");
		this.merchantBV.setFirstName("");
		this.merchantBV.setLastName("");
		this.merchantBV.setIdNumber("");
		this.merchantBV.setDob(null);
		this.merchantBV.setEmail("");
		this.merchantBV.setCity("");
		this.merchantBV.setPostalCode("");
		this.merchantBV.setCountry("");
		this.merchantBV.setState("");
		this.merchantBV.setAddress("");
		this.merchantBV.setJobTitle("");
		this.merchantBV.setCreationDate(null);
		this.merchantBV.setAllowedTrxFlags(null ,null ,null);
		this.merchantBV.setStatus("");
		this.merchantBV.setPin("");
		this.merchantBV.setDescription("");
		this.merchantBV.setAccountNumber("");
		this.merchantBV.setSexe("");
		FacesUtil.resetManagedBean("merchantBV"); 
		//FacesUtil.resetManagedBean("merchantBV"); 
		
		return FOPWARD_TO_ADD;
		
	}
		
	public void construct(Merchants merchant) {
		
		merchant.setMsisdn(this.merchantBV.getMsisdn());
		merchant.setFirstName(this.merchantBV.getFirstName());
		merchant.setLastName(this.merchantBV.getLastName());
		merchant.setIdNumber(this.merchantBV.getIdNumber());
		merchant.setDob(this.merchantBV.getDob());
		merchant.setEmail(this.merchantBV.getEmail());
		merchant.setCity(this.merchantBV.getCity());
		merchant.setPostalCode(this.merchantBV.getPostalCode());
		merchant.setCountry(this.merchantBV.getCountry());
		merchant.setState(this.merchantBV.getState());
		merchant.setAddress(this.merchantBV.getAddress());
		merchant.setJobTitle(this.merchantBV.getJobTitle());
		merchant.setCreationDate(this.merchantBV.getCreationDate());
		merchant.setAllowedTrxFlags(this.merchantBV.getAllowedTrxFlags());
		merchant.setStatus(this.merchantBV.getStatus());
		merchant.setPin(this.merchantBV.getPin());
		merchant.setDescription(this.merchantBV.getDescription());
		merchant.setAccountNumber(this.merchantBV.getAccountNumber());
		merchant.setSexe(this.merchantBV.getSexe());
		
	}
	
	public void account(MerchantAccount account) {
		account.setAccountNumber(this.merchantBV.getAccountNumber());
		//account.setBalance(this.balance)
	}
	
	public String valider() {
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
		DAO dao = new DAO();
		Merchants custmers = new Merchants();
		MerchantAccount accounts = new MerchantAccount();
		construct(custmers);
		account(accounts);
		if (merchantBV.getMsisdn()!=null){
		dao.save(custmers);
		dao.save(accounts);
		
		
		}
		/*if (checkExistRecord(Merchant.class, Merchant.)){
			returnMessageIfExistRecord("Merchant ",custmers.getBankCode(), custmers.getMsisdn());
		}
		else{
			dao.save(custmers);
			facesContext.getMessages();
			returnMessageBeforeTrx("Bank", custmers.getMsisdn(),  custmers.getFirstName(),
					dao.isSuccessOperation(), 'I');
		}
		*/
		
		//MerchantSearchBB.actionDone = true;
		return null;
	}
	
	public void BuildMerchantWithoutId(Merchants cstTo, Merchants cstFrom){
		 
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
		cstTo.setCreationDate(cstFrom.getCreationDate());
		cstTo.setAllowedTrxFlags(cstFrom.getAllowedTrxFlags());
		cstTo.setStatus(cstFrom.getStatus());
		cstTo.setPin(cstFrom.getPin());
		cstTo.setDescription(cstFrom.getDescription());
		cstTo.setAccountNumber(cstFrom.getAccountNumber());
		cstTo.setSexe(cstFrom.getSexe());
	}
	
	//modify a merchant
	public String modify(){
		DAO dao = new DAO();
		Merchants cstTmp = new Merchants();
		Merchants cstToModify = new Merchants();
		Merchants custFromBd = new Merchants();
		cstTmp.setMsisdn(cstToModify.getMsisdn());
		custFromBd = (Merchants)dao.findById("Merchants",merchantAPasser.getMsisdn());
		
		construct(cstToModify);
		BuildMerchantWithoutId(custFromBd, cstToModify);
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
		    	merchantBV.pollEnabled = true;
		    	MerchantParamSearch.actionDone = true; 
			}
		    
		    return null;
	}
		
	
	//delete merchant 
	public String delete(){
		
		DAO dao=new DAO();
		Merchants cust = new Merchants();
		Merchants custToDelete= new Merchants();
	    construct(custToDelete);
	    cust.setMsisdn(custToDelete.getMsisdn());
	    Merchants custFromBd = new Merchants();
	    custFromBd = (Merchants) dao.findById("Merchants",merchantAPasser.getMsisdn());
	    BuildMerchantWithoutId(custFromBd,custToDelete);
	    dao.delete(custFromBd);
		returnMessageBeforeTrx("Model", null, null, dao.isSuccessOperation(), 'D');

		 // A ajouter pour standardisation
		
		if (dao.isSuccessOperation()){
			merchantBV.pollEnabled = true;
			MerchantParamSearch.actionDone = true;
		}
		return null;
		}
	
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
					//resetSessionVars();
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

	

	public MerchantBV getMerchantBV() {
		return merchantBV;
	}

	public void setMerchantBV(MerchantBV merchantBV) {
		this.merchantBV = merchantBV;
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
		MerchantBC.pollEnabled = pollEnabled;
	}

	public  boolean isImmediate() {
		return immediate;
	}

	public  void setImmediate(boolean immediate) {
		MerchantBC.immediate = immediate;
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


}
