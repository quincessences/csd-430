<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="beans.LOTRCharacterBean" %>

<!-- 
Name: Maria Q. Michaels
Date: 1/18/2026
Assignment: CSD430 Module 4 Assignment
Assignment Purpose: Display JavaBean data
-->

<%
    LOTRCharacterBean[] characters = new LOTRCharacterBean[5];

    characters[0] = new LOTRCharacterBean();
    characters[0].setName("Smeagol");
    characters[0].setRace("Former Hobbit");
    characters[0].setFellowship("No");
    characters[0].setHomeland("Misty Mountains");
    characters[0].setRole("Temporary Ring Bearer");

    characters[1] = new LOTRCharacterBean();
    characters[1].setName("Sam Gamgee");
    characters[1].setRace("Hobbit");
    characters[1].setFellowship("Yes");
    characters[1].setHomeland("The Shire");
    characters[1].setRole("Gardener");

    characters[2] = new LOTRCharacterBean();
    characters[2].setName("Aragorn");
    characters[2].setRace("Human");
    characters[2].setFellowship("Yes");
    characters[2].setHomeland("Gondor");
    characters[2].setRole("Ranger");

    characters[3] = new LOTRCharacterBean();
    characters[3].setName("Legolas");
    characters[3].setRace("Elf");
    characters[3].setFellowship("Yes");
    characters[3].setHomeland("Mirkwood");
    characters[3].setRole("Archer");

    characters[4] = new LOTRCharacterBean();
    characters[4].setName("Gimli");
    characters[4].setRace("Dwarf");
    characters[4].setFellowship("Yes");
    characters[4].setHomeland("Lonely Mountain");
    characters[4].setRole("Warrior");
%>

<!DOCTYPE html>
<html>
<head>
    <title>LOTR Characters</title>
</head>

<body>

<h1>The Lord of the Rings</h1>
<h2>Main Characters</h2>

<p>
    This table displays character data from <em>The Lord of the Rings</em>.
    The data is stored in a JavaBean and accessed using JSP scriptlets.
</p>

<h3>Field Descriptions</h3>
<ul>
    <li><strong>Name:</strong> full name</li>
    <li><strong>Race:</strong> species or people</li>
    <li><strong>Fellowship:</strong> part of the fellowship</li>
    <li><strong>Homeland:</strong> origin/home </li>
    <li><strong>Role:</strong> role </li>
</ul>

<table border="1" cellpadding="5">
    <tr>
        <th>Name</th>
        <th>Race</th>
        <th>Fellowship Member</th>
        <th>Homeland</th>
        <th>Role</th>
    </tr>

    <%
        // display loop
        for (int i = 0; i < characters.length; i++) {
    %>
    <tr>
        <td><%= characters[i].getName() %></td>
        <td><%= characters[i].getRace() %></td>
        <td><%= characters[i].getFellowship() %></td>
        <td><%= characters[i].getHomeland() %></td>
        <td><%= characters[i].getRole() %></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>