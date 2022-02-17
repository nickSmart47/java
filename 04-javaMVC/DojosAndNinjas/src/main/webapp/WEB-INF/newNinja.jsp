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
            <title>Title Here</title>
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

          </head>

          <body>
            <div class="container">
              <!-- Beginning of Container -->
              <div class="d-flex justify-content-center gap-5">
                <a  href="/dojos"><button class="btn btn-secondary">Dashboard</button></a>
                <a  href="/ninjas/new"><button class="btn btn-secondary">Register a new Ninja</button></a>
              </div>
              <h1>New Ninja</h1>

              <form:form class="form d-flex flex-column gap-3" action="/ninjas/new" method="post" modelAttribute="ninja">

                <div class="form-group  d-flex justify-content-center align-items-center gap-2">
                  <form:errors path="dojo" class="errors text-danger"></form:errors>
                  <form:label path="dojo">Dojo: </form:label>
                  <form:select class = "form-control" name="dojo" path="dojo">
                    <c:forEach items="${dojos}" var="dojo">
                      <form:option path="dojo" value="${dojo.id}">${dojo.location}</form:option>
                    </c:forEach>
                  </form:select>
                </div>
                <div class="foform-group  d-flex justify-content-center align-items-center gap-2">
                  <form:errors path="firstName" class="errors text-danger"></form:errors>
                  <form:label path="firstName">First Name: </form:label>
                  <form:input class = "form-control" type="text" path="firstName"></form:input>
                </div>
                <div class="form-group  d-flex justify-content-center align-items-center gap-2">
                  <form:errors path="lastName" class="errors text-danger"></form:errors>
                  <form:label path="lastName">Last Name: </form:label>
                  <form:input class = "form-control" type="text" path="lastName"></form:input>
                </div>
                <div class="form-group  d-flex justify-content-center align-items-center gap-2">
                  <form:errors path="age" class="errors text-danger"></form:errors>
                  <form:label path="age">Age: </form:label>
                  <form:input class = "form-control" type="number" path="age"></form:input>
                </div>
                <input type="submit" value="Create" class="btn btn-primary" />
              </form:form>

            </div> <!-- End of Container -->
          </body>

          </html>