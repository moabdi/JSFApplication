package dao.Hibernate.Model;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.faces.model.SelectItem;

import dao.DAO;

// Generated 2 oct. 2009 11:10:31 by Hibernate Tools 3.2.2.GA

/**
 * VListOfClaim generated by hbm2java
 */
public class VListOfClaim implements java.io.Serializable {

	private VListOfClaimId id;
	private String cardNumber;
	private String merchantNumber;
	private Date dateAndTimeCall;
	private String userTakenCall;
	private String userDispatchCall;
	private Date dispatchDate;
	private String userProcessing;
	private Date limitDate;
	private String callReason;
	private Character statusCode;
	private Date statusDate;
	private String action1Taken;
	private String action2Taken;
	private String action3Taken;
	private String action4Taken;
	private BigDecimal generatedFees;
	private String currencyCode;
	private String comments;
	private String wording;
	private String wordingmerchant;
	private String libelleDate;
	private String embossedName;
	private String merchantName;
	private Character entity;
	

	public VListOfClaim() {
	}

	public VListOfClaim(String cardNumber, String merchantNumber,
			String callId, Date dateAndTimeCall, String userTakenCall,
			String userDispatchCall, Date dispatchDate, String userProcessing,
			Date limitDate, String callReason, Character statusCode,
			Date statusDate, String action1Taken, String action2Taken,
			String action3Taken, String action4Taken, BigDecimal generatedFees,
			String currencyCode, String comments, Character entity,String embossedName,
			String merchantName) {
		this.cardNumber = cardNumber;
		this.merchantNumber = merchantNumber;
		this.id = new VListOfClaimId(callId) ;
		this.dateAndTimeCall = dateAndTimeCall;
		this.userTakenCall = userTakenCall;
		this.userDispatchCall = userDispatchCall;
		this.dispatchDate = dispatchDate;
		this.userProcessing = userProcessing;
		this.limitDate = limitDate;
		this.callReason = callReason;
		this.statusCode = statusCode;
		this.statusDate = statusDate;
		this.action1Taken = action1Taken;
		this.action2Taken = action2Taken;
		this.action3Taken = action3Taken;
		this.action4Taken = action4Taken;
		this.generatedFees = generatedFees;
		this.currencyCode = currencyCode;
		this.comments = comments;
		this.entity = entity;
		this.embossedName = embossedName;
		this.merchantName = merchantName;
	}
	public String getEmbossedName() {
		DAO dao = new DAO();
		String embossed;
		
		 String sql = "select EMBOSSED_NAME from CARD_DATA where CARD_NUMBER = '" +getCardNumber()+ "'";
	    	try{
	    		
	    		embossed = (String)dao.getSession().createSQLQuery(sql).uniqueResult();
	    		
	    		    		
	    	}catch (RuntimeException re) {
	    		throw re;
			}
	    	embossedName = embossed;
		return embossedName;
	}

	public void setEmbossedName(String embossedName) {
		this.embossedName = embossedName;
	}

	public String getMerchantName() {
		DAO dao = new DAO();
		String merchantN;
		
		 String sql = "select MERCHANT_NAME from MERCHANT_DATA where MERCHANT_NUMBER = '" +getMerchantNumber()+ "'";
	    	try{
	    		
	    		merchantN = (String)dao.getSession().createSQLQuery(sql).uniqueResult();
	    		
	    		    		
	    	}catch (RuntimeException re) {
	    		throw re;
			}
	    	merchantName = merchantN;
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getCardNumber() {
		return this.cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getMerchantNumber() {
		return this.merchantNumber;
	}

	public void setMerchantNumber(String merchantNumber) {
		this.merchantNumber = merchantNumber;
	}

	

	public Date getDateAndTimeCall() {
		return this.dateAndTimeCall;
	}

	public void setDateAndTimeCall(Date dateAndTimeCall) {
		this.dateAndTimeCall = dateAndTimeCall;
	}

	public String getUserTakenCall() {
		return this.userTakenCall;
	}

	public void setUserTakenCall(String userTakenCall) {
		this.userTakenCall = userTakenCall;
	}

	public String getUserDispatchCall() {
		return this.userDispatchCall;
	}

	public void setUserDispatchCall(String userDispatchCall) {
		this.userDispatchCall = userDispatchCall;
	}

	public Date getDispatchDate() {
		return this.dispatchDate;
	}

	public void setDispatchDate(Date dispatchDate) {
		this.dispatchDate = dispatchDate;
	}

	public String getUserProcessing() {
		return this.userProcessing;
	}

	public void setUserProcessing(String userProcessing) {
		this.userProcessing = userProcessing;
	}

	public Date getLimitDate() {
		return this.limitDate;
	}

	public void setLimitDate(Date limitDate) {
		this.limitDate = limitDate;
	}

	public String getCallReason() {
		return this.callReason;
	}

	public void setCallReason(String callReason) {
		this.callReason = callReason;
	}

	public Character getStatusCode() {
		return this.statusCode;
	}

	public void setStatusCode(Character statusCode) {
		this.statusCode = statusCode;
	}

	public Date getStatusDate() {
		return this.statusDate;
	}

	public void setStatusDate(Date statusDate) {
		this.statusDate = statusDate;
	}

	public String getAction1Taken() {
		return this.action1Taken;
	}

	public void setAction1Taken(String action1Taken) {
		this.action1Taken = action1Taken;
	}

	public String getAction2Taken() {
		return this.action2Taken;
	}

	public void setAction2Taken(String action2Taken) {
		this.action2Taken = action2Taken;
	}

	public String getAction3Taken() {
		return this.action3Taken;
	}

	public void setAction3Taken(String action3Taken) {
		this.action3Taken = action3Taken;
	}

	public String getAction4Taken() {
		return this.action4Taken;
	}

	public void setAction4Taken(String action4Taken) {
		this.action4Taken = action4Taken;
	}

	public BigDecimal getGeneratedFees() {
		return this.generatedFees;
	}

	public void setGeneratedFees(BigDecimal generatedFees) {
		this.generatedFees = generatedFees;
	}

	public String getCurrencyCode() {
		return this.currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public VListOfClaimId getId() {
		return id;
	}

	public void setId(VListOfClaimId id) {
		this.id = id;
	}

	/*public String getWording() {
		
			DAO dao = new DAO();
			CallReasonCard callAction1 = new CallReasonCard();
			String cretiria = null;
			
		    cretiria = " as model where 1=1 and model.id.reasonCode like '%"+callReason+"%'";
		    List<CallAction>  callList = new  ArrayList<CallAction>();
		    List<SelectItem>  callListtSI = new ArrayList<SelectItem>();
		    
		    callList = dao.findByGenCriteria("CallReasonCard", cretiria);
		    List<SelectItem> lists= (List<SelectItem>) dao.findByGenCriteria("CallReasonCard", cretiria);
		    Iterator it_code = lists.iterator();
		    callListtSI=new ArrayList<SelectItem>();
			
			while (it_code.hasNext()) {
				callAction1 = (CallReasonCard) it_code.next();
				callListtSI.add(new SelectItem(callAction1.getId().getReasonCode().trim(), callAction1.getWording()));
				this.wording = callAction1.getWording();
				if (this.wording != null) break;
				}
			
			return (this.wording);
			}
	    

	public void setWording(String wording) {
		this.wording = wording;
	}

	public String getWordingmerchant() {
		DAO dao = new DAO();
		CallReasonMerchant callAction1 = new CallReasonMerchant();
		String cretiria = null;
		
	    cretiria = " as model where 1=1 and model.id.reasonCode like '%"+callReason+"%'";
	    List<CallAction>  callList = new  ArrayList<CallAction>();
	    List<SelectItem>  callListtSI = new ArrayList<SelectItem>();
	    
	    callList = dao.findByGenCriteria("CallReasonCard", cretiria);
	    List<SelectItem> lists= (List<SelectItem>) dao.findByGenCriteria("CallReasonMerchant", cretiria);
	    Iterator it_code = lists.iterator();
	    callListtSI=new ArrayList<SelectItem>();
		
		while (it_code.hasNext()) {
			callAction1 = (CallReasonMerchant) it_code.next();
			callListtSI.add(new SelectItem(callAction1.getId().getReasonCode().trim(), callAction1.getWording()));
			this.wordingmerchant = callAction1.getWording();
			if (this.wordingmerchant != null) break;
			}
		
		return (this.wordingmerchant);
		}
	
*/
	public void setWordingmerchant(String wordingmerchant) {
		this.wordingmerchant = wordingmerchant;
	}

	public String getLibelleDate() {
		if(getDateAndTimeCall() != null){
		SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
		libelleDate = simpleFormat.format(getDateAndTimeCall());
		}
		return libelleDate;
	}

	public void setLibelleDate(String libelleDate) {
		this.libelleDate = libelleDate;
	}

	public Character getEntity() {
		return entity;
	}

	public void setEntity(Character entity) {
		this.entity = entity;
	}

}
