<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prison!!</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container d-flex flex-column  align-items-center justify-content-center p-2 gap-5">
<h1>You're a Bad Ninja!</h1>
<h2>You've accumulated so much debt that you are now in ninja prison...</h2>
<h3>You're going to have to wait a while before you can play the ninja gold game again!</h3>
<p>(Or just clear your session data)</p>

<form action="gold/reset" method="post">
<input type="submit" class = "btn btn-primary" value="Or you can click here... But be good this time!" /></form>
</div>
</body>
</html>