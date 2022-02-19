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
<title>Read Share</title>
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
		<div class="d-flex justify-content-between">
			<h3>Books from Everyone's shelves: </h3>
			<a href="/books/new">Add a book to my shelf!</a>
		</div>
		<table class="table mt-3">
			<tr class="table-info">
				<th>Id</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Posted By</th>

			</tr>
			<c:forEach items="${books}" var="book">
				<tr>
					<td>${book.id}</td>
					<td><a href="/books/${book.id}">${book.title}</a></td>
					<td>${book.author}</td>
					<td>${book.user.userName}</td>
				</tr>
			</c:forEach>
		</table>
		

	</div>
	<!-- End of Container -->
</body>
</html>