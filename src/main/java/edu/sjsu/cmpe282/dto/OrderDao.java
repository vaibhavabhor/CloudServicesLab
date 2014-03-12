package edu.sjsu.cmpe282.dto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import edu.sjsu.cmpe282.domain.Order;
import edu.sjsu.cmpe282.domain.Product;
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
		 String query = "INSERT INTO `cloudservices`.`users` (`id`, `email`, `catalogId`, `productId`, `quantity`, `price`) VALUES "
		 		+ "('" + order.getOrderId() + "', '" + order.getEmail() + "', '" +order.getCatalogId() + "', '" + order.getProductId() 
		 		+ "', '" + order.getQuantity() + "', '"+ order.getPrice() + "');";
		 stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  return true;
	  }
	   
	  public ArrayList<Order> getOrdersForUser(User user){
		  ResultSet rs;
		  List<Order> orderList = new ArrayList<Order>();
		  String origPasswd = null;
		  	try {
		  		stmt = conn.createStatement();
		  		String query = "Select * from cloudservices.Order where email = '"+user.getEmail()+"';";
		  		rs = stmt.executeQuery(query);
		  		rs.next();
		  		origPasswd = rs.getString("passwd");
		  		System.out.println("Password from db : "+ origPasswd );
		  		System.out.println("Password entered : "+user.getPasswd());
		  		
		  		testingRating.setDeveloperId(rs.getInt("developer_id"));
				testingRating.setRating(rs.getFloat("rating"));
				testingRating.setDate(rs.getString("ratingdate"));
				
		  		} catch (SQLException e) {
		  			// TODO Auto-generated catch block
		  			e.printStackTrace();
		  		}
		  		return (ArrayList<Order>)orderList;
		  		//return user.getPasswd().equals(origPasswd);
		  }
	  
	  
}
