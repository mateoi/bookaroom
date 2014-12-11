package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import core.Room;

public class Search {

	public static List<Room> search(Date start, Date end, Integer capacity, int features) {
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
		
		if (capacity == null || capacity == 0) {
			query =
					  "SELECT r.*"
					+ " FROM rooms r"
					+ " HAVING equipment&?=?"
					+ " AND r.room_id NOT IN("
						+ " SELECT b1.room_id"
						+ " FROM bookings b1"
						+ " WHERE b1.room_id = r.room_id"
						+ " AND (b1.start > ? OR b1.end < ?));";
		} else {
			query =
					  "SELECT r.*"
					+ " FROM rooms r"
					+ " HAVING equipment&?=?"
					+ " AND size >= ?"
					+ " AND size < (? * 1.5 + 10)"
					+ " AND r.room_id NOT IN("
						+ " SELECT b1.room_id"
						+ " FROM bookings b1"
						+ " WHERE b1.room_id = r.room_id"
						+ " AND (b1.start > ? OR b1.end < ?));";
			args.add(capacity);
			args.add(capacity);
		}
		
		args.add(end);
		args.add(start);
		
		try {
			return roomify(DBAdapter.dbExecute(query, args, false, conn));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			if(conn!=null) try{conn.close();} catch(SQLException e) {e.printStackTrace();}
		}
	}
	
	public static List<Room> roomify(ResultSet rs) throws SQLException {
		List<Room> rooms = new ArrayList<Room>();
		while (rs.next()) {
			String name = rs.getString("name");
			String location = rs.getString("location");
			int size = rs.getInt("size");
			int features = rs.getInt("equipment");
			Room r = new Room(name, location, size, features);
			rooms.add(r);
		}
		return rooms;
	}
	
	public static List<Room> availableNow() {
		long millis = Calendar.getInstance().getTime().getTime();
		long hourFloor = (millis / 3600000) * 3600000; //3,600,000 ms in 1 hr
		Date now = new Date(hourFloor);
		Date then = new Date(hourFloor + 3600000);
		return search(now, then, 0, 0);
	}
}
