<%@ page import="utils.LoginSystem"%>
<%
	if(!LoginSystem.isAuthenticated(request.getSession(), request)) {
		response.sendRedirect("/index.jsp?notloggedin");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- meta data required for opengraph sites-->
<meta property="og:title"
	content="Nameless organisation - Room booking service">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Book A Room service">
<meta property="og:image:width" content="200">
<meta property="og:image:height" content="200">
<!-- <meta property="og:url" content="http://bookaroom.com" > -->
<meta property="og:description"
	content="Welcome to the Nameless organisation book a room online service. From here you may enter your critieria to select a specific room or simply browse all our rooms.">

<!-- meta data required for Twitter -->
<meta name="twitter:site" content="@bookarooom">
<meta name="twitter:title" content="Book A Room service">
<meta name="twitter:card"
	content="Welcome to the Nameless organisation room booking service!">
<meta name="twitter:description"
	content="Welcome to the Nameless organisation book a room online service. From here you may enter your critieria to select a specific room or simply browse all our rooms.">
<!-- <meta name="twitter:url" content="http://www.bookaroom.com" > -->

<title>Room Booking</title>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<ul class="nav navbar-top-links navbar-left">
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-list fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="help.jsp"><i class="fa fa-flag fa-fw"></i>
								Help</a></li>
						<li class="divider"></li>
						<li><a href="about.jsp"><i class="fa fa-font fa-fw"></i>
								About</a></li>
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
			</ul>

			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp"><i
					class="fa fa-home fa-fw"></i></a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="/logoutServ"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->
		</nav>

		<div id="page-wrapper">
			<div class="row" style="padding: 2em 1em;">
			    <h1 class="page-header">
			        <small>Room Search</small>
			    </h1>
				<div class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-heading">Search</div>
						<div class="panel-body">
							<form role="form" method="POST" action="results.jsp">
								<fieldset>
									<div class="form-group col-md-4">
										<label>Date</label> <input class="form-control"
											placeholder="Format: dd/mm/yyyy" id="date" name="date"
											autofocus>
									</div>

									<div class="form-group col-md-4">
										<label>Time</label> <select class="form-control"
											placeholder="From" id="time_to" name="time_from">
											<option>00:00</option>
											<option>01:00</option>
											<option>02:00</option>
											<option>03:00</option>
											<option>04:00</option>
											<option>05:00</option>
											<option>06:00</option>
											<option>07:00</option>
											<option>08:00</option>
											<option>09:00</option>
											<option>10:00</option>
											<option>11:00</option>
											<option>12:00</option>
											<option>13:00</option>
											<option>14:00</option>
											<option>15:00</option>
											<option>16:00</option>
											<option>17:00</option>
											<option>18:00</option>
											<option>19:00</option>
											<option>20:00</option>
											<option>21:00</option>
											<option>22:00</option>
											<option>23:00</option>
										</select>
									</div>
									<div class="form-group col-md-4">
										<label style="color: #fff;">To</label> <select
											class="form-control" placeholder="To" id="time_from"
											name="time_to">
											<option>00:00</option>
											<option>01:00</option>
											<option>02:00</option>
											<option>03:00</option>
											<option>04:00</option>
											<option>05:00</option>
											<option>06:00</option>
											<option>07:00</option>
											<option>08:00</option>
											<option>09:00</option>
											<option>10:00</option>
											<option>11:00</option>
											<option>12:00</option>
											<option>13:00</option>
											<option>14:00</option>
											<option>15:00</option>
											<option>16:00</option>
											<option>17:00</option>
											<option>18:00</option>
											<option>19:00</option>
											<option>20:00</option>
											<option>21:00</option>
											<option>22:00</option>
											<option>23:00</option>
										</select>
									</div>
									<div class="form-group col-md-4">
										<label>Capacity</label> <input class="form-control"
											placeholder="Min" id="capacity_min" name="capacity_min">
									</div>
									<div class="form-group col-md-8">
										<label>Room Features</label> <br> <label
											class="checkbox-inline"> <input type="checkbox"
											name="wb" value="true"> WhiteBoard
										</label> <label class="checkbox-inline"> <input
											type="checkbox" name="sb" value="true"> SmartBoard
										</label> <label class="checkbox-inline"> <input
											type="checkbox" name="proj" value="true"> Projector
										</label> <label class="checkbox-inline"> <input
											type="checkbox" name="rt" value="true"> Round Tables
										</label> <label class="checkbox-inline"> <input
											type="checkbox" name="laptop" value="true"> Laptop
											A/V Input
										</label>
									</div>
								</fieldset>
								<input type=submit class="btn"> Search</input>
							</form>
						</div>
						<div class="panel-footer pull-right">
							<button type="button" class="btn btn-default">back</button>
							<!-- Kareem: remember to change this to a button or input when using this as a form -->
							<!-- <button type="button" class="btn btn-primary">Search</button> -->
							<!--  <a href="results.html" class="btn btn-primary">Search</a> -->

						</div>
					</div>
				</div>
				<!-- /.col-lg-4 -->
			</div>


			<footer class="bs-docs-footer" role="contentinfo"
				style="margin-top: 200px">
				<div class="container">
					<p style="margin: 0 0 2px;">Copyright © 2013 UCL (University
						College London). All rights reserved.</p>

					<p style="margin: 0 0 2px;">Maintained by Group 9, Software
						engineering team. Built with Bootstrap, Jquery, with a java EE
						back-end</p>

					<p style="margin: 0 0 2px;">University College London - Gower
						Street - London - WC1E 6BT</p>
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
