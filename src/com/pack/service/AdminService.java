package com.pack.service;

import java.util.List;

import com.pack.model.Login;
import com.pack.model.Product;
import com.pack.model.Profile;

public interface AdminService {
	public Login fetchLogin(String usr,String pass);
	public Login fetchLoginByUser(String usr);
	public Profile fetchProfile(String usr);
	public int setLoginStatus(Login l);
	public List<Product> fetchProduct();
	public int insertProduct(Product p);
	public int removeProductByPid(String p);
	public Product fetchProductByPid(String p);
}
