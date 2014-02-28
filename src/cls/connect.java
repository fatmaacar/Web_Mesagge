package cls;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

public class connect 
{

	   static final String DB_URL = "jdbc:mysql://sql3.freesqldatabase.com/sql331412";

	   static final String USER = "sql331412";
	   static final String PASS = "cZ7%uM6!";
	   
	   
	   public String[] mesajGetir()
	   {
		   String[] dizi = new String[500];
		   int sayac = 0;
		   
		   Connection conn = null;
		   Statement stmt = null;
		   try{
		      Class.forName("com.mysql.jdbc.Driver");

		      conn = DriverManager.getConnection(DB_URL,USER,PASS);

		      stmt = (Statement) conn.createStatement();
		      
		      String sql;
		      sql = "SELECT ad,mesaj FROM kullanici ORDER BY id DESC";
		      
		      ResultSet rs = (ResultSet) stmt.executeQuery(sql);

		      while(rs.next())
		      {
		         
		         String ad = rs.getString("ad");
		         String mesaj = rs.getString("mesaj");

		         dizi[sayac] = 		ad;
		         dizi[sayac + 1] = 	mesaj;
		         
		         sayac+=2;
		         
		         System.out.println(", First: " + ad);
		        
		      }

		      rs.close();
		      stmt.close();
		      conn.close();
		   }catch(SQLException se){

		      se.printStackTrace();
		   }catch(Exception e){

		      e.printStackTrace();
		   }finally{

		      try{
		         if(stmt!=null)
		            stmt.close();
		      }catch(SQLException se2){
		      }
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }
		   }

		   
		   return dizi;
	   }

	   
	   public void mesajEkle(String ad, String mesaj)
	   {
		   
		   Connection conn = null;
		   Statement stmt = null;
		   try{
		      System.out.println("STEP 2: Register JDBC driver");
		      Class.forName("com.mysql.jdbc.Driver");

		      
		      System.out.println("Connecting to a selected database...");
		      conn = DriverManager.getConnection(DB_URL, USER, PASS);
		      System.out.println("Connected database successfully...");
		      
		      //STEP 4: Execute a querySystem.out.println("STEP 2: Register JDBC driver");
		      System.out.println("Inserting records into the table...");
		      stmt = (Statement) conn.createStatement();
		      
		      String sql = "INSERT INTO kullanici (ad,mesaj) VALUES ('"+ad+"', '"+mesaj+"')";
		                   
		      stmt.executeUpdate(sql);
		      System.out.println("Inserted records into the table...");

		   }catch(SQLException se){
		      //Handle errors for JDBC
			   System.out.println("1");
		      se.printStackTrace();
		   }catch(Exception e){
			   System.out.println("2");
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(stmt!=null)
		            conn.close();
		      }catch(SQLException se){
		      }// do nothing
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try
		   System.out.println("Goodbye!");
		   

		   
	   }
	   
	   public void yaz()
	   {
		   
		   System.out.println("1");
	   }
	
}
