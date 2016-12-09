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
							<li><a href="/admin/country">Country</a></li>
							<li><a href="/admin/manufacturer">Manufacturer</a></li>
							<li><a href="/admin/colour">Colour</a></li>
							<li><a href="/admin/size">Size</a></li>
							<li><a href="/admin/subcategory">Subcategory</a></li>
							<li><a href="/admin/category">Category</a></li>
							<li><a href="/admin/product">Product</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>