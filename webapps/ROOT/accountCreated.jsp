<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="utils.LoginSystem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Book A Room: Account created</title>
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

    Connection cxn = null;
    try {
        cxn = DBAdapter.dbConnect();
        ResultSet rs = DBAdapter.dbExecute("SELECT * FROM users WHERE username = ?", arguments.subList(0,1), false, cxn);
        if(rs.next()) {
            out.println("User already exists!");
            return;
        }
        DBAdapter.dbExecute("INSERT INTO users VALUES (?,?,?,?)", arguments, true, cxn);
        LoginSystem.saveSession(session, request, response, request.getParameter("username"));
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(cxn!=null) try{cxn.close();} catch(SQLException e) {e.printStackTrace();}
    }

%>
</body>
</html>