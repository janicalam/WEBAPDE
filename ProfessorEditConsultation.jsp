<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Consult.Me</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- custom css -->
<link rel="stylesheet" type="text/css" href="css/custom.css">

</head>

<body>
	<!-- header start -->
	<nav class="navbar navbar-inverse navbar-custom navbar-fixed-top">
	<!-- header content start -->
	<div class="container-fluid">
		<div class="navbar-header">
			<!-- responsive toggle button start -->
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#user">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#links">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- responsive toggle button end -->

			<!-- software name start -->
			<a href=LogInServlet " class="navbar-brand span-custom "
				style="padding-top: 13px"> <span
				class="glyphicon glyphicon-search"></span> Consult.<span class="red">Me</span>
			</a>
			<!-- software name end -->
		</div>

		<!-- link pages start -->
		<ul class="collapse navbar-collapse nav navbar-nav nav-opt-custom"
			id="links">
			<li><a href="ToProfessorEditConsultation">Edit Consultation
					Schedule</a></li>
			<li><a href="ToProfessorViewRequest">View Requests</a></li>
		</ul>
		<!-- link pages end -->

		<!-- header right start -->
		<div class="navbar-right collapse navbar-collapse" id="user">
			<ul class="nav navbar-nav nav-user-custom">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <span
						class="glyphicon glyphicon-user"></span><span class="span-custom">${sessionScope.profile.lastName},
							${sessionScope.profile.firstName}</span> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="ToProfessorChangePassword"><span
								class="glyphicon glyphicon-cog"></span> Change Password</a></li>
						<li><a href="LogIn.jsp"><span
								class="glyphicon glyphicon-off"></span> Logout</a></li>
					</ul></li>
			</ul>

			<!-- notification start -->
			<ul class="nav navbar-nav nav-user-custom">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <span
						class="glyphicon glyphicon-th-list"></span><span
						class="span-custom"> Notifications</span> <span class="caret"></span></a>

					<ul class="dropdown-menu notif" role="menu">
						<!-- notifications content -->
						<div class="notif-wrapper">

							<a class="content" href="#">
								<div class="notif-item">
									<h4 class="item-text">Miguel Sietereales · 2 hours ago</h4>
									<p class="item-details">Requested for consultation!</p>
								</div>
							</a> <a class="content" href="#">
								<div class="notif-item">
									<h4 class="item-text">Angeline Tan · 1 day ago</h4>
									<p class="item-details">Requested for consultation!</p>
								</div>
							</a> <a class="content" href="#">
								<div class="notif-item">
									<h4 class="item-text">Janica Lam · 2 days ago</h4>
									<p class="item-details">Requested for consultation!</p>
								</div>
							</a> <a class="content" href="#">
								<div class="notif-item">
									<h4 class="item-text">Marcus Ramos · 4 days ago</h4>
									<p class="item-details">Requested for consultation!</p>
								</div>
							</a>

						</div>
						<!-- notifications content end -->
					</ul></li>
			</ul>
			<!-- notification end -->
		</div>
		<!-- header right end -->
	</div>
	<!-- header content end --> </nav>
	<!-- header end -->

	<!-- page body start -->
	<div class="container container-custom" id="containerID">
		<!-- content start -->
		<div class="row">
			<div class="col-md-12 trans img-rounded">
				<!-- 2nd row -->
				<div class="row col-md-12">

					<div class="col-md-6">
						<h3>Search Course</h3>
						<hr class="break" />

						<form class="form-horizontal" role="form">
							<div class="form-group row">
								<label for="coursecode" class="control-label col-md-3">Course
									Code: </label>
								<div class="col-md-5">
									<input type="text" class="form-control" id="coursecode">
								</div>
							</div>

							<div class="form-group row">
								<label for="section" class="control-label col-md-3">Section:
								</label>
								<div class="col-md-5">
									<input type="text" class="form-control" id="section">
								</div>
							</div>

							<div class="form-group row">
								<label for="day" class="control-label col-md-3">Day: </label>
								<div class="col-md-5">
									<select class="form-control" id="day">
										<option>All</option>
										<option>Monday</option>
										<option>Tuesday</option>
										<option>Wednesday</option>
										<option>Thursday</option>
										<option>Friday</option>
										<option>Monday/Wednesday</option>
										<option>Tuesday/Thursday</option>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="timestart" class="control-label col-md-3">Time
									Start: </label>
								<div class="col-md-5">
									<select class="form-control" id="timestart">
										<option>7:00</option>
										<option>7:30</option>
										<option>8:00</option>
										<option>8:30</option>
										<option>9:00</option>
										<option>9:30</option>
										<option>10:00</option>
										<option>10:30</option>
										<option>11:00</option>
										<option>11:30</option>
										<option>12:00</option>
										<option>12:30</option>
										<option>13:00</option>
										<option>13:30</option>
										<option>14:00</option>
										<option>14:30</option>
										<option>15:00</option>
										<option>15:30</option>
										<option>16:00</option>
										<option>16:30</option>
										<option>17:00</option>
										<option>17:30</option>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="timeend" class="control-label col-md-3">Time
									End: </label>
								<div class="col-md-5">
									<select class="form-control" id="timeend">
										<option>7:00</option>
										<option>7:30</option>
										<option>8:00</option>
										<option>8:30</option>
										<option>9:00</option>
										<option>9:30</option>
										<option>10:00</option>
										<option>10:30</option>
										<option>11:00</option>
										<option>11:30</option>
										<option>12:00</option>
										<option>12:30</option>
										<option>13:00</option>
										<option>13:30</option>
										<option>14:00</option>
										<option>14:30</option>
										<option>15:00</option>
										<option>15:30</option>
										<option>16:00</option>
										<option>16:30</option>
										<option>17:00</option>
										<option>17:30</option>
										<option>18:30</option>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<center>
									<input type="submit" class="btn btn-info" value="Add">
								</center>
							</div>
						</form>

					</div>

					<div class="col-md-6">
						<h3>Course List</h3>
						<hr class="break" />
						<div class="panel panel-primary">
							<div class="course-wrapper">
								<table class="table" style="border-collapse: collapse;">
									<thead class="panel-th">
										<tr>
											<th>Course Code</th>
											<th>Section</th>
											<th>Time</th>
											<th>Day</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="courses" items="${courses}"
											varStatus="counter">
											<tr>
												<td>${courses.courseCode}</td>
												<td>${courses.section}</td>
												<td>${courses.startTime}-${courses.endTime}</td>
												<td>${courses.day}</td>
												<td><button type="submit"
														class="btn btn-default btn-xs">
														<span class="glyphicon glyphicon-remove"></span> Remove
													</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- content end -->

		<!-- footer -->
		<div class="row">
			<div class="col-md-12">
				<hr class="break" />
				<ul>
					<li class="liblock">© Consult.Me Team 2015</li>
				</ul>
				<p style="padding-left: 4em">Icons from Glyphicons Free.</p>
			</div>
		</div>
		<!-- footer end -->
	</div>
	<!-- page body end -->

	<!-- main bootstrap -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>
