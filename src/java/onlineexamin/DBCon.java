/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onlineexamin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Harsh Archit
 */
public class DBCon {
     public ResultSet rst;
    public Connection con;
    public PreparedStatement pstmt;
 public DBCon()
  {
      try
      {
          Class.forName("com.mysql.jdbc.Driver");
          
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","669696"); 
                
         
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
  }
}


