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
		<form  class = "d-flex flex-column justify-content-center align-items-center" action="/omikuji/send" method="post">
		<h1>Send an Omikuji!</h1>
			<div class="form-group">
				<label for="number">Pick any number from 5 to 25</label> <input
					class="form-control" type="number" name="number" />
			</div>
			<div class="form-group">
				<label for="city">Enter the name of any city</label> <input
					class="form-control" type="text" name="city" />
			</div>
			<div class="form-group">
				<label for="person">Enter the name of any real person</label> <input
					class="form-control" type="text" name="person" />
			</div>
			<div class="form-group">
				<label for="profession">Enter professional endeavor or hobby</label>
				<input class="form-control" type="text" name="profession" />
			</div>
			<div class="form-group">
				<label for="livingthing">Enter any type of living thing</label> <input
					class="form-control" type="text" name="livingThing" />
			</div>
			<div class="form-group">
				<label for="somethingnice">Say something nice to someone</label>
				<textarea class="form-control" name="somethingNice" cols="30"
					rows="10"></textarea>
			</div>
			<div class="form-group">
				<label for="submit">Send and show a friend</label> <input
					type="submit" value="Send" class = "btn btn-primary" />
			</div>
		</form>

	</div>
</body>
</html>