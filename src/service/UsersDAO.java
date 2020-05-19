package service;

import java.util.List;

import entity.User;

public interface UsersDAO {
	
	public boolean UsersLogin(User u);
	
	public List<User> queryAllUser();
	
	public User queryUserById(int id);
	
	public boolean insertUser(User u);
	
	public boolean updateUser(User u);
	
	public boolean deleteUserById(int id);
}
