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
            <title>Product Page</title>
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

          </head>

          <body>
            <div class="container">
              <!-- Beginning of Container -->
              <h1>${product.name}</h1>
              <br>
              <br>
              <div class="d-flex gap-5">
                <div>
                  <h2>Categories:</h2>
                  <ul>
                    <c:forEach items="${product.categories}" var="category">
                        <p>${category.name}</p>
                      </c:forEach>
                  </ul>
                </div>
                <div class = "form-group">
                  <form action="/products/${product.id}" method="post" >
                    <label name= "category">Add Category: </label>
                    <select name = "category">
                      <c:forEach items="${nonMemberCategories}" var="category">
                        <option value = "${category.id}"> ${category.name}</option>
                      </c:forEach>
                    </select>
                    <input type="submit" value="Add" class = "btn btn-primary">
                  </form>
                </div>
              </div>
            </div> <!-- End of Container -->
          </body>

          </html>