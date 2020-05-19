package action;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.ModelDriven;

import entity.User;
import service.UsersDAO;
import sevice_impl.UsersDAOImpl;

public class LoginAction extends BaseAction implements ModelDriven<User> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private User u = new User();
	
	public String login(){
		UsersDAO usersDAO = new UsersDAOImpl();
		if (usersDAO.UsersLogin(u)) {
			//��session�б����û������˺��Ƿ����Ա
			session.setAttribute("loginUserName", u.getName());
			session.setAttribute("loginUserAccount", u.getAccount());
			session.setAttribute("loginUserIsAdmin", u.isAdmin());
			session.setAttribute("loginUserId", u.getId());
			return "login_success";
		}
		else {
			return "login_failure";
		}
	}
	
	@SkipValidation
	public String logout(){
		if(session.getAttribute("loginUserName")!=null){
			session.removeAttribute("loginUserName");
		}
		if(session.getAttribute("loginUserAccount")!=null){
			session.removeAttribute("loginUserAccount");
		}
		return "logout";
	}
	
	@Override
	public void validate() {
		//����û�������Ϊ��
		if ("".equals(u.getAccount().trim())) this.addFieldError("accountError", "�˻�����Ϊ��");
		if (u.getPassword().length()<6) this.addFieldError("passwordError", "���벻������6λ");			
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return u;
	}
	
}
