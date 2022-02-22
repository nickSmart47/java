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
            <title>Category Page</title>
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

          </head>

          <body>
            <div class="container">
              <!-- Beginning of Container -->
              <h1>${category.name}</h1>
              <br>
              <br>
              <div class="d-flex gap-5">
                <div>
                  <h2>Products:</h2>
                  <ul>
                    <c:forEach items="${category.products}" var="product">
                        <p>${product.name}</p>
                      </c:forEach>
                  </ul>
                </div>
                <div class = "form-group">
                  <form action="/categories/${category.id}" method="post" >
                    <label name= "product">Add product: </label>
                    <select name = "product">
                      <c:forEach items="${productsNotInCategory}" var="product">
                        <option value = "${product.id}"> ${product.name}</option>
                      </c:forEach>
                    </select>
                    <input type="submit" value="Add" class = "btn btn-primary">
                  </form>
                </div>
              </div>
            </div> <!-- End of Container -->
          </body>

          </html>