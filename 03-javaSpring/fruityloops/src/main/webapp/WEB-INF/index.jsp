<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fruit Store</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container p-5">
		<h1 class = "d-flex justify-content-center bg-dark text-light">Fruit Store</h1>
		<table class="table table-dark border border-primary">
			<tr>
				<th>Name</th>
				<th>Price</th>
			</tr>
			<c:forEach var="fruit" items="${fruits}">
				<tr>

					<td><c:out value="${fruit.name}"></c:out></td>
					<td><c:out value="${fruit.price}"></c:out></td>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>