<%@page import="com.solution.bean.Shopper"%>
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
<link rel="stylesheet" type="text/css" href="css/updateitem.css">
<title>Update</title>
</head>
<body>
<%
Shopper shopper = (Shopper)session.getAttribute("shopper");
if(shopper!=null){
%>


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
                    
                    	
						<a class='mr-2' style="margin-right: 0%; margin-left: auto;color:white;" href='shopperprofile.jsp'><%=shopper.getUsername() %></a>
						<form action="AuthticationServlet">
						<input type='hidden' name='action' value='logout'>
						<input type='submit' value='Log Out' class="btn btn-success ">
						</form>
    
                          </div>
                        </li>
                    
                    </div>
                  </nav>
    
    </header>

    <section class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-md-3">
                <form class="form-container bg-dark text-white" action="ManageItemServlet" method="post">
                
               	<input type='hidden' name='action' value='updateitem'>
				<input type='hidden' name='iid' value='<%= request.getParameter("iid")%>'>
				<input type='hidden' name='username' value='<%= shopper.getUsername()%>'>
				<input type='hidden' name="category" value='<%= request.getParameter("category")%>'>
                    <h3 class="text-center">Update Item Details </h3>
                <div class="form-group">

                        <label for="exampleInputPassword1">Item Name:</label>
                        <input type='text' name='displayName'value='<%= request.getParameter("displayname")%>' class="form-control" id="a-z" placeholder="Full Name">
                      </div>
                    
                      <div class="form-group">

                            <label for="exampleInputPassword1">One Unit Size:</label>
                            <input type='text' name='oneunitsize'value='<%= request.getParameter("oneunitsize")%>' class="form-control" id="a-z"placeholder="Username">
                          </div>
                          <div class="form-group">

                            <label for="exampleInputPassword1">Measuring Unit:</label>
                            <input type='text' name='unit'value='<%= request.getParameter("unit")%>' class="form-control" id="a-z"placeholder="Address">
                          </div>
                          <div class="form-group">

                            <label for="exampleInputPassword1">Quantity:</label>
                            <input type='text' name='quantity'value='<%= request.getParameter("quantity")%>' class="form-control" id="a-z"placeholder="City">
                          </div>
                          <div class="form-group">

                            <label for="exampleInputPassword1">Price:</label>
                            <input type='text' name='price'value='<%= request.getParameter("price")%>' class="form-control" id="a-z"placeholder="State">
                          </div>
                         


                
                <button type="submit" class="btn btn-primary btn-block">Update Item</button>
              </form></div>
        </div>
       
    </section>
<!-- 
<form action="ManageItemServlet" method="post">
<input type='hidden' name='action' value='updateitem'>
<input type='hidden' name='iid' value='<%= request.getParameter("iid")%>'>
<input type='hidden' name='username' value='<%= shopper.getUsername()%>'>
<label>Item Name:</label><input type='text' name='displayName'value='<%= request.getParameter("displayname")%>'><br><br>
<input type='hidden' name="category" value='<%= request.getParameter("category")%>'>
<label>One Unit Size:</label><input type='text' name='oneunitsize'value='<%= request.getParameter("oneunitsize")%>'><br><br>
<label>Measuring Unit:</label><input type='text' name='unit'value='<%= request.getParameter("unit")%>'><br><br>
<label>Quantity:</label><input type='text' name='quantity'value='<%= request.getParameter("quantity")%>'><br><br>
<label>Price:</label><input type='text' name='price'value='<%= request.getParameter("price")%>'><br><br>
<input type='submit' value='Update Details'><br><br>
</form>
 -->
<% 
}
else{
	response.sendRedirect("shopperlogin.jsp");
}
%>
</body>
</html>