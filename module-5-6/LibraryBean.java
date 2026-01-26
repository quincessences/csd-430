package beans;

import java.sql.*;
import java.util.*;

public class LibraryBean {

    private String url = "jdbc:mysql://localhost:3306/CSD430";
    private String username = "student1";
    private String password = "pass";

    private Connection conn;

    public void connect() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
    }

    public void disconnect() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

    public List<Integer> getAllBookIds() throws SQLException, ClassNotFoundException {
        connect();
        List<Integer> ids = new ArrayList<>();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT book_id FROM student1_library_data ORDER BY book_id");
        while (rs.next()) {
            ids.add(rs.getInt("book_id"));
        }
        rs.close();
        stmt.close();
        disconnect();
        return ids;
    }

    public Map<String, String> getBookById(int bookId) throws SQLException, ClassNotFoundException {
        connect();
        Map<String, String> book = new LinkedHashMap<>();
        PreparedStatement ps = conn.prepareStatement(
            "SELECT book_id, title, author, genre, year_published FROM student1_library_data WHERE book_id = ?"
        );
        ps.setInt(1, bookId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            book.put("Book ID", String.valueOf(rs.getInt("book_id")));
            book.put("Title", rs.getString("title"));
            book.put("Author", rs.getString("author"));
            book.put("Genre", rs.getString("genre"));
            book.put("Year Published", rs.getString("year_published"));
        }
        rs.close();
        ps.close();
        disconnect();
        return book;
    }
}
