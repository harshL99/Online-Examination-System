<%-- 
    Document   : deletequestions
    Created on : Sep 21, 2019, 12:53:47 PM
    Author     : Harsh Archit
--%>

<%@page import="onlineexamin.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                String questionno=request.getParameter("questionno");
              DBCon db=new DBCon();
              db.pstmt=db.con.prepareStatement("delete from questions where quesno='"+questionno+"'");
              int i=db.pstmt.executeUpdate();
              if(i>0)
              {
                  response.sendRedirect("admindashboard.jsp?msg=Successfully Deleted");
              }
              else
                  response.sendRedirect("admindashboard.jsp?msg=Error");
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            %>
    </body>
</html>
