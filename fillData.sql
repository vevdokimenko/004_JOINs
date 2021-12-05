USE Publishing;

INSERT INTO Themes
(NameTheme)
VALUES ('Computer science'),
       ('Programming'),
       ('Web Development'),
       ('Database theory'),
       ('Networks ans security');

INSERT INTO Country
(NameСountry)
VALUES ('USA'),
       ('France'),
       ('Germany'),
       ('England'),
       ('Ukraine'),
       ('Sweden'),
       ('Poland'),
       ('Italy'),
       ('Spain'),
       ('Greece');

INSERT INTO Authors
(FirstName, LastName, Id_Country)
VALUES ('Patrick', 'Fluince', 2),
       ('Mark', 'Schaize', 3),
       ('Sam', 'Duck', 4),
       ('Ganna', 'Lyisko', 5),
       ('Drek', 'Frucken', 6),
       ('Janush', 'Navak', 7),
       ('Vlad', 'Ole', 8),
       ('Eden', 'Speilenman', 9),
       ('Aristotel', 'Greckiy', 10),
       ('John', 'Nork', 1);


INSERT INTO Books
(NameBook, Price, DrawingOfBook, Pages, Id_Theme, Id_Author)
VALUES ('First steps on PC', 59.99, 10000, 345, 1, 10),
       ('PC it is pro100', 29.99, 5000, 444, 1, 10),
       ('C++ for newbies', 35.99, 15000, 542, 2, 3),
       ('C++ for professional', 39.99, 25000, 245, 2, 3),
       ('HTML + CSS', 25.99, 50000, 564, 3, 3),
       ('HTML 5.0', 20.99, 45000, 600, 3, 3),
       ('MS SQL', 15.95, 65000, 755, 4, 4),
       ('NoSQL', 55.55, 85000, 350, 4, 4),
       ('Theory of TCP\IP', 15.95, 20000, 588, 5, 5),
       ('Introducing on network', 17.95, 22000, 754, 5, 5),
       ('Newest PC', 95.59, 75000, 792, 1, 6),
       ('Overclocking PC', 105.59, 97000, 379, 1, 6),
       ('Java for newbies', 58.49, 38000, 555, 2, 7),
       ('C# and WPF for professional', 55.99, 50000, 888, 2, 7),
       ('Phyton for web', 76.55, 50000, 564, 3, 8),
       ('JavaScript for web', 67.50, 45000, 600, 3, 8),
       ('MS SQL 2017', 15.95, 95000, 755, 4, 9),
       ('Introducing to NoSQL', 144.99, 77550, 350, 4, 9),
       ('TCP\IP protocol', 99.95, 24000, 788, 5, 10),
       ('Hacking on networks', 87.95, 27000, 454, 5, 10);

INSERT INTO Shops
(NameShop, Id_Country)
VALUES ('Books for IT', 2),
       ('ITBook', 3),
       ('Book.com', 4),
       ('Books.Kingdom', 5),
       ('RidniBooks', 6),
       ('Readers.SW', 7),
       ('Bukwoedy', 8);


INSERT INTO Sales
(Id_Book, Price, Quantity, Id_Shop)
VALUES
    (5, 88.75, 11, 5),
    (3, 43.99, 33, 6),
    (1, 39.99, 44, 7),
    (6, 11.75, 9, 1),
    (9, 35.75, 8, 2),
    (10, 44.15, 65, 3),
    (3, 22.15, 56, 4),
    (2, 115.55, 32, 5),
    (4, 79.99, 27, 6),
    (7, 95.49, 67, 7),
    (8, 13.95, 14, 3),
    (4, 137.95, 53, 2),
    (2, 225.00, 12, 1),
    (8, 145.95, 23, 5),
    (1, 88.75, 45, 7);