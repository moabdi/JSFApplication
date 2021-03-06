package dao.Hibernate.Model;

// Generated 7 avr. 2010 17:51:19 by Hibernate Tools 3.2.2.GA

import java.util.Date;

/**
 * Merchants generated by hbm2java
 */
public class Merchants implements java.io.Serializable {

	private String msisdn;
	private String firstName;
	private String lastName;
	private String sexe;
	private String idNumber;
	private Date dob;
	private String email;
	private String city;
	private String postalCode;
	private String country;
	private String state;
	private String address;
	private String jobTitle;
	private Date creationDate;
	private String allowedTrxFlags;
	private String status;
	private String pin;
	private String description;
	private String accountNumber;

	public Merchants() {
	}

	public Merchants(String msisdn, String firstName, String lastName,
			String idNumber, String email, String allowedTrxFlags,
			String status, String pin) {
		this.msisdn = msisdn;
		this.firstName = firstName;
		this.lastName = lastName;
		this.idNumber = idNumber;
		this.email = email;
		this.allowedTrxFlags = allowedTrxFlags;
		this.status = status;
		this.pin = pin;
	}

	public Merchants(String msisdn, String firstName, String lastName,
			String sexe, String idNumber, Date dob, String email, String city,
			String postalCode, String country, String state, String address,
			String jobTitle, Date creationDate, String allowedTrxFlags,
			String status, String pin, String description, String accountNumber) {
		this.msisdn = msisdn;
		this.firstName = firstName;
		this.lastName = lastName;
		this.sexe = sexe;
		this.idNumber = idNumber;
		this.dob = dob;
		this.email = email;
		this.city = city;
		this.postalCode = postalCode;
		this.country = country;
		this.state = state;
		this.address = address;
		this.jobTitle = jobTitle;
		this.creationDate = creationDate;
		this.allowedTrxFlags = allowedTrxFlags;
		this.status = status;
		this.pin = pin;
		this.description = description;
		this.accountNumber = accountNumber;
	}

	public String getMsisdn() {
		return this.msisdn;
	}

	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getSexe() {
		return this.sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getIdNumber() {
		return this.idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public Date getDob() {
		return this.dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJobTitle() {
		return this.jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public Date getCreationDate() {
		return this.creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public String getAllowedTrxFlags() {
		return this.allowedTrxFlags;
	}

	public void setAllowedTrxFlags(String allowedTrxFlags) {
		this.allowedTrxFlags = allowedTrxFlags;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPin() {
		return this.pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAccountNumber() {
		return this.accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

}
