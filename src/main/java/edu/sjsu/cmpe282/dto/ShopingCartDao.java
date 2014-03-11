package edu.sjsu.cmpe282.dto;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.ComparisonOperator;
import com.amazonaws.services.dynamodbv2.model.Condition;
import com.amazonaws.services.dynamodbv2.model.PutItemRequest;
import com.amazonaws.services.dynamodbv2.model.QueryRequest;
import com.amazonaws.services.dynamodbv2.model.QueryResult;

import edu.sjsu.cmpe282.domain.Order;
import edu.sjsu.cmpe282.domain.Product;
import edu.sjsu.cmpe282.domain.User;

public class ShopingCartDao {
	static AmazonDynamoDBClient client;
	
	public ShopingCartDao() throws IOException
	{
		AWSCredentials credentials = new PropertiesCredentials(ShopingCartDao.class.getResourceAsStream("AwsCredentials.properties"));
        client = new AmazonDynamoDBClient(credentials);
        Map<String, AttributeValue> item = new HashMap<String, AttributeValue>();
        String tableName = "ShoppingCart";
        item.put("InPublication", new AttributeValue().withN("1"));
        item.put("ProductCategory", new AttributeValue().withS("Book"));
        
        PutItemRequest itemRequest = new PutItemRequest().withTableName(tableName).withItem(item);
        client.putItem(itemRequest);
        item.clear();
	}
	
	public void addToShoppingCart(User user, Product orderToAdd)
	{
		Map<String, AttributeValue> item = new HashMap<String, AttributeValue>();
        String tableName = "ShoppingCart";
        
        //a.withSS(sS)
        item.put("userid", new AttributeValue().withS(user.getEmail()));
        item.put("productId", new AttributeValue().withN(Integer.toString(orderToAdd.getProductId())));
        item.put("name", new AttributeValue().withS(orderToAdd.getName()));
        item.put("description", new AttributeValue().withS(orderToAdd.getDescription()));
        item.put("catalogId", new AttributeValue().withN(Integer.toString(orderToAdd.getCatalogId())));
        item.put("price", new AttributeValue().withS(Float.toString(orderToAdd.getPrice())));
        item.put("quantity", new AttributeValue().withS(Integer.toString(orderToAdd.getQuantity())));
        
        PutItemRequest itemRequest = new PutItemRequest().withTableName(tableName).withItem(item);
        client.putItem(itemRequest);
        item.clear();
	}
	
	public void removeFromShoppingCart(User currentUser, int orderId)
	{
		HashMap filter = new HashMap();

		 Condition hashKeyCondition = new Condition().withComparisonOperator(
		 ComparisonOperator.EQ.toString()).withAttributeValueList(new AttributeValue().withN(Integer.toString(orderId)));

		 filter.put("stdId", hashKeyCondition);
		 QueryRequest queryRequest = new QueryRequest().withTableName("StudentTable").withKeyConditions(filter);

		 QueryResult result = client.query(queryRequest);
		 System.out.println("Query Result:" + result);
	}
	
	
	
}
