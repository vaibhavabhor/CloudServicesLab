package edu.sjsu.cmpe282.domain;

public class Order {

	private int orderId;
	private String email;
	private int catalogId;
	private int productId;
	private int quantity;
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	private float price;
	
	public int getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(int catalogId) {
		this.catalogId = catalogId;
	}

	public Order(int id, String email, int catalogId, int productId, int quantity, float price)
	{
		super();
		this.productId = id;
		this.email = email;
		this.productId = productId;
		this.quantity = quantity;
		this.price = price;
	}
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
