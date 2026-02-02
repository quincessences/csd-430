<!--
Name: Maria Q. Michaels
Date: 2/1/2026
Assignment: CSD430 Module 7
Purpose: Add new library records and display all books
-->

<%@ page import="beans.LibraryBean, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    LibraryBean lb = new LibraryBean();
    String message = "";

    /* -------------------------
       Handle Add Book
    ------------------------- */
    String action = request.getParameter("action");

    if("add".equals(action)) {

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String genre = request.getParameter("genre");
        String year = request.getParameter("year");

        try {
            lb.addBook(title, author, genre, year);
            message = "Book successfully added!";
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }

    List<Map<String,String>> books = new ArrayList<>();

    try {
        books = lb.getAllBooks();
    } catch(Exception e) {
        message = "Error loading books.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Library Record Entry</title>

    <style>
        table {
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px 12px;
        }
        th {
            background-color: #eee;
        }
    </style>
</head>

<body>

<h1>Library Record Entry</h1>
<p>Add a new book to the database and view all stored records.</p>

<h2>Add Book</h2>

<form method="post">

    <input type="hidden" name="action" value="add">

    Title: <input type="text" name="title" required><br><br>
    Author: <input type="text" name="author" required><br><br>
    Genre: <input type="text" name="genre" required><br><br>
    Year Published: <input type="text" name="year" required><br><br>

    <input type="submit" value="Add Book">

</form>

<p style="color:green;"><b><%= message %></b></p>

<hr>

<h2>All Library Records</h2>

<table>
    <thead>
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
            <th>Year Published</th>
        </tr>
    </thead>

    <tbody>
    <%
        for(Map<String,String> book : books){
    %>
        <tr>
            <td><%= book.get("Book ID") %></td>
            <td><%= book.get("Title") %></td>
            <td><%= book.get("Author") %></td>
            <td><%= book.get("Genre") %></td>
            <td><%= book.get("Year Published") %></td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>