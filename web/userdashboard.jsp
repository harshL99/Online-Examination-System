<%-- 
    Document   : userdashboard
    Created on : Sep 24, 2019, 11:18:33 AM
    Author     : Harsh Archit
--%>

<%@page import="onlineexamin.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <style type="text/css">
      *{
          box-sizing: border-box !important;
      }
      .nav{
   	width: 300px;
   	height: 100%;
   	position: fixed;
   	background:linear-gradient(to top,lightgreen,white);
   }
   li a{
   	text-align: center;
   	font-size: 20px;
   	line-height: 35px;
   }
   .tab-content{
   	margin-left: 300px;
   	float: left;
   	width: 77.5%;
   	margin-top: -20px;
   	
   }
   #home,#menu1,#menu2{
   	width: 100%;
   	height: 130vh;

   }
   label{
   	font-size: 20px;
   }
   input,select{
   	border:none;
   	border-bottom: 2px solid;
   	background-color: transparent;
   	outline: none;
   	margin-top: -200px;
   	font-size: 18px;
        width: 290px;
   }
    #td{
   	padding: 20px;
   }
   #table{
   	margin-top: 50px !important;
        
        
   }
   #table2 td{
       padding-left: 20px;
       padding-top: 5px;
   }
   #table2 input{
       margin-bottom: 10px;
       
   }
   #table2 label{
       color: dodgerblue;
   }
   h1{
       color: dodgerblue;
   }
   #img:hover{
      border-radius: 30px !important; 
      transition: 2s;
   }
   #table3,th{
       text-align: center
   }
   #tdd{
       padding: 10px;
   }
   a:hover{
       color:green;
   }
   
  </style>
</head>
<body>
    <%
        try{
            
            int i=0;
        String user=(String)session.getAttribute("email");
        if(user!=null){
        DBCon db=new DBCon();
        db.pstmt=db.con.prepareStatement("select * from userdetails where Email='"+user+"'");
        db.rst=db.pstmt.executeQuery();
       
        %>
<ul class="nav">
	<img src="images\student.png" width="200px" height="200px" style="margin-left:40px;">
  <li><a class="active" data-toggle="tab" href="#home" style="margin-top: 50px;">Home</a></li>
  
      <div class="dropdown">
          <button class="btn btn-success btn-block dropdown-toggle" data-toggle="dropdown" style="font-size:18px;">Give Test<div class="caret" style="position:relative;left:10px;font-size: 18px !important;"></div></button>
          <div class="dropdown-menu" style="margin-left: 250px !important;background-color: dodgerblue;text-align: center;">
              <a href="#" class="dropdown-item" style="color:white;text-decoration: none;" data-toggle="modal" data-target="#mymod">SSC</a>
          </div>
      </div>
  </li>
  
  <li><a data-toggle="tab" href="#menu2">Update Profile</a></li>
  <li><a data-toggle="tab" href="#menu3">Previous Test Result</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active" style="background:linear-gradient(to bottom,lightgreen,white);">
    <h1 style="text-align: center;"><br><u>Profile</u></h3>
    <form>
        <%
            if(db.rst.next())
            {
                String name=db.rst.getString(2).toUpperCase();
                
        %>
        <br><img id="img" src='images/<%=db.rst.getString(5)%>' style="margin-left:450px;width: 150px;height: 150px;border-radius: 100px;">
        
        <table style="margin: auto;" id="table">
            <tr><td id="td"><label style="color:dodgerblue;">Name:</label></td>
                <td id="td"><input type="text" name="" value="<%=name%>" readonly=""></td></tr>
            <tr><td id="td"><label style="color:dodgerblue;">Email:</label></td>
                <td id="td"><input type="Email" name="" value="<%=db.rst.getString(3)%>" readonly=""></td></tr>
            <tr><td id="td"><label style="color:dodgerblue;">Mobile:</label></td>
                <td id="td"><input type="number" name="" value="<%=db.rst.getString(4)%>" readonly=""></td></tr>
    	</table>
        <%
            }
            %>
    </form>
  </div>
            
  <div id="menu1" class="tab-pane fade" style="background:linear-gradient(to bottom,lightgreen,white);">
    <h1 style="text-align: center;"><br><u>Add Questions</u></h1>
  </div>
  <div id="menu2" class="tab-pane fade" style="background:linear-gradient(to bottom,lightgreen,white);">
      <%
          db.pstmt=db.con.prepareStatement("select * from userdetails");
          db.rst=db.pstmt.executeQuery();
          %>
          <%
            if(db.rst.next())
            {
                String name=db.rst.getString(2).toUpperCase();
                
        %>
        <form action="userupdateprofile" method="post" enctype="multipart/form-data"><input type="hidden" value="<%=db.rst.getString(3)%>" name="id">
      <h1 style="text-align: center;position: relative;top:50px;"><u>Update Profile</u></h1>
      
      
        
        
        
        <table style="margin:100px auto;">
            <tr><td id="tdd"><label style="color:dodgerblue;">Name:</label></td>
                <td id="tdd"><input type="text" name="name" value="<%=name%>"></td></tr>
            <tr><td id="tdd"><label style="color:dodgerblue;">New Image:</label></td>
                <td id="tdd" style="position:relative;top:180px;"><input type="file" name="pic"></td></tr>
            
            <tr><td id="tdd"><label style="color:dodgerblue;">Mobile:</label></td>
                <td id="tdd"><input type="number" name="mobile" value="<%=db.rst.getString(4)%>"></td></tr>
            
            <tr><td id="tdd" colspan="2" align="center"><button type="submit" class="btn btn-success">Update</button></td></tr>
    	</table>
            
        <%
            }
            %>
    </form>
  </div>
</div>
    
    <div class="modal fade" id="mymod">
    <form action="questionsinput.jsp">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
                                    <h1 style="float:right;margin-top: -10px;color: black;"><a href="#" data-dismiss="modal" style="text-decoration:none;">&times;</a></h1><br>
                                    <h1 class="modal-title" style="color:red;text-align: center;"><u>Important Instructions</u></h1>
                                    
				</div>
				<div class="modal-body">
					
                                    <div class="container-fluid" style="color:blue;font-size: 18px;">
                                        <ol>
                                            <li>Knowledge is the key to success and so wisely read and understand the questions before attempting.</li>
                                            <li>Each Question will have 4 options and you need to choose one from the given 4 options.</li>
                                            <li>Question Paper is of Max <mark>100 Marks.</mark></li>
                                            <li>Every Question will contain <mark>1 Marks</mark> each.</li>
                                            <li>Questions with wrong answers will make your marks deduct so try not to give wrong answers.</li>
                                            <li>On Click of proceed your test will start with a timer of <mark>60 Minutes</mark>.</li>
                                        </ol>
                                        <button class="btn btn-success btn-block">Proceed</button>
                                    </div>
				</div>
				
				</div>
			</div>
    </form>
		</div>
    
</body>
</html>
<%
    }
else
response.sendRedirect("onlineexam2.jsp?msg=Please Log In to Continue...");
    }
catch(Exception e)
{
e.printStackTrace();
}
    %>
