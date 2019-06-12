<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

<style type="text/css">

#bt {
  background-color: DeepSkyBlue; 
  border: none;
  color: white;
  padding: 10px 40px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

#ted{
background-color: DeepSkyBlue; font-weight: bold;
size:100px; font-family: inherit; padding-top: 20px;
color:white; height: 100px; width: 100px;
}

</style>


</head>
<body style="background-color: white">

	<h1 style="color: Green; text-align: center;">Welcome to Bookstore IT books</h1>
	<hr>
	<div class="container" style="height: 200px; width: 50%; text-align: center">
		<c:if test="${not empty books}">
		<c:forEach var = "i" begin = "0" end = "2">    
	        <table   class="table" >
						<tr>
							<td id="ted" >
								<h3>${books[i].id}</h3>
							</td>
							<td style=" font-weight: bold; font-family: inherit;">	
							  <p>${books[i].name}</p>  
							  <h3> ${books[i].price}  &euro;</h3>
						    </td>
						    <td style="padding-top:30px">
						    	<form id="book" action="/bookdetail" method="post">
								  <input type="hidden" name="bookId" value="${books[i].id}">
								  <input type="hidden" name="userEmail" value="${user}">  
								  <input id="bt" type="submit" value="More >>" >
								</form>
						    </td>
						</tr>
				</table> 
	      </c:forEach>	
	      </c:if>
	      <c:if test="${not empty error}"> <h1>${error}</h1></c:if>
	</div>

	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>