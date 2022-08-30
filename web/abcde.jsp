<%-- 
    Document   : abcde
    Created on : Oct 2, 2019, 8:41:12 PM
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
    <body onload="play()">
        <script>
            function play()
            {
                document.forms["btn"].submit();
            }
        </script>  
        <%
            String op="";
             int id=(int)session.getAttribute("id");
             out.println(id);
            String count=request.getParameter("count");
            if(request.getParameter("op1")!=null)
               op=request.getParameter("op1");
            if(request.getParameter("op2")!=null)
               op=request.getParameter("op2");
            if(request.getParameter("op3")!=null)
               op=request.getParameter("op3");
            if(request.getParameter("op4")!=null)
               op=request.getParameter("op4");
             out.println(op);
            int c=Integer.parseInt(count)+1;
            
            %>
            <form action="abcd.jsp" id="btn" name="btn">
                <input type="hidden" value="<%=c%>" name="count">
                
            </form>
                <%
                    try{
                        int score=0,att=0;
                        String rightop="";
                  DBCon db=new DBCon();
                  
                  db.pstmt=db.con.prepareStatement("select rightop from questions where quesno='"+request.getParameter("count")+"'");
                  db.rst=db.pstmt.executeQuery();
                  if(db.rst.next())
                  {
                      rightop=db.rst.getString(1);
                      if(rightop.equals(op))
                      {
                          db.pstmt=db.con.prepareStatement("select Score from test where ID='"+id+"'");
                          db.rst=db.pstmt.executeQuery();
                          if(db.rst.next())
                          {
                          score=db.rst.getInt(1);
                          
                          }
                          score++;
                          db.pstmt=db.con.prepareStatement("update test set Score='"+score+"' where ID='"+id+"'");
                          db.pstmt.executeUpdate();
                      }
                      if(op!="")
                      {
                          db.pstmt=db.con.prepareStatement("select Attempted from test where ID='"+id+"'");
                          db.rst=db.pstmt.executeQuery();
                          if(db.rst.next())
                          {
                          att=db.rst.getInt(1);
                          }
                          att++;
                          db.pstmt=db.con.prepareStatement("update test set Attempted='"+att+"' where ID='"+id+"'");
                          db.pstmt.executeUpdate();
                      }
                  }
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                    %>
    </body>
</html>
