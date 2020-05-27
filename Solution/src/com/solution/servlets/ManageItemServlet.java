package com.solution.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.solution.bean.Item;
import com.solution.db.DBMImp;

/**
 * Servlet implementation class AddItemServlet
 */
public class ManageItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if(action.equals("additem")) {
			String displayName = request.getParameter("displayName");
			String category = request.getParameter("category");
			String username = request.getParameter("username");
			int oneunitsize = Integer.parseInt(request.getParameter("oneunitsize"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String unit = request.getParameter("unit");
			int price = Integer.parseInt(request.getParameter("price"));
			String itemName = displayName+oneunitsize+unit+username;
			Item item = new Item();
			item.setItemname(itemName);
			item.setCategory(category);
			item.setUsername(username);
			item.setOneunitsize(oneunitsize);
			item.setQuantity(quantity);
			item.setUnit(unit);
			item.setPrice(price);
			item.setDname(displayName);
			boolean status = new DBMImp().addItem(item);
			if(status) {
				RequestDispatcher rd=request.getRequestDispatcher("shopperprofile.jsp");
				out.print("<p>item Added....</p>");
				rd.include(request, response);
			}
			else
			{
				out.print("<p>Problem in adding item..</p>");
				RequestDispatcher rd=request.getRequestDispatcher("shopperprofile.jsp");
				rd.include(request, response);
			}
		}
		else if(action.equals("updateitem")) {
			int iid = Integer.parseInt(request.getParameter("iid"));
			String displayName = request.getParameter("displayName");
			String category = request.getParameter("category");
			String username = request.getParameter("username");
			int oneunitsize = Integer.parseInt(request.getParameter("oneunitsize"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String unit = request.getParameter("unit");
			int price = Integer.parseInt(request.getParameter("price"));
			String itemName = displayName+oneunitsize+unit+username;
			Item item = new Item();
			item.setIid(iid);
			item.setItemname(itemName);
			item.setCategory(category);
			item.setUsername(username);
			item.setOneunitsize(oneunitsize);
			item.setQuantity(quantity);
			item.setUnit(unit);
			item.setPrice(price);
			item.setDname(displayName);
			boolean status = new DBMImp().updateItem(item);
			if(status) {
				RequestDispatcher rd=request.getRequestDispatcher("shopperprofile.jsp");
				out.print("<p>item Updated....</p>");
				rd.include(request, response);
			}
			else
			{
				out.print("<p>Problem in updating item..</p>");
				RequestDispatcher rd=request.getRequestDispatcher("shopperprofile.jsp");
				rd.include(request, response);
			}
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
