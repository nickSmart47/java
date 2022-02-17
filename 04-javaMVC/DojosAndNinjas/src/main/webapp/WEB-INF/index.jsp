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
<title>Dojos and Ninjas</title>
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
		<div class="d-flex justify-content-center gap-5">
			<a  href="/dojos"><button class="btn btn-secondary">Dashboard</button></a>
			<a  href="/ninjas/new"><button class="btn btn-secondary">Register a new Ninja</button></a>
		</div>
		<div class="m-2 p-3 bg-light d-flex flex-column align-items-center">
			<h1>New Dojo</h1>
			<form:form class="form d-flex flex-column gap-3" action="/dojos" method="post"
				modelAttribute="dojo">
				<div class=" d-flex justify-content-center align-items-center gap-2">
					<form:errors path="location" class="errors"></form:errors>
					<form:label path="location">Location: </form:label>
					<form:input class = "form-control" type="text" path="location"></form:input>
					<input class = "w-50 btn btn-primary" type="submit" value="Create" />
				</div>
			</form:form>
		</div>

		<div class="m-3">
			<h2>Current Dojos</h2>
			<table class="table mt-3">
				<tr class="table-info">
					<th>Location</th>
					<th>Actions</th>
				</tr>
				<c:forEach items="${dojos}" var="dojo">
					<tr>
						<td>${dojo.location}</td>
						<td><a href="/dojos/${dojo.id}">See Ninjas</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- End of Container -->
</body>
</html>