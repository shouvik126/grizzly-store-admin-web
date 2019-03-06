<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.pack.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Grizzly Store</title>
<link rel="stylesheet" href="styles/bootstrap.min.css" type="text/css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<link rel="stylesheet" href="styles/style1.css" type="text/css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script language="javascript">
	window.history.forward(1);
	browser.cache.offline.enable = false;
	function noBack() {
		window.history.forward(1);

	}
	self.close()
</script>
</head>
<body onload="noBack()">
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies. 	

		if (session.getAttribute("login") == null && session.getAttribute("profile") == null) {
			response.sendRedirect("/grizzly-store-admin-web/AdminLogin.jsp");
			return;
		}
	%>
	<%!Login l = null;%>
	<%!Profile p = null;%>
	<div class="header container-fluid">
		<div class="row">
			<div class="col-lg-3">
				<img src="images/logo2.png" height="100%" width="100%">
			</div>

			<div class="col-lg-3">
				<div class="search">
					<input type="text" class="head " placeholder="&nbsp;&nbsp;Search"
						style="width: 63%; margin-top: 27px; border: none;">
					<button style="margin-top: 27px;">
						<i class="fas fa-search"></i>
					</button>
					</input>
				</div>
			</div>

			<div class="col-lg-1"></div>

			<div class="col-lg-1">
				<a id="notif" href="#"><i class="fas fa-bell fa-2x"
					style="margin-top: 28px;"></i></a>
			</div>

			<div class="col-lg-2">
				<%
					l = (Login) session.getAttribute("login");
					p = (Profile) session.getAttribute("profile");
				%>
				<h5 style="font-size: 120%; margin-top: 37px;">
					Welcome,<%=l.getId()%></h5>
			</div>

			<div class="col-lg-2">
				<form action="/grizzly-store-admin-web/LogoutController"
					method="post">
					<input type="submit" value="Logout" class="logo1"
						style="width: 150px; border-radius: 50px; background-color: #bfbfbf; padding: 7px; margin-top: 27px; font-size: 22px;">
				</form>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="card body1 col-lg-2"
			style="margin-left: 40px; margin-top: 30px; background-color: #f2f2f2; border: none;">
			<div class="card-header"
				style="background-color: #cccccc; margin-top: 15px; margin-left: 10px; margin-right: 10px; border: none;">
				<h4 style="color: white;">PROFILE</h4>
			</div>

			<img src="images/userimg.jpg" class="logo1"
				style="border: 1px solid #cccccc; margin-top: 25px;">

			<div class="card-body"
				style="margin-top: 10px; margin-left: 10px; margin-right: 10px; border: none;">
				<h5 class="card-content card-title" style="font-size: 28px;"><%=p.getFirstname()%>
					<%=p.getLastname()%></h5>
				<br>
				<p class="card-content card-text">
					<b>ID</b><br><%=p.getId()%>
				</p>
				<br>
				<p class="card-content card-text">
					<b>Designation</b><br><%=p.getDesignation()%>
				</p>
				<br>
				<p class="card-content card-text">
					<b>Office</b><br><%=p.getAddress()%>
				</p>
				<br>
			</div>
		</div>

		<div class="col-lg-9"
			style="margin-left: 40px; margin-top: 30px; border: none;">

			<ul class="pill-list nav nav-pills mb-3" id="pills-tab"
				role="tablist">
				<li class="pill-item nav-item"><a
					class="pill-link nav-link active" id="pills-prod-tab"
					data-toggle="pill" href="#prod" role="tab" aria-controls="prod"
					aria-selected="true"><h2>PRODUCTS</h2></a></li>
				<li class="pill-item nav-item"><a class="pill-link nav-link"
					id="pills-vend-tab" data-toggle="pill" href="#vend" role="tab"
					aria-controls="vend" aria-selected="false"><h2>VENDORS</h2></a></li>

				<li class="pill-item nav-item"><a class="pill-link nav-link"
					id="pills-cate-tab" data-toggle="pill" href="#cate" role="tab"
					aria-controls="cate" aria-selected="false"><h2>CATEGORY</h2></a></li>

			</ul>

			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="prod" role="tabpanel"
					aria-labelledby="pills-prod-tab">
					
					<form action="/grizzly-store-admin-web/AdminAddProductController" method="post">
						<div class="row">
							<div class="col-lg-5">
								<img src="images/addimage.jpg" width="100%">
								<div class="row">
									<div class="container1 col-sm-2">
										<img class="thumbnail" src="images/addthumb.jpg" width="100%">
										<a href="#" style="color: black;"><i
											class="fas fa-times-circle"></i></a>
									</div>
									<div class="container1 col-sm-2">
										<img class="thumbnail" src="images/addthumb.jpg" width="100%">
										<a href="#" style="color: black;"><i
											class="fas fa-times-circle"></i></a>
									</div>
									<div class="container1 col-sm-2">
										<img class="thumbnail" src="images/addthumb.jpg" width="100%">
										<a href="#" style="color: black;"><i
											class="fas fa-times-circle"></i></a>
									</div>
									<div class="container1 col-sm-2">
										<img class="thumbnail" src="images/addthumb.jpg" width="100%">
										<a href="#" style="color: black;"><i
											class="fas fa-times-circle"></i></a>
									</div>
									<div class="container1 col-sm-2">
										<img class="thumbnail" src="images/addthumb.jpg" width="100%">
										<a href="#" style="color: black;"><i
											class="fas fa-times-circle"></i></a>
									</div>
								</div>
							</div>
	
							<div class="col-lg-4">
								<input type="text" name="pid"class="add-product"placeholder="Enter product ID"><br> 
								<select name="productcategory"class="add-product">
									<option disabled value="none" selected>Category</option>
									<option value="laptops">Laptops</option>
									<option value="electronics">Electronics</option>
									<option value="personal-care">Personal Care</option>
									<option value="art-supplies">Art Supplies</option>
								</select><br> 
								<input type="text" name="productname"class="add-product"placeholder="Name"> 
								<input type="text"name="productdescription"class="add-product" placeholder="Description"> 
								<input type="text" name="productprice"class="add-product" placeholder="Price">
							</div>
	
							<div class="col-lg-3">
								<input type="submit" value="Add"class="logo1"style="width: 150px; border-radius: 50px; background-color: #4d4d4d; padding: 7px; margin-top: 0; color: white; float: right; position: absolute; bottom: 50px; right: 5px;">
								</form>
								<form action="/grizzly-store-admin-web/AdminAddProductController" method="get">
								<input type="submit" value="Cancel"class="logo1"style="width: 150px; border-radius: 50px; background-color: #d9d9d9; padding: 7px; margin-top: 0; color: #737373; float: right; position: absolute; bottom: 0px; right: 5px;">
							</div>
						</div>
					</form>

				</div>
				<div class="tab-pane fade" id="vend" role="tabpanel"
					aria-labelledby="pills-vend-tab">
					<p>asfsgvsgdevws</p>
				</div>
				<div class="tab-pane fade" id="cate" role="tabpanel"
					aria-labelledby="pills-cate-tab">
					<p>asdasxvbsdeww</p>
				</div>
			</div>

		</div>
	</div>
</body>
</html>