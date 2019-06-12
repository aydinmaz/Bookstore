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

<style>
body {
	background-color: bisque;
}

h3 {
	font-family: verdana;
	font-size: 100%;
	text-align: center;
}

p {
	color: red;
}

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
</style>


</head>
<body>
	<%-- <h1 style="color:DodgerBlue;text-align: center;" >Welcome to Finsoft ${currentuser}  </h1> --%>
	<h1 style="color: Green; text-align: center;">Welcome to Wineshop
	</h1>
	<h2 style="text-align: center;">Please order your wine</h2>
	<hr>

	<div class="container"
		style="height: 200px; width: 50%; text-align: center">
		<form id="wineee" action="/reservation" method="post">
			<table id="caio1" class="table table-bordered">
				<thead>
					<tr
						style="background-color: #b3b3ff; font-weight: bold; color: Red; font-family: italic">
						<td style="background-color: #8080ff">Wine Type</td>
						<td>Quantity</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td
							style="background-color: #b3b3ff; font-weight: bold; font-family: inherit;">White
							Wine</td>
						<td>Quantity (between 1 and 100): <input type="number"
							name="whitee" min="0" max="100" value="0">
						</td>
					</tr>
					<tr>
						<td
							style="background-color: #b3b3ff; font-weight: bold; font-family: inherit;">Red
							Wine</td>
						<td>Quantity (between 1 and 100): <input type="number"
							name="redd" min="0" max="100" value="0">
						</td>
					</tr>
					<tr>
						<td
							style="background-color: #b3b3ff; font-weight: bold; font-family: inherit;">Pink
							Wine</td>
						<td>Quantity (between 1 and 100): <input type="number"
							name="pinkk" min="0" max="100" value="0">
						</td>
					</tr>
				</tbody>
			</table>

			<input type="hidden" name="user_name" value="${user_info}">
			<input type="submit" value="Submit">
		</form>
	</div>

	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>