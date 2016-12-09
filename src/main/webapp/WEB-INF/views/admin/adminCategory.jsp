<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<script>
		$(function() {
			$('select[name=product]').chosen();
		});
	</script>

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
							<li class="active"><a href="/admin/category">Category</a><span
								class="sr-only">(current)</span></li>
							<li><a href="/admin/product">Product</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	
	<div class="col-md-4 col-xs-12">
	<form:form action="/admin/category" method="post" modelAttribute="category">
	<form:hidden path="id"/>
	<form:errors path="*"/>
	<c:forEach items="${param}" var="parameter">
			<c:forEach items="${parameter.value}" var="value">
				<input type="hidden" name="${parameter.key}" value="${value}">
			</c:forEach>
		</c:forEach>
		<table>
			<tr>
				<td><form:errors path="name"/></td>
			</tr>
			<tr>
				<td><form:input path="name"/></td>
			</tr>
			<tr>
				<td><input type="submit"></td>
			</tr>
		</table>
	</form:form>
	<form:form action="/admin/category" method="get" modelAttribute="filter">
		<c:forEach items="${param}" var="parameter">
			<c:forEach items="${parameter.value}" var="value">
				<c:if test="${parameter.key ne 'search'}">
					<input type="hidden" name="${parameter.key}" value="${value}">
				</c:if>
			</c:forEach>
		</c:forEach>
		<table>
			<tr>
				<td><form:input path="search" placeholder="search"/><input type="submit" value="ok"></td>
			</tr>
		</table>
	</form:form>
	</div>
	
	
	<div class="col-md-6 col-xs-12">
	<table>
		<tr>
			<th>Category name</th>
		</tr>
		<c:forEach items="${page.content}" var="category">
			<tr>
				<td>${category.name}</td>
				<td>
					<a href="/admin/category/delete/${category.id}?page=${page.number+1}&size=${page.size}&sort=${param['sort']}&search=${param['search']}">delete</a>
				</td>
				<td>
					<a href="/admin/category/update/${category.id}?page=${page.number+1}&size=${page.size}&sort=${param['sort']}&search=${param['search']}">update</a>
				</td>
			</tr>
		</c:forEach>
	
		<tr>
		<td><a href="/admin">Back to admin</a></td>
		</tr>
	</table>
	</div>
	
	<div class="col-md-2 col-xs-12">
	
	<div class="col-md-6">
			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button"
					data-toggle="dropdown">
					Sort <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<custom:sort innerHtml="Category name asc"
						paramValue="name" />
					<custom:sort innerHtml="Category name desc"
						paramValue="name,desc" />
				</ul>
			</div>
		</div>
	<div class="col-md-6">
			<custom:size posibleSizes="2,4,10,20" size="${page.size}" title="Size" />
		</div>
		</div>
		<div class="col-md-12 text-center">
		<custom:pageable page="${page}" cell="<li></li>" container="<ul class='pagination'></ul>"/>
	</div>
</body>
</html>