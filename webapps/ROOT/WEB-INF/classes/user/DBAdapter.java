package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

public class DBAdapter {

	
	private static Connection dbConnect(){
		//Database=bookaroA3u9fTTBJ;Data Source=eu-cdbr-azure-west-b.cloudapp.net;
		//User Id=b66e246790eef4;Password=82095bbb
		Connection conn = null;
		String url  = "jdbc:mysql://eu-cdbr-azure-west-b.cloudapp.net/bookaroA3u9fTTBJ";
		String user = "b66e246790eef4";
		String password  = "82095bbb";
		try {
            conn = DriverManager.getConnection(url, user, password);
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT VERSION()");

            if (rs.next()) {
                System.out.println(rs.getString(1));
            }
        } catch (SQLException ex) {
        	ex.printStackTrace();
        	conn = null;
        } 
		
		return conn;
	} 
	public void changePassword(User user, String hashedPassword) {
		user.setHashedPassword(hashedPassword);
		
	}
	public static void main(String args[]){
		System.out.println("heelo");
		dbConnect();
	}
}
