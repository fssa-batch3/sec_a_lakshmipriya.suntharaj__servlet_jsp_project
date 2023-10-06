<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>JSTL demo</h1>
	<c:set value="Ram" var="name" />

	<c:if test="${name != null}"> <!-- Best practice to avoid page crash -->
		<h3>
			<c:out value="${name}"></c:out>
		</h3>
	</c:if>
	
	<% request.setAttribute("name","Krihna"); %>
	<% session.setAttribute("age","18"); %>
	
	<c:out value="Page Scope : ${name}"></c:out><br>
	<c:out value="Request Scope : ${requestScope.name}"></c:out><br>
	<c:out value="Session Scope : ${sessionScope.age}"></c:out>
	
		<%
	String[] cityNames = { "Chennai", "Delhi", "Bangalore", "Kolkata", "Mumbai" };
	%> <!-- always let the servlet set the request attribute as shown in solved -->
	<c:set value="<%=cityNames%>" var="cityNames" />
	<p>City Names</p>
	<ul>
		<c:forEach var="cityName" items="${cityNames}">
			<li><c:out value="${cityName}" /></li>
		</c:forEach>
	</ul>
</body>
</html>







