<!--
Name: Maria Q. Michaels
Date: 2/8/2026
Assignment: CSD430 Module 8
Purpose: Add new library records and display all books
-->

<%@ page import="java.util.*" %>
<jsp:useBean id="libBean" class="beans.LibraryBean" scope="session" />

<html>
<head>
    <title>Update Library Record</title>
</head>
<body>

<h2>Update a Library Book Record</h2>

<%
    String action = request.getParameter("action");
%>

<!-- =======================
     dropdown select
     ======================= -->
<% if (action == null) { %>

<form method="post">
    <input type="hidden" name="action" value="select">

    Select book ID to edit:
    <select name="book_id">
        <%
            for (Integer id : libBean.getAllBookIds()) {
        %>
            <option value="<%= id %>"><%= id %></option>
        <%
            }
        %>
    </select>

    <input type="submit" value="Edit Book">
</form>

<!-- =======================
     edit record
     ======================= -->
<% } else if ("select".equals(action)) {

    int bookId = Integer.parseInt(request.getParameter("book_id"));
    Map<String,String> book = libBean.getBookById(bookId);
%>

<form method="post">
    <input type="hidden" name="action" value="update">

    Book ID:
    <b><%= book.get("Book ID") %></b>
    <input type="hidden" name="book_id" value="<%= book.get("Book ID") %>">
    <br><br>

    Title:
    <input type="text" name="title" value="<%= book.get("Title") %>">
    <br><br>

    Author:
    <input type="text" name="author" value="<%= book.get("Author") %>">
    <br><br>

    Genre:
    <input type="text" name="genre" value="<%= book.get("Genre") %>">
    <br><br>

    Year Published:
    <input type="text" name="year" value="<%= book.get("Year Published") %>">
    <br><br>

    <input type="submit" value="Update Book">
</form>

<!-- =======================
     update/display
     ======================= -->
<% } else if ("update".equals(action)) {

    int bookId = Integer.parseInt(request.getParameter("book_id"));
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String genre = request.getParameter("genre");
    String year = request.getParameter("year");

    libBean.updateBook(bookId, title, author, genre, year);
    Map<String,String> book = libBean.getBookById(bookId);
%>

<h3>Book updated successfully!</h3>

<table border="1">
    <tr>
        <th>Book ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Genre</th>
        <th>Year Published</th>
    </tr>
    <tr>
        <td><%= book.get("Book ID") %></td>
        <td><%= book.get("Title") %></td>
        <td><%= book.get("Author") %></td>
        <td><%= book.get("Genre") %></td>
        <td><%= book.get("Year Published") %></td>
    </tr>
</table>

<br>
<a href="updateBook.jsp">Update another book?k</a>

<% } %>

</body>
</html>
