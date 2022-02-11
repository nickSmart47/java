<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hopper's Receipt</title>
</head>
<body>
	<h1><strong>Customer Name: </strong><c:out value="${name}"></c:out></h1>
	<p><strong>Item name: </strong><c:out value="${itemName}"></c:out></p>
	<p><strong>Price: </strong><c:out value="${price}"></c:out></p>
	<p><strong>Description: </strong>	 <c:out value="${description}"></c:out></p>
	<p><strong>Vendor: </strong><c:out value="${vendor}"></c:out></p>
</body>
</html>