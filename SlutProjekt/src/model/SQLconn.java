package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class SQLconn {
	
	static Connection conn = null;
	static PreparedStatement stmt = null;
	static ResultSet rs = null;
	
	public static boolean connectSQL(String database) { //behöver ta emot en sträng som param till conn login/post
		try {
			//driver setup
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("hittar en connection");
			
		}catch(Exception e) {
			System.out.println("Exception Driver: " + e);
			return false;
		}
		
		try {
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + database + "?serverTimezone=UTC",
				   DatabaseLogin.getuserName(), DatabaseLogin.getuserPass());
			//System.out.println("test 2");
			return true;
			
		}catch(SQLException e) {
			// handle errors
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
			return false;
		}
	}
	
	public static boolean stateSQL(UserBean bean) {
		
		// get post
		try {
			//System.out.println("test 3");
			String requestQuery = "SELECT `FirstName`, `LastName` FROM `users` WHERE `UserName`=? AND `UserPass`=?";
			
			stmt = conn.prepareStatement(requestQuery);

			stmt.setString(1, bean.getUserName()); //för första frågetecknet 
			stmt.setString(2, bean.getPassword()); //för andra frågetecknet

			rs = stmt.executeQuery();
			
			boolean loginState = false;
			
			while (rs.next()) {

				/*
				System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3) +
						"  " + rs.getString(4) + "  " + rs.getString(5));
						*/

				bean.setFirstName(rs.getString("FirstName"));
				bean.setLastName(rs.getString("LastName"));
				loginState = true;
				

			}
			conn.endRequest();
			conn.close();
			return loginState;
			

		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());

		}
		return false;
		
	}
	
	public static ArrayList <PostContent> getPostSQL() {
		
		ArrayList <PostContent> postList = new ArrayList<PostContent>();
		// get posts from DB
		try {
			//I use all of them since i order by the postId hence the SELECT*
			String requestQuery = "SELECT * FROM `createdpost` WHERE 1 ORDER BY `PostID` DESC";
			
			stmt = conn.prepareStatement(requestQuery);

			rs = stmt.executeQuery();
			
			while (rs.next()) {

				/* test prints
				System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3) +
						"  " + rs.getString(4) + "  " + rs.getDate(5));
						*/
				
				//create post objects an add to postList (2=Name, 3=content, 4=tag, 5=Date )
				postList.add(new PostContent(rs.getString(3), rs.getString(4), rs.getString(2), rs.getString(5)));

			}
			conn.endRequest();
			conn.close();
			
			

		} catch (SQLException ex) {
			
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());

		}
		return postList;
		
	}
	
	//return boolean if new post success and forward back to login
	public static void insertPostSQL(String content, String tags, String userName) {
		
		//get current date
		LocalDate date = LocalDate.now();
		Date formatedDate = Date.valueOf(date);
		
		try {
			
			System.out.println("i am in insertSQL method");
			String requestQuery = "INSERT INTO `createdpost`(`Writer`, `Content`, `Tag`, `DateCreated`) VALUES (?, ?, ?, ?)";
			
			stmt = conn.prepareStatement(requestQuery); 
		
			stmt.setString(1, userName);
			stmt.setString(2, content);
			stmt.setString(3, tags);
			stmt.setDate(4, formatedDate);
			
			//update feed with new post
			stmt.executeUpdate();
			
			stmt.close();
	        conn.close();
	         
	        System.out.println("database updated with new post");
			

		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());

		}
		
		
	}
	
	

	
}
