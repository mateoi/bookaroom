package core;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DBAdapter;

public class CommonUser extends User {

	public CommonUser(String username, String hashedPassword, DBAdapter database) {
		super(username, hashedPassword, false, database);
	}
	
	public boolean requestBooking(User user, int room_id, Date start, Date end) throws SQLException {
		Connection conn;
		try {
			conn = DBAdapter.dbConnect();
		} catch (ClassNotFoundException e1) {
			// connection failed
			return false;
		}
		
		try {
			if (this.hasBooking(start)) {
				return false;
			}
		} catch (ClassNotFoundException | SQLException e) {
			return false;
		}
		
		String newBooking = "INSERT INTO bookings (room_id, username, start, end) VALUES(?, ?, ?, ?);";
		List<Object> args = new ArrayList<Object>();
		args.add(room_id);
		args.add(this.getUsername());
		args.add(start);
		args.add(end);
		
		DBAdapter.dbExecute(newBooking, args, true, conn);
		return true;
	}

}
