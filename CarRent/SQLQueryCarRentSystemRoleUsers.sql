USE Car_Rent_System

Create table [Role](
	ID int primary key identity,
	Name varchar(50)
)

Create table Users(
	UserID int primary key identity,
	FIO varchar(150) NOT NULL,
	PhoneNumber varchar(15) NOT NULL,
	Login varchar(100) NOT NULL,
	Password varchar(100) NOT NULL,
	RoleID int constraint DF_Users_RoleID default 2 foreign key references [Role](ID) NOT NULL
)

insert into [Role](Name)
Values ('Администратор'),
	   ('Менеджер')

SELECT * FROM Role

SELECT * FROM Users

Alter table Users
Drop FK__Users__RoleID__2BFE89A6