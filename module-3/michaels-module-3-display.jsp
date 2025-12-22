<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>

<!-- 
Name: Maria Q. Michaels
Date: 12/21/2025
Assignment: CSD430 Module 3 Assignment - Working with JSP Forms
Assignment Purpose: Create a form to gather data from a user for a job application
 -->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Form Submitted!</title>
</head>
<body>
    <h2>Your Order Details</h2>

    Name: <%= request.getParameter("name") %>
    <br>
    <br>
    Email: <%= request.getParameter("email") %>
    <br>
    <br>
    Department: <%= request.getParameter("department") %>
    <br>
    <br>
    Number of guests: <%= request.getParameter("guests") %>
    <br>
    <br>


    Food order: 
    <%
    String[] food = request.getParameterValues("food");
    if(food != null){
        out.print(String.join(", ", food));
    } else {
        out.print("None");
    }
	%>
    <br>
    <br>
</body>
</html>