package edu.sjsu.cmpe282.dto;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.PutItemRequest;


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
}
