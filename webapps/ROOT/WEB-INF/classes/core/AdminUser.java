package core;

import java.sql.Date;

import utils.DBAdapter;

public class AdminUser extends User {

	public AdminUser(String username, String hashedPassword, boolean isAdmin,
			DBAdapter database) {
		super(username, hashedPassword, true, database);
	}

	@Override
	public boolean requestBooking(User user, Room room, Date date) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public boolean forceBooking(User user, Room room, Date date) {
		return false;
	}

}
