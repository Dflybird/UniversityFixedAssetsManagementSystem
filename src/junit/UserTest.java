package junit;

import static org.junit.Assert.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entity.User;

public class UserTest {

	private Session session;
	private SessionFactory sessionFactory;
	private Transaction transaction;
	
	@Before
	public void setUp() throws Exception {
		Configuration confi = new Configuration().configure();
		sessionFactory = confi.buildSessionFactory();
		session = sessionFactory.getCurrentSession();
		transaction = session.beginTransaction();
	}

	@After
	public void tearDown() throws Exception {
		session.close();
		sessionFactory.close();
	}

	@Test
	public void test() {
		User u0 = new User("admin", "000000", "000000", true);
		
		session.save(u0);
		
		transaction.commit();
	}

}
