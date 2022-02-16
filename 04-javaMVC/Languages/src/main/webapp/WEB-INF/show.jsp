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
<title>language Details</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
		<div class="d-flex justify-content-between align-items-center">
		<h1 class = "text-primary">Language Details</h1>
    <div class="d-flex justify-content-end gap-4">
      <form action="/languages/${language.id}" method="post">
        <input type="hidden" name="_method" value="delete"> <input
          type="submit" value="Delete" class="btn btn-danger">
      </form>
          <a class = "btn btn-primary"href="/languages">Dashboard</a>
    </div>
		</div>
        <div class="container bg-dark text-light p-3">
		<p>Language Name: ${language.name}</p>
		<p>Creator Name: ${language.creator}</p>
		<p>Current Version: ${language.currentVersion}</p>
	</div>
    </div> <!-- End of Container -->
</body>
</html>