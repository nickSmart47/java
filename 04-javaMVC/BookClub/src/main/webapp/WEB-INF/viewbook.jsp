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
            <title>Read Share</title>
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

          </head>

          <body>
            <div class="container d-flex flex-column gap-3">
              <!-- Beginning of Container -->
              <div class="d-flex justify-content-between">
                <h1>${book.title}</h1>
                <a href="/home">back to the shelves</a>
              </div>
              
              <c:choose>
                <c:when test="${book.user.getId() == loggedInUserID}">
                  <h2>You read ${book.title} by ${book.author}</h2>
                  <h3>Here are your thoughts:</h3>
                </c:when>
                <c:otherwise>
                  <h2>${book.user.userName} read ${book.title} by ${book.author}</h2>
                  <h3>Here are ${book.user.userName}'s thoughts:</h3>
                </c:otherwise>
              </c:choose>

              <hr>
              <p>${book.thoughts}</p>
              <hr>
              <c:if test="${book.user.getId() == loggedInUserID}">
                <a href="/books/${book.id}/edit" class="btn btn-success"> Edit</a>
              </c:if>
            </div> <!-- End of Container -->
          </body>

          </html>