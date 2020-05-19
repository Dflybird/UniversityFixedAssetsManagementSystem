package sevice_impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import db.MyHibernateSessionFactory;
import entity.Item;
import service.ItemsDAO;

public class ItemsDAOImpl implements ItemsDAO {
	private Transaction transaction = null;

	@Override
	public List<Item> queryAllitems() {
		String hql = "from Item";
		List<Item> list = null;

		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Query<Item> query = session.createQuery(hql, Item.class);
			list = query.getResultList();
			transaction.commit();
			return list;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return list;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public Item queryItemByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Item queryItemById(String id) {
		Item item = null;
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			item = session.get(Item.class, id);
			transaction.commit();
			return item;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return item;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public boolean insertItem(Item i) {
		String hql = "select max(itemId) from Item";
		String itemId = "";
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Query<String> query = session.createQuery(hql, String.class);
			itemId = query.getSingleResult();

			// 设置编号
			if (itemId == null || "".equals(itemId)) {
				// itemId = "I 0000 00 00 00 00000";
				itemId = getItemId("00000");
			} else {
				String temp = itemId.substring(11);
				// 编号后五位加一
				int id = Integer.parseInt(temp)+1;
				if (id < 10)
					itemId = getItemId("0000"+String.valueOf(id));
				else if (id < 100)
					itemId = getItemId("000"+String.valueOf(id));
				else if (id < 1000)
					itemId = getItemId("00"+String.valueOf(id));
				else if (id<10000)
					itemId = getItemId("0"+String.valueOf(id));
				else if (id <100000)
					itemId = getItemId(String.valueOf(id));
				else 
					return false;
			}

			i.setItemId(itemId);
			session.save(i);
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
	public boolean updateItem(Item i) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			session.update(i);
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
	public boolean deleteItemById(String id) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Item item = session.get(Item.class, id);
			session.delete(item);
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

	private String getItemId(String id) {
		StringBuilder sb = new StringBuilder();
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		String year, month, day, hour;
		year = String.valueOf(calendar.get(Calendar.YEAR));
		int mon = calendar.get(Calendar.MONTH)+1;
		if (mon < 10)
			month = "0" + String.valueOf(mon);
		else 
			month = String.valueOf(mon);
		
		int d = calendar.get(Calendar.DATE);
		if (d < 10)
			day = "0" + String.valueOf(d);
		else 
			day = String.valueOf(d);
		
		int h = calendar.get(Calendar.HOUR);
		if (h < 10)
			hour = "0" + String.valueOf(h);
		else 
			hour = String.valueOf(h);
		sb.append("I").append(year).append(month).append(day).append(hour);
		return sb.append(id).toString();
	}

}
