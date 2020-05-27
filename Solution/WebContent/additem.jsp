<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.solution.db.DBMImp"%>
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
<link rel="stylesheet" type="text/css" href="css/additem.css">
<title>Add items</title>
</head>
<body>
<%
Shopper shopper = (Shopper)session.getAttribute("shopper");
if(shopper!=null){
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
                    
                    
						<% 
						
						if(shopper!=null){
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





<section class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-md-3">
                <form class="form-container" action="ManageItemServlet" method="post">
                    <h3 class="text-center">Sell New Item</h3>
                <div class="form-group" >
						<input type='hidden' name='action' value='additem'>
						<input type='hidden' name='username' value='<%= shopper.getUsername()%>'>
                        <label for="exampleInputPassword1">Item Name:</label>
                        <input type='text' name='displayName' class="form-control" id="a-z" placeholder="Full Name">
                      </div>
                    
                      <div class="form-group">

                           
                            <div class="form-group col-lg-12" style="padding-left: 0px;padding-right: 0px;">                              <label for="inputState">Category</label>
                                
                                <select id="inputState" class="form-control" name="category">
                                  <%
                                List<String> categories= new DBMImp().getAllCategory();
                            	Iterator<String> itr = categories.iterator();
                            	while(itr.hasNext()){
                            		String cname=itr.next();
                            	
                                %>
                                  <option value='<%= cname%>'><%= cname%></option>
                                <%
                                }
                                %>  
                                </select>
                              </div>
                          </div>
                          
                          <div class="form-group">

                            <label for="exampleInputPassword1">One Unit Size:</label>
                            <input type="text" class="form-control" id="a-z"placeholder="" name='oneunitsize'>
                          </div>
                          
                          <div class="form-group">

                            <label for="exampleInputPassword1">Price:</label>
                            <input type="text" class="form-control" id="a-z"placeholder="" name='price'>
                          </div>
                          
                          <div class="form-group">

                            <label for="exampleInputPassword1">Measuring Unit:</label>
                            <input type="text" class="form-control" id="a-z"placeholder="" name='unit'>
                          </div>
                          
                          <div class="form-group">

                            <label for="exampleInputPassword1">Quantity:</label>
                            <input type="text" class="form-control" id="a-z"placeholder=""  name='quantity'>
                          </div>
                          
                        

                          <div class="form-group">                  
                <button type="submit" class="btn btn-success btn-block">Add Item</button>
               
              </form></div>
        </div>
       
    </section>
















<!-- 
<form action="ManageItemServlet" method="post">
<input type='hidden' name='action' value='additem'>
<input type='hidden' name='username' value='<%= shopper.getUsername()%>'>
<label>Item Name:</label><input type='text' name='displayName'><br><br>
<label>Category:</label><select name="category">
  
  <%
                                 categories= new DBMImp().getAllCategory();
                            	 itr = categories.iterator();
                            	while(itr.hasNext()){
                            		String cname=itr.next();
                            	
                                %>
                                  <option value='<%= cname%>'><%= cname%></option>
                                <%
                                }
                                %>  
  
  
  <option value="food">Food</option>
  <option value="vegetable">vegetable</option>
  <option value="electronics">Electronics</option>
  <option value="clothes">Clothes</option>
  <option value="utensiles">Utensiles</option>
  <option value="services">Services</option>
  <option value="furniture">Furniture</option>
  <option value="electrical">Electrical</option>
  <option value="other">Other</option>
   
</select><br><br>
<label>One Unit Size:</label><input type='text' name='oneunitsize'><br><br>
<label>Price:</label><input type='text' name='price'><br><br>
<label>Measuring Unit:</label><input type='text' name='unit'><br><br>
<label>Quantity:</label><input type='text' name='quantity'><br><br>
<input type='submit' value='Add Item'><br><br>
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