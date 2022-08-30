<%-- 
    Document   : userlogincheck
    Created on : Sep 23, 2019, 8:21:29 PM
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
                String email=request.getParameter("email");
                String pass=request.getParameter("pass");
                session.setAttribute("email",email);
                String cpass="";
               DBCon db=new DBCon();
               db.pstmt=db.con.prepareStatement("select Password from userdetails where Email='"+email+"'");
               db.rst=db.pstmt.executeQuery();
               if(db.rst.next())
               {
                  cpass=db.rst.getString(1);
                  if(cpass.equals(pass))
                      response.sendRedirect("userdashboard.jsp?msg=Successfully Logged In");
                  else
                       response.sendRedirect("onlineexam2.jsp?msg=Failure");
               }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            %>
    </body>
</html>
