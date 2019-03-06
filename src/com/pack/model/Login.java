package com.pack.model;

public class Login {
	private String id,password,usertype;
	private String status;
	
	public Login()
	{
		super();
	}

	public Login(String id, String password, String status, String usertype) {
		super();
		this.id = id;
		this.password = password;
		this.status = status;
		this.usertype = usertype;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
}
