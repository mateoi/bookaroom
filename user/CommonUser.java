package user;

import java.sql.Date;

public class CommonUser extends User {

	public CommonUser(String username, String hashedPassword, DBAdapter database) {
		super(username, hashedPassword, false, database);
	}
	
	public boolean requestBooking(User user, Room room, Date date) {
		user = this;
		return false;
	}

}
