package edu.sjsu.cmpe282.sample;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import edu.sjsu.cmpe282.domain.Product;
import edu.sjsu.cmpe282.domain.User;
import edu.sjsu.cmpe282.dto.*;

public class TestClass {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
	    Statement stmt = null;
		try{
		      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      conn = DriverManager.getConnection("jdbc:mysql://mydbinstance.cizvqwfgh78q.us-west-1.rds.amazonaws.com:3306","applestore","applestore");
		      System.out.println("Connection done!");
		      
		      ShopingCartDao s = new ShopingCartDao();
		      User u = new User("fname","lname","vaibhav@gmail.com","pwd");
		      Product p = new Product(2,"productname","Description",5, 5 );
		      
		      //s.addToShoppingCart(u, p);
		      
		      //s.getItemsFromShoppingCart(u);
		      s.removeFromShoppingCart(currentUser);
		   }
		   catch (SQLException e) {
					e.printStackTrace();
					
			}
	}

}
