<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Omikuji</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div
			class="d-flex flex-column justify-content-center align-items-center"
			action="/omikuji/send">
			<h1>Here's your Omikuji!</h1>
			<div class="bg-primary border text-light p-5 m-2">
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