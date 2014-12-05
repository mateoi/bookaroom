<%@ page import="utils.DBAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="utils.LoginSystem" %>
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
        Connection cxn = null;
        try {
            cxn = DBAdapter.dbConnect();
            ResultSet rs = DBAdapter.dbExecute("SELECT username, password FROM users WHERE username=?", list, false, cxn);
            if(rs.next()) {
                boolean success = password.equals(rs.getString("password"));
                if (success) {
                    LoginSystem.saveSession(session, request, response, username);
                } else {
                    out.println("Invalid Password");
                }
            } else out.println("Invalid Username");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cxn!=null) try{cxn.close();} catch(SQLException e) {e.printStackTrace();}
        }
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