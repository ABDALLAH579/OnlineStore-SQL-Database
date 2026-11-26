--Abdallah Ahmed Hamdi
CREATE DATABASE OnlineStore


USE OnlineStore

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(200)
)
CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) UNIQUE NOT NULL,
    Description VARCHAR(200)
)
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Stock_Quantity INT NOT NULL DEFAULT 0 CHECK (Stock_Quantity >= 0),
    Category_ID INT NOT NULL,

    FOREIGN KEY (Category_ID)
    REFERENCES Categories(Category_ID)
)
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE DEFAULT GETDATE(),
    Customer_ID INT NOT NULL,
    Order_Status VARCHAR(20) DEFAULT 'Pending'
    CHECK (Order_Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),

    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID)
)
CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Unit_Price DECIMAL(10,2) NOT NULL CHECK (Unit_Price >= 0),

    FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID),

    FOREIGN KEY (Product_ID)
    REFERENCES Products(Product_ID)
)
USE OnlineStore

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
--//////////////

INSERT INTO Customers
(Customer_ID, Name, Email, Phone, Address)
VALUES
(1, 'Ahmed', 'ahmed@gmail.com', '01011111111', 'Cairo'),
(2, 'Mohamed', 'mohamed@gmail.com', '01022222222', 'Giza'),
(3, 'Ali', 'ali@gmail.com', '01033333333', 'Alexandria'),
(4, 'Omar', 'omar@gmail.com', '01044444444', 'Qalyubia'),
(5, 'Sara', 'sara@gmail.com', '01055555555', 'Cairo')

INSERT INTO Categories
(Category_ID, Category_Name, Description)
VALUES
(1, 'Electronics', 'Electronic devices'),
(2, 'Clothes', 'Clothing products'),
(3, 'Accessories', 'Personal accessories')

INSERT INTO Products
(Product_ID, Product_Name, Price, Stock_Quantity, Category_ID)
VALUES
(1, 'Laptop', 25000, 10, 1),
(2, 'Mobile', 12000, 15, 1),
(3, 'Headphones', 800, 20, 1),
(4, 'T-Shirt', 350, 30, 2),
(5, 'Jeans', 700, 15, 2),
(6, 'Watch', 1500, 12, 3),
(7, 'Backpack', 900, 10, 3),
(8, 'Sunglasses', 500, 25, 3)

INSERT INTO Orders
(Order_ID, Order_Date, Customer_ID, Order_Status)
VALUES
(1, '2026-11-15', 1, 'Pending'),
(2, '2026-11-16', 2, 'Shipped'),
(3, '2026-11-17', 3, 'Delivered'),
(4, '2026-11-18', 4, 'Pending'),
(5, '2026-11-19', 5, 'Delivered')

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Unit_Price)
VALUES
(1, 1, 1, 1, 25000),
(2, 1, 3, 2, 800),
(3, 2, 2, 1, 12000),
(4, 2, 4, 2, 350),
(5, 3, 5, 1, 700),
(6, 3, 6, 1, 1500),
(7, 4, 7, 2, 900),
(8, 5, 8, 1, 500)

SELECT * FROM Customers
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM Order_Details