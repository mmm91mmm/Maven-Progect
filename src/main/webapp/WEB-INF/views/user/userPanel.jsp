<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
							<li><a href="/user/country">Country</a></li>
							<li><a href="/user/manufacturer">Manufacturer</a></li>
							<li><a href="/user/colour">Colour</a></li>
							<li><a href="/user/size">Size</a></li>
							<li><a href="/user/subcategory">Subcategory</a></li>
							<li><a href="/user/category">Category</a></li>
							<li><a href="/user/product">Product</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>