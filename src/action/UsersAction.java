package action;

import java.util.List;

import entity.User;
import service.UsersDAO;
import sevice_impl.UsersDAOImpl;

public class UsersAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String queryAll(){
		UsersDAO usersDAO = new UsersDAOImpl();
		List<User> list = null;
		list = usersDAO.queryAllUser();
		if (list != null && list.size() > 0) {
			session.setAttribute("users_list", list);
		} else
			session.setAttribute("users_list", null);
		return "users_query_all_success";
	}
	
	public String delete(){
		UsersDAO usersDAO = new UsersDAOImpl();
		int id = Integer.valueOf(request.getParameter("id"));
		if (usersDAO.deleteUserById(id)){
			return "users_delete_success";
		} else
			return "users_delete_failure";
	}
	
	public String modify(){
		UsersDAO usersDAO = new UsersDAOImpl();
		int id = Integer.valueOf(request.getParameter("id"));
		User u = usersDAO.queryUserById(id);
		session.setAttribute("modify_user", u);
		return "users_modify_success";
	}
	
	public String insert(){
		User u = new User();
		UsersDAO usersDAO = new UsersDAOImpl();
		String isAdmin = request.getParameter("isAdmin");
		u.setAccount(request.getParameter("account"));
		if (isAdmin.equals("true")) 
			u.setAdmin(true);
		else
			u.setAdmin(false);
		u.setName(request.getParameter("name"));
		u.setPassword(request.getParameter("password"));
		if (usersDAO.insertUser(u)) {
			return "users_insert_success";				
		} else 
			return "users_insert_failure";
	}
	
	public String update(){
		User u = new User();
		UsersDAO usersDAO = new UsersDAOImpl();
		String isAdmin = request.getParameter("isAdmin");
		int id = Integer.valueOf(request.getParameter("id"));
		request.setAttribute("id", id);
		u.setId(id);
		u.setAccount(request.getParameter("account"));
		System.out.println(isAdmin);
		if (isAdmin.equals("true")) 
			u.setAdmin(true);
		else
			u.setAdmin(false);
		u.setName(request.getParameter("name"));
		u.setPassword(request.getParameter("password"));
		if (usersDAO.updateUser(u)) {
			return "users_update_success";
		} else
			return "forms_update_failure";
	}
}
