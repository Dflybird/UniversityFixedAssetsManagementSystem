package junit;

import org.junit.Test;

import entity.User;
import service.UsersDAO;
import sevice_impl.UsersDAOImpl;

public class UsersDAOImplTest {

	@Test
	public void test() {
		UsersDAO usersDAO = new UsersDAOImpl();
		User u = new User("root", "root", "123", false);
		System.out.println(usersDAO.insertUser(u));
	}

}
