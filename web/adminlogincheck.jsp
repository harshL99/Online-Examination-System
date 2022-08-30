<%-- 
    Document   : adminlogincheck
    Created on : Sep 10, 2019, 8:53:07 PM
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
            String user=request.getParameter("user");
            String pass=request.getParameter("pass");
            session.setAttribute("user", user);
            
            String password="";
            DBCon db=new DBCon();
            db.pstmt=db.con.prepareStatement("select password from admindetails where username='"+user+"'");
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
            {
              password=db.rst.getString(1);
            }
            if(password.equals(pass))
            {
                response.sendRedirect("admindashboard.jsp?msg=Successfully LoggedIn");
            }
            else
                response.sendRedirect("onlineexam.jsp?msg=Wrong Details");
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            %>
    </body>
</html>
