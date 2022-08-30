<%-- 
    Document   : onlineexam
    Created on : Sep 10, 2019, 7:43:00 PM
    Author     : Harsh Archit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <style type="text/css">
		html{
			scroll-behaviour:smooth;

		}
		body{
			margin: 0;
			padding: 0;
            overflow-x: hidden;
            font-family: 'Raleway', sans-serif !important;
		}
		li{
			margin-left: 20px;
			height: 10px !important;

		}
		a{
			line-height: 50px !important;
			font-size: 18px;
			color: white !important;
            height: 70px;
            letter-spacing: 1px;
		}
		a:hover{
			border-bottom: 2px solid;

		}
		nav{
			background-image: linear-gradient(to left,lightgreen,white) !important;
		}
		#about{
			width: 100%;
			height: 70vh;
			background:linear-gradient(to left,lightgreen,white);
			margin-top: -20px;
			
		}
		#contact
		{
			width: 100%;
			height: 73vh;
			background:linear-gradient(to right,lightgreen,white);
			margin-top: -20px;
		}
		#left{
           width: 33%;
           height: 75%;
           float: left;
           
           
           }
           #left1{
           width: 50%;
           height: 100%;
           float: left;
           
           
           }
           #left input{
           	width: 350px;
           }
           .left img:hover{
           	transform: rotate(360deg);
           	transition: 2s;
           }
           .form-group input,label{
           	font-size: 18px;
           }
           abbr[title] {
  border-bottom: none !important;
  text-decoration: none !important;
}
.modal-dialog{
	width: 500px !important;
}
           
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
           <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">

</head>
<body>
<nav class="navbar navbar-default">
	<div class="container-fluid">
    <div class="navbar-header" style="margin-left: 100px;">
      <a href="#"><img src="images/quizwizz.png" style="width: 200px;height: 80px;"></a>
    </div>
    <ul class="nav navbar-nav" style="margin-left: 400px;">
      <li><a href="#">Home</a></li>
      <li><a href="#about">About</a></li>
      <li><a href="#contact">Contact</a></li>
      <li><a href="#" data-toggle="modal" data-target="#mymod">Login</a></li>
      <li><a><abbr title="No SignUp for Admin">SignUp</abbr></a></li>
      
    </ul>
  </div>
</nav>
	 <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top: -20px;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/exam2.jpg" alt="Los Angeles" style="width: 100%;height: 90vh;">
    </div>

    <div class="item">
      <img src="images/exam6.jpg" alt="Chicago" style="width: 100%;height: 90vh;">
    </div>

    <div class="item">
      <img src="images/exam4.jpg" alt="New York" style="width: 100%;height: 90vh;">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


	<div id="about">
		<h1 style="text-align: center;line-height: 100px;"><u>AboutUs</u></h1>
		<div class="container">
			<div id="left1" style="position: relative;left:-20px;">
        <p style="font-size: 20px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br>
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br>
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
    <div id="left1" style="position: relative;right:-20px;">
    	<img src="images\exam7.jpg" style="width: 100%;">
    </div>
        </div>
	</div>
    <div id="contact">
    	<h1 style="text-align: center;line-height: 100px;"><u>ContactUs</u></h1>
    	<div id="left">
    		<img src="images\contactus.png" style="width: 100%;height: 100%;margin-top: -20px;">
    	</div>
    	<div id="left" class="left">
    		
    		<img src="https://img.icons8.com/nolan/64/000000/facebook-new.png" style="margin-left: 20px;margin-top: 30px;">
    		<img src="https://img.icons8.com/nolan/64/000000/twitter.png" style="margin-top: 30px;position: relative;top: 70px;">
    		<img src="https://img.icons8.com/nolan/64/000000/linkedin.png" style="margin-top:30px;position: relative;top: 120px;left: 30px;">
    		<img src="https://img.icons8.com/nolan/64/000000/github.png" style="margin-top: 30px;position: relative;top: 200px;right: 35px;">
    		<img src="https://img.icons8.com/nolan/64/000000/email.png" style="margin-top: 30px;position: relative;top: 70px;">
    		<img src="https://img.icons8.com/nolan/64/000000/phone-disconnected.png" style="margin-top: 30px;">
            <h3 style="text-align: center;position: relative;top: 210px;">We Will Contact You Soon!</h3>
    	</div>
    	<div id="left" class="container-fluid">
    		
    		
    		    <div class="form-group">
    		    	<label>Name</label><input type="text" name="" class="form-control">
    		    </div>
    		     <div class="form-group">
    		    	<label>Mobile</label><input type="text" name="" class="form-control">
    		    </div>
    		     <div class="form-group">
    		    	<label>Email</label><input type="text" name="" class="form-control">
    		    </div>
    		     <div class="form-group">
    		    	<label>Address</label><input type="text" name="" class="form-control">
    		    </div>
    		     <div class="form-group">
    		    	<button class="btn btn-success">Submit</button>
    		    </div>
    	</div>
    	
    </div>
<!-- Modals for login and signup -->
<div class="modal fade" id="mymod">
    <form action="adminlogincheck.jsp">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title">Login Form</h1>
				</div>
				<div class="modal-body">
					
            	<div class="form-group">
            		<label>Username</label>
            		<input  type="text" name="user" placeholder="Username" class="form-control">
            	</div>
            	<div class="form-group">
            		<label>Password</label>
            		<input type="Password" name="pass" placeholder="Password" class="form-control">
            	</div>
            	<div class="form-group">
            		
            		<button class="btn btn-primary" type="submit">Submit</button>

					<button class="btn btn-warning" data-dismiss="modal">Close</button>
            	
            	</div>
				</div>
				
				</div>
			</div>
    </form>
		</div>
   
</body>
</html>
</html>
