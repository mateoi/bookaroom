package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import core.Room;

public class Search {

	public static List<Room> search(Date start, Date end, int capacity, int features) {
		Connection conn = null;
		try {
			conn = DBAdapter.dbConnect();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		String query;
		List<Object> args = new ArrayList<Object>();
		args.add(features);
		args.add(features);
		
		if (capacity == 0) {
			query =
					  "SELECT r.*"
					+ "FROM rooms r, bookings b"
					+ "HAVING equipment&?=?"
					+ "AND r.room_id NOT IN("
						+ "SELECT b.room_id"
						+ "FROM bookings b"
						+ "WHERE b.room_id = r.room_id"
						+ "AND (b.start > ? OR b.end < ?));";
		} else {
			query =
					  "SELECT r.*"
					+ "FROM rooms r, bookings b"
					+ "HAVING equipment&?=?"
					+ "AND size >= ?"
					+ "AND size < (? * 1.5 + 10)"
					+ "AND r.room_id NOT IN("
						+ "SELECT b.room_id"
						+ "FROM bookings b"
						+ "WHERE b.room_id = r.room_id"
						+ "AND (b.start > ? OR b.end < ?));";
			args.add(capacity);
			args.add(capacity);
		}
		
		args.add(end);
		args.add(start);
		
		try {
			return roomify(DBAdapter.dbExecute(query, args, false, conn));
		} catch (SQLException e) {
			return null;
		}
	}
	
	private static List<Room> roomify(ResultSet rs) throws SQLException {

		return null;
	}

}
