package web.view;
/**
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.faces.application.FacesMessage;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import org.richfaces.component.html.HtmlDataTable;
import org.richfaces.component.html.HtmlScrollableDataTable;



import javax.faces.event.ActionEvent;

import metier.dao.DAO;
import metier.dao.HibernateSessionFactory;
import metier.epsTools.EpsParameter;
import Hibernate.Model.IncomingVisaTransaction;
import Hibernate.Model.IncomingVisaTransactionId;




import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;

import metier.appLists.*;
///Security
import eps.jsf.security.*;
import eps.jsf.security.user.UserContext;
import eps.messages.BuildMessage;
import eps.utils.SessionUtils;
*/

public class IncomingVisaTransactionSearchBB {// extends AbstractBakingBean implements LoginSecurity {
	/*****
	private String acquirerReferenceNumber;
	private Short sequenceNumber;
	private Date businessDate;
	private Date transactionDateTO;
	private Date transactionDate;
	private Date businessDateTO;
	private String cardNumber;
	private List criteria = null;
	public  IncomingVisaTransaction incomingVisaTransactionAPASSER;
	private HtmlDataTable datable;
	private String enterModif = "IncomingVisaTransactionSearchBB-search"; // variable pour le menu
	public  String Back_To_Welcome_Page="BackToWelcomePage";
    private String  alertMsg;
    private boolean   render= false; 
   
    public IncomingVisaTransactionSearchBB(){
    	
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
	
	
	
	
	public void onPageLoad() { initUserContext();
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
				initUserRegistry();
				userReg.beanName = this.getClass().getName();
				userReg.setRegistry();
			}
			
			userReg.loadRegistry();
		};

		
	}

	
	
	public String search(){
		DAO searchDAO = new DAO();
		IncomingVisaTransaction incomingVisaTransaction = new IncomingVisaTransaction();
		String cretiria = null;
		cretiria = " as model where 1=1 ";
		
			 
		if (this.acquirerReferenceNumber != null && getAcquirerReferenceNumber().length()>=0) {
			cretiria = cretiria + " and model.id.acquirerReferenceNumber like '%"+
			getAcquirerReferenceNumber()+"%' " ;
		}
		
		if (getSequenceNumber()!=null && getSequenceNumber().byteValue()>0) {
			cretiria = cretiria + " and model.id.sequenceNumber like '%"+
			getSequenceNumber()+"%' " ;
		}
		if (getBusinessDate()!=null) {
			SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
			String businessdate = simpleFormat.format(getBusinessDate());
						
			cretiria = cretiria + " and model.businessDate >='" + businessdate+"' ";
		}
		if (getBusinessDateTO()!=null) {
			SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
			String businessdateto = simpleFormat.format(getBusinessDateTO());
						
			cretiria = cretiria + " and model.businessDate <='" + businessdateto+"' ";
		}
		if (getTransactionDate()!=null) {
			SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
			String transactionDate = simpleFormat.format(getTransactionDate());
						
			cretiria = cretiria + " and model.transactionDate >='" + transactionDate+"' ";
		}
		if (getTransactionDateTO()!=null) {
			SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
			String transactionDateto = simpleFormat.format(getTransactionDateTO());
						
			cretiria = cretiria + " and model.transactionDate <='" + transactionDateto+"' ";
		}
		
	
		
		if (this.cardNumber != null && getCardNumber().length()>=	0) {cretiria = cretiria + " and model.cardNumber like '%"+getCardNumber()+"%' " ;}
		
		criteria = (List) searchDAO.findByGenCriteria("IncomingVisaTransaction", cretiria);
		
		 List listCriteria = new ArrayList();
         for (Object obj: criteria){
        	 IncomingVisaTransaction incoming= (IncomingVisaTransaction ) obj;
        	 incoming.setTransactionAmount(convertBigDecimal(incoming.getTransactionAmount(), incoming.getTransactionCurrency()));
        	 incoming.setBillingAmount(convertBigDecimal(incoming.getBillingAmount(), incoming.getBillingCurrency()));
        	 incoming.setLocalAmount(convertBigDecimal(incoming.getLocalAmount(), incoming.getLocalCurrency()));
        	 incoming.setSettlementAmount(convertBigDecimal(incoming.getSettlementAmount(), incoming.getSettlementCurrency()));
        	 incoming.setIssuerFeeAmount(convertBigDecimal(incoming.getIssuerFeeAmount(), incoming.getIssuerFeeCurrency()));
        	 incoming.setInterchangeFeeAmount(convertBigDecimal(incoming.getInterchangeFeeAmount(), incoming.getInterchangeFeeCurrency()));
        	
             listCriteria.add(incoming);
         }
         criteria = listCriteria;
		
		
		return null;		
	}
	public String Refresh(){
		this.acquirerReferenceNumber= "";
		this.sequenceNumber=null;
		this.cardNumber= "";
		this.businessDate=null;
		this.transactionDate= null;
		this.transactionDateTO=null;
		this.businessDateTO=null;
		return null;		
	}

	
	public String backToWelcomPage(){
		criteria=null;
		return Back_To_Welcome_Page;
	}
	
	
	public void selectId(ActionEvent evt){
	       DAO dao = new DAO();
	       IncomingVisaTransaction incoming = (IncomingVisaTransaction) datable.getRowData();
	      			
	        incomingVisaTransactionAPASSER = (IncomingVisaTransaction)  dao.findObjectById("IncomingVisaTransaction",incoming.getId());
	        
	        SessionUtils.setAttribute("currency_trx_amount", incomingVisaTransactionAPASSER.getTransactionCurrency());
			SessionUtils.setAttribute("currency_bill_amount", incomingVisaTransactionAPASSER.getBillingCurrency());
			SessionUtils.setAttribute("currency_lcl_amount", incomingVisaTransactionAPASSER.getLocalCurrency());
			SessionUtils.setAttribute("currency_settle_amount", incomingVisaTransactionAPASSER.getSettlementCurrency());
			SessionUtils.setAttribute("currency_issuer_amount", incomingVisaTransactionAPASSER.getIssuerFeeCurrency());
			SessionUtils.setAttribute("currency_inter_amount", incomingVisaTransactionAPASSER.getInterchangeFeeCurrency());
			
			
	}
	
	public String getAcquirerReferenceNumber() {
		return acquirerReferenceNumber;
	}

	public void setAcquirerReferenceNumber(String acquirerReferenceNumber) {
		this.acquirerReferenceNumber = acquirerReferenceNumber;
	}

	public Short getSequenceNumber() {
		return sequenceNumber;
	}

	public void setSequenceNumber(Short sequenceNumber) {
		this.sequenceNumber = sequenceNumber;
	}

	public Date getBusinessDate() {
		return businessDate;
	}

	public void setBusinessDate(Date businessDate) {
		this.businessDate = businessDate;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public Date getTransactionDateTO() {
		return transactionDateTO;
	}

	public void setTransactionDateTO(Date transactionDateTO) {
		this.transactionDateTO = transactionDateTO;
	}

	public Date getBusinessDateTO() {
		return businessDateTO;
	}

	public void setBusinessDateTO(Date businessDateTO) {
		this.businessDateTO = businessDateTO;
	}

	public  IncomingVisaTransaction getIncomingVisaTransactionAPASSER() {
		return incomingVisaTransactionAPASSER;
	}

	public  void setIncomingVisaTransactionAPASSER(
			IncomingVisaTransaction incomingVisaTransactionAPASSER) {
		this.incomingVisaTransactionAPASSER = incomingVisaTransactionAPASSER;
	}

	public String getEnterModif() {
		return enterModif;
	}

	public void setEnterModif(String enterModif) {
		this.enterModif = enterModif;
	}


	*/
}
