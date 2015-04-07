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
          <a href = "LogIn.jsp" class="navbar-brand span-custom" style="padding-top: 13px">
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
            <li><a href="SignUp.jsp"><span class="glyphicon glyphicon-user"></span><span class = "span-custom"> Sign Up</span></a></li>
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
          <form class="form-horizontal" role="form" action = "studenthome.html">
            <div class="modal-body">
                <div class="form-group row has-feedback"> <!-- if error add "has-errpr" -->
                  <label class="control-label col-sm-4" for="usernametxt">Username:</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" id="usernametxt" maxlength="20">
                    <!-- add this here if may error -->
                    <!-- <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span> -->
                  </div>
                </div>
                <div class="form-group row has-feedback"> <!-- if error add "has-errpr" -->
                  <label class="control-label col-sm-4" for="passtxt">Password:</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control" id="passtxt" maxlength="20">
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
        <div class = "jumbotron trans">
          <h1 style="padding-top: 20px"> Sign Up </h1> <!-- Title -->
          <hr class = "break"/> 
          <form class="form-horizontal" role="form" method = "post" action = "SignUpServlet">

            <div class="form-group row">
              <label for="accountType" class = "control-label col-md-2">Account Type:</label>
              <div class = "col-md-3">
                <select class = "form-control" id = "accountType" name = "type" value = "asd">
                  <option> - </option>
                  <option> Student </option>
                  <option> Professor </option>
                </select>
              </div>
            </div>

            <div class="form-group row">
              <label for="idnumber" class = "control-label col-md-2">ID Number:</label>
              <div class = "col-md-3">
                <input type="number" class="form-control" id="idnumber" name = "idnum" placeholder="ID Number">
              </div>
            </div>

            <div class="form-group row">
              <label for="firstname" class = "control-label col-md-2">First Name:</label>
              <div class = "col-md-3">
                <input type="text" class="form-control" id="firstname" name = "fname" placeholder="First Name">
              </div>

              <label for="lastname" class = "control-label col-md-2">Last Name:</label>
              <div class = "col-md-3">
                <input type="text" class="form-control" id="lastname" name = "lname" placeholder="Last Name">
              </div>
            </div>

            <div class="form-group row">
              <label for="dlsuemail" class = "control-label col-md-2">DLSU Email:</label>
              <div class = "col-md-3">
                <input type="email" class="form-control" id="dlsuemail" name = "email" placeholder="Email">
              </div>

              <label for="confirmemail" class = "control-label col-md-2">Confirm Email:</label>
              <div class = "col-md-3">
                <input type="email" class="form-control" id="confirmemail" name = "cemail" placeholder="Confirm Email">
              </div>
            </div>

            <div class="form-group row">
              <label for="firstpass" class = "control-label col-md-2">Password:</label>
              <div class = "col-md-3">
                <input type="password" class="form-control" id="firstpass" name = "password" placeholder="Password">
              </div>

              <label for="confirmpass" class = "control-label col-md-2">Confirm Password:</label>
              <div class = "col-md-3">
                <input type="password" class="form-control" id="lastname" name = "cpassword" placeholder="Confirm Password">
              </div>
            </div>

            <hr class = "break"/> 

            <div class="row">
              <center>        
                <input type="submit" class="btn btn-info" value = "Submit">
              </center>
              
            </div>

          </form>
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
