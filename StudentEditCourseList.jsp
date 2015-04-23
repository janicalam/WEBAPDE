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
<script src="jquery-2.1.3.js"></script>
<script type="text/javascript">		
		function addBtn(index){		
			//e.preventDefault();
			var x = index;
			$.ajax({
				url : "AddCourse",
				data : {"index" : x,
				method : "POST",
				success : function(data) {
				}
			}});
		}
			
		function dropBtn(index){
			//e.preventDefault();
			var x = index;
			$.ajax({
				url : "DropCourse",
				data : {"index" : x,
				method : "POST",
				success : function(data) {
				}
			}});
		}
	</script>
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

							<c:forEach var="n" items="${notif}" varStatus="counter">
								<a class="content" href="ToStudentViewRequest">
									<div class="notif-item">
										<h4 class="item-text">${n.lastName },${n.firstName }·
											${n.course }</h4>
										<p class="item-details">${n.status }your consultation
											request!</p>
									</div>
								</a>
							</c:forEach>

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
										<c:forEach var="c" items="${enrolledCourses}"
											varStatus="counter">
											<tr>
												<td>${c.courseCode}</td>
												<td>${c.section}</td>
												<td>${c.professorLast},${c.professorFirst}</td>
												<td><form class="form-horizontal">
														<button type="submit" class="btn btn-default btn-xs"
															onclick="javascript:dropBtn(${counter.index})">
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

						<form class="form-horizontal" role="form"
							action="StudentEditCourse" method="POST">
							<div class="form-group row">
								<label for="coursecode" class="control-label col-md-3">Course
									Code: </label>
								<div class="col-md-5">
									<select class="form-control" id="course" name="course">
										<option>All</option>
										<c:forEach var="c" items="${coursecode}" varStatus="counter">
											<option>${c}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="section" class="control-label col-md-3">Section:
								</label>
								<div class="col-md-5">
									<select class="form-control" id="section" name="section">
										<option>All</option>
										<c:forEach var="s" items="${sections}" varStatus="counter">
											<option>${s}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<center>
									<input type="submit" class="btn btn-info" value="Search"
										id="search">
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
										<c:forEach var="courselist" items="${courselist}"
											varStatus="counter">
											<tr>
												<td>${courselist.courseCode}</td>
												<td>${courselist.section}</td>
												<td>${courselist.professorLast},${courselist.professorFirst}</td>
												<td><form class="form-horizontal">
														<button type="submit" class="btn btn-default btn-xs"
															onclick="javascript:addBtn(${counter.index})">
															<span class="glyphicon glyphicon-ok"></span> Add
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
	<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.js"></script>
	<script type="text/javascript">
	//$("#addCourse").click(
	/* $(document).ready(function() {
		$('#addCourse').click(function(event) { 
			var x=$('#addCourse').val();
			$.ajax({
				url : "AddCourse",
				data : {"index" : x,
				method : "POST",
				success : function(data) {
				}
			}});	
		});
	 */	
		
		function addBtn(index, e){
			
			e.preventDefault();
			var x = index;
			$.ajax({
				url : "AddCourse",
				data : {"index" : x,
				method : "POST",
				success : function(data) {
				}
			}});
		}
			
		function dropBtn(index, e){
			e.preventDefault();
			var x = index;
			$.ajax({
				url : "DropCourse",
				data : {"index" : x,
				method : "POST",
				success : function(data) {
				}
			}});
		}
	};
 -->
	<!-- /* $("#search").click(function() { function getSelectedText(elementId)
	{ var elt = document.getElementById(elementId); if (elt.selectedIndex
	== -1) return null; return elt.options[elt.selectedIndex].text; } var
	course = getSelectedText('course'); var section =
	getSelectedText('sections'); $.ajax({ url : "StudentEditCourse", data :
	{"course" : course, "sections" : section}, method : "POST", success :
	function(data) { //alert(data); $('#content p').text(data); // id =
	data.idtodo; } }); }); */
	</script>
 -->
</body>
</html>
