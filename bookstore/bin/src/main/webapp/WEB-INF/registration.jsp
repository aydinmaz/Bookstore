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

<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div class="container" align="center">

		<form:form method="POST" modelAttribute="userForm" class="form-signin">
			<h2 class="form-signin-heading">Create your account</h2>
			<spring:bind path="username">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="username" class="form-control"
						placeholder="Username" autofocus="true"></form:input>
					<form:errors path="username"></form:errors>
				</div>
			</spring:bind>
			<br>
			<spring:bind path="name">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="name" path="name" class="form-control"
						placeholder="name"></form:input>
					<form:errors path="name"></form:errors>
				</div>
			</spring:bind>
			<br>
			<spring:bind path="surname">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="surname" path="surname" class="form-control"
						placeholder="surname"></form:input>
					<form:errors path="surname"></form:errors>
				</div>
			</spring:bind>
			<br>
			<br>
			<spring:bind path="birthdate" >
				<div class="form-group ${status.error ? 'has-error' : ''}">
					
					<form:input type="number" path="birthdate" class="form-control"
						 label="age" ></form:input> 
					<form:errors path="birthdate"></form:errors>
				</div>
			</spring:bind>
			<br>
			<spring:bind path="email">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="email" path="email" class="form-control"
						placeholder="email"></form:input>
					<form:errors path="email"></form:errors>
				</div>
			</spring:bind>
			<br>
			<spring:bind path="address">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="address" class="form-control"
						placeholder="address"></form:input>
					<form:errors path="address"></form:errors>
				</div>
			</spring:bind>

			<br>
			<spring:bind path="city">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:select type="text" path="city" class="form-control"
						placeholder="city" autofocus="true">

						<option value="Bologna">Bologna</option>
						<option value="Rome">Rome</option>
						<option value="Milan">Milan</option>
						<option value="Verona">Verona</option>
						<option value="Parma">Parma</option>
						<option value="Ferrara">Ferrara</option>
						<option value="Siena">Siena</option>
						<option value="Palermo">Palermo</option>
					</form:select>
					<form:errors path="city"></form:errors>
				</div>
			</spring:bind>
			<br>

			<!--  <button type="button" class="btn btn-info" >success</button>  -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>


		</form:form>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>