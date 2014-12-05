<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>
<%--
  Created by IntelliJ IDEA.
  User: andrewwg94
  Date: 12/5/14
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book A Room: My Bookings</title>
</head>
<body>
    <%
        Connection conn = null;
        try {
            conn = DBAdapter.dbConnect();
            ResultSet rs = DBAdapter.dbExecute("SELECT * FROM rooms", new ArrayList<Object>(), false, conn);
            while(rs.next()){
                out.print(" Name:" + rs.getString("name") + "<br>");
                out.print(" Size:" + rs.getString("size") + "<br>");
                out.print(" Location:" + rs.getString("location") + "<br>");
                out.print(" Equipment:" + rs.getString("equipment") + "<br>");
                out.print(" Rating:" + rs.getString("rating") + "<br>");
                out.print(" Review:" + rs.getString("review") + "<br>");
                out.print(" Rank:" + rs.getString("rank") + "<br>");
                out.print("<br>");
            }
        } catch (Exception e) {
            e.printStackTrace(new PrintWriter(out));
        }finally{
            if(conn!=null) try{conn.close();} catch(SQLException e) {e.printStackTrace();}
        }
    %>
</body>
</html>
