<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<title>Bookstore login</title>


<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div>

		<form:form method="POST" modelAttribute="userForm" class="form-signin">
			<h2 class="form-signin-heading">bookstore login</h2>
        <hr class="style2">
			<br>
			<spring:bind path="email">
				<div class="form-group ">
					<form:input type="email" path="email" class="form-control"
						placeholder="email"></form:input>
				</div>
			</spring:bind>
		
			<spring:bind path="password">
				<div class="form-group ">
					<form:input type="password" path="password" class="form-control"
						placeholder="password"></form:input>
					
				</div>
			</spring:bind>


			<!--  <button type="button" class="btn btn-info" >success</button>  -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			
		</form:form>
		
		
		
<h4 style="text-align:center;color:red;">${error[0]}</h4>
<h4 style="text-align:center;color:red;">${error[1]}</h4>


	</div>
	<!-- /container -->

</body>
</html>