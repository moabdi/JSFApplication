package web.view;

import java.io.IOException;
import java.util.List;
import javax.faces.application.FacesMessage;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.richfaces.component.html.HtmlDataTable;



import javax.faces.event.ActionEvent;

import dao.DAO;
import dao.Hibernate.Model.Merchants;
import javax.servlet.http.HttpServletRequest;
 
///Security
import metier.eps.jsf.security.*;
import metier.eps.jsf.security.usersession.UserSessionRegistry;
import metier.eps.messages.BuildMessage;
import metier.eps.utils.SessionUtils;


public class MerchantParamSearch  extends AbstractBakingBean{
	
	private String msisdn;

	private String email;
	
	public  String testCriteria; 

	private List criteria = null;
	
	
	public static boolean  actionDone  = false;

	private String enterModif = "MerchantParamSearch-search"; // variable pour le menu

	public HtmlDataTable datable;
	
	public  String FOPWARD_TO_MODIFY="ForwardToaddMerchant";
	
	public  String BACK_TO_SEARCH="BackToSearchMerchant";
	
	public  String FOPWARD_TO_ADD="ForwardToaddMerchant";
	
	public  String Back_To_Welcome_Page="BackToWelcomePage";
	
	public  Merchants merchantAPasser; 
	
	
	//public static String val="0";
	public  String val=(String) SessionUtils.getAttribute("val_bankEps");//init 0
    private String alertMsg;
    
    private boolean render= false; 
   
    public void MerchantParamSearch()
    {
    	userReg = (UserSessionRegistry) SessionUtils.getAttribute("userSessionRegistry");
    	
    }
    	
	public String search(){
		DAO searchDAO = new DAO();
	
		String cretiria = null;
		cretiria = " as model where 1=1 ";
		 if (this.msisdn != null && getMsisdn().length()>0) {cretiria = cretiria + " and model.msisdn like '%"+getMsisdn()+"%' " ;}
		if (getEmail().length()>0) {cretiria = cretiria + " and model.email like '%"+getEmail()+"%'" ;} 
		
		setTestCriteria(cretiria);
		criteria = searchDAO.findByGenCriteria("Merchants", cretiria);
		
		return null;		
	}
	
	public String Refresh(){
		this.msisdn = "";
		this.email = "";
		
		return null;		
	}
	
	public String forwardModify(){
		//userReg = (UserSessionRegistry) SessionUtils.getAttribute("userSessionRegistry");
		if (merchantAPasser == null){
			userReg.objAPasser = new Merchants();
		    userReg.setRegistry();
			BuildMessage
			.addMessage(null,"",
					BuildMessage.getMessageResourceString("i18n.messages", "MSG_record_locked"
							, null, FacesContext.getCurrentInstance().getViewRoot().getLocale()),
					FacesMessage.SEVERITY_ERROR);
			initSearch(testCriteria);
			return null;
		}else{
			
			userReg.objAPasser = merchantAPasser;
			userReg.modifyStatus = true;
			userReg.addStatus = false;
			userReg.setRegistry();
			/*
			val="0";
			userReg.userVars.set(0,new EpsParameter("val_bankEps", val));
			userReg.setRegistry();
			*/
			return FOPWARD_TO_MODIFY;
		}
		
	}
	
	public String back(){ // A modifier
		MerchantParamSearch.actionDone = false;
		MerchantBV.pollEnabled=false;
		if(testCriteria!=null){
				initSearch(testCriteria);
			}
			releaseSession(); 
			return BACK_TO_SEARCH;
	}
	
	
	
	public String initSearch(String criterion) { // A ajouter
		DAO searchDAO = new DAO();
		criteria = searchDAO.findByGenCriteria("Merchants", criterion);
		return null;
	}
	
	public String backToWelcomPage(){
		this.criteria=null;
		
		return Back_To_Welcome_Page;
	}
	
@SuppressWarnings("unused")	
	
	public void selectId(ActionEvent evt){
	      DAO dao = new DAO();

			userReg = (UserSessionRegistry) SessionUtils.getAttribute("userSessionRegistry");
	        Merchants merchants = (Merchants) datable.getRowData();
	        merchantAPasser = (Merchants) dao.findByIdObjectLock(Merchants.class, merchants.getMsisdn());
			userReg.objAPasser = merchantAPasser;
			userReg.setRegistry();
	      	       
	         //MerchantParamSearch.val="0";
	
	}

	public String addRecord()
	{
		userReg = (UserSessionRegistry) SessionUtils.getAttribute("userSessionRegistry");
		userReg.modifyStatus = false;
		userReg.addStatus = true;
		userReg.setRegistry();
		setActionDone(false);
		/*
		val="0";
		userReg.userVars.set(0,new EpsParameter("val_bankEps", val));
		userReg.setRegistry();
		 */
		//return FOPWARD_TO_ADD;
		return FOPWARD_TO_ADD;
	}
		
	public Merchants getMerchantAPasser() {
		return merchantAPasser;
	}

	public void setMerchantAPasser(Merchants merchantAPasser) {
		this.merchantAPasser = merchantAPasser;
	}

	public void resetSessionVars(){
		this.val = null;
	}
	

	
	public String getAlertMsg() {
		return alertMsg;
	}

	public void setAlertMsg(String alertMsg) {
		this.alertMsg = alertMsg;
	}

	public boolean isRender() {
		return render;
	}

	public void setRender(boolean render) {
		this.render = render;
	}
	
	public String getMsisdn() {
		return msisdn;
	}

	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List getCriteria() {
		return criteria;
	}

	public void setCriteria(List criteria) {
		this.criteria = criteria;
	}

	public HtmlDataTable getDatable() {
		return datable;
	}

	public void setDatable(HtmlDataTable datable) {
		this.datable = datable;
	}

	public boolean isActionDone() {
		return actionDone;
	}


	public  void setActionDone(boolean actionDone) {
		MerchantParamSearch.actionDone = actionDone;
	}


	public String getTestCriteria() {
		return testCriteria;
	}


	public void setTestCriteria(String testCriteria) {
		this.testCriteria = testCriteria;
	}


	public String getEnterModif() {
		return enterModif;
	}


	public void setEnterModif(String enterModif) {
		this.enterModif = enterModif;
	}		
	
}
