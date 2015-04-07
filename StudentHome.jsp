<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <li><a href="ToChangePasswordServlet" ><span class="glyphicon glyphicon-cog"></span> Change Password</a></li>
                    <li><a href="Login.jsp"><span class="glyphicon glyphicon-off"></span> Logout</a></li>  
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

                          <a class="content" href="ToStudentViewRequest">
                            <div class="notif-item">
                              <h4 class="item-text">Mr. Luis Dery · 1 day ago</h4>
                              <p class = "item-details">Accepted your consultation request!</p>
                            </div>
                          </a>

                          <a class="content" href="ToStudentViewRequest">
                            <div class="notif-item">
                              <h4 class="item-text">Ms. Shirley Chu · 1 day ago</h4>
                              <p class = "item-details">Rejected your consultation request!</p>
                            </div>
                          </a>

                          <a class="content" href="ToStudentViewRequest">
                            <div class="notif-item">
                              <h4 class="item-text">Ms. Solomon See · 2 days ago</h4>
                              <p class = "item-details">Rejected your consultation request!</p>
                            </div>
                          </a>

                          <a class="content" href="ToStudentViewRequest">
                            <div class="notif-item">
                              <h4 class="item-text">Ms. Ethel Ong · 4 days ago</h4>
                              <p class = "item-details">Rejected your consultation request!</p>
                            </div>
                          </a>
                             
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
      <div class="jumbotron jumbotron-custom">
        <div id="carousel_slider" class="carousel slide img-rounded" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
              <div class="item img-rounded carousel-1">
                <div class="carousel-caption-custom ">
                  <h1>Consult Me</h1>
                  <p>Requesting consultations has never been this easy!</p>
                  <a class = "btn btn-info" href="ToStudentRequestConsultation">
                    <strong>Request Consultation Now! <span class = "glyphicon glyphicon-arrow-right"></span</strong>
                  </a>
                </div>
              </div>
              <div class="item img-rounded carousel-2">
                <div class="carousel-caption-custom ">
                  <h1>Consult Me</h1>
                  <p>Requesting consultations has never been this easy!</p>
                  <a class = "btn btn-info" href="ToStudentViewRequest">
                    <strong>View Requests Now! <span class = "glyphicon glyphicon-arrow-right"></span</strong>
                  </a>
                </div>
              </div>
              <div class="active item img-rounded carousel-3">
                <div class="carousel-caption-custom ">
                  <h1>Consult Me</h1>
                  <p>Requesting consultations has never been this easy!</p>
                  <a class = "btn btn-info" href="ToStudentEditCourseList">
                    <strong>Edit Course List Now! <span class = "glyphicon glyphicon-arrow-right"></span</strong>
                  </a>
                </div>
              </div>
          </div>
          <!-- Left and right controls -->
          <div class = "sliders"> 
            <a href="#carousel_slider" class="left carousel-control" data-slide="prev">
              <span> < </span>
            </a>
            <a href="#carousel_slider" class="right carousel-control" data-slide="next">
              <span> > </span>
            </a>
          </div>
        </div>
      </div>

      <div class = "row">
        <div class = "col-md-12">
          <div class = "col-md-12  trans img-rounded">           
            <div class="col-md-4">
              <h3>About Us</h3>
              <hr class = "break"/> 
              <p>CCS students have created this web application to help students and professors in De La Salle University in regards to booking a consultation.</p>
              <p>Created on S.Y. 2014-2015, 3rd Term for the course WEBAPDE which focuses on web application design.</p>
            </div>

            <div class="col-md-4">
              <h3>Contact Us</h3>
              <hr class = "break"/> 
              <p>Group Members:</p>
              <p>Sietereales, Miguel; Tan, Angeline; Lam, Janica</p>
              <p>Professor: Ms. Courtney Ngo </p>
              <p>WEBAPDE S20 / G301</p>
            </div>

            <div class="col-md-4">
              <h3>Target Users</h3>
              <hr class = "break"/>         
              <p>Consult Me is a web application that mainly targets students and professors of De La Salle University.</p>
              <p>As of the moment, the application is only limited to CCS students and its faculty.</p>
            </div>

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