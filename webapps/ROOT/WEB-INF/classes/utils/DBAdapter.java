package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;

/***
 * 
 * @author xosauce
 *		Only static access. 
 */
public class DBAdapter {
	
	public static Connection dbConnect() throws Exception{
        Connection conn = null;
		String url  = "jdbc:mysql://bookaroom.cywsxh61j8sj.eu-west-1.rds.amazonaws.com/bookaroomdb";
		String user = "user";
		String password  = "abcd1234";
		try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception ex) {
            throw ex;
        } 
		return conn;
	}
	public static ResultSet dbExecute(String sqlQuery,ArrayList<Object> arguments, boolean update, Connection conn) throws Exception{
        
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
			if(update){
				statement.executeUpdate();
				return null;
			}
            return statement.executeQuery();
		}catch(Exception ex){
            throw ex;
		}
	}
	
	public static void main(String args[]) throws SQLException{
		System.out.println("heelo");
		ArrayList<Object> arguments = new ArrayList<Object>();
		arguments.add(10);
		arguments.add("MOM");
		//dbExecute("SELECT * FROM ? WHERE id = ? ",arguments, false);

	}
}
