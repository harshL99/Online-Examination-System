<%-- 
    Document   : questionsinput2
    Created on : Sep 28, 2019, 11:34:14 AM
    Author     : Harsh Archit
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
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
                ArrayList<String> arr=new ArrayList<String>();
                SimpleDateFormat formatter=new SimpleDateFormat("HH:mm");
                Date date=new Date();
                String Timeout=formatter.format(date);
                String Timein=(String)session.getAttribute("Timein");
                String email=(String)session.getAttribute("email");
                int i;
                DBCon db=new DBCon();
           int score=0,count=0;
            i=Integer.parseInt(request.getParameter("id"));
           
           db.pstmt=db.con.prepareStatement("select rightop from questions");
           db.rst=db.pstmt.executeQuery();
           
           while(db.rst.next())
           {
               arr.add(db.rst.getString(1));
           }
           for(int j=0;j<arr.size();j++)
           {
               if(arr.get(j).equals(request.getParameter("option"+(j+1))))
                   score+=10;
               if(request.getParameter("option"+(j+1))!=null)
                   count++;
           }
           db.pstmt=db.con.prepareStatement("insert into testdetails(Email,ExamName,Attempted,TimeIn,TimeOut,Date,MaxScore,Score) values('"+email+"','SSC','"+count+"','"+Timein+"','"+Timeout+"','"+java.time.LocalDate.now()+"','100','"+score+"')");
           int k=db.pstmt.executeUpdate();
           if(k>0)
               response.sendRedirect("Resultpanel.jsp");
               
           else
               response.sendRedirect("onlineexam2.jsp?Error");
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            %>
    </body>
</html>
