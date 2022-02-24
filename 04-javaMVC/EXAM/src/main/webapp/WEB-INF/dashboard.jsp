<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- c:out ; c:forEach ; c:if -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (like dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<!-- Beginning of Container -->
		<div class="d-flex justify-content-between">
			<h1>Welcome, ${user.userName}!</h1>
			<a href="/logout">Logout</a>
		</div>
		<h3>Tv Shows</h3>
		<table class="table mt-3 table-dark">
			<tr class="table-dark">
				<th>Show</th>
				<th>Network</th>
				<th>Average Rating</th>


			</tr>
			<c:forEach items="${shows}" var="show">
					<tr>
						<td><a href="/shows/${show.id}">${show.title}</a></td>
						<td>${show.network}</td>
						<td>${show.getAverageRating()}</td>
						
					</tr>
				</c:forEach>
		</table>
		<a href="/shows/new" class = "btn btn-primary">Add a Show</a>

	</div>
	<!-- End of Container -->
</body>
</html>