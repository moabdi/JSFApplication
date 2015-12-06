package metier.epsTools;

import java.io.Serializable;
import java.util.Date;

public class AccountStructure implements Serializable {
	
	public String numberAccount;
	public String priorityAccount;
	public String typeAccount;
	public String currencyAccount;
	public String statusAccount;
	public Date statusDateAccount;
	public String listingAccount;
	
	
	public AccountStructure() {
		
		
	}


	public AccountStructure(String numberAccount, String priorityAccount,
			String typeAccount, String currencyAccount, String statusAccount,
			Date statusDateAccount, String listingAccount) {
		super();
		this.numberAccount = numberAccount;
		this.priorityAccount = priorityAccount;
		this.typeAccount = typeAccount;
		this.currencyAccount = currencyAccount;
		this.statusAccount = statusAccount;
		this.statusDateAccount = statusDateAccount;
		this.listingAccount = listingAccount;
	}


	public String getNumberAccount() {
		return numberAccount;
	}


	public void setNumberAccount(String numberAccount) {
		this.numberAccount = numberAccount;
	}


	public String getPriorityAccount() {
		return priorityAccount;
	}


	public void setPriorityAccount(String priorityAccount) {
		this.priorityAccount = priorityAccount;
	}


	public String getTypeAccount() {
		return typeAccount;
	}


	public void setTypeAccount(String typeAccount) {
		this.typeAccount = typeAccount;
	}


	public String getCurrencyAccount() {
		return currencyAccount;
	}


	public void setCurrencyAccount(String currencyAccount) {
		this.currencyAccount = currencyAccount;
	}


	public String getStatusAccount() {
		return statusAccount;
	}


	public void setStatusAccount(String statusAccount) {
		this.statusAccount = statusAccount;
	}


	public Date getStatusDateAccount() {
		return statusDateAccount;
	}


	public void setStatusDateAccount(Date statusDateAccount) {
		this.statusDateAccount = statusDateAccount;
	}


	public String getListingAccount() {
		return listingAccount;
	}


	public void setListingAccount(String listingAccount) {
		this.listingAccount = listingAccount;
	}

	
	
}
