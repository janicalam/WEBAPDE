<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class = "htmlbg">
  <head>
    <title>Consult.Me</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- custom css -->
    <link rel="stylesheet" type = "text/css" href = "css/custom.css">

  </head>

  <body>
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

      <!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#links">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button> -->
          <!-- responsive toggle button end -->

          <!-- software name start -->
          <a href="login.html" class="navbar-brand span-custom " style="padding-top: 13px">
            <span class="glyphicon glyphicon-search"></span>
            Consult.<span class="red">Me</span>
          </a>
          <!-- software name end -->
        </div>

        <!-- link pages start -->
    <!--<ul class="collapse navbar-collapse nav navbar-nav nav-opt-custom" id = "links">
          <li><a href="Homepage.html">Home</a></li>
          <li><a href="AboutUs.html">About Us</a></li>
          <li><a href="ContactUs.html">Contact Us</a></li>
        </ul> -->
        <!-- link pages end -->
        
        <!-- header right start -->
        <div class = "navbar-right collapse navbar-collapse" id = "user">
          <ul class="nav navbar-nav nav-user-custom">
            <li><a href="ToSignUp"><span class="glyphicon glyphicon-user"></span><span class = "span-custom"> Sign Up</span></a></li>
            <li><a type="button" data-toggle="modal" data-target="#login">
              <span class="glyphicon glyphicon-log-in"></span><span class = "span-custom"> Login</span></a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- login -->
    <div class="modal modal-login fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style = "background-color: #222; color: white; border-color: #FF3030;">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
            <h4 class="modal-title" id="loginLabel"><span class="glyphicon glyphicon-log-in"></span> Login</h4>
          </div>
          <form class="form-horizontal" role="form" action = "LogInServlet" method = "post">
            <div class="modal-body">
                <div class="form-group row has-feedback"> <!-- if error add "has-errpr" -->
                  <label class="control-label col-sm-4" for="usernametxt">Id Number:</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" id="usernametxt" name = "idnum" maxlength="20">
                    <!-- add this here if may error -->
                    <!-- <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span> -->
                  </div>
                </div>
                <div class="form-group row has-feedback"> <!-- if error add "has-errpr" -->
                  <label class="control-label col-sm-4" for="passtxt">Password:</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control" id="passtxt" name = "password" maxlength="20">
                    <!-- add this here if may error -->
                    <!-- <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span> -->
                  </div>
                </div>
            </div>

            <div class="modal-footer">
              <center>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <input type="submit" class="btn btn-info btn-custom" value="Login"/>
              </center>
            </div>
          </form>
        </div>
      </div>
    </div>

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
                  <a class = "btn btn-info" href="SignUp.html">
                    <strong>Sign Up Now! <span class = "glyphicon glyphicon-arrow-right"> </span></strong>
                  </a>
                </div>
              </div>
              <div class="item img-rounded carousel-2">
                <div class="carousel-caption-custom ">
                  <h1>Consult Me</h1>
                  <p>Requesting consultations has never been this easy!</p>
                  <a class = "btn btn-info" href="SignUp.html">
                    <strong>Sign Up Now! <span class = "glyphicon glyphicon-arrow-right"> </span></strong>
                  </a>
                </div>
              </div>
              <div class="active item img-rounded carousel-3">
                <div class="carousel-caption-custom ">
                  <h1>Consult Me</h1>
                  <p>Requesting consultations has never been this easy!</p>
                  <a class = "btn btn-info" href="SignUp.html">
                    <strong>Sign Up Now! <span class = "glyphicon glyphicon-arrow-right"> </span></strong>
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