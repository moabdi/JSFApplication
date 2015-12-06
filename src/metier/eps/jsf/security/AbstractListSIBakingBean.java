package metier.eps.jsf.security;

import java.util.List;

import javax.faces.model.SelectItem;

import metier.finder.ListFinder;

public abstract class AbstractListSIBakingBean {

	/*public void fillBankListSI(String bankCode,List<SelectItem> bankListSI){
		ListFinder listFinder= new ListFinder();
		listFinder.findBankById(bankCode);
		for (Bank bankEpsTmp : listFinder.findBankById(bankCode)) {
			bankListSI.add(new SelectItem(bankEpsTmp.getBankCode(),bankEpsTmp.getWording()));
		}
	}
	public void fillBranchListSI(BranchId branchId,List<SelectItem> branchListSI){
		ListFinder listFinder= new ListFinder();
		listFinder.findBranchById(branchId);
		for (Branch branchTmp : listFinder.findBranchById(branchId)) {
			branchListSI.add(new SelectItem(branchTmp.getId().getBranchCode()
											,branchTmp.getWording()));
		}
	}
	
	public void fillAccountTypeListSI(String accountType,List<SelectItem> accountTypeListSI){
		ListFinder listFinder= new ListFinder();
		listFinder.findAccountTypeById(accountType);
		for (AccountType accountTypeTmp : listFinder.findAccountTypeById(accountType)) {
			accountTypeListSI.add(new SelectItem(accountTypeTmp.getAccountType()
											,accountTypeTmp.getWording()));
		}
	}

	public void fillCurrencyListSI(String currencyCode,List<SelectItem> currencyListSI){
		ListFinder listFinder= new ListFinder();
		listFinder.findCurrencyById(currencyCode.trim());
		for (CurrencyCountryEps CurrencyCountryEpsTmp : listFinder.findCurrencyById(currencyCode.trim())) {
			currencyListSI.add(new SelectItem(CurrencyCountryEpsTmp.getCurrencyCode()
											,CurrencyCountryEpsTmp.getWording()));
		}
	}*/

}
