<%@page import="java.io.PrintWriter"%>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="utils.LoginSystem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Book A Room: Browse</title>
</head>
<body>
<%  if(!LoginSystem.isAuthenticated(session, request)) {
        response.sendRedirect("/login.jsp");
        return;
    }

    Connection conn = null;
    try {
        conn = DBAdapter.dbConnect();
    	ResultSet rs = DBAdapter.dbExecute("SELECT * FROM rooms", new ArrayList<Object>(),false,conn);
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

