<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Book A Room: Browse</title>
</head>
<body>
<%
	
    out.print("hi");
    try {
        ResultSet rs = DBAdapter.dbExecute("SELECT * FROM rooms", null,false);
        //out.print(rs);
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>
</body>
</html>