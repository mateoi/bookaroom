<%@ page import="utils.LoginSystem" %>
<%
    String username = request.getParameter("email");
    String password = request.getParameter("password");
    if(username!=null && password !=null && !username.equals("") && !password.equals("")) {
        System.out.println("attempting login");
        boolean loginsuccess = LoginSystem.logIn(request, response, session);
        System.out.println("login successful: "+loginsuccess);
    }
    response.sendRedirect("/index.jsp");
%>