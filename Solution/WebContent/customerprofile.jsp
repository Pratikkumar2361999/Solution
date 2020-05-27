<%@page import="com.solution.bean.Shopper"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.solution.db.DBMImp"%>
<%@page import="com.solution.bean.Log"%>
<%@page import="java.util.List"%>
<%@page import="com.solution.bean.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/27dcef5e28.js" crossorigin="anonymous"></script>
<title>Customer Profile</title>
</head>
<body>

<%Client c=(Client)session.getAttribute("client");
if(c!=null){

%>
<!-- 
<a href='customerupdate.jsp'>edit</a>
<a href='AuthticationServlet?action=logout'>Logout</a>
 -->
<%
List<Log> loglist = new DBMImp().customerLog(c.getUsername());
%>
<%
						
						
%>
<header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand">BuySell</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                      <ul class="navbar-nav">
                           
                        <li class="nav-item active">
                          <a class="nav-link" href="index.jsp">Home </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="category.jsp">Category</a>
                          </li>
                          <li class="nav-item active">
                              <a class="nav-link" target="_blank" href="https://web-chat.global.assistant.watson.cloud.ibm.com/preview.html?region=eu-gb&integrationID=579ca9b6-0924-4c5d-a38a-1b099c002fee&serviceInstanceID=ef5d31f8-c04f-480a-990b-7e75ef25e6a0">Help</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link mx-1" href="#"><i class="fas fa-bell"></i><span class="sr-only">(current)</span></a>
                              </li>
                            
                        <form class="form-inline my-2 my-lg-0" action="search.jsp">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"  name='searchelement' >
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                              </form>
                             
                    </ul>
                    
                    	
						<label class='mr-2' style="margin-right: 0%; margin-left: auto;color:white;"><%=c.getUsername() %></label>
						<form action="customerupdate.jsp" >
						<input type='submit' value='Edit' class="btn btn-primary ml-auto mx-3">
						</form>
						<form action="AuthticationServlet">
						<input type='hidden' name='action' value='logout'>
						<input type='submit' value='Log Out' class="btn btn-success ">
						</form>
    
                          </div>
                        </li>
                    
                    </div>
                  </nav>
    
    </header>
<div class="table-responsive">
  

<table class="table table-striped table-hover ">
  <thead>
  <tr>
    <th scope="col">Item Name</th>
    <th scope="col">Items Bought</th>
    <th scope="col">Remaining Items</th>
    <th scope="col">One Unit Size</th>
    <th scope="col">Shopper Name</th>
    <th scope="col">Customer Name</th>
    <th scope="col">Price</th>
    <th scope="col">Bought At(Date/Time 24hrs)</th>
    <th scope="col">Display Name</th>
  </tr>
  </thead>
  <tbody>
  <%
	
	Iterator<Log> itr= loglist.iterator();
	while(itr.hasNext()){
		Log log = itr.next();
%>
<tr> 
  <td><%= log.getItemname()%></td> 
  <td><%= log.getBquantity()%></td> 
  <td><%= log.getRquantity()%></td>
  <td><%= log.getOneunitsize()%></td>
  <td><%= log.getSusername()%></td>
  <td><%= log.getCusername()%></td>
  <td><%= log.getPrice()%></td>
  <td><%= log.getBoughtat()%></td>
  <td><%= log.getDname()%></td>
  </tr>
<% 
	}
%>
</tbody>
</table>
</div>
<%
}
else{
	response.sendRedirect("customerlogin.jsp");
}
%>
</body>
</html>