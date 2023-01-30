<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<div class="p-3 mb-2 bg-light">
	<div class="row">
		<c:forEach var="product" items="${productList}">
			<div class="col-xl-3 col-lg-4 col-md-6 col-12">
				<img class="img-fluid" alt="${product.name }" src="${product.src }" style="height: 200px"
					onclick="location.href='/PRJ321x_Project_3_ngocntFX17334/InformationProductController?id=${product.id}';">
				<p class="p-3 mb-2 text-uppercase text-center">${product.type}</p>
				<p class="fw-bold text-center">${product.name}</p>
				<p class="fw-bold text-danger text-center">${product.price}</p>
			</div>
		</c:forEach>
	</div>

	<!-- For displaying Page numbers -->
	<div class="row justify-content-center">
		<div class="col-3 col-lg-2 col-xl-1">
			<c:forEach var="i" begin="1" end="${noOfPage}">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<button class="btn btn-outline-infor" disabled>${i }</button>
					</c:when>
					<c:otherwise>
						<a class="btn btn-outline-info"
							href="/PRJ321x_Project_3_ngocntFX17334/HomeProductController?page=${i }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>