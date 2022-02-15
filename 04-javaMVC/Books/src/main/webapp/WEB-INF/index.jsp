<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>

<div class = "container p-3">
<h1>All Books</h1>
<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Title</th>
      <th scope="col">Description</th>
      <th scope="col">Language</th>
      <th scope="col">Number of Pages</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items = "${books}" var="book">
  
    <tr>
      <th scope="row">${book.id}</th>
      <td><a href="/books/${book.id}">${book.title}</a></td>
      <td>${book.description}</td>
      <td>${book.language}</td>
      <td>${book.language}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</div>
</body>
</html>