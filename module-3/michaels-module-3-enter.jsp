<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Module 3 Food Order for End-of-Year Party</title>
</head>
<body>
    <h1>Be ready for our Christmas Party form!</h1>
    <form action="michaels-module-3-display.jsp" method="post">
        <!-- person info, text entry -->
        Name: <input type="text" name="name" required>
        <br>
        <br>
        Work Email: <input type="email" name="email" required>
        <br>
        <br>
        Department: <input type="text" name="department" required>
        <br>
        <br>

        <!-- guests, number entry -->
        Total guests: <input type="number" name="guests" min="0" required>
        <br>
        <br>

        <!-- food order, select checkbox -->
        Skills:<br>
        <input type="checkbox" name="food" value="Apple Cider"> Apple Cider
        <br>
        <input type="checkbox" name="food" value="Steak"> Steak
        <br>
        <input type="checkbox" name="food" value="Chocolate Cake"> Chocolate Cake
        <br>
        <br>

        <input type="submit" value="Submit Order">
    </form>
</body>
</html>