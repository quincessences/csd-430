<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!-- 
Name: Maria Q. Michaels
Date: 12/21/2025
Assignment: CSD430 Module 2 Assignment - Working with JSP Forms
Assignment Purpose: Create a scriptlet for favorite book
 -->
 
<%
 String[][] characters = {
        {"Smeagol", "Former Hobbit", "No"},
        {"Sam Gamgee", "Hobbit", "Yes"},
        {"Aragorn", "Human", "Yes"},
        {"Legolas", "Elf", "Yes"},
        {"Gimli", "Dwarf", "Yes"},
    };
%>

<!DOCTYPE html>
<html>
<head>
    <title>LOTR Characters</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>

<h1>The Lord of the Rings</h1>
<h2>Characters</h2>

<p>
    A table of <em>The Lord of the Rings</em> characters by their species.
</p>

<h3>Fields:</h3>
<ul>
    <li><strong>Name:</strong> character's full name</li>
    <li><strong>Race:</strong> species or people of the character</li>
    <li><strong>Fellowship:</strong> indicator if the character was part of the Fellowship</li>
</ul>

<table>
    <tr>
        <th>Name</th>
        <th>Race</th>
        <th>Fellowship Member</th>
    </tr>

    <%
        // Loop through the character records and display each row
        for (int i = 0; i < characters.length; i++) {
    %>
    <tr>
        <td><%= characters[i][0] %></td>
        <td><%= characters[i][1] %></td>
        <td><%= characters[i][2] %></td>
    </tr>
    <%
        }
    %>

</table>

</body>
</html>