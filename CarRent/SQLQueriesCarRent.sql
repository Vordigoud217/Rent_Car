USE Car_Rent_System

-- 1. Подсчет общего количества автомобилей
SELECT COUNT(*) AS TotalCars FROM Cars;

-- 2. Средняя стоимость аренды автомобиля
SELECT AVG(Total_Rent_Cost) AS AverageRentCost FROM Rental_data;

-- 3. Список автомобилей и их статусы
SELECT Cars.Car_ID, Car_Status.Car_Status_Description
FROM Cars 
LEFT JOIN Car_Status ON Cars.Car_Status_ID = Car_Status.Car_Status_ID;

-- 4. Список клиентов и их аренды
SELECT Clients.Client_ID, Clients.Name, Rental_data.Rent_ID
FROM Clients 
LEFT JOIN Rental_data ON Clients.Client_ID = Rental_data.Client_ID;

-- 5. Список арендованных автомобилей и их клиентов
SELECT Cars.Car_ID, Clients.Client_ID, Clients.Name
FROM Cars 
INNER JOIN Rental_data ON Cars.Car_ID = Rental_data.Car_ID
INNER JOIN Clients ON Rental_data.Client_ID = Clients.Client_ID;

-- 6. Список арендованных автомобилей и их статусы
SELECT Cars.Car_ID, Car_Status.Car_Status_Description
FROM Cars 
INNER JOIN Rental_data ON Cars.Car_ID = Rental_data.Car_ID
INNER JOIN Car_Status ON Cars.Car_Status_ID = Car_Status.Car_Status_ID;

-- 7. Список всех клиентов и менеджеров (UNION)
SELECT Client_ID AS ID, Name FROM Clients
UNION
SELECT Manager_ID AS ID, FirstName AS Name FROM Managers;

-- 8. Список клиентов, которые арендовали автомобили с двигателем 'Petrol', но не 'Diesel'
SELECT Client_ID FROM Rental_data 
INNER JOIN Cars ON Rental_data.Car_ID = Cars.Car_ID
INNER JOIN Car_specifications ON Cars.Spec_ID = Car_specifications.Spec_ID
WHERE Car_specifications.Engine = 'Petrol'
EXCEPT
SELECT Client_ID FROM Rental_data 
INNER JOIN Cars ON Rental_data.Car_ID = Cars.Car_ID
INNER JOIN Car_specifications ON Cars.Spec_ID = Car_specifications.Spec_ID
WHERE Car_specifications.Engine = 'Diesel';

-- 9. Отчет о количестве арендованных автомобилей по статусам
SELECT Car_Status.Car_Status_Description, COUNT(Cars.Car_ID) AS NumberOfCars
FROM Cars 
INNER JOIN Car_Status ON Cars.Car_Status_ID = Car_Status.Car_Status_ID
GROUP BY Car_Status.Car_Status_Description;

-- 10. Отчет о сумме оплат по аренде
SELECT Rental_data.Rent_ID, SUM(Payments.Payment_Amount) AS TotalPayment
FROM Rental_data 
INNER JOIN Payments ON Rental_data.Rent_ID = Payments.Rent_ID
GROUP BY Rental_data.Rent_ID;

-- 11. Представление списка арендованных автомобилей и их клиентов
CREATE VIEW RentedCars AS
SELECT Cars.Car_ID, Clients.Client_ID, Clients.Name
FROM Cars 
INNER JOIN Rental_data ON Cars.Car_ID = Rental_data.Car_ID
INNER JOIN Clients ON Rental_data.Client_ID = Clients.Client_ID;
SELECT * FROM RentedCars

-- 12. Представление отчета о количестве арендованных автомобилей по статусам
CREATE VIEW CarsByStatus AS
SELECT Car_Status.Car_Status_Description, COUNT(Cars.Car_ID) AS NumberOfCars
FROM Cars 
INNER JOIN Car_Status ON Cars.Car_Status_ID = Car_Status.Car_Status_ID
GROUP BY Car_Status.Car_Status_Description;
SELECT * FROM CarsByStatus

-- Проверка работы условий ограничений на данные
-- Попытка добавить автомобиль с годом выпуска ранее 2015 года
INSERT INTO Models (ModelName, Release_Year, Colour, Brand_ID)
VALUES ('A7', 2014, 'Green', 1);

-- Добавление тестового клиента
INSERT INTO Clients (Surname, Name, Age, DeliveryAdress, DrivingExperience, Phone, EMail)
VALUES ('Тест', 'Тест', 22, 'Тестовая улица 1', 2, +79870071724, 'Test@mail.ru');

-- Добавление тестовой аренды для тестового клиента
INSERT INTO Rental_data (Car_ID, Client_ID, Service_ID, Rent_Start_Date, Rent_End_Date, Total_Rent_Cost)
VALUES (1, (SELECT MAX(Client_ID) FROM Clients), 1, '2023-10-23 12:00:00', '2023-10-30 12:00:00', 32000);

-- Удаление тестового клиента
DELETE FROM Clients WHERE Client_ID = (SELECT MAX(Client_ID) FROM Clients);

-- Проверка, что аренда была удалена
SELECT * FROM Rental_data WHERE Client_ID = (SELECT MAX(Client_ID) FROM Clients);
---------------------------------------------------------------------------------------------------------- 
--Попытка вставить клиента с возрастом меньше 21 года:
INSERT INTO Clients (Surname, Name, Age, DeliveryAdress, DrivingExperience, Phone, EMail)
VALUES ('Тест', 'Тест', 20, 'Тестовый адрес', 3, +79999999999, 'test@mail.ru');

--Попытка вставить клиента с опытом вождения меньше 2 лет:
INSERT INTO Clients (Surname, Name, Age, DeliveryAdress, DrivingExperience, Phone, EMail)
VALUES ('Тест', 'Тест', 22, 'Тестовый адрес', 1, +79999999999, 'test@mail.ru');

--Попытка вставить автомобиль с типом двигателя, отличным от ‘Petrol’ или ‘Diesel’:
INSERT INTO Car_specifications (Model_ID, Engine, Transmission, DriveUnit)
VALUES (1, 'Electric', 'Automatic', 'AWD');

--Попытка вставить клиента с одинаковыми номерами телефона:
INSERT INTO Clients (Surname, Name, Age, DeliveryAdress, DrivingExperience, Phone, EMail)
VALUES ('Тест', 'Тест', 22, 'Тестовый адрес', 2, 79870071723, 'test2@mail.ru');

--Попытка вставить клиента с одинаковыми адресами электронной почты:
INSERT INTO Clients (Surname, Name, Age, DeliveryAdress, DrivingExperience, Phone, EMail)
VALUES ('Тест', 'Тест', 22, 'Тестовый адрес', 2, +79999999998, 'Ivanov@mail.ru');

--Проверка корректности работы целостности данных:
--Создание тестовых данных:
INSERT INTO Clients (Surname, Name, Age, DeliveryAdress, DrivingExperience, Phone, EMail)
VALUES ('Тест', 'Тест', 22, 'Тестовый адрес', 3, +79999999999, 'test@mail.ru');

INSERT INTO Rental_data (Client_ID, Spec_ID, Rent_Start_Date, Rent_End_Date)
VALUES 
	(13, 2, '2023-10-24 16:00:00', '2023-10-25 16:00:00')

SELECT * FROM Rental_data
--Удалить тестового клиента:
DELETE FROM Clients WHERE Surname = 'Тест' AND Name = 'Тест';

--Проверить, что Client_ID в таблице Rental_data был установлен в NULL:
SELECT * FROM Rental_data WHERE Client_ID IS NULL;

--Выборка данных из представления RentedCars:
SELECT * FROM RentedCars;

--Выборка данных из представления CarsByStatus:
SELECT * FROM CarsByStatus;

--Редактирование данных, отображаемых в представлении RentedCars:
UPDATE Rental_data SET Rent_Start_Date = '2023-11-01 12:00:00' WHERE Rent_ID = 1;
SELECT * FROM RentedCars;
SELECT * FROM Rental_data

--Удаление данных, отображаемых в представлении “RentedCars”:
DELETE FROM Rental_data WHERE Rent_ID = 1;
SELECT * FROM RentedCars;
SELECT * FROM Rental_data

--Добавление пользователей "Менеджер" и "Администратор" БД:
-- Создание логина и пользователя "Менеджер"
CREATE ROLE Manager;
CREATE LOGIN ManagerLogin WITH PASSWORD = 'ManagerPassword';
CREATE USER ManagerUser FOR LOGIN ManagerLogin;
GRANT SELECT, INSERT, DELETE, UPDATE ON ManagerRents TO Manager;
GRANT SELECT, INSERT, DELETE, UPDATE ON Rental_data TO Manager;
-- Присвоение роли Manager пользователю "Менеджер"
EXEC sp_addrolemember 'Manager', 'ManagerUser'
-- Создание логина и пользователя "Администратор"
CREATE LOGIN AdministratorLogin WITH PASSWORD = 'AdministratorPassword';
CREATE USER AdministratorUser FOR LOGIN AdministratorLogin;
-- Присвоение роли db_owner пользователю "Администратор"
EXEC sp_addrolemember 'db_owner', 'AdministratorUser';
