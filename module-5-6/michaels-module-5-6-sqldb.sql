CREATE DATABASE CSD430;

USE CSD430;

CREATE TABLE student1_library_data (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    year_published INT
);

INSERT INTO student1_library_data (title, author, genre, year_published) VALUES
('Game of Thrones', 'George R.R. Martin', 'Fantasy', 1996),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937),
('Lord of the Rings - The Fellowship of the Ring', 'J.R.R. Tolkien', 'Fantasy', 1954),
('Eragon', 'Christopher Paolini', 'Fantasy', 2002),
('Silmarillion', 'J.R.R. Tolkien', 'Fantasy', 1977),
('Princess Bride', 'William Goldman', 'Fantasy', 1973),
('Sabriel', 'Garth Nix', 'Fantasy', 1995),
('The Color of Magic', 'Terry Pratchett', 'Fantasy', 1983),
('Dune Chronicles', 'Frank Herbert', 'Science Fiction', 1965);

SELECT * FROM student1_library_data;

GRANT USAGE ON *.* TO 'student1'@'localhost'
GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost'