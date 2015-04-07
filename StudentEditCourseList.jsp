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
			<a href="StudentHome.jsp" class="navbar-brand span-custom "
				style="padding-top: 13px"> <span
				class="glyphicon glyphicon-search"></span> Consult.<span class="red">Me</span>
			</a>
			<!-- software name end -->
		</div>

		<!-- link pages start -->
		<ul class="collapse navbar-collapse nav navbar-nav nav-opt-custom"
			id="links">
			<li><a href="ToStudentEditCourseList">Edit Course List</a></li>
			<li><a href="ToStudentRequestConsultation">Request
					Consultation</a></li>
			<li><a href="ToStudentViewRequest">View Requests</a></li>
		</ul>
		<!-- link pages end -->

		<!-- header right start -->
		<div class="navbar-right collapse navbar-collapse" id="user">
			<ul class="nav navbar-nav nav-user-custom">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <span
						class="glyphicon glyphicon-user"></span><span class="span-custom">
							${sessionScope.profile.lastName},
							${sessionScope.profile.firstName} </span> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="ToChangePasswordServlet"><span
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

							<a class="content" href="ToStudentViewRequest">
								<div class="notif-item">
									<h4 class="item-text">Mr. Luis Dery · 1 day ago</h4>
									<p class="item-details">Accepted your consultation request!</p>
								</div>
							</a> <a class="content" href="ToStudentViewRequest">
								<div class="notif-item">
									<h4 class="item-text">Ms. Shirley Chu · 1 day ago</h4>
									<p class="item-details">Rejected your consultation request!</p>
								</div>
							</a> <a class="content" href="ToStudentViewRequest">
								<div class="notif-item">
									<h4 class="item-text">Ms. Solomon See · 2 days ago</h4>
									<p class="item-details">Rejected your consultation request!</p>
								</div>
							</a> <a class="content" href="ToStudentViewRequest">
								<div class="notif-item">
									<h4 class="item-text">Ms. Ethel Ong · 4 days ago</h4>
									<p class="item-details">Rejected your consultation request!</p>
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
				<!-- 1st row -->
				<div class="row col-md-12">
					<div class="col-md-12">
						<h3>My Courses</h3>
						<hr class="break" />
						<div class="panel panel-primary">
							<div class="course-wrapper">
								<table class="table" style="border-collapse: collapse;">
									<thead class="panel-th">
										<tr>
											<th>Course Code</th>
											<th>Section</th>
											<th>Professor</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="c" items="${course}" varStatus="counter">
											<tr>
												<td>${c.courseCode}</td>
												<td>${c.section}</td>
												<td>${c.professorLast},${c.professorFirst}</td>
												<td><form class="form-horizontal" action="DropCourse">
														<button type="submit" class="btn btn-default btn-xs">
															<span class="glyphicon glyphicon-remove"></span> Drop
														</button>
													</form></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

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
									<select class="form-control" id="section">
										<option>All</option>
										<option>S17</option>
										<option>S18</option>
										<option>S19</option>
										<option>S20</option>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="profname" class="control-label col-md-3">Professor:
								</label>
								<div class="col-md-5">
									<select class="form-control" id="professor">
										<option>All</option>
										<option>Mr. Solomon See</option>
										<option>Ms. Courtney Ngo</option>
										<option>Ms. Shirley Chu</option>
										<option>Ms. Ethel Ong</option>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<center>
									<input type="submit" class="btn btn-info" value="Search">
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
											<th>Professor</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="courselist" items="${courselist}" varStatus="counter">
											<tr>
												<td>${courselist.courseCode}</td>
												<td>${courselist.section}</td>
												<td>${courselist.professorLast},${courselist.professorFirst}</td>
												<td><button type="submit"
														class="btn btn-default btn-xs">
														<span class="glyphicon glyphicon-ok"></span> Add
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
