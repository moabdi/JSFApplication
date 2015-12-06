package metier.eps.jsf.security.user;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class UserContext {
	// Fields

	public  String userCode;

	public  String userName;

	public  String userType;

	public  String userPassword;

	public  String userBankCode;

	public   String userBranchCode;
	
	public 	String userLocale;
	
	public   String languageCode;

	public   Long numberOfTries;

	public   String ipAddressMang;

	public   String ipAddress;

	public   List userRoles;
	
	public   String connexionDate;
	
	public   String connexionTime;
	
	public  Date deconexionDate;
	
	//add by Jurin
	
	private Long numberOfTriesAllowed;
	
	private Integer nbreSessionAllowed;
	
	private Integer nbreSeesionConnected;
	
	private Integer lengthPassword;
	
	private Character complexityFlag;
	
	private Long expirationPassword;
	
	private Date dateStartPass;
	
	private Date dateEndPass;
	
	private Character blockAccess;
	
	public Long getNumberOfTriesAllowed() {
		return numberOfTriesAllowed;
	}

	public void setNumberOfTriesAllowed(Long numberOfTriesAllowed) {
		this.numberOfTriesAllowed = numberOfTriesAllowed;
	}

	public Integer getNbreSessionAllowed() {
		return nbreSessionAllowed;
	}

	public void setNbreSessionAllowed(Integer nbreSessionAllowed) {
		this.nbreSessionAllowed = nbreSessionAllowed;
	}

	public Integer getNbreSeesionConnected() {
		return nbreSeesionConnected;
	}

	public void setNbreSeesionConnected(Integer nbreSeesionConnected) {
		this.nbreSeesionConnected = nbreSeesionConnected;
	}

	public Integer getLengthPassword() {
		return lengthPassword;
	}

	public void setLengthPassword(Integer lengthPassword) {
		this.lengthPassword = lengthPassword;
	}

	public Character getComplexityFlag() {
		return complexityFlag;
	}

	public void setComplexityFlag(Character complexityFlag) {
		this.complexityFlag = complexityFlag;
	}

	public Long getExpirationPassword() {
		return expirationPassword;
	}

	public void setExpirationPassword(Long expirationPassword) {
		this.expirationPassword = expirationPassword;
	}

	public Date getDateStartPass() {
		return dateStartPass;
	}

	public void setDateStartPass(Date dateStartPass) {
		this.dateStartPass = dateStartPass;
	}

	public Date getDateEndPass() {
		return dateEndPass;
	}

	public void setDateEndPass(Date dateEndPass) {
		this.dateEndPass = dateEndPass;
	}

	public Character getBlockAccess() {
		return blockAccess;
	}

	public void setBlockAccess(Character blockAccess) {
		this.blockAccess = blockAccess;
	}
	
	//end add
	
	public  String chaineAttributedRoles;
	
	public String modifyView; // retrouver la vue en modification
	
	private  String  alertMsg;
	
	public String getConnexionDate() {
		return connexionDate;
	}

	public void setConnexionDate(String connexonDate) {
		this.connexionDate = connexonDate;
	}

	public Date getDeconexionDate() {
		return deconexionDate;
	}

	public void setDeconexionDate(Date deconexionDate) {
		this.deconexionDate = deconexionDate;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserBankCode() {
		return userBankCode;
	}

	public void setUserBankCode(String userBankCode) {
		this.userBankCode = userBankCode;
	}

	public String getUserBranchCode() {
		return userBranchCode;
	}

	public void setUserBranchCode(String userBranchCode) {
		this.userBranchCode = userBranchCode;
	}

	public Long getNumberOfTries() {
		return numberOfTries;
	}

	public void setNumberOfTries(Long numberOfTries) {
		this.numberOfTries = numberOfTries;
	}

	public String getIpAddressMang() {
		return ipAddressMang;
	}

	public void setIpAddressMang(String ipAddressMang) {
		this.ipAddressMang = ipAddressMang;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	@SuppressWarnings("unused")
	public List getUserRoles() {
		return userRoles;
	}
	@SuppressWarnings("unused")
	public void setUserRoles(List userRoles) {
		this.userRoles = userRoles;
	}

	public String getConnexionTime() {
		return connexionTime;
	}

	public void setConnexionTime(String connexionTime) {
		this.connexionTime = connexionTime;
	}

	public String getChaineAttributedRoles() {
		return chaineAttributedRoles;
	}

	public void setChaineAttributedRoles(String chaineAttributedRoles) {
		this.chaineAttributedRoles = chaineAttributedRoles;
	}
	public  void alert(String message) {
        alertMsg = "<script language='JavaScript'> var userRoles = '"+ chaineAttributedRoles +"'.split(','); </script>";
        
    }
	
	public String getAlertMsg() {
		return alertMsg;
	}

	public void setAlertMsg(String alertMsg) {
		this.alertMsg = alertMsg;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public String getUserLocale() {
		return userLocale;
	}

	public void setUserLocale(String userLocale) {
		this.userLocale = userLocale;
	}

	public String getModifyView() {
		return modifyView;
	}

	public void setModifyView(String modifyView) {
		this.modifyView = modifyView;
	}
	
}
