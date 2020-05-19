package db;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class MyHibernateSessionFactory {
	
	private static SessionFactory sessionFactory;

	private MyHibernateSessionFactory() {}
	
	public static SessionFactory getSessionFactory(){
		if (sessionFactory==null) {
			Configuration confi = new Configuration().configure();
			sessionFactory = confi.buildSessionFactory();
			return sessionFactory;
		} else return sessionFactory;
	}
}
