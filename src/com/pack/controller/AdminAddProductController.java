package com.pack.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.model.Product;
import com.pack.service.AdminServiceImpl;

/**
 * Servlet implementation class AdminAddProductController
 */
//@WebServlet("/AdminAddProductController")
public class AdminAddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		RequestDispatcher rd=request.getRequestDispatcher("AdminListProductController");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String pid=request.getParameter("pid");
		String productname=request.getParameter("productname");
		String productcategory=request.getParameter("productcategory");
		String productdescription=request.getParameter("productdescription");
		double productprice=Double.parseDouble(request.getParameter("productprice"));
		
		Product p=new Product(pid,productname,"NA",productcategory,productdescription,0.0,productprice);
		AdminServiceImpl as=new AdminServiceImpl();
		int i=as.insertProduct(p);
		if(i!=0)
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminListProductController");
			rd.forward(request, response);
		}
	}

}
