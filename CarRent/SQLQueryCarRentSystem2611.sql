CREATE DATABASE Car_Rent_System
USE Car_Rent_System

--Таблица "Автомобили"

CREATE TABLE Cars
(
	Car_ID int constraint PK_Car_ID PRIMARY KEY identity,
	Spec_ID int constraint FK_Cars_Spec_ID FOREIGN KEY REFERENCES Car_specifications(Spec_ID) ON DELETE CASCADE NOT NULL,
	Car_Status_ID int constraint FK_Cars_Car_Status_ID FOREIGN KEY REFERENCES Car_Status(Car_Status_ID) ON DELETE SET NULL,
)
SELECT * FROM Cars

Alter table Cars add Price int

SELECT * FROM Tariff

alter table Cars
drop column Insurance_ID

--Таблица "Клиенты"

--CREATE TABLE Clients
--(
--	Client_ID int constraint PK_Client_ID PRIMARY KEY identity,
--	Surname varchar(40) NOT NULL,
--	Name varchar(40) NOT NULL,
--	DeliveryAdress varchar(40) NOT NULL,
--	Age int constraint CK_Age CHECK(Age >= 21),
--	DrivingExperience int constraint CK_DrivingExperience CHECK(DrivingExperience >= 2),
--	Phone decimal(12,0) constraint Phone_UNIQ UNIQUE,
--	EMail varchar(255) constraint EMail_UNIQ UNIQUE NOT NULL
--)
--SELECT * FROM Clients

alter table Clients
add BirthDate date null

alter table Clients
drop column DrivingExperience

alter table Clients
drop CK_DrivingExperience

alter table Clients
add 

alter table Clients
drop CK_age

alter table Car_specifications
add ImageCar image null

--Таблица "Арендные данные"

--CREATE TABLE Rental_data
--(
--	Rent_ID int constraint PK_Rent_ID PRIMARY KEY identity,
--	Car_ID int constraint FK_Rental_data_Car_ID FOREIGN KEY REFERENCES Cars(Car_ID) ON DELETE CASCADE NOT NULL,
--	Client_ID int constraint FK_Rental_data_Client_ID FOREIGN KEY REFERENCES Clients(Client_ID) ON DELETE CASCADE NOT NULL,
--	Service_ID int constraint FK_Rental_data_Service_ID FOREIGN KEY REFERENCES [Services](Service_ID) ON DELETE SET NULL,
--	Rent_Start_Date datetime NOT NULL,
--	Rent_End_Date datetime NOT NULL,
--	Total_Rent_Cost money
--)
--SELECT * FROM Rental_data

--Таблица "Детали аренды"

--create table RentDetails
--(
--	RentDetails_ID int constraint PK_RentDetails_ID PRIMARY KEY identity,
--	Rent_ID int constraint FK_Rent_ID foreign key references Rental_data(Rent_ID),
--	Service_ID int constraint FK_Service_ID foreign key references [Services](Service_ID)
--)

--CREATE TABLE [Services]
--(
--	Service_ID int constraint PK_Service_ID PRIMARY KEY identity,
--	ServiceName varchar(40) NOT NULL,
--	Service_Description varchar(250),
--	Service_Cost money NOT NULL
--)
--SELECT * FROM [Services]

--Таблица "Статус автомобиля"
--CREATE TABLE Car_Status
--(
--	Car_Status_ID int constraint PK_Car_Status_ID PRIMARY KEY identity,
--	Car_Status_Description varchar(40) NOT NULL
--)
--SELECT * FROM Car_Status

--Таблица "Платежи"

--CREATE TABLE Payments
--(
--	Payment_ID int constraint PK_Payment_ID PRIMARY KEY identity,
--	Rent_ID int constraint FK_Payments_Rent_ID FOREIGN KEY REFERENCES Rental_data(Rent_ID) ON DELETE CASCADE NOT NULL,
--	Payment_Date datetime,
--	Payment_Status varchar(40) constraint DF_Payment_Status DEFAULT 'Оплачено',
--	Payment_Amount money NOT NULL
--)
--SELECT * FROM Payments

--Таблица "Тариффы"

--CREATE TABLE Tariff
--(
--	Tariff_ID int constraint PK_Tariff_ID PRIMARY KEY identity,
--	Daily_Cost money NOT NULL
--)
--SELECT * FROM Tariff

--Таблица "Спецификации автомобилей"

CREATE TABLE Car_specifications
(
	Spec_ID int constraint PK_Spec_ID PRIMARY KEY identity,
	Model_ID int constraint FK_Car_specifications_Model_ID FOREIGN KEY REFERENCES Models(Model_ID) NOT NULL,
	Brand_ID int constraint FK_Car_specifications_Brand_ID FOREIGN KEY REFERENCES Brands(Brand_ID) NOT NULL,
	Engine_ID int constraint FK_Car_specifications_Engine_ID FOREIGN KEY REFERENCES Engines(Engine_ID) NOT NULL,
	Transmission_ID int constraint FK_Car_specifications_Transmission_ID FOREIGN KEY REFERENCES Transmissions(Transmission_ID) NOT NULL,
	DriveUnit_ID int constraint FK_Car_specifications_DriveUnit_ID FOREIGN KEY REFERENCES DriveUnits(DriveUnit_ID) NOT NULL
	price int
)
SELECT * FROM Car_specifications

CREATE TABLE Engines
(
	Engine_ID int constraint PK_Engine_ID primary key identity,
	Engine varchar(40) NOT NULL
)
select * from Engines

CREATE TABLE DriveUnits
(
	DriveUnit_ID int constraint PK_DriveUnit_ID primary key identity,
	DriveUnit varchar(40) NOT NULL
)
select * from DriveUnits

CREATE TABLE Transmissions
(
	Transmission_ID int constraint PK_Transmission_ID primary key identity,
	Transmission varchar(40) NOT NULL
)

CREATE TABLE Brands
(
	Brand_ID int constraint PK_Brand_ID PRIMARY KEY identity,
	BrandName varchar(40) NOT NULL
)








--Таблица "Марки"

SELECT * FROM Brands

--Таблица "Модели"

CREATE TABLE Models
(
	Model_ID int constraint PK_Model_ID PRIMARY KEY identity,
	ModelName varchar(40) NOT NULL,
	Release_Year int constraint CK_Release_Year CHECK(Release_Year >=2015) NOT NULL,
	Colour varchar(40) NOT NULL,
	Brand_ID int constraint FK_Model_Brand_ID FOREIGN KEY REFERENCES Brands(Brand_ID) NOT NULL
)
SELECT * FROM Models



--Таблица "Менеджеры"

--CREATE TABLE Managers
--(
--	Manager_ID int constraint PK_Manager_ID PRIMARY KEY identity,
--	FirstName varchar(40),
--	SecondName varchar(40),
--	Age int constraint CH_Age CHECK(Age >= 23)
--)
--SELECT * FROM Managers

--Таблица "Менеджеры ии Аренда"

--CREATE TABLE ManagerRents
--(
--	ManagerRent_ID int constraint PK_ManagerRent_ID PRIMARY KEY identity,
--	Manager_ID int constraint FK_ManagerRents_Manager_ID FOREIGN KEY REFERENCES Managers(Manager_ID) ON DELETE CASCADE NOT NULL,
--	Rent_ID int constraint FK_ManagerRents_Rent_ID FOREIGN KEY REFERENCES Rental_data(Rent_ID) ON DELETE CASCADE NOT NULL,
--)
SELECT * FROM ManagerRents
-- Представление всех клиентов и их арендованных автомобилей
CREATE VIEW ClientsAndCars AS
SELECT Clients.Client_ID, Clients.Surname, Clients.Name, Cars.Car_ID
FROM Clients
JOIN Rental_data ON Clients.Client_ID = Rental_data.Client_ID
JOIN Cars ON Rental_data.Car_ID = Cars.Car_ID;

SELECT * FROM ClientsAndCars
-- Представление всех оплат по аренде для клиентов на основании предыдущего представления
CREATE VIEW ClientsPayments AS
SELECT ClientsAndCars.Client_ID, ClientsAndCars.Surname, ClientsAndCars.Name, Payments.Payment_Amount
FROM ClientsAndCars
JOIN Rental_data ON ClientsAndCars.Client_ID = Rental_data.Client_ID
JOIN Payments ON Rental_data.Rent_ID = Payments.Rent_ID;

SELECT * FROM ClientsPayments