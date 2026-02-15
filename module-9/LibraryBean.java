package beans;

import java.sql.*;
import java.util.*;

public class LibraryBean {

    private String url = "jdbc:mysql://localhost:3306/CSD430";
    private String username = "student1";
    private String password = "pass";

    private Connection conn;

    // =====================================================
    // db
    // =====================================================
    public void connect() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
    }

    public void disconnect() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

    // =====================================================
    // module 8 - dropdown
    // =====================================================
    public List<Integer> getAllBookIds()
            throws SQLException, ClassNotFoundException {

        connect();

        List<Integer> ids = new ArrayList<>();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(
            "SELECT book_id FROM student1_library_data ORDER BY book_id"
        );

        while (rs.next()) {
            ids.add(rs.getInt("book_id"));
        }

        rs.close();
        stmt.close();
        disconnect();

        return ids;
    }

    // =====================================================
    // module 8 - retrieve
    // =====================================================
    public Map<String, String> getBookById(int bookId)
            throws SQLException, ClassNotFoundException {

        connect();

        Map<String, String> book = new LinkedHashMap<>();

        PreparedStatement ps = conn.prepareStatement(
            "SELECT book_id, title, author, genre, year_published " +
            "FROM student1_library_data WHERE book_id = ?"
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

    // =====================================================
    // module 8 - update
    // =====================================================
    public void updateBook(int bookId, String title, String author,
                           String genre, String year)
            throws SQLException, ClassNotFoundException {

        connect();

        String sql =
            "UPDATE student1_library_data " +
            "SET title = ?, author = ?, genre = ?, year_published = ? " +
            "WHERE book_id = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, author);
        ps.setString(3, genre);
        ps.setString(4, year);
        ps.setInt(5, bookId);

        ps.executeUpdate();

        ps.close();
        disconnect();
    }

    // =====================================================
    // module 7 - insert
    // =====================================================
    public void addBook(String title, String author,
                        String genre, String year)
            throws SQLException, ClassNotFoundException {

        connect();

        String sql =
            "INSERT INTO student1_library_data " +
            "(title, author, genre, year_published) " +
            "VALUES (?, ?, ?, ?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, author);
        ps.setString(3, genre);
        ps.setString(4, year);

        ps.executeUpdate();

        ps.close();
        disconnect();
    }

    // =====================================================
    // module 7 - display
    // =====================================================
    public List<Map<String, String>> getAllBooks()
            throws SQLException, ClassNotFoundException {

        connect();

        List<Map<String, String>> books = new ArrayList<>();

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(
            "SELECT book_id, title, author, genre, year_published " +
            "FROM student1_library_data ORDER BY book_id"
        );

        while (rs.next()) {

            Map<String, String> book = new LinkedHashMap<>();

            book.put("Book ID", String.valueOf(rs.getInt("book_id")));
            book.put("Title", rs.getString("title"));
            book.put("Author", rs.getString("author"));
            book.put("Genre", rs.getString("genre"));
            book.put("Year Published", rs.getString("year_published"));

            books.add(book);
        }

        rs.close();
        stmt.close();
        disconnect();

        return books;
    }
    
    // =====================================================
    // module 9 - delete
    // =====================================================
 public void deleteBook(int bookId)
         throws SQLException, ClassNotFoundException {

     connect();

     String sql = "DELETE FROM student1_library_data WHERE book_id = ?";

     PreparedStatement ps = conn.prepareStatement(sql);
     ps.setInt(1, bookId);

     ps.executeUpdate();

     ps.close();
     disconnect();
 }

}
