package com.pack.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack.model.Login;
import com.pack.model.Product;
import com.pack.model.Profile;
import com.pack.service.AdminServiceImpl;

/**
 * Servlet implementation class AdminListProductController
 */
//@WebServlet("/AdminListProductController")
public class AdminListProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminListProductController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		HttpSession hs=request.getSession(false);
		AdminServiceImpl as=new AdminServiceImpl();
		//Login l=(Login)hs.getAttribute("login");
		//Profile p=as.fetchProfile(l.getId());
		//hs.setAttribute("profile", p);
		List<Product>li=as.fetchProduct();
		request.setAttribute("product", li);
		RequestDispatcher rd=request.getRequestDispatcher("/AdminListProduct.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		HttpSession hs=request.getSession(false);
		AdminServiceImpl as=new AdminServiceImpl();
		Login l=(Login)hs.getAttribute("login");
		Profile p=as.fetchProfile(l.getId());
		hs.setAttribute("profile", p);
		List<Product>li=as.fetchProduct();
		request.setAttribute("product", li);
		RequestDispatcher rd=request.getRequestDispatcher("/AdminListProduct.jsp");
		rd.forward(request, response);
		
		
	}

}
