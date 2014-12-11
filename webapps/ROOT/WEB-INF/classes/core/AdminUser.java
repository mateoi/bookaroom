package core;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DBAdapter;

public class AdminUser extends User {

	public AdminUser(String username, String hashedPassword, boolean isAdmin,
			DBAdapter database) {
		super(username, hashedPassword, true, database);
	}

	@Override
	public boolean requestBooking(User user, int room_id, Date start, Date end) throws SQLException {
		Connection conn;
		try {
			conn = DBAdapter.dbConnect();
		} catch (ClassNotFoundException e1) {
			// connection failed
			return false;
		}

		try {
			if (user.hasBooking(start)) {
				return false;
			}
		} catch (ClassNotFoundException | SQLException e) {
			return false;
		}

		String newBooking = "INSERT INTO bookings (room_id, username, start, end) VALUES(?, ?, ?, ?);";
		List<Object> args = new ArrayList<Object>();
		args.add(room_id);
		args.add(user.getUsername());
		args.add(start);
		args.add(end);

		DBAdapter.dbExecute(newBooking, args, true, conn);
		return true;
	}

	public boolean forceBooking(User user, int room_id, Date start, Date end) throws SQLException {
		Connection conn;
		try {
			conn = DBAdapter.dbConnect();
		} catch (ClassNotFoundException e1) {
			// connection failed
			return false;
		}

		String newBooking = "INSERT INTO bookings (room_id, username, start, end) VALUES(?, ?, ?, ?);";
		List<Object> args = new ArrayList<Object>();
		args.add(room_id);
		args.add(user.getUsername());
		args.add(start);
		args.add(end);

		DBAdapter.dbExecute(newBooking, args, true, conn);
		return true;
	}

}
