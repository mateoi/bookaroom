package core;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public abstract boolean requestBooking(User user, Room room, Date start, Date end) throws SQLException;

	public String getUsername() {
		return username;
	}

	public String getHashedPassword() {
		return hashedPassword;
	}

	public void setHashedPassword(String hashedPassword) throws Exception {
		this.hashedPassword = hashedPassword;
	}
	
	protected boolean hasBooking(Date start) throws ClassNotFoundException, SQLException {
		Connection conn = DBAdapter.dbConnect();
		String query = "SELECT * FROM bookings WHERE username = ? AND end < ?;";
		List<Object> args = new ArrayList<Object>();
		args.add(this.username);
		args.add(start);
		
		ResultSet result = DBAdapter.dbExecute(query, args, false, conn);
		
		if (result != null && result.next()) {
			return true;
		} else {
			return false;
		}
		
		
	}
}
