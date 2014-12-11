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
public class Bookings {
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
                int id = rs.getInt("booking_id");
                Room r = new Room(name, location, size, features);
                bookings.add(new Booking(id,r,start,end));
            }



        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(conn!=null) try{conn.close();} catch(SQLException e) {e.printStackTrace();}
        }
        return bookings;
    }
    public static void removeBooking(String id) {

        List<Object> arguments = new ArrayList<Object>();
        arguments.add(id);
        Connection conn = null;
        try {
            conn = DBAdapter.dbConnect();
            DBAdapter.dbExecute("DELETE FROM bookings WHERE booking_id=?", arguments, true, conn);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(conn!=null) try{conn.close();} catch(SQLException e) {e.printStackTrace();}
        }
    }
}
