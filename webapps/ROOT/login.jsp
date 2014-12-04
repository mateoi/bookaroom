<%@ page import="utils.DBAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Book A Room: Login</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    ArrayList<Object> list = new ArrayList<Object>();
    list.add(username);
    if(username!=null && password !=null && !username.equals("") && !password.equals("")) {
        Connection cxn = DBAdapter.dbConnect();
        DBAdapter
    }
%>
<form>
     Username: <input type="text" name="username">
     Password: <input type="password" name="password">
     <input type="submit">
 </form>
<a href="newAccount.jsp">Create Account</a>
</body>
</html>