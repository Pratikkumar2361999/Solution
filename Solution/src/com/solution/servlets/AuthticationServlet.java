package com.solution.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.solution.bean.Client;
import com.solution.bean.Shopper;
import com.solution.db.DBMImp;

/**
 * Servlet implementation class AuthticationServlet
 */
public class AuthticationServlet extends HttpServlet {
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();	
		String action = request.getParameter("action");
		if(action.equals("shoppersignup")) {
			String username = request.getParameter("username");
			String name     = request.getParameter("sname");
			String pno      = request.getParameter("pno");
			String address  = request.getParameter("address");
			String city     = request.getParameter("city");
			String state    = request.getParameter("state");
			String country  = request.getParameter("country");
			String password = request.getParameter("password");
			Shopper shopper = new Shopper();
			shopper.setName(name);
			shopper.setPno(pno);
			shopper.setUsername(username);
			shopper.setAddress(address);
			shopper.setCity(city);
			shopper.setCountry(country);
			shopper.setState(state);
			shopper.setPassword(password);
			boolean status = new DBMImp().insertShopper(shopper);
			if(status) {
				RequestDispatcher rd=request.getRequestDispatcher("shopperlogin.jsp");
				out.print("<p>Shopper Added..</p>");
				rd.include(request, response);
			}
			else
			{
				out.print("<p>Problem in insertion..</p>");
				RequestDispatcher rd=request.getRequestDispatcher("shoppersignup.jsp");
				rd.include(request, response);
			}
			
		}
		else if(action.equals("customersignup")) {
			String username = request.getParameter("username");
			String name     = request.getParameter("cname");
			String pno      = request.getParameter("pno");
			String password = request.getParameter("password");
			Client client=new Client();
			client.setUsername(username);
			client.setName(name);
			client.setPno(pno);
			client.setPassword(password);
			boolean status = new DBMImp().insertClient(client);
			if(status) {
				RequestDispatcher rd=request.getRequestDispatcher("customerlogin.jsp");
				out.print("<p>Client Added..</p>");
				rd.include(request, response);
			}
			else
			{
				out.print("<p>Problem in insertion..</p>");
				RequestDispatcher rd=request.getRequestDispatcher("customersignup.jsp");
				rd.include(request, response);
			}
			out.close();
		}
		else if(action.equals("shopperlogin")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Shopper shopper=new Shopper();
			shopper = new DBMImp().getShopper(username);
			if(shopper!=null && shopper.getPassword().equals(password))
			{
				HttpSession hs=request.getSession();
				hs.setAttribute("shopper", shopper);
				hs.setAttribute("client", null);
				response.sendRedirect("shopperprofile.jsp");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("customerlogin.jsp");
				out.println("<h3>Invalid Username or Password</h3>");
				rd.include(request,response);	
			}
			out.close();
		}
		else if(action.equals("customerlogin")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Client client=new Client();
			client = new DBMImp().getClient(username);
			if(client!=null && client.getPassword().equals(password))
			{
				HttpSession hs=request.getSession();
				hs.setAttribute("client", client);
				hs.setAttribute("shopper", null);
				response.sendRedirect("customerprofile.jsp");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("customerlogin.jsp");
				out.println("<h3>Invalid Username or Password</h3>");
				rd.include(request,response);	
			}	
			out.close();
		}
		else if(action.equals("customerupdate")) {
			String username = request.getParameter("username");
			String name     = request.getParameter("cname");
			String pno      = request.getParameter("pno");
			String password = request.getParameter("password");
			Client client=new Client();
			client.setUsername(username);
			client.setName(name);
			client.setPno(pno);
			client.setPassword(password);
			boolean status = new DBMImp().updateClient(client);
			if(status) {
				HttpSession hs = request.getSession();
				hs.setAttribute("client", client );
				hs.setAttribute("shopper", null);
				RequestDispatcher rd=request.getRequestDispatcher("customerprofile.jsp");
				out.print("<p>Client Information Updated.</p>");
				rd.include(request, response);
			}
			else
			{
				out.print("<p>Problem in Updation..</p>");
				RequestDispatcher rd=request.getRequestDispatcher("customerprofile.jsp");
				rd.include(request, response);
			}
			out.close();
		}
		else if(action.equals("shopperupdate")) {
			String username = request.getParameter("username");
			String name     = request.getParameter("sname");
			String pno      = request.getParameter("pno");
			String address  = request.getParameter("address");
			String city     = request.getParameter("city");
			String state    = request.getParameter("state");
			String country  = request.getParameter("country");
			String password = request.getParameter("password");
			Shopper shopper = new Shopper();
			shopper.setName(name);
			shopper.setPno(pno);
			shopper.setUsername(username);
			shopper.setAddress(address);
			shopper.setCity(city);
			shopper.setCountry(country);
			shopper.setState(state);
			shopper.setPassword(password);
			boolean status = new DBMImp().updateShopper(shopper);
			if(status) {
				HttpSession hs = request.getSession();
				hs.setAttribute("shopper", shopper);
				hs.setAttribute("client", null);
				RequestDispatcher rd=request.getRequestDispatcher("shopperprofile.jsp");
				out.print("<p>Shopper Information Updated..</p>");
				rd.include(request, response);
			}
			else
			{
				out.print("<p>Problem in Updation..</p>");
				RequestDispatcher rd=request.getRequestDispatcher("shopperprofile.jsp");
				rd.include(request, response);
			}
		}
		else if(action.equals("logout")) {
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
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
