<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="/resources/css/product.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
							<li><a href="/user/myOrder">Order</a></li>
							<li class="active"><a href="/user/product">Product</a><span
								class="sr-only">(current)</span></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	
	<div class="col-md-2 col-xs-12">
		<form:form action="/user/product" class="form-inline" method="get"
			modelAttribute="filter">
			<custom:hiddenInputs
				excludeParams="min, max, subcategoryIds, colourIds, manufacturerIds, countryIds, _countryIds, _manufacturerIds _colourIds,_subcategoryIds" />
			<div class="form-group">
				<form:input path="min" placeholder="min" class="form-control" />
				<form:input path="max" placeholder="max" class="form-control" />
				<button type="submit" class="btn btn-primary">Ok</button>
			</div>
			<div class="form-group">
				<h4>Manufacturer</h4>
			</div>
			<div class="form-group">
				<form:checkboxes items="${manufacturers}" path="manufacturerIds"
					itemLabel="name" itemValue="id" />
			</div>
			<div class="form-group">
				<h4>Colour</h4>
			</div>
			<div class="form-group">
				<form:checkboxes items="${colors}" path="colourIds" itemLabel="name"
					itemValue="id" />
			</div>
			<div class="form-group">
				<h4>Country</h4>
			</div>
			<div class="form-group">
				<form:checkboxes items="${countrys}" path="countryIds"
					itemLabel="name" itemValue="id" />
			</div>
			<div class="form-group">
				<h4>Subcategory</h4>
			</div>
			<div class="form-group">
				<form:checkboxes items="${subcategorys}" path="subcategoryIds"
					itemLabel="name" itemValue="id" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Ok</button>
			</div>
		</form:form>
	</div>

	<div class="col-md-8 col-xs-12">
		<c:forEach items="${page.content}" var="product">
			<div class="col-md-6">
			<div><img class="img-thumbnail" width="300" src="/images/product/${product.id}${product.path}?version=${product.version}" /></div>
				<div>Name:   		${product.name}</div>
				<div>Cost:   		${product.cost}</div>
				<div>Colour: 		${product.colour.name}</div>
				<div>Manufacturer:	${product.manufacturer.name}</div>
				<div>Subcategory:	${product.subcategory.name}</div>
				<div>Country:		${product.country.name}</div>
				<div>Sizes: <select name="sizeId">
											<c:forEach items="${product.sizes}" var="sizes">
												<option value="${sizes.id}">${sizes.name}</option>
											</c:forEach>
									</select>
							</div>
				<button class="btn btn-success"  type="button">
					Buy
				</button>
			</div>
		</c:forEach>
		<div class="col-md-12 text-center">
			<custom:pageable page="${page}" cell="<li></li>"
				container="<ul class='pagination'></ul>" />
		</div>
	</div>
	
	
	
	<div class="col-md-2 col-xs-12">
		<div class="col-md-6">
			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button"
					data-toggle="dropdown">
					Sort <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<custom:sort innerHtml="Country asc" paramValue="country.name" />
					<custom:sort innerHtml="Country desc"
						paramValue="country.name,desc" />
					<custom:sort innerHtml="Subcategory name asc"
						paramValue="subcategory.name" />
					<custom:sort innerHtml="Subcategory name desc"
						paramValue="subcategory.name,desc" />
					<custom:sort innerHtml="Colour name asc" paramValue="colour.name" />
					<custom:sort innerHtml="Colour name desc"
						paramValue="colour.name,desc" />
					<custom:sort innerHtml="Manufacturer name asc"
						paramValue="manufacturer.name" />
					<custom:sort innerHtml="Manufacturer name desc"
						paramValue="manufacturer.name,desc" />
				</ul>
			</div>
		</div>
		<div class="col-md-6">
			<custom:size posibleSizes="2,4,10,20" size="${page.size}" title="Size" />
		</div>
	</div>
</body>
</html>