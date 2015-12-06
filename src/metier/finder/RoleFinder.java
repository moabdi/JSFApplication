package metier.finder;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import dao.Hibernate.Model.*;
import dao.DAO;
public class RoleFinder extends DAO{


		DAO obj = new DAO();
		public void RoleFinder(){};
		
		public List<PageAccessParam> findRolesByPage(String bean){
			Criteria criteria=getSession().createCriteria(PageAccessParam.class);
			List<PageAccessParam> pageAccessParamSet;
			criteria.add(Restrictions.eq("id.page", bean));
			pageAccessParamSet=criteria.list();
			return pageAccessParamSet;
			
		}

	
}
