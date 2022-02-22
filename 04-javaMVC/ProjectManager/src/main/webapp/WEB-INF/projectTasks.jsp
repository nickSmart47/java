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
            <title>Project Tasks</title>
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

          </head>

          <body>
            <div class="container bg-light p-2">
              <!-- Beginning of Container -->
              <div class="d-flex justify-content-between">
                <h1>Project: ${project.title}</h1>
                <a href="/dashboard">Back to Dashboard</a>
              </div>
              <br>
              <h3>Project Lead: ${project.leader.getUserName()}</h3>
              <br>
              <form action="/projects/tasks/{id}" method="put">
                <div class="form-group d-flex mt-2 align-items-center mt-3">
                  <label for="task">Add a task ticket for the team:</label>
                  <textarea name="task" class="form-control" id="" cols="20" rows="7"></textarea>
                </div>
                <div class="position-relative">
                  <input type="submit" value="Submit" class="btn btn-primary position-absolute top-0 end-0 mt-3">

                </div>
              </form>

              <div style="width: 80%; height: 300px; overflow: scroll;" class="border border-secondary p-5 m-3">
                <ul class="list-group">
                  <c:forEach var="task" items="${tasks}">
                    <li class="list-group-item">
                      <c:out value="${task}"></c:out>
                    </li>
                  </c:forEach>
                </ul>
              </div>
            </div> <!-- End of Container -->
          </body>

          </html>