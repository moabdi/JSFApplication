package metier.eps.jsf.security.auditManagement;

import java.lang.reflect.Field;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import dao.DAO;
import dao.HibernateSessionFactory;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.record.formula.TblPtg;
import org.hibernate.EntityMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.ejb.HibernateEntityManager;
import org.hibernate.ejb.HibernatePersistence;
import org.hibernate.mapping.Column;
import org.hibernate.mapping.PersistentClass;
import org.hibernate.persister.collection.BasicCollectionPersister;
import org.hibernate.persister.entity.*;
import org.hibernate.tuple.IdentifierProperty;
import org.hibernate.tuple.entity.AbstractEntityTuplizer;

import com.sun.java.util.jar.pack.*;

import metier.eps.jsf.security.AbstractBakingBean;
import metier.eps.jsf.security.LoginSecurity;
import metier.eps.jsf.security.user.UserContext;

public class Audit extends AbstractBakingBean {

	private String userCode;
	private String tableName;
	private String tableKey;
	private String ipAddress;

	public void initAuditFields(Object obj) throws SQLException,
			SecurityException, NoSuchFieldException, IllegalArgumentException,
			IllegalAccessException {
		
		DAO dao = new DAO();
		initUserContext();
		Class cls = obj.getClass();
		Object id;
		this.userCode = userContext.getUserCode();
		this.ipAddress = userContext.getIpAddress();
		this.tableKey = null;
		SessionFactory sessionFactory = HibernateSessionFactory.sessionFactory;

		AbstractEntityPersister classMetadata = (AbstractEntityPersister) sessionFactory
				.getClassMetadata(cls);

		String table = classMetadata.getTableName();
		this.tableName = StringUtils.substring(table, StringUtils.lastIndexOf(
				table, ".") + 1, table.length());

		id = classMetadata.getIdentifier(obj, dao.getSession().getEntityMode());
		if(id != null && StringUtils.substring(id.toString(), 0, 9).equals("Hibernate")){
		Field fileds[];
		fileds = id.getClass().getDeclaredFields();
		for (Field field : fileds) {
			Field f = id.getClass().getDeclaredField(field.getName());
			f.setAccessible(true);
			String fieldValue = f.get(id).toString();
			tableKey = tableKey + fieldValue ;  //  avec + "||"
		}
		this.tableKey = StringUtils.substring(tableKey, 4 ); 
		}
		else
			this.tableKey = id.toString(); 

		 // avec StringUtils.lastIndexOf(tableKey, "||")
	}

	public void auditInsert(Object obj) throws SecurityException,
			IllegalArgumentException, SQLException, NoSuchFieldException,
			IllegalAccessException {
		initAuditFields(obj);

		DAO dao = new DAO();
		Session session = dao.getSession();
		String sql = session.getNamedQuery("management_audit_insert")
				.getQueryString();

		Connection hibConnection = session.connection();
		try {

			CallableStatement storedProc = hibConnection.prepareCall(sql);
			storedProc.registerOutParameter(1, Types.VARCHAR);
			storedProc.setString(2, this.userCode);
			storedProc.setString(3, this.tableName);
			storedProc.setString(4, this.tableKey);
			storedProc.setString(5, this.ipAddress);
			storedProc.executeUpdate();
			hibConnection.close();
			hibConnection = null;
		} catch (SQLException sqle) {

			System.out.println("Error: " + sqle.getMessage());

		}

	}

	public void auditDelete(Object obj) throws SecurityException,
			IllegalArgumentException, SQLException, NoSuchFieldException,
			IllegalAccessException {
		initAuditFields(obj);

		DAO dao = new DAO();
		Session session = dao.getSession();
		String sql = session.getNamedQuery("management_audit_delete")
				.getQueryString();

		Connection hibConnection = session.connection();
		try {

			CallableStatement storedProc = hibConnection.prepareCall(sql);
			storedProc.registerOutParameter(1, Types.VARCHAR);
			storedProc.setString(2, this.userCode);
			storedProc.setString(3, this.tableName);
			storedProc.setString(4, this.tableKey);
			storedProc.setString(5, this.ipAddress);
			storedProc.executeUpdate();
			hibConnection.close();
			hibConnection = null;
		} catch (SQLException sqle) {

			System.out.println("Error: " + sqle.getMessage());

		}

	}

	public void auditUpdateBefore(Object obj) throws SecurityException,
			IllegalArgumentException, SQLException, NoSuchFieldException,
			IllegalAccessException {
		initAuditFields(obj);

		DAO dao = new DAO();
		Session session = dao.getSession();
		String sql = session.getNamedQuery("management_audit_update_before")
				.getQueryString();

		Connection hibConnection = session.connection();
		try {

			CallableStatement storedProc = hibConnection.prepareCall(sql);
			storedProc.registerOutParameter(1, Types.VARCHAR);
			storedProc.setString(2, this.userCode);
			storedProc.setString(3, this.tableName);
			storedProc.setString(4, this.tableKey);
			storedProc.setString(5, this.ipAddress);
			storedProc.executeUpdate();
			hibConnection.close();
			hibConnection = null;
		} catch (SQLException sqle) {

			System.out.println("Error: " + sqle.getMessage());

		}

	}

	public void auditUpdateAfter(Object obj) throws SecurityException,
			IllegalArgumentException, SQLException, NoSuchFieldException,
			IllegalAccessException {
		
		initAuditFields(obj);

		DAO dao = new DAO();
		Session session = dao.getSession();
		String sql = session.getNamedQuery("management_audit_update_after")
				.getQueryString();

		Connection hibConnection = session.connection();
		try {

			CallableStatement storedProc = hibConnection.prepareCall(sql);
			storedProc.registerOutParameter(1, Types.VARCHAR);
			storedProc.setString(2, this.userCode);
			storedProc.setString(3, this.tableName);
			storedProc.setString(4, this.tableKey);
			storedProc.setString(5, this.ipAddress);
			storedProc.executeUpdate();
			hibConnection.close();
			hibConnection = null;
		} catch (SQLException sqle) {

			System.out.println("Error: " + sqle.getMessage());

		}

	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableKey() {
		return tableKey;
	}

	public void setTableKey(String tableKey) {
		this.tableKey = tableKey;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

}
