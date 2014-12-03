package core;

import java.sql.Date;

import utils.DBAdapter;

public abstract class User {
	private String username;
	private String hashedPassword;
	private boolean isAdmin;
	public final DBAdapter database;
	
	public User(String username, String hashedPassword, boolean isAdmin, DBAdapter database) {
		this.username = username;
		this.setHashedPassword(hashedPassword);
		this.isAdmin = isAdmin;
		this.database = database;
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

	public void setHashedPassword(String hashedPassword) {
		database.changePassword(this, hashedPassword);
		this.hashedPassword = hashedPassword;
	}
}
