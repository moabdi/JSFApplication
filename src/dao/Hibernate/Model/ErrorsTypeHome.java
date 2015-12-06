package dao.Hibernate.Model;

// Generated 16 avr. 2010 09:34:44 by Hibernate Tools 3.2.2.GA

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class ErrorsType.
 * @see hiber.ErrorsType
 * @author Hibernate Tools
 */
public class ErrorsTypeHome {

	private static final Log log = LogFactory.getLog(ErrorsTypeHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(ErrorsType transientInstance) {
		log.debug("persisting ErrorsType instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(ErrorsType instance) {
		log.debug("attaching dirty ErrorsType instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ErrorsType instance) {
		log.debug("attaching clean ErrorsType instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(ErrorsType persistentInstance) {
		log.debug("deleting ErrorsType instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ErrorsType merge(ErrorsType detachedInstance) {
		log.debug("merging ErrorsType instance");
		try {
			ErrorsType result = (ErrorsType) sessionFactory.getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public ErrorsType findById(java.lang.String id) {
		log.debug("getting ErrorsType instance with id: " + id);
		try {
			ErrorsType instance = (ErrorsType) sessionFactory
					.getCurrentSession().get("hiber.ErrorsType", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<ErrorsType> findByExample(ErrorsType instance) {
		log.debug("finding ErrorsType instance by example");
		try {
			List<ErrorsType> results = (List<ErrorsType>) sessionFactory
					.getCurrentSession().createCriteria("dao.Hibernate.Model.ErrorsType")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
