-- Basis data sudah dibuat oleh variabel MARIADB_DATABASE,
-- baris berikut memastikan skrip tetap aman jika dijalankan ulang.
CREATE DATABASE IF NOT EXISTS LibraryDB
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE LibraryDB;

-- Tabel Buku
CREATE TABLE IF NOT EXISTS Books (
    ISBN         VARCHAR(20) PRIMARY KEY,
    Title        VARCHAR(255) NOT NULL,
    Author       VARCHAR(255) NOT NULL,
    Genre        VARCHAR(100),
    Quantity     INT NOT NULL DEFAULT 0 CHECK (Quantity >= 0)
) ENGINE=InnoDB;

-- Tabel Anggota
CREATE TABLE IF NOT EXISTS Members (
    MemberId     INT AUTO_INCREMENT PRIMARY KEY,
    Name         VARCHAR(255) NOT NULL,
    Email        VARCHAR(255) UNIQUE,
    Phone        VARCHAR(20)
) ENGINE=InnoDB;

-- Tabel Peminjaman
CREATE TABLE IF NOT EXISTS Loans (
    LoanId       INT AUTO_INCREMENT PRIMARY KEY,
    MemberId     INT NOT NULL,
    ISBN         VARCHAR(20) NOT NULL,
    LoanDate     DATE NOT NULL,
    ReturnDate   DATE NULL,
    FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
) ENGINE=InnoDB;

-- Data Contoh
INSERT INTO Books (ISBN, Title, Author, Genre, Quantity) VALUES
('978-0140449136', 'The Odyssey', 'Homer', 'Classics', 5),
('978-0435133595', 'Harry Potter and the Goblet of Fire', 'J.K. Rowling', 'Fantasy', 10),
('978-0262033840', 'Introduction to Algorithms', 'Cormen et al.', 'Computer Science', 3);

INSERT INTO Members (Name, Email, Phone) VALUES
('John Doe', 'john.doe@example.com', '088012345678'),
('Mary James', 'mary.james@example.com', '08807854321');

INSERT INTO Loans (MemberId, ISBN, LoanDate, ReturnDate) VALUES
(1, '978-0140449136', '2025-11-21', '2025-11-15'),
(1, '978-0435133595', '2025-11-05', NULL),
(2, '978-0262033840', '2025-11-08', NULL);
```[cite: 2]