<%-- 
    Document   : questionsinput
    Created on : Sep 28, 2019, 11:17:47 AM
    Author     : Harsh Archit
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
  <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Text&display=swap" rel="stylesheet"> <link href="https://fonts.googleapis.com/css?family=EB+Garamond&display=swap" rel="stylesheet">      
  <style>
            #inp1,#inp2{
                width: 45%;
                
            }
            #divv input{
                border:none;
                color:dodgerblue;
            }
            #divv table{
                margin-top: 20px;
            }
            #divv table td{
                padding-left: 10px;
            }
        </style>
    </head>
    <body style="background-color:lightgrey;">
         <script>
            var mins=1;var secs=0;
            var i=setInterval(play,1000);
            function play()
            {
                if(secs==0&&mins!=0)
                {
                    mins--;
                    secs=60;
                }
                if(mins==0&&secs==9)
                {
                    document.getElementById("inp1").style.color="red";
                    document.getElementById("inp2").style.color="red";
                }
               if(mins==0&&secs==0)
                {
                    clearInterval(i);
                    var button=document.getElementById("sub");
                    button.form.submit();
                }
            
                else
                {
                    secs--;
                   document.getElementById("inp1").value=mins;
                   if(secs>=10)
                   {
                   document.getElementById("inp2").value=secs;
               }
               else
                   document.getElementById("inp2").value="0"+secs;
               }
            }
             
        </script>
        <h1 style="color:red;text-align: center;margin-top: 20px;font-family: 'Big Shoulders Text', cursive;"><u>SSC MCQ</u></h1>
        <h2 style="color:red;margin:-50px 1200px;font-family: 'Big Shoulders Text', cursive;">Marks:<mark>100</mark></h2>
        <div style="margin:100px 1200px;width: 100px;height: 100px;font-family: 'Big Shoulders Text', cursive;">
            <input id="inp1" type="text" style="float:left;color:blue;text-align: center;font-size:18px;">
            <input id="inp2" type="text" style="color:blue;text-align: center;font-size:18px;">
            
        </div>
        <%
            try{
                SimpleDateFormat formatter=new SimpleDateFormat("HH:mm");
                Date date=new Date();
                session.setAttribute("Timein",formatter.format(date));
                int i=0;
            DBCon db=new DBCon();
            db.pstmt=db.con.prepareStatement("select COUNT(*) from questions");
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
            {
                 i=db.rst.getInt(1);
            }
            db.pstmt=db.con.prepareStatement("select * from questions");
            db.rst=db.pstmt.executeQuery();%>
            <form action="questionsinput2.jsp"><input type="hidden" value="<%=i%>" name="id"> 
                <div id="divv" style="width:800px;min-height: 2000px;margin:-100px auto;background-color:white;border-radius:20px;"><br>
               <% 
                for(int j=1;j<=i;j++)
            {
                if(db.rst.next())
                {
                    %>
                    
                    <div style="width: 500px;height: 200px;margin-left: 50px;font-family: 'EB Garamond', serif;font-size:18px;">
                <label>Ques.<%=db.rst.getString(1)%>&nbsp;<%=db.rst.getString(2)%></label>
                <table>
                    <tr>
                        <td><input type="radio" name="option<%=j%>" value="a"></td>
                        <td><input type="text" value="<%=db.rst.getString(3)%>"></td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="option<%=j%>" value="b"></td>
                        <td><input type="text" value="<%=db.rst.getString(4)%>"></td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="option<%=j%>" value="c"></td>
                        <td><input type="text" value="<%=db.rst.getString(5)%>"></td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="option<%=j%>" value="d"></td>
                        <td><input type="text" value="<%=db.rst.getString(6)%>"></td>
                    </tr>
                    
                </table>
            </div><hr>
            <%
                }
}
            %>
            <button id="sub" type="submit" class="btn btn-success" style="margin-left: 350px;font-family: 'EB Garamond', serif;">Submit</button>
                </div>
            </form>
            <%
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            %>
        
    </body>
</html>
