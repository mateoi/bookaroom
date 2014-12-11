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

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8 text-center">
                <h1 class="page-header">
                    About <small>- 'Book a Room' Overview</small>
                </h1>
                </br>
                <ol class="breadcrumb">
                    <li class="active">
                        <i class="fa fa-paperclip"></i> Summary
                    </li>
                </ol>
                <p>
                    This is a book a simple room booking service built by the group 9 of the UCL software engineering group for Nameless inc. 
                    The main purpose of this system is for the search and reservation of the various rooms in Nameless inc. The main highlights of the Book a room service include the ability to search and book various rooms, see the availability of a venue at a certain time specified by a user and the speed of booking. 
                </p>
                <li class="divider"></li>
                <ol class="breadcrumb">
                    <li class="active">
                        <i class="fa fa-hdd"></i> Technical Summary
                    </li>
                </ol>
                <p>
                    This Website frontend was built entirely using HTML5/CSS3, Javascript/Jquery and Bootstrap for layout and CSS styling. Other plugins used in the front end were Toastr for interactive alerts and notifications, as well as font-awesome-4.1.0 for icons and additional fonts. The website backend was built with JAVA EE ver 8.25 and Apache Tomcat 8.0.15 for implementation of the Java Servlet and JavaServer Pages. A MySQL database is used for information storage.
                </p>
                </br></br>
                <li class="divider"></li>
            </div>
        </div>

            

            <footer class="bs-docs-footer" role="contentinfo" style="margin-top:-20px">
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
