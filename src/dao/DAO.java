package dao;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.persistence.OptimisticLockException;
import javax.servlet.http.HttpServletRequest;

import web.controller.*;

import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.NonUniqueObjectException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;

import metier.eps.utils.SessionUtils;
public class DAO {
public static boolean successOperation= false;
public static String failedOperationError;


 
   public DAO() {

	
	}

	public Session getSession() {
		HibernateSessionFactory.currentSession().setFlushMode(FlushMode.ALWAYS);
		HibernateSessionFactory.currentSession().setCacheMode(CacheMode.REFRESH);	
		return HibernateSessionFactory.currentSession();
	}

	public static void main(String[] args) {

	}

	public void save(Object obj) {
		//Audit audit = new Audit();
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		Transaction tx=null;
		try {
			Session session = getSession();
			// session.flush();
			tx = session.beginTransaction();
			session.save(obj);			
			tx.commit();
			// audit.auditInsert(obj);
			tx=null;
			session.persist(obj);
			session.flush();
			successOperation = true;
		}catch (org.hibernate.JDBCException jdbce) {
			successOperation = false;
			DAO.failedOperationError = jdbce.getCause().getMessage();
			// throw jdbce;
		} catch (org.hibernate.HibernateException e) {
			successOperation = false;
			
			// DAO.failedOperationError = e.getCause().getMessage();
			/*if (getSession().isOpen()) getSession().close();
			if (tx != null) tx.rollback () ;
			System.out.print(e.getCause ()) ;*/
			// e.printStackTrace();
			
			// getSession().refresh(obj);
			} catch (SecurityException e) {
			e.printStackTrace();
	} /*catch (IllegalArgumentException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}*/
		 finally {
				/*try {
					if (getSession().isOpen()){
						// getSession().close();
					}
				} catch (Exception e) {
					successOperation = false;
					e.printStackTrace();
					DAO.failedOperationError = e.getCause().getMessage();
				}*/

			}
	}

	public Object load(Class className, Object id,Object obj) {
		Object object;
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		//getSession().flush();
		if (getSession().equals(obj)){
			object = getSession().load(className, (Serializable) id);
		}
		else
			{
			try{
			object = findByIdObject(className,id);
			}
			catch (org.hibernate.JDBCException jdbce) {
				String url = ((HttpServletRequest) ectx.getRequest())
				.getContextPath()
				+ "/pages/common/eps_connect_error.jsf";
				try {
					ectx.redirect(url);
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				throw jdbce;
			}catch (NonUniqueObjectException  e) {
				object	=	getSession().get(className, (Serializable) id);
			}
			};
		
		return object;
	}
	
	@SuppressWarnings("boxing")
	public Object findByIdObject(Class entity, Object id) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			// getSession().refresh(entity);
			
			Object obj = getSession().get(entity, (Serializable) id);
			return obj;
		} catch (org.hibernate.JDBCException jdbce) {

			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}

	public void saveOrUpdate(Object obj) {	
	
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		// Audit audit = new Audit();
		Transaction tx=null;
		Session session = getSession();
		Session session_upd = (Session) SessionUtils.getAttribute("trx_update");
		
		if (session_upd != null && (!session_upd.equals(session))){
			session = session_upd;
			session.clear();
		}else{
			session = getSession();
			session.clear();
		}
		tx=session.getTransaction(); // A revérifier
		
		try {
			
			//audit.auditUpdateBefore(obj);
			if (!tx.isActive()){
				tx.begin();
			}
			
			session.saveOrUpdate(obj);			
			tx.commit();
			//audit.auditUpdateAfter(obj);
			reset(session, 2);
			SessionUtils.setAttribute("trx_update", null);
			session.flush();
			successOperation = true;
		} catch (org.hibernate.JDBCException jdbce) {
			successOperation = false;
			DAO.failedOperationError = jdbce.getCause().getMessage();
			System.out.print(jdbce.getCause ().getMessage()) ;

		}catch (org.hibernate.TransactionException jte) {
			if (tx != null) { tx.rollback (); tx = null; }
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jte;
		
		}catch (org.hibernate.HibernateException e) {
			successOperation = false;
			//if (getSession().isOpen()) getSession().close();
			
			if (tx != null) tx.rollback () ;
			System.out.print(e.getCause ()) ;
			e.printStackTrace();
			DAO.failedOperationError = e.getCause().getMessage();
			//getSession().refresh(obj);
			} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}	
		/*catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}*/
		catch(OptimisticLockException ole){
			
			successOperation = false;
			//if (getSession().isOpen()) getSession().close();
			
			if (tx != null) tx.rollback () ;
			System.out.print(ole.getCause ()) ;
			ole.printStackTrace();

		}finally {
			try {
				if (getSession().isOpen()){
					// HibernateSessionFactory.closeSession();
				}
			} catch (Exception e) {
				successOperation = false;
				e.printStackTrace();
				DAO.failedOperationError = e.getCause().getMessage();
			}

		}
	}
	
	public void saveOrUpdate(Object obj,String index) {	
		
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		// Audit audit = new Audit();
		Transaction tx=null;
		Session session = getSession();
		Session session_upd = (Session) SessionUtils.getAttribute(index);
		
		if (session_upd != null && (!session_upd.equals(session))){
			session = session_upd;
			session.clear();
		}else{
			session = getSession();
			session.flush();
		}
		tx=session.getTransaction(); // A revérifier
		
		try {
			
			// audit.auditUpdateBefore(obj);
			if (!tx.isActive()){
				tx.begin();
			}
			
			session.saveOrUpdate(obj);
			tx.commit();
			// audit.auditUpdateAfter(obj);
			reset(session, 2);
			SessionUtils.setAttribute("trx_update", null);
			// session.persist(obj);
			session.flush();
			successOperation = true;
		} catch (org.hibernate.JDBCException jdbce) {
			successOperation = false;
			DAO.failedOperationError = jdbce.getCause().getMessage();
			System.out.print(jdbce.getCause ().getMessage()) ;
		}catch (org.hibernate.TransactionException jte) {
			if (tx != null) { tx.rollback (); tx = null; }
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jte;
		
		}catch (org.hibernate.HibernateException e) {
			successOperation = false;
			//if (getSession().isOpen()) getSession().close();
			
			if (tx != null) tx.rollback () ;
			System.out.print(e.getCause ()) ;
			e.printStackTrace();
			DAO.failedOperationError = e.getCause().getMessage();
			//getSession().refresh(obj);
			} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}	
		/*catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}*/
		catch(OptimisticLockException ole){
			
			successOperation = false;
			//if (getSession().isOpen()) getSession().close();
			
			if (tx != null) tx.rollback () ;
			System.out.print(ole.getCause ()) ;
			ole.printStackTrace();

		}finally {
			try {
				if (getSession().isOpen()){
					// HibernateSessionFactory.closeSession();
				}
			} catch (Exception e) {
				successOperation = false;
				e.printStackTrace();
				DAO.failedOperationError = e.getCause().getMessage();
			}

		}
	}

	public void delete(Object obj,String index) {
		  // Audit audit = new Audit();
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		Session session = getSession();
		Session session_upd = (Session) SessionUtils.getAttribute(index);
		Transaction tx=null;
		
		if (session_upd != null && (!session_upd.equals(session))){
			session = session_upd;
			session.clear();
		}else{
			session = getSession();
			session.flush();
		}
		
		try {
			tx = session.beginTransaction();
			// audit.auditDelete(obj);
			session.delete(obj);
			tx.commit();
			tx=null;
			reset(session, 2);
			SessionUtils.setAttribute("trx_update", null);
			// session.persist(obj);
			successOperation = true;
			session.flush();
		}catch (org.hibernate.JDBCException jdbce) {
			successOperation = false;
			DAO.failedOperationError = jdbce.getCause().getMessage();
			System.out.print(jdbce.getCause ().getMessage()) ;
			jdbce.printStackTrace();
		} catch (org.hibernate.HibernateException e) {
			successOperation = false;
			//if (getSession().isOpen()) getSession().close();
			
			if (tx != null) tx.rollback () ;
			System.out.print(e.getCause ()) ;
			e.printStackTrace();
			DAO.failedOperationError = e.getCause().getMessage();
			System.out.print(e.getCause ().getMessage()) ;
			//getSession().refresh(obj);
			} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} /*catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}*/
		 finally {
				/*try {
					if (getSession().isOpen()){
						getSession().close();
					}
				} catch (Exception e) {
					successOperation = false;
					e.printStackTrace();
					DAO.failedOperationError = e.getCause().getMessage();
				}*/

			}
	}
	
	public void delete(Object obj) {
		 // Audit audit = new Audit();
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		Session session = getSession();
		Session session_upd = (Session) SessionUtils.getAttribute("trx_update");
		Transaction tx=null;
		
		if (session_upd != null && (!session_upd.equals(session))){
			session = session_upd;
			session.clear();
		}else{
			session = getSession();
			session.flush();
		}
		
		try {
			tx = session.beginTransaction();
			//audit.auditDelete(obj);
			session.delete(obj);
			tx.commit();
			tx=null;
			reset(session, 2);
			SessionUtils.setAttribute("trx_update", null);
			// session.persist(obj);
			successOperation = true;
			 getSession().flush();
		}catch (org.hibernate.JDBCException jdbce) {
			successOperation = false;
			DAO.failedOperationError = jdbce.getCause().getMessage();
			System.out.print(jdbce.getCause ().getMessage()) ;
			jdbce.printStackTrace();
		} catch (org.hibernate.HibernateException e) {
			successOperation = false;
			//if (getSession().isOpen()) getSession().close();
			
			if (tx != null) tx.rollback () ;
			System.out.print(e.getCause ()) ;
			e.printStackTrace();
			DAO.failedOperationError = e.getCause().getMessage();
			System.out.print(e.getCause ().getMessage()) ;
			//getSession().refresh(obj);
			} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} /*catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace(); 
		}*/
		 finally {
				/*try {
					if (getSession().isOpen()){
						getSession().close();
					}
				} catch (Exception e) {
					successOperation = false;
					e.printStackTrace();
					DAO.failedOperationError = e.getCause().getMessage();
				}*/

			}
	}
	
	public void deleteByCriteria(String table, String creteria) {
		
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		Transaction tx=null;
		try {
			Session session = HibernateSessionFactory.sessionFactory.openSession(); // getSession();
			
			tx=session.getTransaction();
			tx = session.beginTransaction();
			session.flush();
			session.createSQLQuery( "DELETE FROM " + table +" WHERE "+ creteria ).executeUpdate();
			
			tx.commit();
			successOperation = true;
			//getSession().flush();
			
			
		} catch (org.hibernate.JDBCException jdbce) {
			successOperation = false;
			/*String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}*/
			DAO.failedOperationError = jdbce.getCause().getMessage();
			System.out.print(jdbce.getCause ().getMessage()) ;
			jdbce.printStackTrace();
		}catch (RuntimeException re) {
			
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List findByExample(Object object, String clas) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			getSession().flush();
			List results = getSession().createCriteria(
					"Hibernate.Model." + clas).add(Example.create(object))
					.list();

			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}

	public List findByExampleDAO(Object object, String clas,
			String[] excludeProperty) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			Criteria crit = getSession().createCriteria(
					"dao.Hibernate.Model." + clas);
			Example example = Example.create(object);
			for (String exclude : excludeProperty) {
				example.excludeProperty(exclude);
			}
			crit.add(example);
			return crit.list();
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List findByOrder(Object object, String clas, String order) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			List results = getSession().createCriteria(
					"dao.Hibernate.Model." + clas)
					.addOrder(Order.desc(order)).list();

			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	// add by Jurin for sorting list in ascendant order
	public List findByOrderAsc(Object object, String clas, String order) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			List results = getSession().createCriteria(
					"dao.Hibernate.Model." + clas).add(Example.create(object))
					.addOrder(Order.asc(order)).list();

			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List findByCriterion(String clas, Criterion... criterion) {
		Criteria crit = getSession().createCriteria("dao.Hibernate.Model." + clas);
		for (Criterion c : criterion) {
			crit.add(c);
		}
		return crit.list();
	}

	public Object findByproperty(String clas, String order, String property,
			String value) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			Object results = getSession().createCriteria(
					"dao.Hibernate.Model." + clas).add(
					Property.forName(property).eq(value)).addOrder(
					Order.desc(order)).uniqueResult();

			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}

	public List findListByproperty(String clas, String order, String property,
			String value) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			List results = getSession().createCriteria(
					"dao.Hibernate.Model." + clas).add(
					Property.forName(property).eq(value)).addOrder(
					Order.desc(order)).list();

			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	public List findThreeResultPersonaliser(String clas, String order, String property,
			String value,String status,String val,String tableInd,String valTab) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			
			List results = 
				getSession().createCriteria("dao.Hibernate.Model." + clas).
					add(Property.forName(property).eq(value)).
					add(Property.forName(status).eq(val)).
					add(Property.forName(tableInd).eq(valTab)).
					addOrder(Order.desc(order)).setMaxResults(3).list();
			
			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	public Object findWording(String clas,String valTab,String tre,String wordin) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			
			Object results = 
				getSession().createCriteria("dao.Hibernate.Model." + clas).setProjection(Projections.property(wordin)).
					add(Property.forName(valTab).eq(tre)).setMaxResults(1).uniqueResult();
			
			return results;
		}  catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	public List findThreeResult(String clas, String order, String property,
			String value) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			List results = getSession().createCriteria(
					"dao.Hibernate.Model." + clas).add(
					Property.forName(property).eq(value)).addOrder(
					Order.desc(order)).setMaxResults(3).list();

			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	public List findResultsByOrder(String clas, String order, String property,
			String value) {
		try {
			List results = getSession().createCriteria(
					"dao.Hibernate.Model." + clas).add(
					Property.forName(property).eq(value)).addOrder(
					Order.desc(order)).list();

			return results;
		} catch (RuntimeException re) {
			throw re;
		}
	}


	public Object findUniqueResult(Object object, String clas, String order) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			Object results = getSession().createCriteria(
					"dao.Hibernate.Model." + clas).add(Example.create(object))
					.addOrder(Order.desc(order)).setMaxResults(1)
					.uniqueResult();

			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	public Object findUniqueResult(Object object, Class clas) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		
		try {
			Object results = getSession().createCriteria(
					clas).add(Example.create(object))
					.setMaxResults(1)
					.uniqueResult();
		
			return results;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}


	@SuppressWarnings("unchecked")
	public List findByDate(String table, String propertyName, String s1,
			String s2) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			String queryString = "from " + table + " as model where model."
					+ propertyName + " >= to_date( '" + s1
					+ "' , 'DD/MM/RRRR hh24:mi') and model." + propertyName
					+ "  <= to_date( '" + s2 + "' , 'DD/MM/RRRR hh24:mi')"
					+ " ORDER BY  " + propertyName + "  desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List findByDateAndProperty(String table, String date, String s1,
			String s2, String propertyName, String s3) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			String queryString = "from " + table + " as model where model."
					+ date + " >= to_date( '" + s1
					+ "' , 'DD/MM/RRRR hh24:mi') and model." + date
					+ "  <= to_date( '" + s2 + "' , 'DD/MM/RRRR hh24:mi')"
					+" and model."+ propertyName + " like '%" + s3 + "%'"
					+ " ORDER BY  " + propertyName + "  desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List findByDateAndCriteria(String table, String date, String s1,
			String s2, String cretiria) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			String queryString = "from " + table + cretiria + " and model."
					+ date + " >= to_date( '" + s1
					+ "' , 'DD/MM/RRRR hh24:mi:ss') and model." + date
					+ "  <= to_date( '" + s2 + "' , 'DD/MM/RRRR hh24:mi:ss')"
					+ " ORDER BY  " + date + "  desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}


	@SuppressWarnings("unchecked")
	public List findByGenCriteria(String table, String creteria) {
		
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		
		getSession().clear();
		try {
			String queryString = "from " + table + creteria;
			//getSession().flush();
			Query queryObject = getSession().createQuery(queryString);
			
			//queryObject.setCacheMode(CacheMode.REFRESH);
			//queryObject.setFlushMode(FlushMode.ALWAYS);
			return queryObject.list();
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	public List selectSimpleCriteria(String propertyNameFromDB, String tableNameFromDB,String FieldOfCondition,String Condition) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
          String sql = "Select  " + propertyNameFromDB + " from " + tableNameFromDB + " WHERE " + FieldOfCondition + " = '" + Condition +"'" ;
    	
    	try{
    		List results;
    		 results = getSession().createSQLQuery(sql).list();
    		return results;
    		    		
    	} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	public List selectSimple(String propertyNameFromDB, String tableNameFromDB) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
          String sql = "Select  " + propertyNameFromDB + " from " + tableNameFromDB;
    	
    	try{
    		List results;
    		 results = getSession().createSQLQuery(sql).list();
    		return results;
    		    		
    	} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	
	public List findDistinctByGenCriteria(String propertyNameFromDB, String tableNameFromDB, String sqlCreteria) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
          String sql = "Select distinct " + propertyNameFromDB + " from " + tableNameFromDB +  sqlCreteria;
    	
    	try{
    		List results;
    		 results = getSession().createSQLQuery(sql).list();
    		return results;
    		    		
    	} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}

	public Object findByGenCriteriaUniqueResult(String table, String creteria) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			List resultList = new ArrayList();
			Object result = null;
			String queryString = "from " + table + creteria;
			Query queryObject = getSession().createQuery(queryString).setMaxResults(1);
			resultList = queryObject.list();
			for (Object object : resultList) {
				result = object;
			}
			return result;
		}  catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}

	@SuppressWarnings("boxing")
	public Object findById(String entity, String id) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			Object obj = getSession().get("dao.Hibernate.Model." + entity, id);
			return obj;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	@SuppressWarnings("boxing")
	public Object findObjectById(String entity, Object id) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			Object obj = getSession().get("dao.Hibernate.Model." + entity, (Serializable) id);
			return obj;
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	@SuppressWarnings("boxing")
	public Object findByIdObjectLock(Class entity, Object id) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		
		Session session = HibernateSessionFactory.sessionFactory.openSession(); // getSession();
		SessionUtils.setAttribute("trx_update", session);
		int isolation = -1;
		Transaction tx=null;
		tx = session.getTransaction();
	
		try {
			// getSession().refresh(entity);
			isolation = session.connection().getTransactionIsolation();
			Object obj = session.get(entity, (Serializable) id);
			session.connection().setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE); //Load
			session.lock(obj, LockMode.UPGRADE_NOWAIT);
			tx.begin();
			return obj;
		} catch (org.hibernate.JDBCException jdbce) {
			// if (tx != null) { tx.rollback (); }
			
			return null;
			
		}catch (org.hibernate.TransactionException jte) {
			// if (tx != null) { tx.rollback (); }
			
			return null;
		}catch (SQLException e) {
			// if (tx != null) { tx.rollback (); }
			
			return null;
		}
		catch (RuntimeException re) {
			// if (tx != null) { tx.rollback (); }
			
			return null;
		}
	}
	
	@SuppressWarnings("boxing")
	public Object findByIdObjectLock(Class entity, Object id, String session_id) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		
		Session session = HibernateSessionFactory.sessionFactory.openSession(); // getSession();
		SessionUtils.setAttribute(session_id, session);
		int isolation = -1;
		Transaction tx=null;
		tx = session.getTransaction();
	
		try {
			// getSession().refresh(entity);
			isolation = session.connection().getTransactionIsolation();
			Object obj = session.get(entity, (Serializable) id);
			session.connection().setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE); //Load
			session.lock(obj, LockMode.UPGRADE_NOWAIT);
			tx.begin();
			return obj;
		} catch (org.hibernate.JDBCException jdbce) {
			// if (tx != null) { tx.rollback (); }
			
			return null;
			
		}catch (org.hibernate.TransactionException jte) {
			// if (tx != null) { tx.rollback (); }
			
			return null;
		}catch (SQLException e) {
			// if (tx != null) { tx.rollback (); }
			
			return null;
		}
		catch (RuntimeException re) {
			// if (tx != null) { tx.rollback (); }
			
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List requestExecute(String request) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext ectx = context.getExternalContext();
		try {
			Query query = getSession().createSQLQuery(request);
			return query.list();
		} catch (org.hibernate.JDBCException jdbce) {
			String url = ((HttpServletRequest) ectx.getRequest())
			.getContextPath()
			+ "/pages/common/eps_connect_error.jsf";
			try {
				ectx.redirect(url);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			throw jdbce;
		}	catch (RuntimeException re) {
			
			throw re;
		}
	}
	
	public static void reset(Session session, int isolation) {
		if (isolation >= 0) {
		try {
		session.connection().setTransactionIsolation(isolation);
		} catch (SQLException e) {
		System.err.println("Could not reset the isolation level: " + e);
		} catch (HibernateException e) {
		System.err.println("Could not reset the isolation level: " + e);
		}
		}
	}
	
	public boolean isSuccessOperation() {
		return successOperation;
	}

	public void setSuccessOperation(boolean successOperation) {
		DAO.successOperation = successOperation;
	}

	public String getFailedOperationError() {
		return failedOperationError;
	}

	public void setFailedOperationError(String failedOperationError) {
		DAO.failedOperationError = failedOperationError;
	}
	
	
	
}
