<%-- 
    Document   : admindashboard
    Created on : Sep 10, 2019, 8:20:43 PM
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
  
  </style>
</head>
<body>
    <%
        try{
            int i=0;
        String user=(String)session.getAttribute("user");
        DBCon db=new DBCon();
        db.pstmt=db.con.prepareStatement("select * from admindetails where username='"+user+"'");
        db.rst=db.pstmt.executeQuery();
       
        %>
<ul class="nav">
	<img src="images\student.png" width="200px" height="200px" style="margin-left:40px;">
  <li><a class="active" data-toggle="tab" href="#home" style="margin-top: 50px;">Home</a></li>
  <li><a data-toggle="tab" href="#menu1">Add Questions</a></li>
  <li><a data-toggle="tab" href="#menu2">Update Profile</a></li>
  <li><a data-toggle="tab" href="#menu3">View Users</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active" style="background:linear-gradient(to bottom,lightgreen,white);">
    <h1 style="text-align: center;"><br><u>Profile</u></h3>
    <form>
        <%
            if(db.rst.next())
            {
                String name=db.rst.getString(3).toUpperCase();
                
        %>
        <br><img id="img" src='images/<%=db.rst.getString(6)%>' style="margin-left:450px;width: 150px;height: 150px;border-radius: 100px;">
        
        <table style="margin: auto;" id="table">
            <tr><td id="td"><label style="color:dodgerblue;">Name:</label></td>
                <td id="td"><input type="text" name="" value="<%=name%>" readonly=""></td></tr>
            <tr><td id="td"><label style="color:dodgerblue;">Email:</label></td>
                <td id="td"><input type="Email" name="" value="<%=db.rst.getString(4)%>" readonly=""></td></tr>
            <tr><td id="td"><label style="color:dodgerblue;">Mobile:</label></td>
                <td id="td"><input type="number" name="" value="<%=db.rst.getString(5)%>" readonly=""></td></tr>
    	</table>
        <%
            }
            %>
    </form>
  </div>
            <%
                db.pstmt=db.con.prepareStatement("select MAX(quesno) from questions");
                db.rst=db.pstmt.executeQuery();
                if(db.rst.next())
                {
                 i=db.rst.getInt(1);
                i=i+1;
                
                %>
  <div id="menu1" class="tab-pane fade" style="background:linear-gradient(to bottom,lightgreen,white);">
    <h1 style="text-align: center;"><br><u>Add Questions</u></h3>
    <fieldset style="width: 50%;height: 320px;border:1px solid;background-color: white;margin: auto;margin-top: 20px;border-radius: 20px;">
    	<legend class="badge badge badge-pill"><%=i%></legend>
        
           <form action="insertquestions.jsp"><input type="hidden" name="quesno" value="<%=i%>">
            <table style="margin:auto;" id="table2">
                <tr><td><label>Question:</label></td><td><input required="" type="text" name="ques"></td></tr>
                <tr><td><label>Option1:</label></td><td><input required="" type="text" name="op1"></td></tr>
                <tr><td><label>Option2:</label></td><td><input required="" type="text" name="op2"></td></tr>
                <tr><td><label>Option3:</label></td><td><input required="" type="text" name="op3"></td></tr>
                <tr><td><label>Option4:</label></td><td><input required="" type="text" name="op4"></td></tr>
                <tr><td><label>Right Ans:</label></td><td><select required="" name="rightop"><option>--Choose--</option><option>a</option><option>b</option><option>c</option><option>d</option></select></td></tr>
                <tr><td colspan="2" align="center" style="padding-top:25px;"><button class="btn btn-success" type="submit">Submit</button></td></tr>
            </table>
        </form>
    </fieldset>
    <%
            }
            %>
    <div class="container-fluid">
        <table class="table table-bordered" style="background-color:white;margin-top: 100px;" id="table3">
            <tr><th>Quesno</th><th>Question</th><th>Op1</th><th>Op2</th><th>Op3</th><th>Op4</th><th>RightOp</th><th colspan="2">Action</th></tr>
            <%
                db.pstmt=db.con.prepareStatement("select * from questions");
                db.rst=db.pstmt.executeQuery();
                while(db.rst.next())
                {
                %>
            <form action="updatequestions.jsp"><input type="hidden" value="<%=db.rst.getString(1)%>" name="questionno">
            <tr><td><%=db.rst.getString(1)%></td><td><%=db.rst.getString(2)%></td><td><%=db.rst.getString(3)%></td>
            <td><%=db.rst.getString(4)%></td><td><%=db.rst.getString(5)%></td><td><%=db.rst.getString(6)%></td>
            <td><%=db.rst.getString(7)%></td><td><button class="btn btn-success btn-sm">Update</button></td></form><form action="deletequestions.jsp"><input type="hidden" value="<%=db.rst.getString(1)%>" name="questionno"><td><button name="delete" value="delete" type="submit" class="btn btn-warning btn-sm">Delete</button></td></form></tr>
                <%
                    }
                    %>
        </table>
    </div>
  </div>
  <div id="menu2" class="tab-pane fade" style="background:linear-gradient(to bottom,lightgreen,white);">
      <%
          db.pstmt=db.con.prepareStatement("select * from admindetails");
          db.rst=db.pstmt.executeQuery();
          %>
          <%
            if(db.rst.next())
            {
                String name=db.rst.getString(3).toUpperCase();
                
        %>
        <form action="adminupdateprofile" method="post" enctype="multipart/form-data"><input type="hidden" value="<%=db.rst.getString(1)%>" name="id">
      <h1 style="text-align: center;position: relative;top:50px;"><u>Update Profile</u></h1>
      
      
        
        
        
        <table style="margin:100px auto;">
            <tr><td id="tdd"><label style="color:dodgerblue;">Name:</label></td>
                <td id="tdd"><input type="text" name="name" value="<%=name%>"></td></tr>
            <tr><td id="tdd"><label style="color:dodgerblue;">New Image:</label></td>
                <td id="tdd" style="position:relative;top:180px;"><input type="file" name="pic"></td></tr>
            <tr><td id="tdd"><label style="color:dodgerblue;">Email:</label></td>
                <td id="tdd"><input type="email" name="email" value="<%=db.rst.getString(4)%>"></td></tr>
            <tr><td id="tdd"><label style="color:dodgerblue;">Mobile:</label></td>
                <td id="tdd"><input type="number" name="mobile" value="<%=db.rst.getString(5)%>"></td></tr>
            
            <tr><td id="tdd" colspan="2" align="center"><button type="submit" class="btn btn-success">Update</button></td></tr>
    	</table>
            
        <%
            }
            %>
    </form>
  </div>
</div>
</body>
</html>
<%
    }
catch(Exception e)
{
e.printStackTrace();
}
    %>
