<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="utils.DBAdapter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="utils.LoginSystem" %>
<%@ page import="utils.FetchMyBookings" %>
<%@ page import="java.util.List" %>
<%@ page import="utils.Search" %>
<%@ page import="core.Room" %>
<%@ page import="core.Booking" %>
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
            response.sendRedirect("/index.jsp");
            return;
        }
        List<Booking> bookings = FetchMyBookings.getBookings((String) session.getAttribute("username"));
        for(Booking b: bookings) {
            out.print(b.getRoom().getName()+"<br>");
            out.print(b.getRoom().getCapacity()+"<br>");
            out.print(b.getRoom().getLocation()+"<br>");
            for(String f: b.getRoom().getFeatures()) out.println(f);
            out.println("<br>"+b.getStart()+"<br>");
            out.println(b.getEnd()+"<br>"+"<br>");
        }
    %>
</body>
</html>
