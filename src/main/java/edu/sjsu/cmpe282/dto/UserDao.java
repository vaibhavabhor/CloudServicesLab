package edu.sjsu.cmpe282.dto;

import java.sql.*;

import edu.sjsu.cmpe282.domain.User;

public class UserDao {
		Connection conn = null;
	    Statement stmt = null;
	
	// Constructure with JDBC connection
	  public UserDao()
	  {
		   try{
		      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      conn = DriverManager.getConnection("mydbinstance.cizvqwfgh78q.us-west-1.rds.amazonaws.com:3306","applestore","applestore");
		   }
		   catch (SQLException e) {
					e.printStackTrace();
					
			}
	  }
	  
	  public boolean addUser(User user)
	  {
		  try {
		 stmt = conn.createStatement();
		 String query = "INSERT INTO `cloudservices`.`users` (`firstname`, `lastname`, `email`, `passwd`) VALUES ('" + user.getFirstName() + "', '" + user.getLastName() + "', '" + user.getEmail() + "', '" + user.getPasswd() + "');";
		 stmt.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  return true;
	  }
	  
//	  public boolean checkUser(User user)
//	  {
//		  try {
//				 stmt = conn.createStatement();
//				 String query = "
//				 stmt.executeUpdate(query);
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//		  
//	  }
	  
	  public boolean checkUser(User user){
		  ResultSet rs;
		  String origPasswd = null;
		  	try {
		  		stmt = conn.createStatement();
		  		String query = "Select passwd from cloudservices.users where email = '"+user.getEmail()+"';";
		  		rs = stmt.executeQuery(query);
		  		rs.next();
		  		origPasswd = rs.getString("passwd");
		  		System.out.println("Password from db : "+ origPasswd );
		  		System.out.println("Password entered : "+user.getPasswd());
		  		} catch (SQLException e) {
		  			// TODO Auto-generated catch block
		  			e.printStackTrace();
		  		}

		  		return user.getPasswd().equals(origPasswd);
		  }
	  
	  
}
