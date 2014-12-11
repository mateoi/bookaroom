package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import core.Room;

public class Search {

	public static List<Room> search(Timestamp start, Timestamp end, Integer capacity, int features) {
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
						+ " AND ( (? < b1.start AND ? < b1.end AND ? >= b1.start ) OR (? >= b1.start AND ? < b1.end)));";
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
						+ " AND ( (? < b1.start AND ? < b1.end AND ? >= b1.start ) OR (? >= b1.start AND ? < b1.end)));";
			args.add(capacity);
			args.add(capacity);
		}
		
		args.add(start);
		args.add(end);
		args.add(end);
		args.add(start);
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
            int r_id = rs.getInt("room_id");
			Room r = new Room(r_id,name, location, size, features);
			rooms.add(r);
		}
		return rooms;
	}
}
