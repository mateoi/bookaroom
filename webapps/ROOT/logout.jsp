<%@ page import="utils.LoginSystem" %>
<%--
  Created by IntelliJ IDEA.
  User: andrewwg94
  Date: 12/5/14
  Time: 1:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    LoginSystem.forgetSession(request, response);
%>