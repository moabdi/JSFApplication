package metier.finder;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import dao.DAO;
import dao.HibernateSessionFactory;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import dao.Hibernate.Model.*;


public class UserFinder extends DAO{
	DAO obj = new DAO();
public void UserFinder(){};

	public List<UserHabilitationParam> findRolesByUser(String userCode){
		Criteria criteria=getSession().createCriteria(UserHabilitationParam.class);
		List<UserHabilitationParam> userHabilitationParamSet;
		criteria.add(Restrictions.eq("userManagement.userCode", userCode));
		userHabilitationParamSet=criteria.list();
		return userHabilitationParamSet;
		
	}
	public List<UserHabilitationParam> findRolesByUserAndRole(String userCode,String role){
		Criteria criteria=getSession().createCriteria(UserHabilitationParam.class);
		List<UserHabilitationParam> userHabilitationParamSet;
		criteria.add(Restrictions.eq("userManagement.userCode", userCode));
		criteria.add(Restrictions.eq("epsHabilitationParam.code", role));
		userHabilitationParamSet=criteria.list();
		return userHabilitationParamSet;
		

		
	}

	public UserManagement findUserManagement(String userCode){
		Criteria criteria=getSession().createCriteria(UserManagement.class);
		UserManagement userManagement;
		criteria.add(Restrictions.eq("userCode", userCode));
		userManagement=(UserManagement) criteria.setMaxResults(1).uniqueResult();
		return userManagement;
		
	}

	
	public List<UserManagement> findDistinctUsers(){
		List<UserManagement> uniqueUserManagementSet = new ArrayList<UserManagement>();
		Criteria criteria=getSession().createCriteria(UserManagement.class);
		List<UserManagement> userManagementSet;
		//criteria.setProjection(Projections.distinct(Projections.property("userCode")));
		userManagementSet=criteria.list();
		
		
		/*List<UserManagement> uniqueUserManagementSet =null;
		StringBuilder sb = new StringBuilder();
		sb.append(" select userManagement.*");
		sb.append(" from UserManagement userManagement ");
		Query query = getSession().createQuery(sb.toString());
		 
		userManagementSet =  query.list();
		*/
		for (UserManagement  temporaryList : userManagementSet) {
			if (!uniqueUserManagementSet.contains(temporaryList)){
				uniqueUserManagementSet.add(temporaryList);
				}
		}
		return uniqueUserManagementSet;
	}
}
