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
<link rel="stylesheet" type="text/css" href="css/shopperupdate.css">
<title>Shopper Update</title>
</head>
<body>

<%Shopper s= (Shopper)session.getAttribute("shopper");
if(s!=null){
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
                    
                    	
						<a class='mr-2' style="margin-right: 0%; margin-left: auto;color:white;" href='shopperprofile.jsp'><%=s.getUsername() %></a>
						<form action="AuthticationServlet">
						<input type='hidden' name='action' value='logout'>
						<input type='submit' value='Log Out' class="btn btn-success ">
						</form>
    
                          </div>
                        </li>
                    
                    </div>
                  </nav>
    
    </header>
    
    
    
     </header>
    <section class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-md-3">
                <form class="form-container bg-dark text-white" action="AuthticationServlet" method="post">
                
                <input type="hidden" name="action" value="shopperupdate">
                <input type='hidden' name='username' value='<%=s.getUsername()%>'>
                    <h3 class="text-center">Shopper Update </h3>
                <div class="form-group">

                        <label for="exampleInputPassword1">Name:</label>
                        <input type='text' name='sname' value='<%=s.getName()%>' class="form-control" id="a-z" placeholder="Full Name">
                      </div>
                    
                      <div class="form-group">

                            <label for="exampleInputPassword1">Mobile No:</label>
                            <input type='number' name='pno' value='<%=s.getPno()%>' class="form-control" id="a-z"placeholder="Username">
                          </div>
                          <div class="form-group">

                            <label for="exampleInputPassword1">Address:</label>
                            <input type="text" name="address" value='<%=s.getAddress()%>' class="form-control" id="a-z"placeholder="Address">
                          </div>
                          <div class="form-group">

                            <label for="exampleInputPassword1">City:</label>
                            <input type="text" name="city" value='<%=s.getCity()%>' class="form-control" id="a-z"placeholder="City">
                          </div>
                          <div class="form-group">

                            <label for="exampleInputPassword1">State:</label>
                            <input type="text" name="state" value='<%=s.getState()%>' class="form-control" id="a-z"placeholder="State">
                          </div>
                          <div class="form-group">

                            <label for="exampleInputPassword1">Country:</label>
                            <input type="text" name="country" value='<%=s.getCountry()%>' class="form-control" id="a-z"placeholder="Country">
                          </div>


                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type='password' name='password' value='<%=s.getPassword()%>' class="form-control" id="exampleInputPassword1" placeholder="password">
                </div>
                <button type="submit" class="btn btn-primary btn-block">Save</button>
              </form></div>
        </div>
       
    </section>




<!-- 
<form action="AuthticationServlet" method="post">
<input type="hidden" name="action" value="shopperupdate">
<input type='hidden' name='username' value='<%=s.getUsername()%>'><br><br>
<label>Name</label><input type='text' name='sname' value='<%=s.getName()%>'><br><br>
<label>Mobile No.</label><input type='number' name='pno' value='<%=s.getPno()%>'><br><br>
<label>Address</label><input type="text" name="address" value='<%=s.getAddress()%>'><br><br>
<label>City</label><input type="text" name="city" value='<%=s.getCity()%>'><br><br>
<label>State</label><input type="text" name="state" value='<%=s.getState()%>'><br><br>
<label>Country</label><input type="text" name="country" value='<%=s.getCountry()%>'><br><br>
<label>Password</label><input type='password' name='password' value='<%=s.getPassword()%>'><br><br>
<input type='submit' value='Save'>
<!-- <a href='AuthticationServlet?action=logout'>Logout</a>  -->
</form>








<%}
else{
	response.sendRedirect("customerlogin.jsp");
}	
%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>