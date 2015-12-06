package web.view;

import java.io.IOException;
import java.util.List;
import javax.faces.application.FacesMessage;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.richfaces.component.html.HtmlDataTable;



import javax.faces.event.ActionEvent;

import dao.DAO;
import dao.Hibernate.Model.Customers;
import javax.servlet.http.HttpServletRequest;
 
///Security
import metier.eps.jsf.security.*;
import metier.eps.jsf.security.usersession.UserSessionRegistry;
import metier.eps.messages.BuildMessage;
import metier.eps.utils.SessionUtils;


public class CustomerParamSearch  extends AbstractBakingBean{
	
	private String msisdn;

	private String email;
	
	public  String testCriteria; 

	private List criteria = null;
	
	
	public static boolean  actionDone  = false;

	public HtmlDataTable datable;
	
	public  String FOPWARD_TO_MODIFY="ForwardToaddCustomer";
	
	public  String BACK_TO_SEARCH="BackToSearchCustomer";
	
	public  String FOPWARD_TO_ADD="ForwardToaddCustomer";
	
	public  String Back_To_Welcome_Page="BackToWelcomePage";
	
	public  Customers customerAPasser; 
	
	
	//public static String val="0";
	public  String val=(String) SessionUtils.getAttribute("val_bankEps");//init 0
    private String alertMsg;
    
    private boolean render= false; 
   
    public void CustomerParamSearch()
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
		criteria = searchDAO.findByGenCriteria("Customers", cretiria);
		
		return null;		
	}
	
	public String Refresh(){
		this.msisdn = "";
		this.email = "";
		
		return null;		
	}
	
	public String forwardModify(){
		//userReg = (UserSessionRegistry) SessionUtils.getAttribute("userSessionRegistry");
		if (customerAPasser == null){
			userReg.objAPasser = new Customers();
		    userReg.setRegistry();
			BuildMessage
			.addMessage(null,"",
					BuildMessage.getMessageResourceString("i18n.messages", "MSG_record_locked"
							, null, FacesContext.getCurrentInstance().getViewRoot().getLocale()),
					FacesMessage.SEVERITY_ERROR);
			initSearch(testCriteria);
			return null;
		}else{
			
			userReg.objAPasser = customerAPasser;
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
		CustomerParamSearch.actionDone = false;
		CustomerBV.pollEnabled=false;
		if(testCriteria!=null){
				initSearch(testCriteria);
			}
			releaseSession(); 
			return BACK_TO_SEARCH;
	}
	
	
	
	public String initSearch(String criterion) { // A ajouter
		DAO searchDAO = new DAO();
		criteria = searchDAO.findByGenCriteria("Customers", criterion);
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
	        Customers customers = (Customers) datable.getRowData();
	        customerAPasser = (Customers) dao.findByIdObjectLock(Customers.class, customers.getMsisdn());
			userReg.objAPasser = customerAPasser;
			userReg.setRegistry();
	      	       
	         //CustomerParamSearch.val="0";
	
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
		
	public Customers getCustomerAPasser() {
		return customerAPasser;
	}

	public void setcustomerAPasser(Customers customerAPasser) {
		this.customerAPasser = customerAPasser;
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
		CustomerParamSearch.actionDone = actionDone;
	}


	public String getTestCriteria() {
		return testCriteria;
	}


	public void setTestCriteria(String testCriteria) {
		this.testCriteria = testCriteria;
	}	
	
}
