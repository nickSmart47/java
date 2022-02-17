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
<title>Title Here</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
      <div class="d-flex justify-content-center gap-5">
        <a  href="/dojos"><button class="btn btn-secondary">Dashboard</button></a>
        <a  href="/ninjas/new"><button class="btn btn-secondary">Register a new Ninja</button></a>
      </div>
      <h2>${dojo.location} Ninjas</h2>
			<table class="table mt-3">
				<tr class="table-info">
					<th>First Name</th>
					<th>Last Name</th>
					<th>Age</th>

				</tr>
				<c:forEach items="${dojo.ninjas}" var="ninja">
					<tr>
						<td>${ninja.firstName}</td>
						<td>${ninja.lastName}</td>
						<td>${ninja.age}</td>

					</tr>
				</c:forEach>
			</table>
    </div> <!-- End of Container -->
</body>
</html>