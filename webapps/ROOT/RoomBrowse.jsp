<%@page import="java.io.PrintWriter"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Book A Room: Browse</title>
</head>
<body>
<%
	
    out.print("hi");

	Connection conn = DBAdapter.dbConnect();
	try {
    	ResultSet rs = DBAdapter.dbExecute("SELECT * FROM rooms", new ArrayList<Object>(),false,conn);
        while(rs.next()){
        	out.print(rs.getString("name"));
        }
        
        out.print("here");
    } catch (SQLException e) {
    	out.print("there");
        e.printStackTrace(new PrintWriter(out));
    }finally{
    	conn.close();
    }

%>
</body>
</html>