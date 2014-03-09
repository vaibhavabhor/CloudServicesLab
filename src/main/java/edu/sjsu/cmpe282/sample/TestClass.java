package edu.sjsu.cmpe282.sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class TestClass {

	public static void main(String[] args) {
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
		   }
		   catch (SQLException e) {
					e.printStackTrace();
					
			}
	}

}
