<%-- 
    Document   : abcd
    Created on : Sep 30, 2019, 7:08:16 PM
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
            input{
                border:none;
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <%
            try{
            int i=Integer.parseInt(request.getParameter("count"));
          
            %>
        <form action="abcde.jsp">
            <input type="hidden" name="count" value="<%=i%>">
            
        
            <%
                
                DBCon db=new DBCon();
                db.pstmt=db.con.prepareStatement("select * from questions where quesno='"+request.getParameter("count")+"'");
                db.rst=db.pstmt.executeQuery();
                if(db.rst.next())
                {
                %>
                <div style="width: 500px;height: 200px;margin:100px auto;">
                    
                        <label>Ques.<%=db.rst.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;<%=db.rst.getString(2)%></label>
                        <table>
                            <tr><td><input type="radio" name="op<%=request.getParameter("count")%>" value="a"></td><td><input type="text" value="<%=db.rst.getString(3)%>"></td></tr>
                            <tr><td><input type="radio" name="op<%=request.getParameter("count")%>" value="b"></td><td><input type="text" value="<%=db.rst.getString(4)%>"></td></tr>
                            <tr><td><input type="radio" name="op<%=request.getParameter("count")%>" value="c"></td><td><input type="text" value="<%=db.rst.getString(5)%>"></td></tr>
                            <tr><td><input type="radio" name="op<%=request.getParameter("count")%>" value="d"></td><td><input type="text" value="<%=db.rst.getString(6)%>"></td></tr>
                            <tr><td colspan="2" align="left" style="padding-top:10px;"><button type="submit" class="btn btn-success">Next</button></td></tr>
                    </table>
                </div>
                <%
                    }

%>

</form>
<%}
catch(Exception e)
{
e.printStackTrace();
}
                    %>
    </body>
</html>
