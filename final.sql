-- Create the 'authors' table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);

-- Create the 'books' table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    publication_year INT,
    author_id INT,  -- Foreign key to authors
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create the 'borrowers' table
CREATE TABLE borrowers (
    borrower_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    date_of_birth DATE
);

-- Create the 'borrow_records' table to track borrowed books
CREATE TABLE borrow_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,  -- Foreign key to books
    borrower_id INT,  -- Foreign key to borrowers
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);

-- Example data insertion (optional for testing)
INSERT INTO authors (first_name, last_name, birth_date, nationality) 
VALUES 
('J.K.', 'Rowling', '1965-07-31', 'British'),
('George', 'Orwell', '1903-06-25', 'British');

INSERT INTO books (title, genre, publication_year, author_id) 
VALUES 
('Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 1997, 1),
('1984', 'Dystopian', 1949, 2);

INSERT INTO borrowers (first_name, last_name, email, phone, date_of_birth) 
VALUES 
('Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890', '1990-05-15'),
('Bob', 'Smith', 'bob.smith@example.com', '987-654-3210', '1985-09-25');

INSERT INTO borrow_records (book_id, borrower_id, borrow_date, return_date) 
VALUES 
(1, 1, '2025-05-01', '2025-05-15'),
(2, 2, '2025-05-03', NULL);
