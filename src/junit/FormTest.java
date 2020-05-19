package junit;

import static org.junit.Assert.*;

import java.util.EnumSet;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.hibernate.tool.schema.TargetType;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class FormTest {

	private Session session;
	private SessionFactory sessionFactory;
	private Transaction transaction;
	private SchemaExport schemaExport;
	
	@Before
	public void setUp() throws Exception {
		Configuration confi = new Configuration().configure();
		sessionFactory = confi.buildSessionFactory();
		session = sessionFactory.getCurrentSession();
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
		Metadata metadata = new MetadataSources( serviceRegistry ).buildMetadata();
		SchemaExport schemaExport = new SchemaExport();
		schemaExport.create(EnumSet.of(TargetType.DATABASE), metadata);
	}

	@After
	public void tearDown() throws Exception {
		
		session.close();
		sessionFactory.close();
	}

	@Test
	public void testSave() {
		
	}
	
	@Test
	public void test() {
		
	}

}
