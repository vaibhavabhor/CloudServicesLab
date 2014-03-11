package edu.sjsu.cmpe282.dto;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.DeleteItemRequest;
import com.amazonaws.services.dynamodbv2.model.DeleteItemResult;
import com.amazonaws.services.dynamodbv2.model.ExpectedAttributeValue;
import com.amazonaws.services.dynamodbv2.model.GetItemRequest;
import com.amazonaws.services.dynamodbv2.model.GetItemResult;
import com.amazonaws.services.dynamodbv2.model.PutItemRequest;
import com.amazonaws.services.dynamodbv2.model.ReturnValue;

import edu.sjsu.cmpe282.domain.Product;
import edu.sjsu.cmpe282.domain.User;

public class ShopingCartDao {
	static AmazonDynamoDBClient client;
	
	public ShopingCartDao() throws IOException
	{
		AWSCredentials credentials = new PropertiesCredentials(ShopingCartDao.class.getResourceAsStream("AwsCredentials.properties"));
		client = new AmazonDynamoDBClient(credentials);
		client.setRegion(Region.getRegion(Regions.US_WEST_1)); 
	}
	
	public void addToShoppingCart(User user, Product orderToAdd)
	{
		Map<String, AttributeValue> item = new HashMap<String, AttributeValue>();
        String tableName = "MyShoppingCart";
        
        //a.withSS(sS)
        item.put("userId", new AttributeValue().withS(user.getEmail()));
        item.put("productId", new AttributeValue().withN(Integer.toString(orderToAdd.getProductId())));
        item.put("name", new AttributeValue().withS(orderToAdd.getName()));
        item.put("description", new AttributeValue().withS(orderToAdd.getDescription()));
        item.put("catalogId", new AttributeValue().withN(Integer.toString(orderToAdd.getCatalogId())));
        item.put("price", new AttributeValue().withS(Float.toString(orderToAdd.getPrice())));
        item.put("quantity", new AttributeValue().withS(Integer.toString(orderToAdd.getQuantity())));
        PutItemRequest itemRequest = new PutItemRequest().withTableName(tableName).withItem(item);
        client.putItem(itemRequest);
        System.out.println("Put successful!!");
        //item.clear();
	}
	
	public void removeFromShoppingCart(User currentUser)
	{
		try {
            Map<String, ExpectedAttributeValue> expectedValues = new HashMap<String, ExpectedAttributeValue>();
            HashMap<String, AttributeValue> key = new HashMap<String, AttributeValue>();
			key.put("userId", new AttributeValue().withN(currentUser.getEmail()));
            expectedValues.put("InPublication", new ExpectedAttributeValue().withValue(new AttributeValue().withN("0"))); // Boolean stored as 0 or 1.
            ReturnValue returnValues = ReturnValue.ALL_OLD;
            com.amazonaws.services.dynamodbv2.model.DeleteItemRequest deleteItemRequest = new DeleteItemRequest()
                .withTableName("MyShoppingCart")
                .withKey(key)
                .withExpected(expectedValues)
                .withReturnValues(returnValues);
            DeleteItemResult result = client.deleteItem(deleteItemRequest);

            // Check the response.
            System.out.println("Printing item that was deleted...");
            //printItem(result.getAttributes());            
        }  catch (AmazonServiceException ase) {
                                System.err.println("Failed to get item after deletion " + "ShoppingCart");
        } 
       }
	
	public ArrayList<Product> getItemsFromShoppingCart(User currentUser)
	{
		List<Product> productList;
		try {
            HashMap<String, AttributeValue> key = new HashMap<String, AttributeValue>();
			key.put("userId", new AttributeValue().withS(currentUser.getEmail()));
			key.put("productId", new AttributeValue().withN("1"));
			
			System.out.println("getting data for" + currentUser.getEmail());
			GetItemRequest getItemRequest = new GetItemRequest()
                .withTableName("MyShoppingCart")
                .withKey(key);
            
            GetItemResult result = client.getItem(getItemRequest);

            // Check the response.
            System.out.println("Printing item after retrieving it....");
            
            if(result.getItem().entrySet() != null){
            for (Map.Entry<String, AttributeValue> item : result.getItem().entrySet()) 
            {
                String attributeName = item.getKey();
                AttributeValue value = item.getValue();
                System.out.println(attributeName + " "
                        + (value.getS() == null ? "" : "S=[" + value.getS() + "]")
                        + (value.getN() == null ? "" : "N=[" + value.getN() + "]")
                        + (value.getB() == null ? "" : "B=[" + value.getB() + "]")
                        + (value.getSS() == null ? "" : "SS=[" + value.getSS() + "]")
                        + (value.getNS() == null ? "" : "NS=[" + value.getNS() + "]")
                        + (value.getBS() == null ? "" : "BS=[" + value.getBS() + "] \n"));
            }
            }
		}
          catch (AmazonServiceException ase) {
                    System.err.println("Failed to retrieve item in " + "ShoppingCart");
        }
		
		return null;
	}
}
