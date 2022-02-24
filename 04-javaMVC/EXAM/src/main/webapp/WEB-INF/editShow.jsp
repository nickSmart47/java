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
<title>Edit TV Show</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
  <div class="container">
    <div class="d-flex flex-column justify-content-center align-items-center gap-2">
      <h1>${editShow.title}</h1>
    </div>
    <form:form class="" action="/shows/${editShow.id}/edit" method="put" modelAttribute="editShow">
      <div class="d-flex flex-column gap-3 mt-3 ">
        <form:errors path="title" class="errors text-danger"></form:errors>
        <div class=" d-flex justify-content-center align-items-center gap-2">
          <form:label path="title">Title: </form:label>
          <form:input class="form-control" type="text" path="title"></form:input>
        </div>
        <form:errors path="network" class="errors text-danger"></form:errors>
        <div class=" d-flex  justify-content-center align-items-center gap-2">
          <form:label path="network">Network: </form:label>
          <form:input class="form-control" type="text" path="network" ></form:input>
        </div>
        <form:errors path="description" class="errors text-danger"></form:errors>
        <div class=" d-flex   justify-content-center align-items-center gap-2">
          <form:label path="description">Description: </form:label>
          <form:textarea class="form-control" type="text" path="description" rows="5"></form:textarea>
        </div>
        <div class="d-flex justify-content-center gap-3">
          <a class="w-25 btn btn-secondary" href="/shows">Cancel</a>
          <input class="w-25 btn btn-success" type="submit" value="Submit" />
        </div>
      </div>
    </form:form>
    <form action="/shows/${editShow.id}" method="post">
      <input type="hidden" name="_method" value="delete"> <input
      type="submit" value="Delete" class="btn btn-danger">
    </form>
</body>
</html>