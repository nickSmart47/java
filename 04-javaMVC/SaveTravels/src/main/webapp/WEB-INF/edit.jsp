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
<title>Edit Expense</title>
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
		<div class="d-flex justify-content-between align-items-center">
		<h1 class = "text-success">Edit Expense</h1>
		<a href="/expenses">Go back</a>
		</div>
		<form:form action="/expenses/${expense.id}" method="put" modelAttribute="expense"
			class="form-group">
			<div class="d-flex flex-column gap-2 text-danger align-items-center">

				<form:errors path="name" />
				<form:errors path="vendor" />
				<form:errors path="amount" />
				<form:errors path="description" />
			</div>
			<p class="d-flex gap-3 mt-2">
				<form:label path="name">Expense Name:</form:label>
				<form:input path="name" class="form-control" value = "${expense.name}" />
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
			<input type="submit" value="Submit" class="btn btn-success" />
		</form:form>
	</div>
	<!-- End of Container -->
</body>
</html>