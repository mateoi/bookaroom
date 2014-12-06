<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="utils.LoginSystem" %>
<%@ page import="java.util.List" %>
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
        if(!LoginSystem.isAuthenticated(session, request)) {
            response.sendRedirect("/login.jsp");
            return;
        }
        List<Object> arguments = new ArrayList<Object>();
        arguments.add(session.getAttribute("username"));
        Connection conn = null;
        try {
            conn = DBAdapter.dbConnect();
            ResultSet rs = DBAdapter.dbExecute("SELECT * FROM bookings WHERE username = ?", arguments, false, conn);
            while(rs.next()){
                out.print(" Room: " + rs.getString("room_id") + "<br>");
                out.print(" Username: " + rs.getString("username") + "<br>");
                out.print(" From: " + rs.getString("start") + "<br>");
                out.print(" To: " + rs.getString("end") + "<br>");
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
