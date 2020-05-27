<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.solution.db.DBMImp"%>
<%@page import="com.solution.bean.Item"%>
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
    <link rel="stylesheet" type="text/css" href="css/style.css">
<title>Shopper Profile</title>
</head>
<body>
<%
Shopper shopper = (Shopper)session.getAttribute("shopper");
//session.setAttribute("shopper", shopper);
if(shopper!=null){

%>
<!-- 
<a href='shopperupdate.jsp'>edit</a>
<a href='AuthticationServlet?action=logout'>Logout</a>
<a href='additem.jsp'>Add item</a>
<a href='search.jsp'>search</a>
<a href='shopperlog.jsp'>Log</a>
 -->
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
                 		<a class='mr-2' style="margin-right: 0%; margin-left: auto;color:white;" ><%=shopper.getUsername() %></a>
                 		<form action="shopperlog.jsp" >
						<input type='submit' value='Log' class="btn btn-danger ml-auto mx-2">
						</form>
                 		<form action="additem.jsp" >
						<input type='submit' value='Add Item' class="btn btn-warning ml-auto mx-4" '>
						</form>
                        <form action="shopperupdate.jsp" >
						<input type='submit' value='Edit' class="btn btn-primary ml-auto mx-2">
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




<h1 style='margin-left: auto;margin-right: auto;'><u>Items you are selling</u></h1>



<div class="table-responsive">
<table class="table table-striped table-hover ">
  <thead>
  <tr>
    <th>Item Name</th>
    <th>One Unit Size</th>
    <th>Quantity</th>
    <th>Unit</th>
    <th>Price</th>
    <th>Update Item</th>
  </tr>
  </thead>
<%
List<Item> items = new DBMImp().getUserItems(shopper.getUsername());
Iterator<Item> itr = items.iterator();
while(itr.hasNext()){
	Item item = itr.next();
%>

  <tr>
    <td><%=item.getDname() %></td>
    <td><%=item.getOneunitsize() %></td>
    <td><%=item.getQuantity() %></td>
    <td><%= item.getUnit() %></td>
    <td><%= item.getPrice() %></td>
    <td><form action="updateitem.jsp" method="post">
<input type='hidden' name='action' value='additem'>
<input type='hidden' name='iid' value='<%= item.getIid()%>'>
<input type='hidden' name='username' value='<%= item.getUsername()%>'>
<input type='hidden' name='displayname' value='<%= item.getDname()%>'>
<input type='hidden' name="category" value='<%= item.getCategory()%>'>
<input type='hidden' name='oneunitsize' value='<%= item.getOneunitsize()%>'>
<input type='hidden' name='unit' value='<%= item.getUnit()%>'>
<input type='hidden' name='quantity' value='<%= item.getQuantity()%>'>
<input type='hidden' name='price' value='<%= item.getPrice()%>'>
<input type='submit' value='Update Item Details'>

</form></td>
  </tr>


<%
}
}
else{
	response.sendRedirect("shopperlogin.jsp");
}
%>
</table>
</div>
</body>
</html>