package metier.finder;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import dao.Hibernate.Model.*;
import dao.DAO;

public class ClientFinder extends DAO {
	DAO obj = new DAO();
	public void ClientFinder(){};
	
	/*public HostAccount findHostAccount(String accountNumber){
		Criteria criteria=getSession().createCriteria(HostAccount.class);
		HostAccount hostAccount;
		criteria.add(Restrictions.eq("id.accountNumber", accountNumber));
		hostAccount=(HostAccount) criteria.setMaxResults(1).uniqueResult();
		return hostAccount;
		
	}*/
	/*public String findMaxHostAccount(){
		Criteria criteria=getSession().createCriteria(HostAccount.class);
		String hostAccount;
		criteria.setProjection(Projections.max("id.accountNumber"));
		hostAccount= ((String) criteria.setMaxResults(1).uniqueResult() == null ? "0" :(String) criteria.setMaxResults(1).uniqueResult());
		return hostAccount;
		
	}*/
	
	/*public String findMaxHostTransfer(){
		Criteria criteria=getSession().createCriteria(HostTransfer.class);
		String hostTransfer;
		criteria.setProjection(Projections.max("id.referenceNumber"));
		hostTransfer= ((String) criteria.setMaxResults(1).uniqueResult() == null ? "0" :(String) criteria.setMaxResults(1).uniqueResult());
		return hostTransfer;
		
	}*/

	/*public static  void main(String[] a) {
		
		ClientFinder clientFinder = new ClientFinder();
		Integer in;
		in = Integer.valueOf(clientFinder.findMaxHostAccount().toString())+1;
		System.out.print("Ping :" + in  );

    }*/

}
