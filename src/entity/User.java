package entity;

public class User {
	private int id;
	private String name;
	private String account; //6λ
	private String password;//6λ
	private boolean isAdmin;
	
	public User(String name, String account, String password, boolean isAdmin) {
		this.name = name;
		this.account = account;
		this.password = password;
		this.isAdmin = isAdmin;
	}

	public User() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", account=" + account + ", password=" + password + ", isAdmin="
				+ isAdmin + "]";
	}
	
}
