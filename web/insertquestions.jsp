<%-- 
    Document   : insertquestions
    Created on : Sep 12, 2019, 6:41:22 PM
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
                 DBCon db=new DBCon();
                 String ques=request.getParameter("ques");
                 db.pstmt=db.con.prepareStatement("select question from questions where question='"+ques+"'");
                 db.rst=db.pstmt.executeQuery();
                 
                 if(db.rst.next())
                 {
                   String questions=db.rst.getString(1);
                  
                       response.sendRedirect("admindashboard.jsp?msg=Questions matching");
                  %>
                  
                  <%
                    }  
                  else
{
                String quesno=request.getParameter("quesno");
             
              String op1=request.getParameter("op1");
               String op2=request.getParameter("op2");
                String op3=request.getParameter("op3");
                 String op4=request.getParameter("op4");
                  String rightop=request.getParameter("rightop");
                  
                  if((op1.equals(op2))||(op1.equals(op3))||(op1.equals(op4))||(op2.equals(op3))||(op2.equals(op4))||(op3.equals(op4)))
{   response.sendRedirect("admindashboard.jsp?msg=Failure,Two or more options are matching");
}
else {

                  if((rightop.equals("choose")))
                  {
response.sendRedirect("admindashboard.jsp?msg=Choose right option"); 
        
}
else {
                      DBCon db1=new DBCon();
                      out.println("Error here");
            db1.pstmt=db1.con.prepareStatement("insert into questions values('"+quesno+"','"+ques+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"','"+rightop+"')");
            int i=db1.pstmt.executeUpdate();
            if(i>0)
                response.sendRedirect("admindashboard.jsp#menu1?msg=Successfully Added");
                      
            else
                response.sendRedirect("admindashboard.jsp?msg=Error");
                      
                  }
                 
                   
}
}}
            catch(Exception e)
            {
                e.printStackTrace();
            }
            %>
    </body>
</html>
