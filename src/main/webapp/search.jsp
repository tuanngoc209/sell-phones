<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eCommerce test web|Search result</title>
<link rel="stylesheet" href="css/Assignment.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<c:import url="header.jsp" />
	<div class="row">
		<c:forEach var="product" items="${results}">
			<div class="col-xl-3 col-lg-4 col-md-6 col-12" 
				onclick="location.href='/PRJ321x_Project_3_ngocntFX17334/InformationProductController?id=${product.id}';">
				<img class="img-fluid" alt="${product.name }" src="${product.src }" style="height: 200px">
				<p class="p-3 mb-2 text-uppercase text-center">${product.type}</p>
				<p class="fw-bold text-center">${product.name}</p>
				<p class="fw-bold text-danger text-center">$ ${product.price}</p>
			</div>
		</c:forEach>
	</div>
	<c:import url="footer.jsp" />
</body>
</html>