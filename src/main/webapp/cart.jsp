<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eCommerce test web|Cart</title>
<link rel="stylesheet" href="css/Assignment.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

	<%
	Cart c = (Cart) session.getAttribute("cart");
	List<Product> productList = c.getItems();
	int size = productList.size();
	pageContext.setAttribute("productList", productList);
	int tongSP=0;
	for(Product p:productList){
		tongSP+=p.getNumber();
	}
	%>

	<c:import url="header.jsp" />
	<div class="row justify-content-center p-3 md-2">
		<table class="table table-light carttable">
			<tr >
				<%-- <th>Products in cart:<%=size%></th> --%>
				<th>Products in cart:<%=tongSP%></th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Amount</th>
				<th></th>
			</tr>
			<c:forEach var="product" items="${productList }">
				<tr>
					<td>${product.name}</td>
					<td>${product.price}</td>
					<td>${product.number}</td>
					<td>${product.tongTien}</td>
					<td><a
						href="/PRJ321x_Project_3_ngocntFX17334/AddToCartController?id=${product.id}&action=delete">Remove</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td>Total payment: </td>
				<td colspan="5" style="float: right;"><c:out
						value="${sessionScope.cart.amount}" /></td>
			</tr>
		</table>

		<form class="payform" name="payform" action="PayController"
			onsubmit="return validate()" method="post">
			<label class="col-3" for="name">Customer mail</label> 
			<input
				class="col-6" type="text" id="name" name="name"><br> 
			<label
				class="col-3" for="address">Customer address</label> 
			<input
				class="col-6" type="text" id="address" name="address"><br>
			<label class="col-3" for="discount">Discount code(if any):</label> 
			<input
				class="col-6" type="text" id="discount" name="discount"><br>
			<input class="greenbutton" type="submit" value="Submit"><br>
			<div class="error">
				<%
				String error = (String) session.getAttribute("error");
				if (error != null) {
					out.println(error);
				}
				%>
			</div>
		</form>
	</div>
</body>
</html>