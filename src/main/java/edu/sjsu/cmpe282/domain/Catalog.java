package edu.sjsu.cmpe282.domain;

public class Catalog {
	
	private Integer catalogId;
	private String Name;
		
	public Catalog() {
		super();
	}
		
	public Integer getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(Integer catalogId) {
		this.catalogId = catalogId;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Catalog(Integer id, String name) {
		super();
		this.catalogId = id;
		this.Name = name;
	}
}
