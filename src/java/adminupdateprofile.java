/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import onlineexamin.DBCon;

/**
 *
 * @author Harsh Archit
 */
public class adminupdateprofile extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String[] value=new String[5];
           String pathToSavePhoto=getServletContext().getRealPath("/images/");
           String fileName=null;
           File f=null;
           boolean fileUploaded=false;
           int i=0;
           long s=0;
            try{
           MultipartParser mps=new MultipartParser(request,5*1024*1024) ;
           Part part;
           while((part=mps.readNextPart())!=null){
               String name=part.getName();
               if(part.isParam())
               {
                   ParamPart pp=(ParamPart)part;
                   value[i]=pp.getStringValue();
                   i++;
               }
               else if(part.isFile())
               {
                   FilePart filePart=(FilePart)part;
                   fileName=filePart.getFileName();
                   f=new File(pathToSavePhoto);
                   if(fileName!=null)
                       s=filePart.writeTo(f);
               }
           }
        }catch(Exception e)
        {
        e.printStackTrace();
        }
           
       
            DBCon db=new DBCon();
            
            db.pstmt=db.con.prepareStatement("update admindetails set name='"+value[1]+"',email='"+value[2]+"',mobile='"+value[3]+"',photo='"+fileName+"' where username='"+value[0]+"'");
            int j=db.pstmt.executeUpdate();
            
            if(j>0)
            {
              response.sendRedirect("admindashboard.jsp?msg=Successfully Updated");
              
               
               
            }
            else{
               response.sendRedirect("admindashboard.jsp?msg=Error");
        
        }
        }    
        catch(Exception e)
        {
            e.printStackTrace();
        }
        }
}
