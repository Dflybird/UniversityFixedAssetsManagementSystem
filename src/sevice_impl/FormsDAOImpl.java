package sevice_impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import db.MyHibernateSessionFactory;
import entity.Form;
import service.FormsDAO;

public class FormsDAOImpl implements FormsDAO {
	private Transaction transaction = null;

	@Override
	public List<Form> queryAllForm() {
		String hql = "from Form";
		List<Form> list = null;
		
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Query<Form> query = session.createQuery(hql, Form.class);
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
	public Form queryFormByFormId(String formId) {
		Form form = null;
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			form = session.get(Form.class, formId);
			transaction.commit();
			return form;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return form;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public Form queryFormByItemId(String itenId) {
		Form form = null;
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			form = session.get(Form.class, itenId);
			transaction.commit();
			return form;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return form;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public boolean insertForm(Form f) {
		String hql = "select max(formId) from Form";
		String formId = "";
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Query<String> query = session.createQuery(hql, String.class);
			formId = query.getSingleResult();

			// 设置编号
			if (formId == null || "".equals(formId)) {
				// formId = "F 0000 00 00 00 00000";
				formId = getFormId("00000");
			} else {
				String temp = formId.substring(11);
				// 编号后五位加一
				int id = Integer.parseInt(temp)+1;
				if (id < 10)
					formId = getFormId("0000"+String.valueOf(id));
				else if (id < 100)
					formId = getFormId("000"+String.valueOf(id));
				else if (id < 1000)
					formId = getFormId("00"+String.valueOf(id));
				else if (id<10000)
					formId = getFormId("0"+String.valueOf(id));
				else if (id <100000)
					formId = getFormId(String.valueOf(id));
				else 
					return false;
			}

			f.setFormId(formId);
			session.save(f);
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
	public boolean updateForm(Form f) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			session.update(f);
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
	public boolean deleteFormById(String id) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Form form = session.get(Form.class, id);
			session.delete(form);
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

	private String getFormId(String id) {
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
		sb.append("F").append(year).append(month).append(day).append(hour);
		return sb.append(id).toString();
	}
}
