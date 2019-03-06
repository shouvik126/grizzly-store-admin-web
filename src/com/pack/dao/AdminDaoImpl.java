package com.pack.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pack.DBUtility;
import com.pack.model.Login;
import com.pack.model.Product;
import com.pack.model.Profile;

public class AdminDaoImpl implements AdminDao{

	@Override
	public Login fetchLogin(String usr, String pass) {
		Connection con=null;
		PreparedStatement ps=null;
		Login l=null;
		try
		{
			//con=DbUtility.getConnection();
			con=DBUtility.getDatasourse().getConnection();
			con.setAutoCommit(false);
			ps=con.prepareStatement("select id,password,status,usertype from login where id=? and password=?");
			ps.setString(1, usr);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				l=new Login();
				l.setId(rs.getString("id"));
				l.setPassword(rs.getString("password"));
				l.setStatus(rs.getString("status"));
				l.setUsertype(rs.getString("usertype"));
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
			try{
				if(con!=null)
				{
					con.close();
					ps.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return l;
	}

	@Override
	public Profile fetchProfile(String usr) {
		Connection con=null;
		PreparedStatement ps=null;
		Profile p=null;
		try
		{
			con=DBUtility.getDatasourse().getConnection();
			con.setAutoCommit(false);
			System.out.println(usr);
			ps=con.prepareStatement("select id,firstname,middlename,lastname,designation,address from profile where id=?");
			ps.setString(1, usr);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p=new Profile();
				p.setId(rs.getString("id"));
				p.setFirstname(rs.getString("firstname"));
				p.setMiddlename(rs.getString("middlename"));
				p.setLastname(rs.getString("lastname"));
				p.setDesignation(rs.getString("designation"));
				p.setAddress(rs.getString("address"));
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			try
			{
				if(con!=null)
				{
					con.close();
					ps.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return p;
	}

	@Override
	public Login fetchLoginByUser(String usr) {
		Connection con=null;
		PreparedStatement ps=null;
		Login l=null;
		try
		{
			//con=DbUtility.getConnection();
			con=DBUtility.getDatasourse().getConnection();
			con.setAutoCommit(false);
			ps=con.prepareStatement("select id,password,status,usertype from login where id=?");
			ps.setString(1, usr);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				l=new Login();
				l.setId(rs.getString("id"));
				l.setPassword(rs.getString("password"));
				l.setStatus(rs.getString("status"));
				l.setUsertype(rs.getString("usertype"));
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
			try{
				if(con!=null)
				{
					con.close();
					ps.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return l;
	}

	@Override
	public int setLoginStatus(Login l) {
		int i=0;
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
			//con=DbUtility.getConnection();
			con=DBUtility.getDatasourse().getConnection();
			con.setAutoCommit(false);
			//String status=l.getStatus();
			String status="nvalid";
			String sql="update login set status='invalid' where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, l.getId());
			i=ps.executeUpdate();
			con.commit();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
			try{
				if(con!=null)
				{
					con.close();
					ps.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return i;
	}

	@Override
	public List<Product> fetchProduct() {
		Connection con=null;
		PreparedStatement ps=null;
		List<Product> li=new ArrayList<>();
		Product p=null;
		
		try
		{
			//con=DbUtility.getConnection();
			con=DBUtility.getDatasourse().getConnection();
			con.setAutoCommit(false);
			ps=con.prepareStatement("select pid,productname,brand,category,rating,description,price from product");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p=new Product();
				p.setPid(rs.getString("pid"));
				p.setProductname(rs.getString("productname"));
				p.setBrand(rs.getString("brand"));
				p.setCategory(rs.getString("category"));
				p.setRating(rs.getDouble("rating"));
				p.setDescription(rs.getString("description"));
				p.setPrice(rs.getDouble("price"));
				li.add(p);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
			try{
				if(con!=null)
				{
					con.close();
					ps.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return li;
	}

	@Override
	public int insertProduct(Product p) {
		Connection con=null;
		PreparedStatement ps=null;
		int i=0;
		try
		{
			//con=DbUtility.getConnection();
			con=DBUtility.getDatasourse().getConnection();
			con.setAutoCommit(false);
			String sql="insert into product (pid,productname,brand,category,rating,description,price) values(?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, p.getPid());
			ps.setString(2, p.getProductname());
			ps.setString(3, p.getBrand());
			ps.setString(4, p.getCategory());
			ps.setDouble(5, p.getRating());
			ps.setString(6, p.getDescription());
			ps.setDouble(7, p.getPrice());
			i=ps.executeUpdate();
			con.commit();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
			try{
				if(con!=null)
				{
					con.close();
					ps.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return i;
	}

	@Override
	public int removeProductByPid(String p) {
		Connection con=null;
		PreparedStatement ps=null;
		int i=0;
		try
		{
			//con=DbUtility.getConnection();
			con=DBUtility.getDatasourse().getConnection();
			con.setAutoCommit(false);
			String sql="delete from product where pid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, p);
			i=ps.executeUpdate();
			con.commit();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
			try{
				if(con!=null)
				{
					con.close();
					ps.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return i;
	}

	@Override
	public Product fetchProductByPid(String p) {
		Connection con=null;
		PreparedStatement ps=null;
		Product pr=null;
		try
		{
			//con=DbUtility.getConnection();
			con=DBUtility.getDatasourse().getConnection();
			con.setAutoCommit(false);
			ps=con.prepareStatement("select pid,productname,brand,category,rating,description,price from product where pid=?");
			ps.setString(1, p);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				pr=new Product();
				pr.setPid(rs.getString("pid"));
				pr.setProductname(rs.getString("productname"));
				pr.setBrand(rs.getString("brand"));
				pr.setCategory(rs.getString("category"));
				pr.setRating(rs.getDouble("rating"));
				pr.setDescription(rs.getString("description"));
				pr.setPrice(rs.getDouble("price"));
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
			try{
				if(con!=null)
				{
					con.close();
					ps.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return pr;
	}

}
