<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="/resources/css/product.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="collapse navbar-collapse" id="">
						<ul class="nav navbar-nav">
							<li><a href="/admin/country">Country</a></li>
							<li><a href="/admin/manufacturer">Manufacturer</a></li>
							<li><a href="/admin/colour">Colour</a></li>
							<li><a href="/admin/size">Size</a></li>
							<li><a href="/admin/subcategory">Subcategory</a></li>
							<li><a href="/admin/category">Category</a></li>
							<li class="active"><a href="/admin/product">Product</a><span
								class="sr-only">(current)</span></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	
	
<%-- <table>
		<tr>
			<th>Manufacturer name</th>
		</tr>
		<c:forEach items="${page.content}" var="manufacturer">
			<tr>
				<td>${manufacturer.name}</td>
				<td>
					<a href="/admin/manufacturer/delete/${manufacturer.id}?page=${page.number+1}&size=${page.size}&sort=${param['sort']}&search=${param['search']}">delete</a>
				</td>
				<td>
					<a href="/admin/manufacturer/update/${manufacturer.id}?page=${page.number+1}&size=${page.size}&sort=${param['sort']}&search=${param['search']}">update</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
		<td><a href="/admin">Back to admin</a></td>
		</tr>
	</table> --%>
	<!-- 
	google jsp вывод на экран из базы объектов!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	 -->
	<table>
	<tr><th><img class="img-thumbnail" width="300" src="/images/product/${product.id}${product.path}?version=${product.version}" /></th></tr>
				<tr><th>Name:   		${product.name}</th></tr>
				<tr><th>Cost:   		${product.cost}</th></tr>
				<tr><th>Colour: 		${product.colour.name}</th></tr>
				<tr><th>Manufacturer:	${product.manufacturer.name}</th></tr>
				<tr><th>Subcategory:	${product.subcategory.name}</th></tr>
				<tr><th>Country:		${product.country.name}</th></tr>
				<tr><th>Sizes: <select name="sizeId"><c:forEach items="${product.sizes}" var="sizes">
								<option value="${sizes.id}">${sizes.name}</option>
							</c:forEach></select>
							</th></tr>
	</table>
				
			
</body>
</html>