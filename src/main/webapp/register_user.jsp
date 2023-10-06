<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recipe Register</title>
<link rel="stylesheet" href="./asset/css/register_user.css" />

</head>
<body>



	<%
	String errorMessage = request.getParameter("error");
	if (errorMessage != null) {
	%>

	<div class="styledbutton">
		<%=errorMessage%>
		<!-- this will change based on invalid field entered -->
	</div>
	<br />
	<br />
	<%
	}
	%>



	
	<div class="card">
		<div class="card-header">
			<div class="text-header">Register</div>
		</div>
		<div class="card-body">
			<form id="signup" action="Registration" method="post">
				<div class="form-group">
					<label for="username">Username:</label> <input class="form-control"
						name="username" id="username" type="text"
						placeholder="Enter username" autocomplete="username" required
						pattern="[A-Za-z0-9]+"
						title="Make sure name shouldnot contains space" autofocus />
				</div>
				<div class="form-group">
					<label for="email">Email:</label> <input class="form-control"
						name="email" id="email" type="email"
						placeholder=" enter your email" autocomplete="email" required
						pattern="[a-z0-9._%+-]+@[a-z0-9.-_]+\.[a-z]{2,}$" />
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input class="form-control"
						name="password" id="password" id="validation"
						pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,}$"
						title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
						type="password" placeholder="enter your password"
						autocomplete="current-password" required
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" />
				</div>
				<div class="form-group">
					<label for="confirm-password">Confirm Password:</label> <input
						class="form-control" name="confirm-password" id="confirm-password"
						type="password" placeholder="enter your confirm-password"
						autocomplete="current-password" required
						pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,}$"
						title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" />
				</div>
				<button type="submit" class="btn" value="submit">Submit</button>
				<a href="login.jsp">
					<button type="button" class="btn" value="submit">LogIn</button>
				</a>
			</form>
		</div>
	</div>
</body>
</html>