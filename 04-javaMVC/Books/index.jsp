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
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${expenses}" var="expense">

										<tr>
											<th scope="row">${expense.id}</th>
											<td><a href="/expenses/${expense.id}">${expense.name}</a></td>
											<td>${expense.vendor}</td>
											<td>${expense.amount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<h1>Add an expense</h1>
							<form:form action="/books" method="post" modelAttribute="expense" class="form-group">
								<p class="d-flex gap-3">
									<form:label path="name">Expense Name:</form:label>
									<form:errors path="name" />
									<form:input path="name" class="form-control" />
								</p>
								<p class="d-flex gap-3">
									<form:label path="vendor">Vendor</form:label>
									<form:errors path="vendor" />
									<form:input path="vendor" class="form-control" />
								</p>
								<p class="d-flex gap-3">
									<form:label path="amount">Amount</form:label>
									<form:errors path="amount" />
									<form:input path="amount" type="number" class="form-control" />
								</p>
								<p class="d-flex gap-3">
									<form:label path="description">Description</form:label>
									<form:errors path="description" />
									<form:textarea path="description" class="form-control" />
								</p>
								<input type="submit" value="Submit" class="btn btn-primary" />
							</form:form>
						</div>
						<!-- End of Container -->
					</body>

					</html>