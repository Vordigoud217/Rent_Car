USE Car_Rent_System

INSERT INTO Cars (Spec_ID, Car_Status_ID, Tariff_ID)
VALUES 
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(8, 1, 8),
	(9, 1, 9),
	(10, 1, 10)

SELECT * FROM Cars
SELECT * FROM Car_specifications
SELECT * FROM Car_Status
SELECT * FROM Tariff
SELECT * FROM Brands



INSERT INTO Clients (Surname, Name, Age, DeliveryAdress, DrivingExperience, Phone, EMail)
VALUES
	('Иванов', 'Олег', 21, 'Юлиуса Фучика 78', 2, +79870071723, 'Ivanov@mail.ru'),
	('Собиров', 'Мухаммад', 23, 'Ясная Поляна 3', 4, +79950081373, 'Sobirov33@mail.ru'),
	('Мамаев', 'Максим', 22, 'Волкова 23', 3, +79548821672, 'Mamaev@mail.ru'),
	('Курсачов', 'Алан', 25, 'Проспект Победы 55', 6, +79877771723, 'Kursachov@mail.ru'),
	('Ахметова', 'Райля', 24, 'Татарстана 12', 4, +79954245928, 'Akhmetova@mail.ru'),
	('Агазаде', 'Салех', 23, 'Ломжинская 18', 4, +78374625134, 'Agazade@mail.ru'),
	('Салахиев', 'Карим', 32, 'Минская 32', 13, +78564625134, 'Salahiev@mail.ru'),
	('Агишев', 'Андрей', 27, 'Бигичева 29А', 8, +74256321789, 'Agishev@mail.ru')

INSERT INTO Rental_data (Car_ID, Client_ID, Service_ID, Rent_Start_Date, Rent_End_Date, Total_Rent_Cost)
VALUES
	(1, 1, 1, '2023-10-23 12:00:00', '2023-10-30 12:00:00', 32000),
	(2, 2, NULL, '2023-10-26 18:00:00', '2023-10-29 18:00:00', 16500),
	(4, 4, 2, '2023-10-18 10:30:00', '2023-10-28 10:30:00', 88700),
	(5, 5, NULL, '2023-09-30 20:00:00', '2023-10-31 20:00:00', 54250),
	(7, 7, 3, '2023-10-29 06:00:00', '2023-10-30 06:00:00', 15750),
	(8, 8, NULL, '2023-10-25 13:00:00', '2023-10-30 13:00:00', 40000)

SELECT * FROM Rental_data
SELECT * FROM [Services]
SELECT * FROM Clients
SELECT * FROM Cars

INSERT INTO Car_Status (Car_Status_Description)
VALUES
	('Доступен'),
	('Не доступен')
SELECT * FROM Car_Status

UPDATE Cars
SET
Car_Status_ID = 2
WHERE
Car_ID IN (1, 2, 4, 5, 7, 8)

INSERT INTO Payments (Rent_ID, Payment_Date, Payment_Status ,Payment_Amount)
VALUES
	(1, '2023-10-23 12:00:00', 'Оплачено', 32000),
	(2, '2023-10-26 18:00:00', 'Оплачено', 16500),
	(3, '2023-10-18 10:30:00', 'Оплачено', 88700),
	(4, '2023-09-30 20:00:00', 'Оплачено', 54250),
	(5, '2023-10-29 06:00:00', 'Оплачено', 15750),
	(6, '2023-10-25 13:00:00', 'Оплачено', 40000)

INSERT INTO Tariff (Daily_Cost, Daily_Cost_Per_Week, Daily_Cost_Per_Month)
VALUES
	(5000, 4500, 4000),
	(5500, 5000, 4250),
	(8000, 7500, 6500),
	(10000, 8750, 8000),
	(2500, 2000, 1750),
	(4500, 4250, 4000),
	(15000, 13000, 10000),
	(8000, 7750, 7000),
	(4500, 4250, 4000),
	(3500, 3000, 2750)

INSERT INTO Insurances (Insurance_Type, Insurance_Cost)
VALUES
	('ОСАГО, Полное КАСКО', 50000),
	('ОСАГО', 7500),
	('ОСАГО', 7500),
	('ОСАГО, Полное КАСКО', 60000),
	('ОСАГО', 6000),
	('ОСАГО, Полное КАСКО', 45000),
	('ОСАГО, Полное КАСКО', 70000),
	('ОСАГО', 10000),
	('ОСАГО', 7000),
	('ОСАГО', 6000)

INSERT INTO [Services] (ServiceName, Service_Description, Service_Cost)
VALUES
	('GPS', 'Наличие GPS навигатор в машине', 500),	
	('Детское кресло', 'Наличие детского кресла в машине', 1200),	
	('Радар-детектор', 'Оборудование машины Радаром-детектором', 750),	
	('Замена колеса по адресу', null, 500),
	('Эвакуация автомобиля', null, 1500)

INSERT INTO Brands (BrandName)
VALUES
	('Audi'),
	('BMW'),
	('Kia'),
	('Mercedes-Benz'),
	('Toyota')
SELECT * FROM Brands


INSERT INTO Engines (Engine)
VALUES
	('Бензин'),
	('Дизель')
select * from Engines

INSERT INTO Transmissions (Transmission)
VALUES
	('Автоматическая'),
	('Механическая'),
	('Роботизированная')
select * from Transmissions

INSERT INTO DriveUnits (DriveUnit)
VALUES
	('Полный привод'),
	('Задний привод'),
	('Передний привод')
select * from DriveUnits

INSERT INTO Car_specifications (Model_ID, Brand_ID, Engine_ID, Transmission_ID, DriveUnit_ID)
VALUES
	(1, 1, 1, 3, 2),
	(2, 1, 2, 1, 1),
	(3, 2, 2, 1, 1),
	(4, 2, 1, 1, 1),
	(5, 3, 1, 2, 3),
	(6, 3, 1, 1, 2),
	(7, 4, 1, 1, 1),
	(8, 4, 1, 1, 2),
	(9, 5, 1, 1, 3),
	(10, 5, 1, 2, 3)
select * from Car_specifications

INSERT INTO Models (ModelName, Release_Year, Colour, Brand_ID)
VALUES
	('A5', 2020, 'Green', 1),
	('Q8', 2021, 'Black', 1),
	('X5', 2019, 'White', 2),
	('M3', 2020, 'Blue', 2),
	('Rio', 2017, 'Gray', 3),
	('K5', 2023, 'Black', 3),
	('Maybach', 2022, 'Silver', 4),
	('E-Klasse', 2018, 'Black', 4),
	('Camry', 2020, 'Red', 5),
	('Corolla', 2023, 'White', 5)
select * from Models

SELECT * FROM Car_specifications
SELECT * FROM Models
SELECT * FROM Cars

INSERT INTO Managers (FirstName, SecondName, Age)
VALUES
	('Евгений', 'Валуев', 33),
	('Александр', 'Валдавин', 35)
SELECT * FROM Managers

INSERT INTO ManagerRents (Manager_ID, Rent_ID)
VALUES (1, 1),
       (1, 2),
	   (1, 3),
       (2, 4),
       (2, 5),
       (2, 6)