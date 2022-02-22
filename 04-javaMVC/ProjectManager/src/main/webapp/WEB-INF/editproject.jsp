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
            <title>Edit Project</title>
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

          </head>

          <body>
            <div class="container">
              <div class="d-flex  justify-content-around align-items-center gap-2">
                <h1>Change your Entry</h1>
                <a href="/dashboard">Back to the Dashboard</a>
              </div>
              <form:form class="" action="/projects/edit/${project.id}" method="put" modelAttribute="project">
                <div class="d-flex flex-column gap-3 mt-3 ">
                  <form:errors path="title" class="errors text-danger"></form:errors>
                  <div class=" d-flex justify-content-center align-items-center gap-2">
                    <form:label path="title">Project Title: </form:label>
                    <form:input class="form-control" type="text" path="title"></form:input>
                  </div>
                  <form:errors path="description" class="errors text-danger"></form:errors>
                  <div class=" d-flex   justify-content-center align-items-center gap-2">
                    <form:label path="description">Project Description: </form:label>
                    <form:input class="form-control" type="text" path="description"></form:input>
                  </div>
                  <form:errors path="dueDate" class="errors text-danger"></form:errors>
                  <div class=" d-flex  justify-content-center align-items-center gap-2">
                    <form:label path="dueDate">Due Date: </form:label>
                    <form:input class="form-control" path="dueDate" type="date"></form:input>
                  </div>
                  <div class = "d-flex gap-3">
                    <a  href="/dashboard"  class = "w-50 btn btn-secondary">Cancel</a>
                    <input class="w-50 btn btn-success" type="submit" value="Submit" />
                  </div>
                </div>
              </form:form>

          </body>

          </html>