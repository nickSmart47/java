<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!-- c:out ; c:forEach ; c:if -->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!-- Formatting (like dates) -->
		<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!-- form:form -->
			<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<!-- for rendering errors on PUT routes -->
				<%@ page isErrorPage="true" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>Dashboard</title>
						<!-- Bootstrap -->
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
							crossorigin="anonymous">

					</head>

					<body>
						<div class="container">
							<div class="d-flex flex-column justify-content-center align-items-center gap-2">
								<h1>Add a Book to your Shelf!</h1>
							</div>
							<form:form class="" action="/books/${book.id}" method="put" modelAttribute="book">
								<div class="d-flex flex-column gap-3 mt-3 ">
									<form:errors path="title" class="errors text-danger"></form:errors>
									<div class=" d-flex justify-content-center align-items-center gap-2">
										<form:label path="title">Title: </form:label>
										<form:input class="form-control" type="text" path="title"></form:input>
									</div>
									<form:errors path="author" class="errors text-danger"></form:errors>
									<div class=" d-flex   justify-content-center align-items-center gap-2">
										<form:label path="author">Author: </form:label>
										<form:input class="form-control" type="text" path="author"></form:input>
									</div>
									<form:errors path="thoughts" class="errors text-danger"></form:errors>
									<div class=" d-flex  justify-content-center align-items-center gap-2">
										<form:label path="thoughts">My thoughts: </form:label>
										<form:textarea class="form-control" path="thoughts" rows="5" columns="50" />
									</div>
									<form:hidden path = "user" value="${userId}"></form:hidden>
									<div class="d-flex justify-content-center">
										<input class="w-50 btn btn-success" type="submit" value="Submit" />
									</div>
								</div>
							</form:form>
					</body>

					</html>