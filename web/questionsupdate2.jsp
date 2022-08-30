<%-- 
    Document   : questionsupdate2.
    Created on : Sep 22, 2019, 12:13:42 PM
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
                String q=request.getParameter("qno");
            DBCon db=new DBCon();
        db.pstmt=db.con.prepareStatement("update questions set question='"+request.getParameter("question")+"',"
+ "op1='"+request.getParameter("op1")+"',op2='"+request.getParameter("op2")+"',op3='"+request.getParameter("op3")+"',"
+ "op4='"+request.getParameter("op4")+"',rightop='"+request.getParameter("rightop")+"' where quesno='"+q+"'");

int i=db.pstmt.executeUpdate();
if(i>0)
{
response.sendRedirect("admindashboard.jsp?msg=Successfully Updated");
}
else
{
response.sendRedirect("admindashboard.jsp?msg=Error");
}
    }
            catch(Exception e)
    {
        e.printStackTrace();
}
%>
    </body>
</html>
