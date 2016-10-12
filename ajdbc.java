import java.sql.*;
import java.util.*;
public class ajdbc
{
   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
   static final String DB_URL = "jdbc:mysql://localhost/ajdbc";
   //  Database credentials
   static final String USER = "system";
   static final String PASS = "tiger";

   public static boolean ajs(String uid)
   {
   Connection conn = null; Statement stmt = null;
   boolean atx = false;
   //Date date = new Date();
    try
   {
      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");
      //STEP 3: Open a connection
      System.out.println("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);
      //STEP 4: Execute a query
      System.out.println("Inserting records into the table...");
      stmt = conn.createStatement();
      String sql;
      sql = "INSERT INTO entry " +"VALUES('"+uid+"')";
      stmt.executeUpdate(sql);
      //STEP 6: Clean-up environment
      stmt.close();
      conn.close();
      atx = true;
   }
    catch(SQLException se){//Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }
   finally{
      //finally block used to close resources
      try{if(stmt!=null) stmt.close();}
      catch(SQLException se2){}// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
      return atx;
   }//end try
}//end main
}//end FirstExample
