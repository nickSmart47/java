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
			<h1 class="text-warning">Welcome, ${user.userName}!</h1>
			<a href="/logout">Logout</a>
		</div>
		<div class="d-flex justify-content-between">
			<h3>All Projects </h3>
			<a href="/projects/new" class = "btn btn-success">Add new Project</a>
		</div>
		<table class="table mt-3 table-dark">
			<tr class="table-dark">
				<th>Project</th>
				<th>Team Lead</th>
				<th>Due Date</th>
				<th>Actions</th>


			</tr>
			<c:forEach items="${projectsUserNotIn}" var="project">
					<tr>
						<td><a href="/projects/${project.id}">${project.title}</a></td>
						<td>${project.leader.userName}</td>
						<td>${project.getFormattedDueDate()}</td>
						<c:choose>
							<c:when test="${project.leader.getId() == loggedInUserID}">
								<td class="d-flex gap-3">
									<a href="/projects/edit/${project.id}"
									class="btn btn-success ">Edit</a>
									<!-- <form action="/projects/${project.id}" method="post">
										<input type="hidden" name="_method" value="delete"> <input
										type="submit" value="Delete" class="btn btn-danger">
									</form> -->
								</td>
							</td>
						</c:when>
						<c:otherwise>
							
							<td>
									<form action="/projects/join/${project.id}" method="post">
										<input type="hidden" name="_method" value="put"> <input
										type="submit" value="Join Team" class="btn btn-warning">
									</form>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
		</table>

		<div class="d-flex justify-content-between">
			<h3>Your Projects </h3>
		</div>
		<table class="table table-dark mt-3">
			<tr class="table-dark">
				<th>Title</th>
				<th>Team Lead</th>
				<th>Due Date</th>
				<th>Actions</th>


			</tr>
			<c:forEach items="${loggedInUserProjects}" var="project">
					<tr>
						<td><a href="/projects/${project.id}">${project.title}</a></td>
						<td>${project.leader.userName}</td>
						<td>${project.getFormattedDueDate()}</td>
						<c:choose>
							<c:when test="${project.leader.getId() == loggedInUserID}">
								<td class="d-flex gap-3">
									<a href="/projects/edit/${project.id}"
									class="btn btn-success ">Edit</a>
									
								</td>
							</td>
						</c:when>
						<c:otherwise>
							
							<td>
									<form action="/projects/leave/${project.id}" method="post">
										<input type="hidden" name="_method" value="put"> <input
										type="submit" value="leave Team" class="btn btn-secondary">
									</form>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
		</table>
	</div>
	<!-- End of Container -->
</body>
</html>