package com.solution.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.solution.connection.ConnectionProvider;

/**
 * Servlet implementation class SiteController
 */
public class SiteController extends HttpServlet {
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String action=request.getParameter("action");
		Connection con= new ConnectionProvider().getConnection();
		if(action.equals("login")) {
			response.sendRedirect("login.jsp");
		}
		else if(action.equals("customerlogin")) {
			response.sendRedirect("customerlogin.jsp");
		}
		else if(action.equals("shopperlogin")) {
			response.sendRedirect("shopperlogin.jsp");
		}
		else if(action.equals("signup")) {
			response.sendRedirect("signup.jsp");
		}
		else if(action.equals("customersignup")) {
			response.sendRedirect("customersignup.jsp");
		}
		else if(action.equals("shoppersignup")) {
			response.sendRedirect("shoppersignup.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
