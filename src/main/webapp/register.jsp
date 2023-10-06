<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style >
/* Style the form container */
#form {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f9f9f9;
}

/* Style the labels */
label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

/* Style the input fields */
input[type="text"],
input[type="email"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

/* Style the button */
button[type="submit"] {
  background-color: #007bff;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

/* Hover effect for the button */
button[type="submit"]:hover {
  background-color: #0056b3;
}

/* Optional: Add some spacing between elements */
br {
  margin-top: 10px;
}

h1{
margin-left: 550px
}
</style>

</head>
<body>
	<h1>Register</h1>
	<form action="Registration" method="post" id="form">
		<label>UserName: </label> <input type="text" name="name"
			placeholder="Enter username" id="name"> <br /> <label>Email:
		</label> <input type="email" id="email" name="email" placeholder="Enter email">
		<br /> <label>Password: </label> <input type="password"
			name="password" id="password" placeholder="Enter password"> <br />
		<button type = "submit">submit</button>
	</form>
	
</body>
</html>