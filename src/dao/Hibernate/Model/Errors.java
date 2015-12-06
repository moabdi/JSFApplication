package dao.Hibernate.Model;
// Generated 16 avr. 2010 11:24:25 by Hibernate Tools 3.2.2.GA


import java.util.Date;

/**
 * Errors generated by hbm2java
 */
public class Errors  implements java.io.Serializable {


     private String errorId;
     private String errorCode;
     private Date errorDate;
     private String customerMsisdn;
     private String merchantMsisdn;
     private String transactionCode;
     private Long ammount;
     private String memo;
     private String pinTiers;
     private String wrongPin;

    public Errors() {
    }

	
    public Errors(String errorId) {
        this.errorId = errorId;
    }
    public Errors(String errorId, String errorCode, Date errorDate, String customerMsisdn, String merchantMsisdn, String transactionCode, Long ammount, String memo, String pinTiers, String wrongPin) {
       this.errorId = errorId;
       this.errorCode = errorCode;
       this.errorDate = errorDate;
       this.customerMsisdn = customerMsisdn;
       this.merchantMsisdn = merchantMsisdn;
       this.transactionCode = transactionCode;
       this.ammount = ammount;
       this.memo = memo;
       this.pinTiers = pinTiers;
       this.wrongPin = wrongPin;
    }
   
    public String getErrorId() {
        return this.errorId;
    }
    
    public void setErrorId(String errorId) {
        this.errorId = errorId;
    }
    public String getErrorCode() {
        return this.errorCode;
    }
    
    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }
    public Date getErrorDate() {
        return this.errorDate;
    }
    
    public void setErrorDate(Date errorDate) {
        this.errorDate = errorDate;
    }
    public String getCustomerMsisdn() {
        return this.customerMsisdn;
    }
    
    public void setCustomerMsisdn(String customerMsisdn) {
        this.customerMsisdn = customerMsisdn;
    }
    public String getMerchantMsisdn() {
        return this.merchantMsisdn;
    }
    
    public void setMerchantMsisdn(String merchantMsisdn) {
        this.merchantMsisdn = merchantMsisdn;
    }
    public String getTransactionCode() {
        return this.transactionCode;
    }
    
    public void setTransactionCode(String transactionCode) {
        this.transactionCode = transactionCode;
    }
    public Long getAmmount() {
        return this.ammount;
    }
    
    public void setAmmount(Long ammount) {
        this.ammount = ammount;
    }
    public String getMemo() {
        return this.memo;
    }
    
    public void setMemo(String memo) {
        this.memo = memo;
    }
    public String getPinTiers() {
        return this.pinTiers;
    }
    
    public void setPinTiers(String pinTiers) {
        this.pinTiers = pinTiers;
    }
    public String getWrongPin() {
        return this.wrongPin;
    }
    
    public void setWrongPin(String wrongPin) {
        this.wrongPin = wrongPin;
    }




}


