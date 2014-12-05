<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="utils.LoginSystem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Book A Room: Homepage</title>
</head>
<body>
     <h1>Home Page</h1>
      <pre>
       The purpose of this page:
          - check if user is logged in. if the user is logged in, display the name, if not display login button
          - link to the search, booking, and available now pages
          - more button to show about, contact, and help info
----------------------------------------------------------------------------------------------------------------
      </pre>

<a href="RoomBrowse.jsp">Browse</a><br>
<%
    if(LoginSystem.isAuthenticated(session, request)) {
        out.println("LOGEED IN AS: " + session.getAttribute("username"));
        out.println("<a href=\"logout.jsp\">Logout</a>");
    }
    else out.println("<a href=\"login.jsp\">Please Login</a>");
%>
</body>
</html>