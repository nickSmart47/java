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
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
							crossorigin="anonymous">

					</head>

					<body>
						<div class="container">
							<!-- Beginning of Container -->
							<div class="d-flex justify-content-between">
								<h4>Hello, ${user.userName}. Welcome to... </h4>
								<a href="/logout">Logout</a>
							</div>
							<h1 class="text-warning">Book Lender Dashboard</h1>
							<div class="d-flex justify-content-between">
								<h3>Available Books to Borrow: </h3>
								<a href="/books/new">Add a book to the shelf!</a>
							</div>
							<table class="table mt-3">
								<tr class="table-info">
									<th>Id</th>
									<th>Title</th>
									<th>Author Name</th>
									<th>Owner</th>
									<th>Actions</th>


								</tr>
								<c:forEach items="${books}" var="book">
									<tr>
										<c:if test="${(book.borrower.getId() != loggedInUserID) && (book.borrower.getId() == null)}">

											<td>${book.id}</td>
											<td><a href="/books/${book.id}">${book.title}</a></td>
											<td>${book.author}</td>
											<td>${book.user.userName}</td>
											<c:choose>
												<c:when test="${book.user.getId() == loggedInUserID}">
													<td class="d-flex gap-3">
														<a href="/books/${book.id}/edit"
															class="btn btn-success ">Edit</a>
														<form action="/books/${book.id}" method="post">
															<input type="hidden" name="_method" value="delete"> <input
																type="submit" value="Delete" class="btn btn-danger">
														</form>
													</td>
													</td>
												</c:when>
												<c:otherwise>

													<td>
														<form action="/books/borrow/${book.id}" method="post">
															<input type="hidden" name="_method" value="put"> <input
																type="submit" value="Borrow" class="btn btn-warning">
														</form>
													</td>
												</c:otherwise>
											</c:choose>
										</c:if>
									</tr>
								</c:forEach>
							</table>
							<h3>Books I'm Borrowing...</h3>
							<table class="table mt-3">
								<tr class="table-info">
									<th>Id</th>
									<th>Title</th>
									<th>Author Name</th>
									<th>Owner</th>
									<th>Actions</th>

									</tr>
									<c:forEach items="${books}" var="book">
										<tr>
										<c:if test="${book.borrower.getId() == loggedInUserID}">
											
											<td>${book.id}</td>
											<td><a href="/books/${book.id}">${book.title}</a></td>
											<td>${book.author}</td>
											<td>${book.user.userName}</td>
											<td><form action="/books/return/${book.id}" method="post">
												<input type="hidden" name="_method" value="put"> <input
													type="submit" value="Return" class="btn btn-warning">
											</form></td>
										</c:if>
									</tr>
									</c:forEach>
							</table>


							<h3>Books Currently Borrowed</h3>
							<table class="table mt-3">
								<tr class="table-info">
									<th>Id</th>
									<th>Title</th>
									<th>Author Name</th>
									<th>Owner</th>
									<th>Borrower</th>

									</tr>
									<c:forEach items="${books}" var="book">
										<tr>
										<c:if test="${book.borrower.getId() != null}">
											
											<td>${book.id}</td>
											<td><a href="/books/${book.id}">${book.title}</a></td>
											<td>${book.author}</td>
											<td>${book.user.userName}</td>
											<td>${book.borrower.userName}</td>
										</c:if>
									</tr>
									</c:forEach>
							</table>
						</div>
						<!-- End of Container -->
					</body>

					</html>