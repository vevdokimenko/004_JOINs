# Задание 2
# Создайте базу данных с именем “MyJoinsDB”.
CREATE DATABASE MyJoinsDB;

# Задание 3
# В данной базе данных создайте 3 таблицы,
USE MyJoinsDB;

# В 1-й таблице содержатся имена и номера телефонов сотрудников компании.
CREATE TABLE Employees
(
    Employee_ID   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    EmployeeFName VARCHAR(30)        NOT NULL,
    EmployeeLName VARCHAR(30)        NOT NULL,
    EmployeePhone VARCHAR(13)        NOT NULL
);

INSERT INTO Employees (EmployeeFName, EmployeeLName, EmployeePhone)
VALUES ('Иванов', 'Иван', '+380501234567'),
       ('Петров', 'Петр', '+380951234567'),
       ('Сергеев', 'Сергей', '+380661234567'),
       ('Андреев', 'Андрей', '+380671234567'),
       ('Егоров', 'Егор', '+380961234567');

# Во 2-й таблице содержатся ведомости о зарплате и должностях сотрудников: главный директор, менеджер, рабочий.
CREATE TABLE HRInfo
(
    Employee_ID INT         NOT NULL UNIQUE,
    Salary      DOUBLE      NOT NULL,
    Position    VARCHAR(30) NOT NULL,
    FOREIGN KEY (Employee_ID) REFERENCES Employees (Employee_ID)
);

INSERT INTO HRInfo (Employee_ID, Salary, Position)
VALUES (1, 50000, 'Главный директор'),
       (2, 30000, 'Менеджер'),
       (3, 10000, 'Рабочий'),
       (4, 20000, 'Бухгалтер'),
       (5, 30000, 'Юрист');

# В 3-й таблице содержится информация о семейном положении, дате рождения, и месте проживания.
CREATE TABLE PersonalData
(
    Employee_ID INT         NOT NULL UNIQUE,
    Status      VARCHAR(20) NOT NULL,
    Birthday    DATE        NOT NULL,
    Address     VARCHAR(30) NOT NULL,
    FOREIGN KEY (Employee_ID) REFERENCES Employees (Employee_ID)
);

INSERT INTO PersonalData (Employee_ID, Status, Birthday, Address)
VALUES (1, 'Женат', '1985-11-29', 'ул. Свободы, 45'),
       (2, 'Женат', '1988-08-03', 'ул. Независимости, 16'),
       (3, 'Не женат', '1999-06-09', 'ул. Мазепы, 18'),
       (4, 'Женат', '1990-10-30', 'ул. Петровского, 9'),
       (5, 'Не женат', '2001-07-17', 'ул. Институтская, 4');

# Задание 4
# Сделайте выборку при помощи JOIN’s для таких заданий:
# 1) Получите контактные данные сотрудников (номера телефонов, место жительства).
SELECT CONCAT(EmployeeFName, ' ', EmployeeLName, ', ', HI.Position) AS Employee,
       EmployeePhone,
       PD.Address
FROM Employees
         JOIN MyJoinsDB.PersonalData PD ON Employees.Employee_ID = PD.Employee_ID
         JOIN MyJoinsDB.HRInfo HI ON Employees.Employee_ID = HI.Employee_ID;

# 2) Получите информацию о дате рождения всех холостых сотрудников и их номера.
SELECT CONCAT(EmployeeFName, ' ', EmployeeLName, ', ', HI.Position) AS Employee,
       PD.Birthday,
       EmployeePhone
FROM Employees
         JOIN MyJoinsDB.PersonalData PD ON Employees.Employee_ID = PD.Employee_ID
         JOIN MyJoinsDB.HRInfo HI ON Employees.Employee_ID = HI.Employee_ID
WHERE PD.Status = 'Не женат';

# 3) Получите информацию обо всех менеджерах компании: дату рождения и номер телефона.
SELECT CONCAT(EmployeeFName, ' ', EmployeeLName, ', ', HI.Position) AS Employee,
       PD.Birthday,
       EmployeePhone
FROM Employees
         JOIN MyJoinsDB.PersonalData PD ON Employees.Employee_ID = PD.Employee_ID
         JOIN MyJoinsDB.HRInfo HI ON Employees.Employee_ID = HI.Employee_ID
WHERE HI.Position = 'Менеджер';

