package metier.globalVars;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dao.Hibernate.Model.EpsProfile;
import dao.DAO;

//Ajouter les variables globales de l'application depuis la table EPS_PROFILE

public class GlobalVars {
	//Nom de la variable doit etre la même dans la table EPS_PROFILE
	public static String EPS_HOME;
	
	public static Integer EPS_DATATABLE_MAX; // Max results in Datatable
	
	public static String EPS_DATATABLE_SIZE; // Datatable size
	
	public static String EPS_POPUPMSG_TIME; // Message window time

	public GlobalVars() {

		initGlobalVars();
	}

	public static void init() {
		new GlobalVars();
	}

	public void initGlobalVars() {
		DAO dao = new DAO();
		
		try {
			EPS_HOME = findGlobalVarsByCode("EPS_HOME", dao);
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			EPS_DATATABLE_MAX = Integer.parseInt(findGlobalVarsByCode("EPS_DATATABLE_MAX", dao));
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			EPS_DATATABLE_SIZE = findGlobalVarsByCode("EPS_DATATABLE_SIZE", dao);
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			EPS_POPUPMSG_TIME = findGlobalVarsByCode("EPS_POPUPMSG_TIME", dao);
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public String findGlobalVarsByCode(String codeStr, DAO dao) {
		Criteria criteria = dao.getSession().createCriteria(EpsProfile.class);
		EpsProfile epsProfile;
		criteria.add(Restrictions.eq("code", codeStr));
		epsProfile = (EpsProfile) criteria.setMaxResults(1).uniqueResult();
		return epsProfile.getValue();

	}

	public String getEPS_HOME() {
		return EPS_HOME;
	}

	public void setEPS_HOME(String eps_home) {
		EPS_HOME = eps_home;
	}


	public Integer getEPS_DATATABLE_MAX() {
		return EPS_DATATABLE_MAX;
	}

	public void setEPS_DATATABLE_MAX(Integer eps_datatable_max) {
		EPS_DATATABLE_MAX = eps_datatable_max;
	}

	public String getEPS_DATATABLE_SIZE() {
		return EPS_DATATABLE_SIZE;
	}

	public void setEPS_DATATABLE_SIZE(String eps_datatable_size) {
		EPS_DATATABLE_SIZE = eps_datatable_size;
	}

	public String getEPS_POPUPMSG_TIME() {
		return EPS_POPUPMSG_TIME;
	}

	public void setEPS_POPUPMSG_TIME(String eps_popupmsg_time) {
		EPS_POPUPMSG_TIME = eps_popupmsg_time;
	}
	

}
