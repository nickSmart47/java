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
<title>Save Travels</title>
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
		<h1>Save Travels</h1>
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
						<td><a href="/expenses/${expense.id}" class= "text-warning">${expense.name}</a></td>
						<td>${expense.vendor}</td>
						<td>$ ${expense.amount}</td>
						<td class = "d-flex gap-5"><a href="/expenses/edit/${expense.id}" class = "btn btn-primary">Edit</a>
							<form action="/expenses/${expense.id}" method="post">
								<input type="hidden" name="_method" value="delete"> <input
									type="submit" value="Delete" class = "btn btn-danger">
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h1 >Add an expense</h1>
		<form:form action="/expenses" method="post" modelAttribute="expense"
			class="form-group">
			<div class="d-flex flex-column gap-2 text-danger align-items-center">

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
				<form:input path="amount" type="number" step="0.01"
					class="form-control" />
			</p>
			<p class="d-flex gap-3">
				<form:label path="description">Description</form:label>
				<form:textarea path="description" class="form-control" />
			</p>
			<div class="d-flex justify-content-end">
			
			<input type="submit" value="Submit" class="btn btn-primary" />
			</div>
		</form:form>
	</div>
	<!-- End of Container -->
</body>

</html>