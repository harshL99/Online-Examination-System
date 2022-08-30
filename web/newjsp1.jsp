<%-- 
    Document   : newjsp1
    Created on : Oct 23, 2019, 6:53:19 PM
    Author     : Harsh Archit
--%>

<%@page import="onlineexamin.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Jomolhari&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Orbitron&display=swap" rel="stylesheet">
    </head>
    <body>
        <script>
            var mins=10;var secs=0;
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
                    if(mins>=10)
                    {
                   document.getElementById("inp1").value=mins;
               }
               else
                   document.getElementById("inp1").value="0"+mins;
                   if(secs>=10)
                   {
                   document.getElementById("inp2").value=secs;
               }
               else
                   document.getElementById("inp2").value="0"+secs;
               }
            }
        </script>
        <div class="container"><form action="newjsp2.jsp">
                <div style="position: relative;top:-20px;left:20px;"><h3 style="color:red;float:left;">MM:</h3><h3 style="color:blue;float:left;">100</h3></div>
                <h2 style="font-family: 'Jomolhari', serif;text-align: center;"><u>SSC EXAM</u></h2>
                <div style="float:right;margin-top: -40px;"><input id="inp1" type="text" style="font-family: 'Orbitron', sans-serif;float:left;color:blue;text-align: center;font-size:18px;width: 50px;border:none;border-right:1px solid red;">
                <input id="inp2" type="text" style="color:blue;text-align: center;font-size:18px;width: 50px;font-family: 'Orbitron', sans-serif;border:none;border-left:1px solid red;"></div>
                
                <br><br>
  

  <ul class="nav nav-pills">
      <%
          int k=0;
          DBCon db=new DBCon();
          db.pstmt=db.con.prepareStatement("select MAX(quesno) from questions");
          db.rst=db.pstmt.executeQuery();
          if(db.rst.next())
             k=db.rst.getInt(1);
         
          for(int i=1;i<=k;i++)
          {
              if(i==1)
              {
          %>
          <li class="active"><a data-toggle="tab" href="#home1">1</a></li>
          <%
              }
else
{
              %>
    <li><a data-toggle="tab" href="#home<%=i%>"><%=i%></a></li>  
    
    <%
        }
        }
        %>
        <li style="float:right;"><button type="submit" class="btn btn-success" id="sub">Submit</button></li>
    
  </ul><hr>
  <div class="tab-content" style="font-family: 'Merriweather', serif;">
  <%
      int j=0;
      db.pstmt=db.con.prepareStatement("select * from questions");
      db.rst=db.pstmt.executeQuery();
      while(db.rst.next())
      {
          j++;
          if(j==1)
          {
      %>
       <div id="home<%=db.rst.getInt(1)%>" class="tab-pane fade in active" style="margin:50px auto;width: 500px;height: 300px;font-size: 18px;">
        <table style="width:450px;height: 300px;">
          <tr><td align="center"><label>Q.<%=db.rst.getString(1)%></label></td><td><label style="box-sizing: border-box"><%=db.rst.getString(2)%></label></td></tr>
          <tr><td align="center"><input type="radio" value="a" name="home<%=j%>"></td><td><label><%=db.rst.getString(3)%></label></td></tr>
          <tr><td align="center"><input type="radio" value="b" name="home<%=j%>"></td><td><label><%=db.rst.getString(4)%></label></td></tr>
          <tr><td align="center"><input type="radio" value="c" name="home<%=j%>"></td><td><label><%=db.rst.getString(5)%></label></td></tr>
          <tr><td align="center"><input type="radio" value="d" name="home<%=j%>"></td><td><label><%=db.rst.getString(6)%></label></td></tr>
          <tr><td align="center"><button type="button" data-toggle="tab" data-target="#home<%=j-1%>" class="btn btn-danger">Back</button></td><td align="right"><button type="button" data-toggle="tab" data-target="#home<%=j+1%>" class="btn btn-primary" onclick="check()">Save & Next</button></td></tr>
        </table>
    </div>
          <%
              }
else
{
              %>
    <div id="home<%=db.rst.getInt(1)%>" class="tab-pane fade" style="margin:50px auto;width: 500px;height: 300px;font-size: 18px;">
        <table style="width:450px;height: 300px;">
          <tr><td align="center"><label>Q.<%=db.rst.getString(1)%></label></td><td><label style="box-sizing: border-box"><%=db.rst.getString(2)%></label></td></tr>
          <tr><td align="center"><input type="radio" value="a" name="home<%=j%>"></td><td><label><%=db.rst.getString(3)%></label></td></tr>
          <tr><td align="center"><input type="radio" value="b" name="home<%=j%>"></td><td><label><%=db.rst.getString(4)%></label></td></tr>
          <tr><td align="center"><input type="radio" value="c" name="home<%=j%>"></td><td><label><%=db.rst.getString(5)%></label></td></tr>
          <tr><td align="center"><input type="radio" value="d" name="home<%=j%>"></td><td><label><%=db.rst.getString(6)%></label></td></tr>
          <tr><td align="center"><button type="button" data-toggle="tab" data-target="#home<%=j-1%>" class="btn btn-danger">Back</button></td><td align="right"><button type="button" data-toggle="tab" data-target="#home<%=j+1%>" class="btn btn-primary">Save & Next</button></td></tr>
        </table>
    </div>
        <%
            }
            }
            %>
  </div>
            </form>
</div>

    </body>
</html>
