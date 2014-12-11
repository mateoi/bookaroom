<%@ page import="utils.LoginSystem" %>
<%@ page import="core.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="utils.Bookings" %><%
    if(!LoginSystem.isAuthenticated(session, request)) {
        response.sendRedirect("/index.jsp?notloggedin");
        return;
    }
    if (request.getParameter("remove")!=null) {
        System.out.println("removing " + request.getParameter("remove"));
        Bookings.removeBooking(request.getParameter("remove"));
    }

    if (request.getParameter("book")!=null) {
        Bookings.addBooking(request.getParameter("room_id"),(String) session.getAttribute("username"),request.getParameter("start"),request.getParameter("end"));
    }
    List<Booking> bookings = Bookings.getBookings((String) session.getAttribute("username"));
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- meta data required for opengraph sites-->
    <meta property="og:title" content="Nameless organisation - Room booking service" >
    <meta property="og:type" content="website" >
    <meta property="og:site_name" content="Book A Room service" >
    <meta property="og:image:width" content="200" >
    <meta property="og:image:height" content="200" >
    <!-- <meta property="og:url" content="http://bookaroom.com" > -->
    <meta property="og:description" content="Welcome to the Nameless organisation book a room online service. From here you may enter your critieria to select a soecific room or simply browse all our rooms.">

    <!-- meta data required for Twitter -->
    <meta name="twitter:site" content="@bookarooom" >
    <meta name="twitter:title" content="Book A Room service" >
    <meta name="twitter:card" content="Welcome to the Nameless organisation room booking service!" >
    <meta name="twitter:description" content="Welcome to the Nameless organisation book a room online service. From here you may enter your critieria to select a soecific room or simply browse all our rooms." >
    <!-- <meta name="twitter:url" content="http://www.bookaroom.com" > -->

    <title>Room Booking</title>


    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <ul class="nav navbar-top-links navbar-left">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-list fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="help.jsp"><i class="fa fa-flag fa-fw"></i> Help</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="about.jsp"><i class="fa fa-font fa-fw"></i> About</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
            </ul>

            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp"><i class="fa fa-home fa-fw"></i></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="/logoutServ"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
        </nav>

        <div id="page-wrapper">
        <div class="row" style="padding:2em 1em; ">
            <h1 class="page-header">
                <small>My Bookings</small>
            </h1>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab_today">
                    <% for(Booking b: bookings) {%>
                    <div class="row" style="padding:2em 1em; ">
                        <div class="col-lg-12">
                            <div class="panel panel-success" >
                                <div class="panel-body" style="padding:0px">
                                    <img src='images/Nelson_Mandela_Theatre.jpg' height="200" width="300" style="float:left">
                                    <div class="col-md-4 text-left" style="padding-left: 50px;">
                                        <h1 style="margin-top: 5px;"><small><%= b.getRoom().getName()%></small></h1>
                                        <address>
                                            <%=b.getRoom().getLocation()%>
                                        </address>
                                        <h3 style="margin-top: 1em;"><small>Start: <%=b.getStart()%> </small>
                                            <br><small>End: <%=b.getEnd()%></small></h3>
                                    </div>
                                    <div class="col-md-4 text-left">
                                        <ul>
                                            <li><p class="text-muted">Capacity: <%= b.getRoom().getCapacity()%></p></li>
                                            <% for(String f: b.getRoom().getFeatures()) { %>
                                            <li><p class="text-muted"><%= f %></p></li>
                                            <% } %>
                                        </ul>
                                    </div>
                                </div>
                                <div class="panel-footer pull-right">
                                    <!-- Kareem: remember to change this to a button or input when using this as a form -->
                                    <form>
                                         <input type="hidden" name="remove" value ="<%=b.getId()%>">
                                         <input type="submit" value="Remove" class="btn btn-primary"></button>
                                    </form>
                                    <%--<a href="bookings.jsp" class="btn btn-success">Remove</a>--%>
                                </div>
                            </div>
                        </div>
                        <!-- /.col-lg-4 -->
                    </div>
                    <%}%>
                </div>
            </div>
        </div>

            <footer class="bs-docs-footer" role="contentinfo" style="margin-top:200px">
              <div class="container">
                <p style="margin: 0 0 2px;">Copyright © 2013 UCL (University College London). All rights reserved.</p>
                
                <p style="margin: 0 0 2px;">Maintained by Group 9, Software engineering team. Built with Bootstrap, Jquery, with a java EE back-end</p>
                
                <p style="margin: 0 0 2px;">University College London - Gower Street - London - WC1E 6BT</p>
              </div>
            </footer>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/main.js"></script>

</body>

</html>
