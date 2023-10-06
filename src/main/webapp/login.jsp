<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<link rel="stylesheet" href="./asset/css/log.css">
<head>
<title>Login</title>
</head>
<body>
	<header class="head">

		<a href="register_user.jsp">
			<button class="signin">Register</button>
		</a> <a href="./index.jsp">
			<button class="non-veg">Home</button>
		</a>
		<div class="header">
			<img class="logo" src="./asset/image/yellow logo.png" height="50px"
				width="50px" alt="logo">
			<h1>RECIPE APP</h1>
		</div>

	</header>


	<div class="login-card">
		<!-- <a href="../index.html"></a> -->
		<div class="card-header">


			<%
			String errorMessage = request.getParameter("error");
			if (errorMessage != null) {
			%>

			<div class="styledbutton" id="styledbuttonlogin">
				<%=errorMessage%>
				<!-- this will change based on invalid field entered -->
			</div>
			<br /> <br />
			<%
			}
			%>

			<div class="log">Login</div>
		</div>
		<form id="form" action="login" method=post>
			<div class="form-group">
				<label for="email">Email:</label> <input required
					pattern="^\S+@\S+\.\S+$" name="email" id="email" type="email">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input required
					name="password" id="password" type="password"
					pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,}$">
			</div>
			<div class="form-group">
				<input value="Submit" type="submit" id="submit"></input>
			</div>
		</form>
	</div>
</body>

</html>
