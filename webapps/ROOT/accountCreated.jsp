<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Book A Room: Browse</title>
</head>
<body>
<%
	
    ArrayList<Object> arguments = new ArrayList<Object>();
    out.print("hi");
    try {
        DBAdapter.dbExecute("INSERT INTO users VALUES (?,?,?,?)", arguments, false);
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>
</body>
</html>