package utils;

import core.Booking;
import core.Room;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jack on 10/12/14.
 */
public class FetchMyBookings {
    public static List<Booking> getBookings(String username) {
        List<Booking> bookings = new ArrayList<Booking>();
        List<Object> arguments = new ArrayList<Object>();
        arguments.add(username);
        Connection conn = null;
        try {
            conn = DBAdapter.dbConnect();
            ResultSet rs = DBAdapter.dbExecute("SELECT * FROM bookings, rooms WHERE username = ? and bookings.room_id=rooms.room_id", arguments, false, conn);

            while(rs.next()){
                String start =  rs.getString("start");
                String end = rs.getString("end");
                String name = rs.getString("name");
                String location = rs.getString("location");
                int size = rs.getInt("size");
                int features = rs.getInt("equipment");
                Room r = new Room(name, location, size, features);
                bookings.add(new Booking(r,start,end));
            }



        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(conn!=null) try{conn.close();} catch(SQLException e) {e.printStackTrace();}
        }
        return bookings;
    }
}
