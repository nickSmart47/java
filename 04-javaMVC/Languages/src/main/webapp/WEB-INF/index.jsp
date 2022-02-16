<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Languages</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
        <h1>Languages</h1>
        <table class="table table-dark">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Creator</th>
					<th scope="col">Version</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${languages}" var="language">

					<tr>
						<td><a href="/languages/${language.id}" class="text-warning">${language.name}</a></td>
						<td>${language.creator}</td>
						<td>${language.currentVersion}</td>
						<td class="d-flex gap-5"><a
							href="/languages/edit/${language.id}" class="btn btn-primary">Edit</a>
							<form action="/languages/${language.id}" method="post">
								<input type="hidden" name="_method" value="delete"> <input
									type="submit" value="Delete" class="btn btn-danger">
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h1>Add a Language</h1>
		<form:form action="/languages" method="post" modelAttribute="language"
			class="form-group">
			<div class="d-flex flex-column gap-2 text-danger align-items-center">

				<form:errors path="name" />
				<form:errors path="creator" />
				<form:errors path="currentVersion" />
			</div>
			<p class="d-flex gap-3 mt-2">
				<form:label path="name">Language Name: </form:label>
				<form:input path="name" class="form-control" />
			</p>
			<p class="d-flex gap-3">
				<form:label path="creator">Creator: </form:label>
				<form:input path="creator" class="form-control" />
			</p>
			<p class="d-flex gap-3">
				<form:label path="currentVersion">Version: </form:label>
				<form:input path="currentVersion" 
					class="form-control" />
			</p>
			<div class="d-flex justify-content-end">

				<input type="submit" value="Submit" class="btn btn-primary" />
			</div>
		</form:form>
    </div> <!-- End of Container -->
</body>
</html>