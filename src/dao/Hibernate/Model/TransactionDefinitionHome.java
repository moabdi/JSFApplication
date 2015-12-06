package dao.Hibernate.Model;

// Generated 13 avr. 2010 11:00:23 by Hibernate Tools 3.2.2.GA

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class TransactionDefinition.
 * @see hiber.TransactionDefinition
 * @author Hibernate Tools
 */
public class TransactionDefinitionHome {

	private static final Log log = LogFactory
			.getLog(TransactionDefinitionHome.class);

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

	public void persist(TransactionDefinition transientInstance) {
		log.debug("persisting TransactionDefinition instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(TransactionDefinition instance) {
		log.debug("attaching dirty TransactionDefinition instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TransactionDefinition instance) {
		log.debug("attaching clean TransactionDefinition instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(TransactionDefinition persistentInstance) {
		log.debug("deleting TransactionDefinition instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TransactionDefinition merge(TransactionDefinition detachedInstance) {
		log.debug("merging TransactionDefinition instance");
		try {
			TransactionDefinition result = (TransactionDefinition) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public TransactionDefinition findById(java.lang.String id) {
		log.debug("getting TransactionDefinition instance with id: " + id);
		try {
			TransactionDefinition instance = (TransactionDefinition) sessionFactory
					.getCurrentSession().get("hiber.TransactionDefinition", id);
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

	public List<TransactionDefinition> findByExample(
			TransactionDefinition instance) {
		log.debug("finding TransactionDefinition instance by example");
		try {
			List<TransactionDefinition> results = (List<TransactionDefinition>) sessionFactory
					.getCurrentSession().createCriteria(
							"hiber.TransactionDefinition")
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
