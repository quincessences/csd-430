<!--
Name: Maria Q. Michaels
Date: 2/15/2026
Assignment: CSD430 Module 9
Purpose: Display all records and allow delete using id
-->

<%@ page import="beans.LibraryBean, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    LibraryBean lb = new LibraryBean();
    String message = "";

    String action = request.getParameter("action");

    if("delete".equals(action)) {

        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            lb.deleteBook(bookId);
            message = "Book ID " + bookId + " successfully deleted.";
        } catch(Exception e) {
            message = "Error deleting book: " + e.getMessage();
        }
    }

    List<Map<String,String>> books = new ArrayList<>();
    List<Integer> ids = new ArrayList<>();

    try {
        books = lb.getAllBooks();
        ids = lb.getAllBookIds();
    } catch(Exception e) {
        message = "Error loading records.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Library Records</title>

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

<h1>Delete Library Records</h1>
<p>Select a Book ID to delete a record.</p>

<form method="post">

    <input type="hidden" name="action" value="delete">

    <label>Select Book ID:</label>

    <select name="bookId" required>
        <%
            for(Integer id : ids){
        %>
            <option value="<%= id %>"><%= id %></option>
        <%
            }
        %>
    </select>

    <input type="submit" value="Delete Book">

</form>

<p style="color:red;"><b><%= message %></b></p>

<hr>

<h2>Current Library Records</h2>

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