<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fssa.recipe.service.UserService" %>
<%@ page import="com.fssa.recipe.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./asset/css/profile.css" />
    <link rel="stylesheet" href="./asset/css/card.css" />
    <title>Profile</title>
</head>
<body>
    <div class="header">
        <img class="logo" src="./asset/image/yellow logo.png" height="50px" width="50px" alt="logo">
        <h1>RECIPE APP</h1>
    </div>

    <%
        String email = (String) request.getParameter("email");
        UserService userService = new UserService();
        User userObj = null;
        try {
            userObj = userService.findUserByEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <a href="./profile.jsp">
        <button class="non-veg">Profile</button>
    </a>
    <a href="./header.jsp">
        <button class="non-veg">Home</button>
    </a>

    <form class="profile" id="profileform" action="updateProfile.jsp" method="post">
        <div class="profiledetails">
            <div class="form-group">
                <h1>Profile</h1>

                <label for="name">Name:</label>
                <input type="text" class="form-control personName" id="name" name="name" value="<%= userObj.getUsername()%>" placeholder="Enter your name" />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input disabled type="email" class="form-control personEmail" id="email" name="email" value="<%= userObj.getEmail() %>" placeholder="Enter your email" />
            </div>
            <button type="submit" class="btn">Edit</button>
        </div>
    </form>
</body>
</html>
