<!-- 
Name: Maria Q. Michaels
Date: 1/25/2026
Assignment: CSD430 Module 5 & 6
Assignment Purpose: project pages - library dropdown selector + display page
 -->
 
 <%@ page import="beans.LibraryBean, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Michael's Library Viewer</title>
    <style>
        table {
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px 12px;
            text-align: left;
        }
        th {
            background-color: #eee;
        }
    </style>
</head>
<body>
<h1>CSD340 - Library</h1>
<p>Select a Book ID:</p>

<%
    // Create the bean
    LibraryBean lb = new LibraryBean();
    List<Integer> bookIds = new ArrayList<>();
    try {
        bookIds = lb.getAllBookIds();
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error loading books: " + e.getMessage() + "</p>");
    }

    // Get selected ID from request
    String selectedId = request.getParameter("bookId");
%>

<form method="get" action="">
    <label for="bookId">Book ID:</label>
    <select name="bookId" id="bookId">
        <%
            for(Integer id : bookIds) {
                String selected = "";
                if(selectedId != null && selectedId.equals(String.valueOf(id))) {
                    selected = "selected";
                }
        %>
            <option value="<%=id%>" <%=selected%>><%=id%></option>
        <%
            }
        %>
    </select>
    <input type="submit" value="Show Details">
</form>

<hr/>

<%
    // Display book details if a book is selected
    if(selectedId != null && !selectedId.isEmpty()) {
        try {
            int bookId = Integer.parseInt(selectedId);
            Map<String, String> book = lb.getBookById(bookId);

            if(!book.isEmpty()) {
%>
<table>
    <thead>
        <tr>
            <% for(String field : book.keySet()) { %>
                <th><%= field %></th>
            <% } %>
        </tr>
    </thead>
    <tbody>
        <tr>
            <% for(String value : book.values()) { %>
                <td><%=value%></td>
            <% } %>
        </tr>
    </tbody>
</table>
<%
            } else {
                out.println("<p>No book found with ID " + bookId + ".</p>");
            }
        } catch(Exception e) {
            out.println("<p style='color:red;'>Error fetching book: " + e.getMessage() + "</p>");
        }
    }
%>

</body>
</html>
 