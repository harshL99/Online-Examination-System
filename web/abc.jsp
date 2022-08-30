<%-- 
    Document   : abc
    Created on : Oct 1, 2019, 9:39:49 PM
    Author     : Harsh Archit
--%>

<%@page import="onlineexamin.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
    <%
        
        try{
            int id=0;
            DBCon db=new DBCon();
            db.pstmt=db.con.prepareStatement("select MAX(ID) from test");
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
            {
               id=db.rst.getInt(1);
               id++;
               db.pstmt=db.con.prepareStatement("insert into test(ID) values('"+id+"')");
               db.pstmt.executeUpdate();
               session.setAttribute("id", id);
               response.sendRedirect("abcd.jsp?count=1");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
</body>
</html>
