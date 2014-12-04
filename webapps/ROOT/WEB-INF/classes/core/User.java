package core;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import utils.DBAdapter;

public abstract class User {
	private String username;
	private String hashedPassword;
	private boolean isAdmin;
	
	public User(String username, String hashedPassword, boolean isAdmin, DBAdapter database) {
		this.username = username;
		this.hashedPassword=hashedPassword;
		this.isAdmin = isAdmin;
	}
	
	public boolean isAdmin() {
		return isAdmin;
	}
	
	public abstract boolean requestBooking(User user, Room room, Date date);

	public String getUsername() {
		return username;
	}

	public String getHashedPassword() {
		return hashedPassword;
	}

	public void setHashedPassword(String hashedPassword) throws Exception {
		DBAdapter.dbExecute("UPDATE users SET password=? WHERE username=?", new ArrayList<Object>(Arrays.asList(hashedPassword,this.username)),true);
		this.hashedPassword = hashedPassword;
	}
}
