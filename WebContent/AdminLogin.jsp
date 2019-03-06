<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
img.logo {
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	height: 400px;
	display: block;
}

hr.h1 {
	margin-left: auto;
	margin-right: auto;
	width: 35%;
	display: block;
}

input.info {
	margin-left: auto;
	margin-right: auto;
	width: 250px;
	height: 30px;
	display: block;
	background-color: #f2f2f2;
	colour: #000000;
	border-radius: 12px;
	border: none;
}

input.login {
	margin-left: auto;
	margin-right: auto;
	width: 100px;
	height: 30px;
	display: block;
	background-color: #999999;
	colour: #000000;
	border-radius: 12px;
	border: none;
}
</style>
</head>
<body>
	<img class="logo" src="images/logo1.png" alt="log in page logo">
	<hr class="h1">
	<br>
	<form action="/grizzly-store-admin-web/AdminController" method="post">
		<input class="info" type="text" name="username"placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username">
		<br>
		<input class="info" type="password" name="password"placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password">
		<br>
		<input class="login" type="submit" value="login" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login">
	</form>
</body>
</html>