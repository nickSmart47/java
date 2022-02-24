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
            <title>TV Show Details</title>
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

          </head>

          <body>
            <div class="container d-flex flex-column gap-3">
              <!-- Beginning of Container -->
              <div class="d-flex justify-content-between">
                <h1>${show.title}</h1>
                <a href="/shows">Back to Dashboard</a>
              </div>

              <div class="d-flex flex-column">
                <hr>
                <p><strong>Posted by:</strong> ${show.poster.userName}</p>
                <hr>
                <p><strong>Network:</strong> ${show.network}</p>
                <hr>
                <p><strong>Description:</strong> ${show.description}</p>
              </div>
              <c:if test="${show.poster.id == loggedInUserID}">
                <a href="/shows/${show.id}/edit" class="btn btn-success w-25"> Edit</a>
              </c:if>

              <hr>
              <table class="table table-info">
                <th>Name</th>
                <th>Rating</th>
                <c:forEach items="${showRatings}" var = "rating">
                  <tr>
                    <td>${rating.user.userName}</td>
                    <td>${rating.ratingValue}</td>
                  </tr>
                </c:forEach>
              </table>
              <div class = "d-flex gap-4 justify-content-center">
                <form:form class = "" action="/shows/${show.id}/rate" method="post" modelAttribute="newRating">
                  <form:errors path="ratingValue" class="errors text-danger"></form:errors>
                  <form:label path="ratingValue">Leave a Rating: </form:label>
                  <form:input type="number" step = "any" path="ratingValue"></form:input>
                  <input type="submit" value="Rate!" class = "btn btn-warning">
                </form:form>
              </div>
            </div> <!-- End of Container -->
          </body>

          </html>