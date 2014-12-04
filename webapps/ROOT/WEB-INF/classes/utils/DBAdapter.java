package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import core.User;


public class DBAdapter {

	public void changePassword(User user, String hashedPassword) {
			
	}
	
	private static Connection dbConnect(){
		Connection conn = null;
		String url  = "jdbc:mysql://bookaroom.cywsxh61j8sj.eu-west-1.rds.amazonaws.com/bookaroomdb";
		String user = "user";
		String password  = "abcd1234";
		try {
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
		return conn;
	}
	public static void dbExecute(String sqlQuery,ArrayList<Object> arguments, boolean update) throws SQLException{
        Connection conn = dbConnect();

		try{
			PreparedStatement statement = conn.prepareStatement(sqlQuery);

			for(int i = 0; i < arguments.size(); i++){
				int index = i+1;
				if(arguments.get(i) instanceof Integer){
					statement.setInt(index, (Integer)arguments.get(i));
				}else if(arguments.get(i) instanceof String){
					statement.setString(index, (String)arguments.get(i));
				}else if(arguments.get(i) instanceof java.util.Date){
					statement.setDate(index, new java.sql.Date(((Date) (arguments.get(i))).getTime()));
				}else if(arguments.get(i) instanceof Double){
					statement.setDouble(index, (Double)arguments.get(i));
				}
			}
			if(update) statement.executeUpdate();
            else statement.executeQuery();
		}catch(Exception ex){
            throw ex;
		}finally{
			conn.close();
		}
	}
	
	public static void main(String args[]) throws SQLException{
		System.out.println("heelo");
		ArrayList<Object> arguments = new ArrayList<Object>();
		arguments.add(10);
		arguments.add("MOM");
		dbExecute("SELECT * FROM ? WHERE id = ? ",arguments, false);

	}
}
