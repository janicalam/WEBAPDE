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
						<li><a href="StartServlet"><span
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
									<h4 class="item-text">Mr. Luis Dery � 1 day ago</h4>
									<p class="item-details">Accepted your consultation request!</p>
								</div>
							</a> <a class="content" href="ToStudentViewRequest">
								<div class="notif-item">
									<h4 class="item-text">Ms. Shirley Chu � 1 day ago</h4>
									<p class="item-details">Rejected your consultation request!</p>
								</div>
							</a> <a class="content" href="ToStudentViewRequest">
								<div class="notif-item">
									<h4 class="item-text">Ms. Solomon See � 2 days ago</h4>
									<p class="item-details">Rejected your consultation request!</p>
								</div>
							</a> <a class="content" href="ToStudentViewRequest">
								<div class="notif-item">
									<h4 class="item-text">Ms. Ethel Ong � 4 days ago</h4>
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

				<div class="col-md-12">
					<h3>Request Consultation</h3>
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
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#sched1">
													<span class="glyphicon glyphicon-calendar"></span> View
													Schedule
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
		<!-- content end -->

		<!-- modals -->
		<div class="modal modal-login fade" id="sched1" tabindex="-1"
			role="dialog" aria-labelledby="schedLabel1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header"
						style="background-color: #222; color: white; border-color: #FF3030;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
						<h4 class="modal-title" id="schedLabel1">
							<span class="glyphicon glyphicon-calendar"></span> WEBAPDE - Ms.
							Courtney Ngo
						</h4>
					</div>
					<form class="form-horizontal" role="form" method = "post" action= "RequestConsultationServlet">
						
						<div class="modal-body modal-wrapper">
						
							<div class="form-group row">
				                <label for="dateT" class = "control-label col-md-2">Date:</label>
				                <div class = "col-md-4">
				                  <input type="date" class="form-control" id="dateT">
				                </div>
				            </div>
				            
							<table class="table">
								<thead class="panel-th">
									<tr>
										<th>Time</th>
										<th>Availability</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>7:30 - 8:00</td>
										<td class="td-selected"></td>
									</tr>

									<tr>
										<td>8:00 - 8:30</td>
										<td class="td-active"></td>
									</tr>

									<tr>
										<td>9:00 - 9:30</td>
										<td class="td-selected"></td>
									</tr>

									<tr>
										<td>12:00 - 12:30</td>
										<td class="td-active"></td>
									</tr>

									<tr>
										<td>13:00 - 13:30</td>
										<td class="td-active"></td>
									</tr>

								</tbody>
							</table>
						</div>

						<div class="modal-footer">
							<center>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<input type="submit" class="btn btn-info btn-custom"
									value="Submit" />
							</center>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- modals -->
		<div class="modal modal-login fade" id="sched2" tabindex="-1"
			role="dialog" aria-labelledby="schedLabel2" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header"
						style="background-color: #222; color: white; border-color: #FF3030;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
						<h4 class="modal-title" id="schedLabel2">
							<span class="glyphicon glyphicon-calendar"></span> OPERSYS - Mr.
							Solomon See
						</h4>
					</div>
					<form class="form-horizontal" role="form">
						<div class="modal-body modal-wrapper">
							<table class="table">
								<thead class="panel-th">
									<tr>
										<th>Time</th>
										<th>Availability</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>7:30 - 8:00</td>
										<td class="td-selected"></td>
									</tr>

									<tr>
										<td>8:00 - 8:30</td>
										<td class="td-selected"></td>
									</tr>

									<tr>
										<td>9:00 - 9:30</td>
										<td class="td-selected"></td>
									</tr>

									<tr>
										<td>12:00 - 12:30</td>
										<td class="td-selected"></td>
									</tr>

									<tr>
										<td>13:00 - 13:30</td>
										<td class="td-active"></td>
									</tr>

								</tbody>
							</table>
						</div>

						<div class="modal-footer">
							<center>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<input type="submit" class="btn btn-info btn-custom"
									value="Submit" />
							</center>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- modals -->
		<div class="modal modal-login fade" id="sched1" tabindex="-1"
			role="dialog" aria-labelledby="schedLabel1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header"
						style="background-color: #222; color: white; border-color: #FF3030;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
						<h4 class="modal-title" id="schedLabel1">
							<span class="glyphicon glyphicon-calendar"></span> SPSWENG - Ms.
							Ethel Ong
						</h4>
					</div>
					<form class="form-horizontal" role="form">
						<div class="modal-body modal-wrapper">
							<table class="table">
								<thead class="panel-th">
									<tr>
										<th>Time</th>
										<th>Availability</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>7:30 - 8:00</td>
										<td class="td-active"></td>
									</tr>

									<tr>
										<td>8:00 - 8:30</td>
										<td class="td-active"></td>
									</tr>

									<tr>
										<td>9:00 - 9:30</td>
										<td class="td-active"></td>
									</tr>

									<tr>
										<td>12:00 - 12:30</td>
										<td class="td-active"></td>
									</tr>

									<tr>
										<td>13:00 - 13:30</td>
										<td class="td-active"></td>
									</tr>

								</tbody>
							</table>
						</div>

						<div class="modal-footer">
							<center>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<input type="submit" class="btn btn-info btn-custom"
									value="Submit" />
							</center>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- footer -->
		<div class="row">
			<div class="col-md-12">
				<hr class="break" />
				<ul>
					<li class="liblock">� Consult.Me Team 2015</li>
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
