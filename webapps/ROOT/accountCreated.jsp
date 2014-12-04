<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Book A Room: Create Account</title>
</head>
<body>
<%
    ArrayList<Object> arguments = new ArrayList<Object>();
    arguments.add(request.getParameter("username"));
    arguments.add(request.getParameter("password"));
    arguments.add(request.getParameter("email"));
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    arguments.add(dateFormat.format(date));

    out.print("hi");
    DBAdapter.dbExecute("INSERT INTO users VALUES (?,?,?,?)", arguments, true);



%>
</body>
</html>