<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ninja Gold Game</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container d-flex flex-column  align-items-center justify-content-center p-2">
		<h1>
			Your Gold: <span>${gold}</span>
		</h1>

		<div class="m-3 d-flex gap-3">
			<div class="border border-warning p-3">
				<h2>Farm</h2>
				<p>(earns 10-20 gold)</p>
				<form action="/gold/find" method="post">
					<input type="hidden" name="farm" value="farm" />
					<button class="btn btn-warning">Find Gold!</button>
				</form>
			</div>
			<div class="border border-warning p-3">
				<h2>Cave</h2>
				<p>(earns 5-10 gold)</p>
				<form action="/gold/find" method="post">
					<input type="hidden" name="cave" value="cave" />
					<button class="btn btn-warning">Find Gold!</button>
				</form>
			</div>
			<div class="border border-warning p-3">
				<h2>House</h2>
				<p>(earns 2-5 gold)</p>
				<form action="/gold/find" method="post">
					<input type="hidden" name="house" value="house" />
					<button class="btn btn-warning">Find Gold!</button>
				</form>
			</div>
			<div class="border border-warning p-3">
				<h2>Casino!</h2>
				<p>(earns/takes 0 - 50 gold)</p>
				<form action="/gold/find" method="post">
					<input type="hidden" name="casino" value="casino" />
					<button class="btn btn-warning">Find Gold!</button>
				</form>
			</div>
			<div class="border border-warning p-3">
				<h2>Spa</h2>
				<p>(takes 5-20 gold)</p>
				<form action="/gold/find" method="post">
					<input type="hidden" name="spa" value="spa" />
					<button class="btn btn-warning">Find Gold!</button>
				</form>
			</div>

		</div>
		<h3 class="m-3">Activities:</h3>
		<div style="width: 80%; height: 500px; overflow: scroll;"
			class="border border-success p-5">
			<ul class="list-group">
				<c:forEach var="message" items="${messages}">
					<li class="list-group-item"><c:out value="${message}"></c:out></li>
				</c:forEach>
			</ul>
		</div>

		<form action="/gold/reset" class = "m-3" method="post">
		
		<input type="submit" class = "btn btn-danger" value="Reset Gold" />
		</form>

	</div>
</body>
</html>