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
						<title>Save Travels</title>
						<!-- Bootstrap -->
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
							crossorigin="anonymous">

					</head>

					<body>
						<div class="container">
							<!-- Beginning of Container -->
							<table class="table table-dark">
								<thead>
									<tr>
										<th scope="col">Expense</th>
										<th scope="col">Vendor</th>
										<th scope="col">Amount</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${expenses}" var="expense">

										<tr>
											<td>${expense.name}</td>
											<td>${expense.vendor}</td>
											<td>$ ${expense.amount}</td>
											<td><a href="/expenses/edit/${expense.id}">Edit</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<h1>Add an expense</h1>
							<form:form action="/expenses" method="post" modelAttribute="expense" class="form-group">
									<div class = "d-flex flex-column gap-2 text-danger align-items-center">
									
									<form:errors path="name" />
									<form:errors path="vendor" />
									<form:errors path="amount" />
									<form:errors path="description" />
									</div>
								<p class="d-flex gap-3 mt-2">
									<form:label path="name">Expense Name:</form:label>
									<form:input path="name" class="form-control" />
								</p>
								<p class="d-flex gap-3">
									<form:label path="vendor">Vendor</form:label>
									<form:input path="vendor" class="form-control" />
								</p>
								<p class="d-flex gap-3">
									<form:label path="amount">Amount</form:label>
									<form:input path="amount" type="number" step="0.01" class="form-control" />
								</p>
								<p class="d-flex gap-3">
									<form:label path="description">Description</form:label>
									<form:textarea path="description" class="form-control" />
								</p>
								<input type="submit" value="Submit" class="btn btn-primary" />
							</form:form>
						</div>
						<!-- End of Container -->
					</body>

					</html>