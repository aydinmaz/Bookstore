<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
    
<style>
body {background-color: bisque;}
h3   {font-family: verdana;
    font-size: 100%;
    text-align:center;}
p    {color: red;}
ul {
    list-style-type: none;
    margin: 0;
    padding: 50;
    overflow: hidden;
    background-color: #333333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111111;
}
.column {
    float: left;
    width: 33.33%;
    padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
    content: "";
    clear: both;
    display: table;
}
td#a
{
 color:Black;
}
td#b
{color:blue}
</style>


</head>
<body >

         <h1 style="color:DodgerBlue;text-align: center;" >Welcome to Wineshop </h1>
           <h3>Please first register your information and then order your wine</h3>
            <hr>

           
         <nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <ul class="nav navbar-nav">
		      
		      <li><a class="navbar-brand" href="registration">  Register your information </a></li>
		   
		    </ul>
		    <ul class="nav navbar-nav navbar-right">

		      <li> 

		    </ul>
		  </div>
		</nav>
						<div class="row" >
							 <div class="column">
							 <img src="/resources/images/pinkwine.jpg"  style=" width:100%;">
							  </div>
							  <div class="column">
							  <img src="/resources/images/redwine.jpg" style="width:100%">
							  </div>
							  <div class="column">
							  <img src="/resources/images/whitewine.jpg" style="width:100%">
							  </div>
						</div>	
						
						<div class="container" style="height: 200px; width: 50%; text-align: center">
						<c:if test="${userList != null}">
							<c:forEach items="${userList}" var="user"  >
							<table id="usertable" class="table table-bordered"  
							style="background-color: #33ff33; font-weight: bold; color: Red; font-family: italic">
							<tr>
							  <td id="a">Name</td>
							  <td>${user.name}</td>
							</tr>
							<tr>
							  <td id="a">Surname</td>
							  <td>${user.surname}</td>
							</tr>
							<tr>
							  <td id="a">Email</td>
							  <td>${user.email}</td>
							</tr>
							<tr>
							  <td id="a">Address</td>
							  <td>${user.address}</td>
							</tr>
							<tr>
							  <td id="a">City</td>
							  <td>${user.city}</td>
							</tr>
							<c:forEach items="${user.wines}" var="item"
												varStatus="status">
								<tr>
								  <td id="b">${item.name}</td>
								  <td>${item.quantity}</td>
								</tr>
							</c:forEach>
							</table>
							<br><br>
							</c:forEach>
						</c:if>
						</div>
						
						

<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>