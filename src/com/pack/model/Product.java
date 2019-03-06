package com.pack.model;

public class Product {
	private String pid,productname,brand,category,description;
	private double rating,price;
	
	public Product()
	{
		super();
	}
	public Product(String pid, String productname, String brand, String category, String description, double rating,
			double price) {
		super();
		this.pid = pid;
		this.productname = productname;
		this.brand = brand;
		this.category = category;
		this.description = description;
		this.rating = rating;
		this.price = price;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
