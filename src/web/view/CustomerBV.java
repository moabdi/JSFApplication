package web.view;
// default package
// Generated 31 mars 2010 11:08:08 by Hibernate Tools 3.2.2.GA

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

import org.hibernate.validator.Length;
import metier.eps.jsf.security.AbstractBakingBean;
import dao.Hibernate.Model.Customers;



/**
 * Customer generated by hbm2java
 */
public class CustomerBV extends AbstractBakingBean implements java.io.Serializable {

	//@Length(min = 3, message = "msisdn " + "numero")
	private String msisdn ="";
	private String firstName;
	private String lastName;
	private String idNumber;
	private Date dob;
	private String email;
	private String city;
	private String postalCode;
	private String country;
	private String state;
	private String address;
	private String jobTitle;
	private String employerName;
	private String employerNumber;
	private String employerPhone;
	private String employerAddress;
	private Date creationDate;
	private String allowedTrxFlags;
	private String status;
	private String pin;
	private String description;
	private String accountNumber;
	private String sexe = "";
	private String allowedPayment;
	private String allowedBalance;
	private String allowedTransfer;
	private List<SelectItem> items = new ArrayList<SelectItem>();
	private String duplicate;
	private String add;
	private String refresh;
	private String delete; 
	public static boolean pollEnabled = false;
	public  boolean addStatus =userReg.addStatus;
	public  boolean modifyStatus = userReg.modifyStatus;
	private Customers customerAPasser = (Customers) userReg.objAPasser;
	public String backPanel = "Richfaces.showModalPanel('backPanel')"; 
	public  String BACK_TO_SEARCH = "BackToSearchCustomer";
	public static boolean immediate = true; 
	private boolean offcal;
	private boolean offcal2;
	
	public CustomerBV() {
		
		loadlist();
		if (modifyStatus){
			init(customerAPasser);
		}
		
	}
	
	
	public void init(Customers cst){
		this.msisdn = cst.getMsisdn();
		this.firstName = cst.getFirstName();
		this.lastName = cst.getLastName();
		this.idNumber = cst.getIdNumber();
		this.dob = cst.getDob();
		this.email = cst.getEmail();
		this.city = cst.getCity();
		this.postalCode = cst.getPostalCode();
		this.country = cst.getCountry();
		this.state = cst.getState();
		this.address = cst.getAddress();
		this.jobTitle = cst.getJobTitle();
		this.employerName = cst.getEmployerName();
		this.employerNumber = cst.getEmployerNumber();
		this.employerPhone = cst.getEmployerPhone();
		this.employerAddress = cst.getEmployerAddress();
		this.creationDate = cst.getCreationDate();
		this.allowedPayment = cst.getAllowedTrxFlags().substring(0,1);
		this.allowedBalance = cst.getAllowedTrxFlags().substring(1,2);
		this.allowedTransfer = cst.getAllowedTrxFlags().substring(2,3);
		this.status = cst.getStatus();
		this.pin = cst.getPin();
		this.description = cst.getDescription();
		this.accountNumber = cst.getAccountNumber();
		this.sexe = cst.getSexe();
		
	}

	public void aadCostumer(){
		
	}
	
	public void getNumberaccount(ActionEvent evt) {
		this.accountNumber = "";
		if(this.msisdn != null){
			this.accountNumber = this.msisdn + this.msisdn;
		}
	}
	
	
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
	
	public void loadlist(){
		
		//items.clear();
		items.add(new SelectItem(1,"Mr"));
		items.add(new SelectItem(2,"Mme"));
		items.add(new SelectItem(3,"Mlle"));
	}

	public List<SelectItem> getItems() {
		return items;
	}

	public void setItems(List<SelectItem> items) {
		this.items = items;
	}

	
	
	
	public boolean isAddStatus() {
		return addStatus;
	}

	public void setAddStatus(boolean addStatus) {
		this.addStatus = addStatus;
	}

	public boolean isModifyStatus() {
		return modifyStatus;
	}

	public void setModifyStatus(boolean modifyStatus) {
		this.modifyStatus = modifyStatus;
	}

	public String getDuplicate() {
		return duplicate;
	}

	public void setDuplicate(String duplicate) {
		this.duplicate = duplicate;
	}

	public String getAdd() {
		return add;
	}

	public void setAdd(String add) {
		this.add = add;
	}

	public String getRefresh() {
		return refresh;
	}

	public void setRefresh(String refresh) {
		this.refresh = refresh;
	}

	public String getDelete() {
		return delete;
	}

	public void setDelete(String delete) {
		this.delete = delete;
	}

	public  boolean isPollEnabled() {
		return pollEnabled;
	}

	public  void setPollEnabled(boolean pollEnabled) {
		CustomerBV.pollEnabled = pollEnabled;
	}
	
	public String getBackPanel() {
		return backPanel;
	}
	public void setBackPanel(String backPanel) {
		this.backPanel = backPanel;
	}
	public  boolean isImmediate() {
		return immediate;
	}
	public  void setImmediate(boolean immediate) {
		CustomerBV.immediate = immediate;
	}
	
	
	public boolean isOffcal() {
		return offcal;
	}

	public void setOffcal(boolean offcal) {
		this.offcal = offcal;
	}



	public String getMsisdn() {
		return msisdn;
	}



	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public String getIdNumber() {
		return idNumber;
	}



	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}



	public Date getDob() {
		return dob;
	}



	public void setDob(Date dob) {
		this.dob = dob;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getPostalCode() {
		return postalCode;
	}



	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getJobTitle() {
		return jobTitle;
	}



	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}



	public String getEmployerName() {
		return employerName;
	}



	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}



	public String getEmployerNumber() {
		return employerNumber;
	}



	public void setEmployerNumber(String employerNumber) {
		this.employerNumber = employerNumber;
	}



	public String getEmployerPhone() {
		return employerPhone;
	}



	public void setEmployerPhone(String employerPhone) {
		this.employerPhone = employerPhone;
	}



	public String getEmployerAddress() {
		return employerAddress;
	}



	public void setEmployerAddress(String employerAddress) {
		this.employerAddress = employerAddress;
	}



	public Date getCreationDate() {
		return creationDate;
	}



	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}



	public String getAllowedTrxFlags() {
		return getAllowedPayment()+ getAllowedBalance()+getAllowedTransfer();
	}



	public void setAllowedTrxFlags(String allowedPayment, String allowedBalance , String allowedTransfer) {
		setAllowedPayment(allowedPayment);
		setAllowedTransfer(allowedTransfer);
		setAllowedBalance(allowedBalance) ;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getPin() {
		return pin;
	}



	public void setPin(String pin) {
		this.pin = pin;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getAccountNumber() {
		return getMsisdn() + getMsisdn();
	}



	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}



	public String getSexe() {
		return sexe;
	}



	public void setSexe(String sexe) {
		this.sexe = sexe;
	}



	public String getAllowedPayment() {
		return allowedPayment;
	}



	public void setAllowedPayment(String allowedPayment) {
		this.allowedPayment = allowedPayment;
	}



	public String getAllowedBalance() {
		return allowedBalance;
	}



	public void setAllowedBalance(String allowedBalance) {
		this.allowedBalance = allowedBalance;
	}



	public String getAllowedTransfer() {
		return allowedTransfer;
	}



	public void setAllowedTransfer(String allowedTransfer2) {
		this.allowedTransfer = allowedTransfer2;
	}

	public boolean isOffcal2() {
		return offcal2;
	}

	public void setOffcal2(boolean offcal2) {
		this.offcal2 = offcal2;
	}
	
}
