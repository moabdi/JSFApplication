package web.view;

import java.io.IOException;
import java.util.List;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.richfaces.component.html.HtmlDataTable;
import dao.Hibernate.Model.Customers;
import dao.Hibernate.Model.Errors;
import dao.Hibernate.Model.Merchants;



import javax.faces.event.ActionEvent;

import dao.DAO;
import metier.eps.jsf.security.AbstractBakingBean;
import javax.servlet.http.HttpServletRequest;



public class ErrorSearchBB extends AbstractBakingBean {
	
	private String errorId;
	private String customerCode;
	public  String testCriteria; 
	private List criteria = null;
	public  Customers customerAPASSER;
	public  Merchants merchantAPASSER ;
	public Errors errorAPASSER;
	private HtmlDataTable datable;
	private String enterModif = "CustomerParamSearch-search"; // variable pour le menu
	public  String Back_To_Welcome_Page="BackToWelcomePage";
    private String  alertMsg;
    private boolean   render= false; 
	private String callowedPayment;
	private String callowedBalance;
	private String callowedTransfer;
	
	private String mallowedPayment;
	private String mallowedBalance;
	private String mallowedTransfer;
   
    public ErrorSearchBB(){
    	
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
		String cretiria = null;
		cretiria = " as model where 1=1 ";
		 if (this.customerCode != null && getCustomerCode().length()>0) {cretiria = cretiria + " and model.customerMsisdn like '%"+getCustomerCode()+"%' " ;}
		if (getErrorId().length()>0) {cretiria = cretiria + " and model.errorId like '%"+getErrorId()+"%'" ;} 
		
		setTestCriteria(cretiria);
		criteria = searchDAO.findByGenCriteria("Errors", cretiria);
	
		
		/**DAO searchDAO = new DAO();
		Customers incomingVisaTransaction = new Customers();
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
		*/	
		
		return null;	
	}
	public String Refresh(){
	  this.customerCode ="";
	  this.errorId = "";
		return null;		
	}

	
	public String backToWelcomPage(){
		criteria=null;
		return Back_To_Welcome_Page;
	}
	
	public void selectId(ActionEvent event){
				callowedPayment = "";
				callowedBalance = "";
				callowedTransfer = "";
				
			DAO dao = new DAO();
			
			Errors error = (Errors) datable.getRowData();	
			
	        customerAPASSER = (Customers)  dao.findObjectById("Customers",error.getCustomerMsisdn());
	        
	        callowedPayment  = customerAPASSER.getAllowedTrxFlags().substring(0,1);
	        callowedBalance  = customerAPASSER.getAllowedTrxFlags().substring(1,2);
	        callowedTransfer = customerAPASSER.getAllowedTrxFlags().substring(2,3);
	}
	
	
public void selectIdt(ActionEvent event){
	mallowedPayment = "";
	mallowedBalance = "";
	mallowedTransfer = "";
		DAO dao = new DAO();
		Errors error = (Errors) datable.getRowData();	
		
        merchantAPASSER = (Merchants)  dao.findObjectById("Merchants",error.getMerchantMsisdn());
        
        
        //decortiquer le champ AllowedTrxFlags Merchant
        mallowedPayment  = merchantAPASSER.getAllowedTrxFlags().substring(0,1);
        mallowedBalance  = merchantAPASSER.getAllowedTrxFlags().substring(1,2);
        mallowedTransfer = merchantAPASSER.getAllowedTrxFlags().substring(2,3);
}
public void selectIdf(ActionEvent even){
		DAO dao = new DAO();
		Errors error = (Errors) datable.getRowData();	
		
        errorAPASSER = (Errors)  dao.findObjectById("Errors",error.getErrorId());
        merchantAPASSER = (Merchants)  dao.findObjectById("Merchants",error.getMerchantMsisdn());
        customerAPASSER = (Customers)  dao.findObjectById("Customers",error.getCustomerMsisdn());
        }

	public  Customers getCustomerAPASSER() {
		return customerAPASSER;
	}

	public  void setCustomerAPASSER(
			Customers customerAPASSER) {
		this.customerAPASSER = customerAPASSER;
	}

	public String getEnterModif() {
		return enterModif;
	}

	public void setEnterModif(String enterModif) {
		this.enterModif = enterModif;
	}



	public String getErrorId() {
		return errorId;
	}

	public void setErrorId(String errorId) {
		this.errorId = errorId;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getTestCriteria() {
		return testCriteria;
	}

	public void setTestCriteria(String testCriteria) {
		this.testCriteria = testCriteria;
	}


	public Errors getErrorAPASSER() {
		return errorAPASSER;
	}

	public void setErrorAPASSER(Errors errorAPASSER) {
		this.errorAPASSER = errorAPASSER;
	}

	public Merchants getMerchantAPASSER() {
		return merchantAPASSER;
	}

	public void setMerchantAPASSER(Merchants merchantAPASSER) {
		this.merchantAPASSER = merchantAPASSER;
	}

	public String getCallowedPayment() {
		return callowedPayment;
	}

	public void setCallowedPayment(String callowedPayment) {
		this.callowedPayment = callowedPayment;
	}

	public String getCallowedBalance() {
		return callowedBalance;
	}

	public void setCallowedBalance(String callowedBalance) {
		this.callowedBalance = callowedBalance;
	}

	public String getCallowedTransfer() {
		return callowedTransfer;
	}

	public void setCallowedTransfer(String callowedTransfer) {
		this.callowedTransfer = callowedTransfer;
	}

	public String getMallowedPayment() {
		return mallowedPayment;
	}

	public void setMallowedPayment(String mallowedPayment) {
		this.mallowedPayment = mallowedPayment;
	}

	public String getMallowedBalance() {
		return mallowedBalance;
	}

	public void setMallowedBalance(String mallowedBalance) {
		this.mallowedBalance = mallowedBalance;
	}

	public String getMallowedTransfer() {
		return mallowedTransfer;
	}

	public void setMallowedTransfer(String mallowedTransfer) {
		this.mallowedTransfer = mallowedTransfer;
	}

	

	
}
