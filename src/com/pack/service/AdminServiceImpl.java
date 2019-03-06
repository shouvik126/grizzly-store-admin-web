package com.pack.service;

import java.util.List;

import com.pack.dao.AdminDaoImpl;
import com.pack.model.Login;
import com.pack.model.Product;
import com.pack.model.Profile;

public class AdminServiceImpl implements AdminService{

	@Override
	public Login fetchLogin(String usr, String pass) {
		AdminDaoImpl ad=new AdminDaoImpl();
		Login l=ad.fetchLogin(usr, pass);
		return l;
	}

	@Override
	public Profile fetchProfile(String usr) {
		AdminDaoImpl ad=new AdminDaoImpl();
		Profile p=ad.fetchProfile(usr);
		return p;
	}

	@Override
	public Login fetchLoginByUser(String usr) {
		AdminDaoImpl ad=new AdminDaoImpl();
		Login l=ad.fetchLoginByUser(usr);
		return l;
	}

	@Override
	public int setLoginStatus(Login l) {
		AdminDaoImpl ad=new AdminDaoImpl();
		int i=ad.setLoginStatus(l);
		return i;
	}

	@Override
	public List<Product> fetchProduct() {
		AdminDaoImpl ad=new AdminDaoImpl();
		List<Product>li=ad.fetchProduct();
		return li;
	}

	@Override
	public int insertProduct(Product p) {
		AdminDaoImpl ad=new AdminDaoImpl();
		int i=ad.insertProduct(p);
		return i;
	}

	@Override
	public int removeProductByPid(String p) {
		AdminDaoImpl ad=new AdminDaoImpl();
		int i=ad.removeProductByPid(p);
		return i;
	}

	@Override
	public Product fetchProductByPid(String p) {
		AdminDaoImpl ad=new AdminDaoImpl();
		Product pr=ad.fetchProductByPid(p);
		return pr;
	}





}
