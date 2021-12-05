# Задание
# Используя JOIN’s и ShopDB получить имена покупателей
# и имена сотрудников у которых TotalPrice товара больше 1000

USE ShopDB;

SELECT SUM(TotalPrice)                             AS TotalInOrder,
       CONCAT(C.FName, ' ', C.MName, ' ', C.LName) AS Costumer,
       CONCAT(E.FName, ' ', E.MName, ' ', E.LName) AS Employee
FROM OrderDetails
         JOIN Orders O ON O.OrderID = OrderDetails.OrderID
         JOIN Employees E ON E.EmployeeID = O.EmployeeID
         JOIN Customers C ON C.CustomerNo = O.CustomerNo
GROUP BY O.OrderID
HAVING SUM(TotalPrice) > 1000