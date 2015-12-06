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
 * Home object for domain model class MerchantAccount.
 * @see .MerchantAccount
 * @author Hibernate Tools
 */
public class MerchantAccountHome {

	private static final Log log = LogFactory.getLog(MerchantAccountHome.class);

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

	public void persist(MerchantAccount transientInstance) {
		log.debug("persisting MerchantAccount instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(MerchantAccount instance) {
		log.debug("attaching dirty MerchantAccount instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(MerchantAccount instance) {
		log.debug("attaching clean MerchantAccount instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(MerchantAccount persistentInstance) {
		log.debug("deleting MerchantAccount instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public MerchantAccount merge(MerchantAccount detachedInstance) {
		log.debug("merging MerchantAccount instance");
		try {
			MerchantAccount result = (MerchantAccount) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public MerchantAccount findById(java.lang.String id) {
		log.debug("getting MerchantAccount instance with id: " + id);
		try {
			MerchantAccount instance = (MerchantAccount) sessionFactory
					.getCurrentSession().get("MerchantAccount", id);
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

	public List<MerchantAccount> findByExample(MerchantAccount instance) {
		log.debug("finding MerchantAccount instance by example");
		try {
			List<MerchantAccount> results = (List<MerchantAccount>) sessionFactory
					.getCurrentSession().createCriteria("MerchantAccount").add(
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
