<%-- 
    Document   : updatequestions
    Created on : Sep 21, 2019, 11:16:27 AM
    Author     : Harsh Archit
--%>

<%@page import="onlineexamin.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                margin: 0;
                padding: 0;
            }
            div{
                display: flex;justify-content: center;align-items: center;
            }
            h1{
              position: absolute;
              margin:100px 550px;
            }
        </style>
    </head>
    <%
        String q=request.getParameter("questionno");
        try{
        
        DBCon db=new DBCon();
        db.pstmt=db.con.prepareStatement("select * from questions where quesno='"+q+"'");
        db.rst=db.pstmt.executeQuery();
        if(db.rst.next())
        {
        %>
    <body>
        <h1><u>Updation Panel</u></h1>
        <div style="width: 100%;height: 100vh;background-color: lightgrey;">
        <div style="width: 500px;height: 300px;border:1px solid;border-radius: 20px;box-shadow: 0px 20px 20px black;background-color: linen;">
            <form action="questionsupdate2.jsp"><input type="hidden" value="<%=q%>" name="qno">
                <table>
                    <tr><td><label>Question</label></td><td><input required="" name="question" type="text" value="<%=db.rst.getString(2)%>"></td></tr>
                    <tr><td><label>Op1</label></td><td><input required="" name="op1" type="text" value="<%=db.rst.getString(3)%>"></td></tr>
                    <tr><td><label>Op2</label></td><td><input required="" name="op2" type="text" value="<%=db.rst.getString(4)%>"></td></tr>
                    <tr><td><label>Op3</label></td><td><input required="" name="op3" type="text" value="<%=db.rst.getString(5)%>"></td></tr>
                    <tr><td><label>Op4</label></td><td><input required="" name="op4" type="text" value="<%=db.rst.getString(6)%>"></td></tr>
                    <tr><td><label>RightOp</label></td><td><input required="" name="rightop" type="text" value="<%=db.rst.getString(7)%>"></td></tr>
                    <tr><td colspan="2" align="center" style="padding-top: 20px;"><button type="submit" name="update" value="update">Update</button></td></tr>
                </table>
            </form>
        </div>
        </div>
        <%
            }

}
catch(Exception e)
{
e.printStackTrace();
}
            %>
    </body>
</html>
