<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
							<li class="active"><a href="/admin/subcategory">Subcategory</a><span
								class="sr-only">(current)</span></li>
							<li><a href="/admin/category">Category</a></li>
							<li><a href="/admin/product">Product</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	
	<div class="col-md-4 col-xs-12">

<form:form action="/admin/subcategory" method="get" modelAttribute="filter">
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
	

	<form:form action="/admin/subcategory" method="post"
		modelAttribute="form">
		<form:hidden path="id" />
		<form:errors path="*"/>
		<c:forEach items="${param}" var="parameter">
			<c:forEach items="${parameter.value}" var="value">
				<input type="hidden" name="${parameter.key}" value="${value}">
			</c:forEach>
		</c:forEach>
		<table>
			<tr><tr>
			<td>Create Subcategory</td></tr>
				<td><form:select path="category">
						<c:forEach items="${categorys}" var="category">
							<c:choose>
								<c:when test="${category.id eq form.category.id}">
									<option value="${category.id}" selected="selected">${category.name}</option>
								</c:when>
								<c:otherwise>
									<option value="${category.id}">${category.name}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select></td>
			</tr>
			<tr>
				<td><form:errors path="name"/></td>
			</tr>
			<tr>
				<td><form:input path="name" placeholder="Subcategory name" /></td>
			</tr>
			<tr>
				<td><input type="submit"></td>
			</tr>
		</table>
	</form:form>
</div>
	
	<div class="col-md-6 col-xs-12">
	<table>
		<tr>
			<th>Subcategory name</th>
			<th>Category name</th>
		</tr>
		<c:forEach items="${page.content}" var="subcategory">
			<tr>
				<td>${subcategory.name}</td>
				<td>${subcategory.category.name}</td>
				<td><a href="/admin/subcategory/delete/${subcategory.id}?page=${page.number+1}&size=${page.size}&sort=${param['sort']}&search=${param['search']}">delete</a>
				</td>
				<td><a href="/admin/subcategory/update/${subcategory.id}?page=${page.number+1}&size=${page.size}&sort=${param['sort']}&search=${param['search']}">update</a>
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
					<custom:sort innerHtml="Subcategory name asc"
						paramValue="name" />
					<custom:sort innerHtml="Subcategory name desc"
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