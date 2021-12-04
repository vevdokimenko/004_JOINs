# Для базы данных издательства написать следующие запросы:
USE Publishing;

# 1. Показать все книги трех произвольных авторов.
SELECT NameBook, Price, DrawingOfBook, Pages, FirstName AS AuthorFName, LastName AS AuthorLName
FROM Books
         JOIN Authors A ON A.ID_AUTHOR = Books.ID_AUTHOR
WHERE FirstName IN ('Sam', 'Drek', 'Vlad');

# 2. Показать все книги, в которых количество страниц больше 500, но меньше 650.
SELECT NameBook, FirstName, LastName, Pages
FROM Books
         JOIN Authors A ON A.ID_AUTHOR = Books.ID_AUTHOR
WHERE Pages > 500
  AND Pages < 650;

# 3. Необходимо вывести все названия книг, в которых первая буква или А, или С.
SELECT FirstName, LastName, NameBook, Price, Pages
FROM Books
         JOIN Authors A ON A.ID_AUTHOR = Books.ID_AUTHOR
WHERE NameBook LIKE 'A%'
   OR NameBook LIKE 'C%';

# 4. Показать названия книг, тематика которых не "Science Fiction" и тираж которых >=20 экземпляров.
SELECT NameBook, NameTheme, DrawingOfBook
FROM Books
         JOIN Themes T ON T.ID_THEME = Books.ID_THEME
WHERE NameTheme NOT LIKE 'Science Fiction'
  AND DrawingOfBook >= 20;

# 5. Показать все книги, цена которых ниже $30.
SELECT FirstName, LastName, NameBook, Price
FROM Books
         JOIN Authors A ON A.ID_AUTHOR = Books.ID_AUTHOR
WHERE Price < 30;

# 6. Показать книги, в названиях которые начинаются на "Microsoft", и не заканчиваются на "Windows".
SELECT FirstName, LastName, NameBook, Price
FROM Books
         JOIN Authors A ON A.ID_AUTHOR = Books.ID_AUTHOR
WHERE NameBook LIKE 'Microsoft%'
  AND NameBook NOT LIKE '%Windows';

# 7. Вывести названия книг, тематику, автора (полное имя), цена одной страницы которых менее 10 центов.
SELECT NameBook, NameTheme, FirstName, LastName, (Price / Pages) AS OnePagePrice
FROM Books
         JOIN Authors A ON A.ID_AUTHOR = Books.ID_AUTHOR
         JOIN Themes T ON T.ID_THEME = Books.ID_THEME
GROUP BY NameBook, NameTheme, FirstName, LastName, OnePagePrice
HAVING OnePagePrice < 0.10;

# 8. Показать все магазины из Украины.
SELECT NameShop, NameСountry
FROM Shops
         JOIN Country C ON C.ID_COUNTRY = Shops.ID_COUNTRY
WHERE NameСountry = 'Ukraine';
