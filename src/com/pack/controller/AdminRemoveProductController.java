package com.pack.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack.service.AdminServiceImpl;

/**
 * Servlet implementation class AdminRemoveProductController
 */
//@WebServlet("/AdminRemoveProductController")
public class AdminRemoveProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminRemoveProductController() {
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
		HttpSession hs=request.getSession(false);
		String pid=request.getParameter("pid");
		AdminServiceImpl as=new AdminServiceImpl();
		int i=as.removeProductByPid(pid);
		if(i==1)
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminListProductController");
			rd.forward(request, response);
		}
	}

}
