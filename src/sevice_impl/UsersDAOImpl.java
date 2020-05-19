package sevice_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import db.MyHibernateSessionFactory;
import entity.User;
import service.UsersDAO;

public class UsersDAOImpl implements UsersDAO {

	Transaction transaction = null;
	
	@Override
	public boolean UsersLogin(User u) {
		String hql = "";

		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			hql = "from User where account=? and password=?";
			Query<User> query = session.createQuery(hql, User.class);
			query.setParameter(0, u.getAccount());
			query.setParameter(1, u.getPassword());
			List<User> list = query.getResultList();
			if (list.size() > 0) {
				u.setId(list.get(0).getId());
				u.setAdmin(list.get(0).isAdmin());
				u.setName(list.get(0).getName());
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (transaction != null)
				transaction.commit();
			transaction = null;
		}
	}

	@Override
	public List<User> queryAllUser() {
		List<User> list = null;
		String hql = "from User";
		
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Query<User> query = session.createQuery(hql, User.class);
			list = query.getResultList();
			transaction.commit();
			return list;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return list;
		}finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public User queryUserById(int id) {
		User user = null;
		
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			user = session.get(User.class, id);
			transaction.commit();
			return user;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return user;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public boolean insertUser(User u) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			session.save(u);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return false;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public boolean updateUser(User u) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			session.update(u);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return false;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public boolean deleteUserById(int id) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			User u = session.get(User.class, id);
			session.delete(u);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return false;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

}
