<%-- 
    Document   : Resultpanel
    Created on : Sep 27, 2019, 7:20:07 PM
    Author     : Harsh Archit
--%>

<%@page import="onlineexamin.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table input
            {
                width: 132px;
                text-align: center;
            }
            table tr{
                text-align: center;
                
            }
            table tr label{
                color:red;
                text-decoration: underline;
            }
            table tr input{
                color: dodgerblue;
                border:none;
                outline: none;
            }
            
        </style>
    </head>
    <body>
        <%
            try{
                String email=(String)session.getAttribute("email");
                DBCon db=new DBCon();
                db.pstmt=db.con.prepareStatement("select * from testdetails where Email='"+email+"' and Date='"+java.time.LocalDate.now()+"' and ExamName='SSC' Order By ID Desc");
                db.rst=db.pstmt.executeQuery();
                if(db.rst.next())
                {
        %>
        <div style="background: linear-gradient(to top left, #66ccff 0%, #ffffff 100%);width: 100%;height: 100vh;">
        <div class="container">
            <h1 style="text-align:center;color: red;"><u>RECENT RESULT</u></h1>
        <div style="width: 100%;height: 200px;border:1px solid;border-radius: 20px;background-color: white;">
            <table class="tbl tbl-bordered" style="margin-top:50px;">
                <tr>
                    <td><label>Email</label></td>
                    <td><label>ExamName</label></td>
                    <td><label>Attempted</label></td>
                    <td><label>TimeIn</label></td>
                    <td><label>TimeOut</label></td>
                    <td><label>Date</label></td>
                    <td><label>MaxScore</label></td>
                    <td><label>Score</label></td>
                </tr>
                
                <tr>
                    <td><input type="text" value="<%=db.rst.getString(2)%>" style="width: 200px;" readonly=""></td>
                    <td><input type="text" value="<%=db.rst.getString(3)%>" readonly=""></td>
               
                
                    
                    <td><input type="text" value="<%=db.rst.getString(4)%>" readonly=""></td>
                
                    
                    <td><input type="text" value="<%=db.rst.getString(5)%>" readonly=""></td>
                
                
                    
                    <td><input type="text" value="<%=db.rst.getString(6)%>" readonly=""></td>
                
                
                    
                    <td><input type="text" value="<%=db.rst.getString(7)%>" readonly=""></td>
                
                
                    
                    <td><input type="text" value="<%=db.rst.getString(8)%>" readonly=""></td>
                
                
                    
                    <td><input type="text" value="<%=db.rst.getString(9)%>" readonly=""></td>
                </tr>
            </table>
        </div>
        </div>
        </div>
          <%          
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            %>
    </body>
</html>
