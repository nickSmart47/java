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
<title>Project Details</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
            <div class="container d-flex flex-column gap-3">
              <!-- Beginning of Container -->
              <div class="d-flex justify-content-between">
                <h1>${project.title}</h1>
                <a href="/dashboard">Back to Dashboard</a>
              </div>
              
              <div class = "d-flex flex-column">
                <hr>
                <p><strong>Project Title:</strong> ${project.title}</p>
                <hr>
                <p><strong>Project Description:</strong> ${project.description}</p>
                <hr>
                <p><strong>Due Date:</strong> ${project.getFormattedDueDate()}</p>
              </div>
              <c:if test="${project.leader.getId() == loggedInUserID}">
                <div class = "d-flex justify-content-between">
                  <a href="/projects/tasks/${project.id}">See Tasks</a>
                  <a href="/projects/edit/${project.id}" class="btn btn-success w-50"> Edit</a>
                  <form action="/projects/${project.id}" method="post">
                    <input type="hidden" name="_method" value="delete"> <input
                      type="submit" value="Delete" class="btn btn-danger">
                  </form>
                </div>
              </c:if>
            </div> <!-- End of Container -->
          </body>
</html>