package dao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactory {

    private static String CONFIG_FILE_LOCATION = "dao/Hibernate/HibernateConf/hibernate.cfg.xml";

    /** Holds a single instance of Session */
    @SuppressWarnings("unchecked")
	private static final ThreadLocal threadLocal = new ThreadLocal();
    
    /** The single instance of hibernate configuration */
    private static final Configuration cfg = new Configuration();
    
    /** The single instance of hibernate SessionFactory */
    public static org.hibernate.SessionFactory sessionFactory;
    
    @SuppressWarnings("unchecked")
	public static Session currentSession() throws HibernateException {
        Session session = (Session) threadLocal.get();
        if (session == null || !session.isOpen()) {
            if (sessionFactory == null) {
                try {
                    System.out.println("%%%% Success Creating SessionFactory %%%%");
                    cfg.configure(CONFIG_FILE_LOCATION);
                    sessionFactory = cfg.buildSessionFactory();
                } catch (Exception e) {
                    System.err.println("%%%% Error Creating SessionFactory %%%%");
                    e.printStackTrace();
                }
            }
            session = (sessionFactory != null) ? sessionFactory.openSession() : null;
            threadLocal.set(session);
        }

        return session;
    }

    /**
     *  Close the single hibernate session instance.
     *
     *  @throws HibernateException
     */ 
    
    @SuppressWarnings("unchecked")
	public static void closeSession() throws HibernateException {
        Session session = (Session) threadLocal.get();
        threadLocal.set(null);
        
        if (session != null) {
            session.close();
        }
    }

    /**
     * Default constructor.
     */
    private HibernateSessionFactory() {
    }

}
