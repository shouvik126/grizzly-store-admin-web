<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.pack.model.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			response.sendRedirect("/AdminLogin.jsp");
			return;
		}
	%>
	
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
				</div>
			</div>

			<div class="col-lg-1"></div>

			<div class="col-lg-1">
				<a id="notif" href="#"><i class="fas fa-bell fa-2x"
					style="margin-top: 28px;"></i></a>
			</div>

			<%!Login l = null;%>
			<%!Profile p = null;%>
			<%
				l = (Login) session.getAttribute("login");
			%>

			<div class="col-lg-2">
				<h5 style="font-size: 120%; margin-top: 37px;">
					Welcome,<%=l.getId()%>
				</h5>
			</div>

			<div class="col-lg-2">
				<form action="/grizzly-store-admin-web/LogoutController"
					method="post">
					<input type="submit" value="LOGOUT" class="logo1"
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
				<%
					p = (Profile) session.getAttribute("profile");
				%>
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
					<div class="row">
						<div class="col-lg-2">
							<select
								style="border-radius: 50px; border: none; background-color: #f2f2f2; padding: 7px; width: 100%;">
								<option disabled value="none" selected>Category name</option>
								<option value="laptops">Laptops</option>
								<option value="electronics">Electronics</option>
								<option value="personal-care">Personal Care</option>
								<option value="art-supplies">Art Supplies</option>
							</select>
						</div>

						<div class="col-lg-3">
							<div class="search">
								<input type="text" class="head "
									placeholder="&nbsp;&nbsp;Product"
									style="width: 75%; border: none; background-color: #F2F2F2">
								<button style="background-color: #F2F2F2;">
									<i class="fas fa-search"></i>
								</button>
								</input>
							</div>
						</div>

						<div class="col-lg-2">
							<select
								style="border-radius: 50px; border: none; background-color: #f2f2f2; padding: 7px; width: 100%;">
								<option disabled value="none" selected>Sort by</option>
								<option value="category">Category</option>
								<option value="brand">Brand</option>
								<option value="rating">Rating</option>
								<option value="inc" disabled>+</option>
							</select>
						</div>

						<div class="col-lg-2"></div>

						<div class="col-lg-3">
							<form action="/grizzly-store-admin-web/AdminController">
								<input type="submit" value="AddProduct" class="logo1"style="width: 150px; border-radius: 50px; background-color: #4d4d4d; padding: 7px; margin-top: 0; color: white;">
							</form>
						</div>

					</div>

					<div class="table-responsive table-scroll">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>Products List</th>
									<th>Brand</th>
									<th>Category</th>
									<th>Rating</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="prod" items="${product}">
								<tr>
									<td><input type="checkbox" name="product" value="trimmer"
										class="checkbox-round">&nbsp;<c:out value="${prod.productname}" /></td>
									<td><c:out value="${prod.brand}" /></td>
									<td><c:out value="${prod.category}" /></td>
									<td style="color: #bfbfbf; text-align: center;"><c:out value="${prod.rating}" /></td>
									<td>
										<div class="row">
											<div class="col-sm-4">
												<form action="/grizzly-store-admin-web/AdminViewProductController?pid=${prod.pid}" method="post">
													<input type="submit" value="View" class="logo1"style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">
												</form>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Block</button></a>
											</div>

											<div class="col-sm-4">
												<form action="/grizzly-store-admin-web/AdminRemoveProductController?pid=${prod.pid}" method="post">
													<input type="submit" value="Remove" class="logo1"style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">
												</form>
											</div>
										</div>
									</td>
								</tr>
								</c:forEach>

								<!-- <tr>
									<td><input type="checkbox" name="product" value="shaver"
										class="checkbox-round">&nbsp;Shaver</td>
									<td>Braun</td>
									<td>Personal Care</td>
									<td style="color: #bfbfbf; text-align: center;">4.8</td>
									<td>
										<div class="row">
											<div class="col-sm-4">
												<a href="./Product View.html"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">View</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Block</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Remove</button></a>
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<td><input type="checkbox" name="product"
										value="macbookpro" class="checkbox-round">&nbsp;Macbook
										Pro</td>
									<td>Apple</td>
									<td>Laptops</td>
									<td style="color: #bfbfbf; text-align: center;">4.9</td>
									<td>
										<div class="row">
											<div class="col-sm-4">
												<a href="./Product View.html"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">View</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Block</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Remove</button></a>
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<td><input type="checkbox" name="product" value="imac27"
										class="checkbox-round">&nbsp;iMac 27"</td>
									<td>Apple</td>
									<td>Laptops</td>
									<td style="color: #bfbfbf; text-align: center;">4.6</td>
									<td>
										<div class="row">
											<div class="col-sm-4">
												<a href="./Product View.html"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">View</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Block</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Remove</button></a>
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<td><input type="checkbox" name="product"
										value="micronpen" class="checkbox-round">&nbsp;Micron
										Pen</td>
									<td>Sakura Pigma</td>
									<td>Art Supplies</td>
									<td style="color: #bfbfbf; text-align: center;">4.1</td>
									<td>
										<div class="row">
											<div class="col-sm-4">
												<a href="./Product View.html"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">View</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Block</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Remove</button></a>
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<td><input type="checkbox" name="product"
										value="paintmarkers" class="checkbox-round">&nbsp;Paint
										Markers</td>
									<td>Copic</td>
									<td>Art Supplies</td>
									<td style="color: #bfbfbf; text-align: center;">4.2</td>
									<td>
										<div class="row">
											<div class="col-sm-4">
												<a href="./Product View.html"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">View</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Block</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Remove</button></a>
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<td><input type="checkbox" name="product"
										value="applewatch" class="checkbox-round">&nbsp;Apple
										Watch</td>
									<td>Copic</td>
									<td>Electronics</td>
									<td style="color: #bfbfbf; text-align: center;">4.8</td>
									<td>
										<div class="row">
											<div class="col-sm-4">
												<a href="./Product View.html"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">View</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Block</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Remove</button></a>
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<td><input type="checkbox" name="product" value="dellg7"
										class="checkbox-round">&nbsp;Dell G7</td>
									<td>Copic</td>
									<td>Laptops</td>
									<td style="color: #bfbfbf; text-align: center;">4.8</td>
									<td>
										<div class="row">
											<div class="col-sm-4">
												<a href="./Product View.html"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">View</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Block</button></a>
											</div>

											<div class="col-sm-4">
												<a href="#"><button class="logo1"
														style="width: 100%; border-radius: 50px; background-color: #bfbfbf; padding: 5px; margin-top: 0; color: #666666; font-size: 12px;">Remove</button></a>
											</div>
										</div>
									</td>
								</tr>
 -->
							</tbody>
						</table>

					</div>
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