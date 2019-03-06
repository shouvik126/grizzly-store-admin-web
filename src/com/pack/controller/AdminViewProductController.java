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
 * Servlet implementation class AdminViewProductController
 */
//@WebServlet("/AdminViewProductController")
public class AdminViewProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AdminViewProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String pid=request.getParameter("pid");
		AdminServiceImpl as=new AdminServiceImpl();
		Product p=null;
		p=as.fetchProductByPid(pid);
		if(p!=null)
		{
			request.setAttribute("product", p);
			RequestDispatcher rd=request.getRequestDispatcher("/AdminViewProduct.jsp");
			rd.forward(request, response);
		}
		
	}

}
