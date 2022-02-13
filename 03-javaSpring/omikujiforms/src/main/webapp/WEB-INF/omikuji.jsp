<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Omikuji</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<div
			class="d-flex flex-column justify-content-center align-items-center"
			action="/omikuji/send">
			<h1>Here's your Omikuji!</h1>
			<div class="bg-primary border">
				<p>In ${number} years, you will live in ${city} with ${person} as
					your roommate, ${profession} for a living.</p>
				<p>The next time you see a ${livingThing}, you will have good
					luck. Also, ${somethingNice}.</p>
			</div>
			<a href="/omikuji">Go Back</a>
		</div>

	</div>
</body>
</html>