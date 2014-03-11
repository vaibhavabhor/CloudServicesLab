package edu.sjsu.cmpe282.dto;
import java.sql.*;

import edu.sjsu.cmpe282.domain.Order;
import edu.sjsu.cmpe282.domain.RDSConnection;
import edu.sjsu.cmpe282.domain.User;

public class OrderDao {
		Connection conn = null;
	    Statement stmt = null;
	
	// Constructor with JDBC connection
	  public OrderDao()
	  {
		   try{
		      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      conn = DriverManager.getConnection(RDSConnection.connString,RDSConnection.connUsername,RDSConnection.connPassword);
		   }
		   catch (SQLException e) {
					e.printStackTrace();
					
			}
	  }
	  
	  public boolean addOrder(Order order)
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
	   
	  public boolean getOrdersForUser(User user){
		  ResultSet rs;
		  String origPasswd = null;
		  	try {
		  		stmt = conn.createStatement();
		  		String query = "Select * from cloudservices.users where email = '"+user.getEmail()+"';";
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
