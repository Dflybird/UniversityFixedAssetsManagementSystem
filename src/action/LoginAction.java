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
			//在session中保存用户名和账号是否管理员
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
		//检查用户名不能为空
		if ("".equals(u.getAccount().trim())) this.addFieldError("accountError", "账户不能为空");
		if (u.getPassword().length()<6) this.addFieldError("passwordError", "密码不能少于6位");			
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return u;
	}
	
}
