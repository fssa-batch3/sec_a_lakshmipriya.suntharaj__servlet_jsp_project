<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
<link rel="stylesheet" href="./asset/css/profile.css" />
  <link rel="stylesheet" href="./asset/css/card.css" />

</head>
<body>
<a href="./profile.jsp">
			<button class="non-veg" >profile</button>
			
		</a> 
		<a href="./header.jsp">
			<button class="non-veg">Home</button>
		</a> 
		
		<div class="header">
			<img class="logo" src="./asset/image/yellow logo.png" height="50px"
				width="50px" alt="logo">
			<h1>RECIPE APP</h1>
		</div>
  
  <form class="profile" id="profileform">
    <div class="profiledetails">
    <div class="form-group">
        <h1>Profile</h1>
        
        <label for="name">Name:</label>
        <input type="text" class="form-control personName" id="name" placeholder="Enter your name" />
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input disabled type="email" class="form-control personEmail" id="email" placeholder="Enter your email" />
    </div>
     <button type="submit" class="btn">Save</button>
    
    

</div>
    </form>
    




</body>
</html>