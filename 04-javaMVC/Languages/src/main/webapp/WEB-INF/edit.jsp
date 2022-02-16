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
<title>Edit language</title>
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
		<h1 class = "text-success">Edit Language</h1>
		<div class="d-flex justify-content-end gap-4">
			<form action="/languages/${language.id}" method="post">
			  <input type="hidden" name="_method" value="delete"> <input
				type="submit" value="Delete" class="btn btn-danger">
			</form>
				<a class = "btn btn-primary"href="/languages">Dashboard</a>
		  </div>
		</div>
		<form:form action="/languages/${language.id}" method="put" modelAttribute="language"
			class="form-group">
			<div class="d-flex flex-column gap-2 text-danger align-items-center">

				<form:errors path="name" />
				<form:errors path="creator" />
				<form:errors path="currentVersion" />
			</div>
			<p class="d-flex gap-3 mt-2">
				<form:label path="name">Language Name:</form:label>
				<form:input path="name" class="form-control" value = "${language.name}" />
			</p>
			<p class="d-flex gap-3">
				<form:label path="creator">Creator: </form:label>
				<form:input path="creator" class="form-control" />
			</p>
			<p class="d-flex gap-3">
				<form:label path="currentVersion">Current Version: </form:label>
				<form:input path="currentVersion" type="number" step="0.01"
					class="form-control" />
			</p>
			
			<input type="submit" value="Submit" class="btn btn-success" />
		</form:form>
	</div>
	<!-- End of Container -->
</body>
</html>