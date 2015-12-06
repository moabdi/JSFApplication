package dao.Hibernate.Model;

// default package
// Generated 7 avr. 2010 17:19:09 by Hibernate Tools 3.2.2.GA

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class EpsProfile.
 * @see .EpsProfile
 * @author Hibernate Tools
 */
public class EpsProfileHome {

	private static final Log log = LogFactory.getLog(EpsProfileHome.class);

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

	public void persist(EpsProfile transientInstance) {
		log.debug("persisting EpsProfile instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(EpsProfile instance) {
		log.debug("attaching dirty EpsProfile instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(EpsProfile instance) {
		log.debug("attaching clean EpsProfile instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(EpsProfile persistentInstance) {
		log.debug("deleting EpsProfile instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public EpsProfile merge(EpsProfile detachedInstance) {
		log.debug("merging EpsProfile instance");
		try {
			EpsProfile result = (EpsProfile) sessionFactory.getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public EpsProfile findById(java.lang.String id) {
		log.debug("getting EpsProfile instance with id: " + id);
		try {
			EpsProfile instance = (EpsProfile) sessionFactory
					.getCurrentSession().get("EpsProfile", id);
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

	public List<EpsProfile> findByExample(EpsProfile instance) {
		log.debug("finding EpsProfile instance by example");
		try {
			List<EpsProfile> results = (List<EpsProfile>) sessionFactory
					.getCurrentSession().createCriteria("EpsProfile").add(
							create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
