<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Consult.Me</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- custom css -->
    <link rel="stylesheet" type = "text/css" href = "css/custom.css">

  </head>

  <body>
    <!-- header start -->
    <nav class="navbar navbar-inverse navbar-custom navbar-fixed-top">
      <!-- header content start -->
      <div class="container-fluid">
        <div class="navbar-header">
          <!-- responsive toggle button start -->
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#user">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button>

          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#links">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button>
          <!-- responsive toggle button end -->

          <!-- software name start -->
          <a href="StudentHome.jsp" class="navbar-brand span-custom " style="padding-top: 13px">
            <span class="glyphicon glyphicon-search"></span>
            Consult.<span class="red">Me</span>
          </a>
          <!-- software name end -->
        </div>

        <!-- link pages start -->
        <ul class="collapse navbar-collapse nav navbar-nav nav-opt-custom" id = "links">
          <li><a href="ToStudentEditCourseList">Edit Course List</a></li>
          <li><a href="ToStudentRequestConsultation">Request Consultation</a></li>
          <li><a href="ToStudentViewRequest">View Requests</a></li>
        </ul>
        <!-- link pages end -->
        
        <!-- header right start -->
        <div class = "navbar-right collapse navbar-collapse" id = "user">
              <ul class="nav navbar-nav nav-user-custom">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
                  <span class="glyphicon glyphicon-user"></span><span class = "span-custom"> ${sessionScope.profile.lastName}, ${sessionScope.profile.firstName}  </span> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="ToChangePasswordServlet"><span class="glyphicon glyphicon-cog"></span> Change Password</a></li>
                    <li><a href="StartServlet"><span
								class="glyphicon glyphicon-off"></span> Logout</a></li>  
                  </ul>
                </li>
              </ul>

              <!-- notification start -->
              <ul class="nav navbar-nav nav-user-custom">  
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
                  <span class="glyphicon glyphicon-th-list"></span><span class = "span-custom"> Notifications</span> <span class="caret"></span></a>

                  <ul class="dropdown-menu notif" role="menu">
                        <!-- notifications content -->
                        <div class="notif-wrapper">

                          <c:forEach var="n" items="${notif}" varStatus="counter">
								<a class="content" href="ToStudentViewRequest">
									<div class="notif-item">
										<h4 class="item-text">${n.lastName }, ${n.firstName } · ${n.course }</h4>
										<p class="item-details">${n.status } your consultation
											request!</p>
									</div>
								</a>
							</c:forEach>
                             
                        </div>
                        <!-- notifications content end -->
                  </ul>
                </li>            
              </ul>
              <!-- notification end -->
        </div>
        <!-- header right end -->
      </div>
      <!-- header content end -->
    </nav>
  <!-- header end -->

    <!-- page body start -->
    <div class="container container-custom" id = "containerID">
      <!-- content start -->
      <div class = "row">
        <div class = "col-md-12 trans img-rounded">
          <div class = "col-md-12">
            <h3> Change Password </h3> <!-- Title -->
            <hr class = "break"/>          
            

            <form class="form-horizontal" role="form" method = "post" action = "ChangePasswordServlet" >

              <div class="form-group row">
                <label for="firstpass" class = "control-label col-md-2">Old Password:</label>
                <div class = "col-md-3">
                  <input type="password" class="form-control" id="pass" name = "pass" placeholder="Password">
                </div>
              </div>

              <div class="form-group row">
                <label for="newpass" class = "control-label col-md-2">New Password:</label>
                <div class = "col-md-3">
                  <input type="password" class="form-control" id="newpass" name = "newpass" placeholder="New Password">
                </div>
              </div>

              <div class="form-group row">
                <label for="confirmnewpass" class = "control-label col-md-2">Confirm New Password:</label>
                <div class = "col-md-3">
                  <input type="password" class="form-control" id="confirmnewpass" name ="confirmnewpass" placeholder="Enter New Password">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-2"></div>
                <div class="col-md-2">        
                  <input type="submit" class="btn btn-info" value="Submit">
                </div>
                <div class="col-md-5"></div>
              </div>

            </form>
          </div>
        </div>
      </div>
      <!-- content end -->

      <!-- footer -->
      <div class="row">
        <div class = "col-md-12"><hr class = "break"/>
          <ul>
            <li class = "liblock">© Consult.Me Team 2015</li>
          </ul>
            <p style = "padding-left:4em">Icons from Glyphicons Free.</p>
        </div>
      </div>
      <!-- footer end -->
    </div>
    <!-- page body end -->

    <!-- main bootstrap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
  </body>
</html>
