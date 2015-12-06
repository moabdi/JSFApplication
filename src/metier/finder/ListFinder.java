package metier.finder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import dao.Hibernate.Model.*;
import dao.DAO;

public class ListFinder extends DAO{
	DAO obj = new DAO();
	public List<Branch> findBranchByBank(String bankCode){
		Criteria criteria=getSession().createCriteria(Branch.class);
		List<Branch> branch;
		criteria.add(Restrictions.eq("id.bankCode", bankCode));
		branch=criteria.list();
		return branch;
		
	}

	public List<Branch> findBranchById(BranchId branchId){
		Criteria criteria=getSession().createCriteria(Branch.class);
		List<Branch> branch;
		criteria.add(Restrictions.eq("id", branchId));
		branch=criteria.list();
		return branch;
		
	}

	public List<Bank> findBankById(String bankCode ){
		Criteria criteria=getSession().createCriteria(Bank.class);
		List<Bank> bankEps;
		criteria.add(Restrictions.eq("bankCode", bankCode));
		bankEps=criteria.list();
		return bankEps;
		
	}

	/*public List<HostAccount> findHostAccountById(String referenceNumber ){
		Criteria criteria=getSession().createCriteria(HostAccount.class);
		List<HostAccount> hostAccount;
		criteria.add(Restrictions.eq("bankCode", referenceNumber));
		hostAccount=criteria.list();
		return hostAccount;
		
	}*/
	
	/*public List<AccountType> findAccountTypeById(String accountType){
		Criteria criteria=getSession().createCriteria(AccountType.class);
		List<AccountType> accountTypeList;
		criteria.add(Restrictions.eq("accountType", accountType));
		accountTypeList=criteria.list();
		return accountTypeList;
		
	}*/

	/*public List<HostDeposit> findHostDepositById(String referenceNumber){
		Criteria criteria=getSession().createCriteria(HostDeposit.class);
		List<HostDeposit> hostDepositList;
		criteria.add(Restrictions.eq("referenceNumber", referenceNumber));
		hostDepositList=criteria.list();
		return hostDepositList;
		
	}*/

	public List<CurrencyCountryEps> findCurrencyById(String currencyCode){
		Criteria criteria=getSession().createCriteria(CurrencyCountryEps.class);
		List<CurrencyCountryEps> currencyCountryEpsList;
		criteria.add(Restrictions.eq("currencyCode", currencyCode));
		currencyCountryEpsList=criteria.list();
		return currencyCountryEpsList;
		
	}
	public List findSysDate() {
		String hql = "SELECT SYSDATE FROM Dual";
		
		Query q = getSession().createSQLQuery(hql);
		List result = q.list();
		return result;
		
	}
	
	public List findSysDateTime() throws ParseException{
		String hql = "SELECT TO_CHAR(SYSDATE ,'DD/MM/RRRR hh24:mi:ss') FROM Dual";
		
		Query q = getSession().createSQLQuery(hql);
		List result = q.list();
		List tmp = new ArrayList();
		Date tmpDate;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy HH:mm:ss");
		
		for(int i = 0; i<result.size();i++){
			String dateString = (String) result.get(i);
			tmpDate = (Date) sdf.parse(dateString);
			tmp.add(tmpDate);
		}

		result= tmp;
		return result;
		
	}

	
}
