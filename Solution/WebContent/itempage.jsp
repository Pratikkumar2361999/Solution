<%@page import="com.solution.bean.Client"%>
<%@page import="com.solution.bean.Shopper"%>
<%@page import="com.solution.db.DBMImp"%>
<%@page import="com.solution.bean.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<%
String itemname=request.getParameter("itemname");
Item item = new DBMImp().getItem(itemname);
Client client=(Client)session.getAttribute("client");
Shopper shopper =(Shopper)session.getAttribute("shopper");
%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/27dcef5e28.js" crossorigin="anonymous"></script>
<title><%=item.getDname() %> <%=item.getOneunitsize() %> <%=item.getUnit() %></title>
</head>
<body>

<header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" >BuySell</a>
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
                    
                    	<%
						if(client!=null){
						%>
						<a class='mr-2' style="margin-right: 0%; margin-left: auto;color:white;" href="customerprofile.jsp"><%=client.getUsername() %></a>
						<form action="AuthticationServlet">
						<input type='hidden' name='action' value='logout'>
						<input type='submit' value='Log Out' class="btn btn-success ">
						</form>
						<% 
						}
						else if(shopper!=null){
						%>
						<a class='mr-2' style="margin-right: 0%; margin-left: auto;color:white;" href='shopperprofile.jsp'><%=shopper.getUsername() %></a>
						<form action="AuthticationServlet">
						<input type='hidden' name='action' value='logout'>
						<input type='submit' value='Log Out' class="btn btn-success ">
						</form>
						<%
							
						}
						else{
						%>
						<form action="SiteController" style="margin-right: 0%; margin-left: auto;">
						<input type='hidden' name='action' value='login'>
						<input type='submit' value='Log In' class="btn btn-success ">
						</form>
						
    					<% 
						}
						%>
	
                          </div>
                        </li>
                    
                    </div>
                  </nav>
    
    </header>





<h4><%=item.getDname() %> </h4>
<h4>One Unit Amount: <%=item.getOneunitsize() %> <%=item.getUnit() %> </h4>
<h4>Items Remaining: <%=item.getQuantity() %></h4>
<%
if(0>=item.getQuantity()){
%>
<p>Item Not Available: Please check after some time</p>
<% 	
}
else{
	if(client!=null){
%>
<form action="BuyItem">
<input type='hidden' name='itemname' value='<%=item.getItemname()%>'>
<label>Enter Quantity:</label> <input type='number' name='itemno' value='1' max='<%=item.getQuantity() %>' min='1'>
<input type='submit' value='book'>

<%
	}
}
	
%>
</form>


<h2>Map feature will be available soon</h2>
</body>
</html>