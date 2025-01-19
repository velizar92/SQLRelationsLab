IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'ECommerce')
  CREATE DATABASE ECommerce
GO

USE ECommerce
GO

CREATE TABLE Users(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	[Email] VARCHAR(100) NOT NULL,
	[RegistrationDate] DATE,
)

CREATE TABLE Products(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(200) NOT NULL,
	[Description] NVARCHAR(500),
	[Price] DECIMAL(10,2),
	[StockQuantity] INT,
)

CREATE TABLE Categories(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(100),
)

CREATE TABLE ProductsCategories(
	[ProductId] INT,
	[CategoryId] INT,
	PRIMARY KEY([ProductId], [CategoryId]),
	FOREIGN KEY([ProductId]) REFERENCES Products([Id]),
	FOREIGN KEY([CategoryId]) REFERENCES Categories([Id])
)

CREATE TABLE Orders(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[OrderDate] DATE,
	[UserId] INT,
	FOREIGN KEY([UserId]) REFERENCES Users([Id])
)

CREATE TABLE OrderDetails(
	[OrderId] INT,
	[ProductId] INT,
	[Quantity] INT,
	[Price] DECIMAL(10,2),
	PRIMARY KEY([OrderId], [ProductId]),
	FOREIGN KEY([OrderId]) REFERENCES Orders([Id]),
	FOREIGN KEY([ProductId]) REFERENCES Products([Id]),
)

CREATE TABLE PaymentDetails(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[CardNumber] VARCHAR(50),
	[CardType] VARCHAR(20),
	[ExpireDate] DATE,	
	[UserId] INT UNIQUE,
	FOREIGN KEY([UserId]) REFERENCES Users(Id)
)


INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Alice Johnson', 'alice.johnson@example.com', '2023-01-01');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Bob Smith', 'bob.smith@example.com', '2023-01-02');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Charlie Brown', 'charlie.brown@example.com', '2023-01-03');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Diana Prince', 'diana.prince@example.com', '2023-01-04');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Ethan Hunt', 'ethan.hunt@example.com', '2023-01-05');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Fiona Gallagher', 'fiona.gallagher@example.com', '2023-01-06');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('George Martin', 'george.martin@example.com', '2023-01-07');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Hannah Baker', 'hannah.baker@example.com', '2023-01-08');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Ian Fleming', 'ian.fleming@example.com', '2023-01-09');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Jane Austen', 'jane.austen@example.com', '2023-01-10');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Kevin Hart', 'kevin.hart@example.com', '2023-01-11');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Laura Palmer', 'laura.palmer@example.com', '2023-01-12');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Michael Scott', 'michael.scott@example.com', '2023-01-13');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Nancy Drew', 'nancy.drew@example.com', '2023-01-14');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Oscar Wilde', 'oscar.wilde@example.com', '2023-01-15');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Pam Beesly', 'pam.beesly@example.com', '2023-01-16');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Quincy Jones', 'quincy.jones@example.com', '2023-01-17');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Rachel Green', 'rachel.green@example.com', '2023-01-18');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Steve Rogers', 'steve.rogers@example.com', '2023-01-19');
INSERT INTO Users (Name, Email, RegistrationDate) VALUES ('Tina Fey', 'tina.fey@example.com', '2023-01-20');


INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Laptop', 'High-performance laptop', 999.99, 50);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Smartphone', 'Latest model smartphone', 799.99, 100);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Headphones', 'Noise-cancelling headphones', 199.99, 200);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Smartwatch', 'Feature-rich smartwatch', 299.99, 150);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Tablet', 'High-resolution tablet', 499.99, 80);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Camera', 'Digital SLR camera', 699.99, 60);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Printer', 'Wireless printer', 149.99, 120);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Monitor', '4K UHD monitor', 399.99, 70);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Keyboard', 'Mechanical keyboard', 89.99, 300);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Mouse', 'Wireless mouse', 49.99, 250);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Router', 'High-speed router', 129.99, 90);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('External Hard Drive', '1TB external hard drive', 79.99, 150);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Webcam', 'HD webcam', 59.99, 200);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Microphone', 'USB microphone', 99.99, 100);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Speaker', 'Bluetooth speaker', 149.99, 180);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Charger', 'Fast charger', 29.99, 400);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Power Bank', 'Portable power bank', 39.99, 250);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Smart Light', 'Smart LED light', 19.99, 300);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('VR Headset', 'Virtual reality headset', 499.99, 50);
INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES ('Drone', 'Quadcopter drone', 899.99, 40);


INSERT INTO Categories (Name) VALUES ('Electronics');
INSERT INTO Categories (Name) VALUES ('Computers');
INSERT INTO Categories (Name) VALUES ('Accessories');
INSERT INTO Categories (Name) VALUES ('Home Appliances');
INSERT INTO Categories (Name) VALUES ('Mobile Devices');
INSERT INTO Categories (Name) VALUES ('Audio');
INSERT INTO Categories (Name) VALUES ('Photography');
INSERT INTO Categories (Name) VALUES ('Office Supplies');
INSERT INTO Categories (Name) VALUES ('Gaming');
INSERT INTO Categories (Name) VALUES ('Networking');
INSERT INTO Categories (Name) VALUES ('Storage');
INSERT INTO Categories (Name) VALUES ('Video');
INSERT INTO Categories (Name) VALUES ('Lighting');
INSERT INTO Categories (Name) VALUES ('Wearables');
INSERT INTO Categories (Name) VALUES ('Power');
INSERT INTO Categories (Name) VALUES ('Smart Home');
INSERT INTO Categories (Name) VALUES ('Virtual Reality');
INSERT INTO Categories (Name) VALUES ('Drones');
INSERT INTO Categories (Name) VALUES ('Chargers');
INSERT INTO Categories (Name) VALUES ('Peripherals');

INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (1, 2);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (2, 5);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (3, 6);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (4, 14);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (5, 2);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (6, 7);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (7, 8);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (8, 1);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (9, 3);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (10, 3);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (11, 10);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (12, 11);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (13, 12);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (14, 6);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (15, 6);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (16, 19);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (17, 15);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (18, 13);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (19, 18);
INSERT INTO ProductsCategories (ProductId, CategoryId) VALUES (20, 18);


INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-01', 1);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-02', 2);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-03', 3);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-04', 4);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-05', 5);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-06', 6);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-07', 7);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-08', 8);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-09', 9);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-10', 10);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-11', 11);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-12', 12);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-13', 13);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-14', 14);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-15', 15);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-16', 16);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-17', 17);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-18', 18);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-19', 19);
INSERT INTO Orders (OrderDate, UserId) VALUES ('2023-01-20', 20);


INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (1, 1, 1, 999.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (2, 2, 2, 799.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (3, 3, 1, 199.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (4, 4, 1, 299.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (5, 5, 1, 499.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (6, 6, 1, 699.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (7, 7, 1, 149.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (8, 8, 1, 399.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (9, 9, 1, 89.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (10, 10, 1, 49.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (11, 11, 1, 129.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (12, 12, 1, 79.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (13, 13, 1, 59.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (14, 14, 1, 99.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (15, 15, 1, 149.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (16, 16, 1, 29.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (17, 17, 1, 39.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (18, 18, 1, 19.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (19, 19, 1, 499.99);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price) VALUES (20, 20, 1, 899.99);


INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('1234567890123456', 'Visa', '2025-01-01', 1);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('2345678901234567', 'MasterCard', '2025-02-01', 2);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('3456789012345678', 'Visa', '2025-03-01', 3);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('4567890123456789', 'MasterCard', '2025-04-01', 4);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('5678901234567890', 'Visa', '2025-05-01', 5);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('6789012345678901', 'MasterCard', '2025-06-01', 6);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('7890123456789012', 'Visa', '2025-07-01', 7);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('8901234567890123', 'MasterCard', '2025-08-01', 8);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('9012345678901234', 'Visa', '2025-09-01', 9);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('0123456789012345', 'MasterCard', '2025-10-01', 10);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('1123456789012345', 'Visa', '2025-11-01', 11);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('2123456789012345', 'MasterCard', '2025-12-01', 12);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('3123456789012345', 'Visa', '2026-01-01', 13);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('4123456789012345', 'MasterCard', '2026-02-01', 14);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('5123456789012345', 'Visa', '2026-03-01', 15);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('6123456789012345', 'MasterCard', '2026-04-01', 16);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('7123456789012345', 'Visa', '2026-05-01', 17);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('8123456789012345', 'MasterCard', '2026-06-01', 18);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('9123456789012345', 'Visa', '2026-07-01', 19);
INSERT INTO PaymentDetails (CardNumber, CardType, ExpireDate, UserId) VALUES ('0123456789012346', 'MasterCard', '2026-08-01', 20);

