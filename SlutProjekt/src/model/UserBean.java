package model;

public class UserBean {
	
	private String userName;
	private String password; 
	private String firstName;
	private String lastName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String fName) {
		this.firstName = fName;
	
	}
	
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lName) {
		this.lastName = lName;
	
	}
	
	public boolean validate(UserBean bean, String database) {
		
		//om det finns en connection(true), kolla om user finns i DB (true)
		if (SQLconn.connectSQL(database)) { 
			
			return SQLconn.stateSQL(bean);
			
    	}
	
		return false; 
	}
	
	public void resetUserBean() {
		this.password = null;
		this.userName = null;
	}

}
