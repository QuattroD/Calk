CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL
);
CREATE TABLE Orders
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
    CustomerId INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
    CreatedAt DATE NOT NULL,
	ProductCount INT DEFAULT 1,
    Price MONEY NOT NULL
);
CREATE TABLE History 
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL,
    Operation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
);

insert into Products
values ('Shower','OOO Zavod',21,22200),
		('Pivo','OAO PivZavod',10,30000),
		('Verevka','PAO ShakiOnil',71,121000);

insert into Customers
values('Urdov Ivan Dubenkovich'),
		('Grigorin Gena Bukinovich');

insert into Orders
values(1,1,'21.11.2022',21,21000),
		(2,2,'21.6.2022',21,21000),
		(3,1,'30.11.2022',21,21000);

Create VIEW OrdersProductsCustomers
AS SELECT Orders.CreatedAt AS OrderDate, 
        Customers.FirstName AS Customer,
        Products.ProductName AS Product,	
FROM Orders INNER JOIN Products ON Orders.ProductId = Products.Id
INNER JOIN Customers ON Orders.CustomerId = Customers.Id

ALTER VIEW OrdersProductsCustomers
AS SELECT Customers.FirstName AS Customer,	    
		sum(Orders.Price) AS Sum,
		max(Orders.CreatedAt) AS LastDate
FROM Orders INNER JOIN Products ON Orders.ProductId = Products.Id
INNER JOIN Customers ON Orders.CustomerId = Customers.Id
GROUP BY Customers.FirstName

select * from OrdersProductsCustomers

WITH OrdersInfo AS
(
    SELECT ProductId, 
        SUM(ProductCount) AS TotalCount, 
        SUM(ProductCount * Price) AS TotalSum
    FROM Orders
    GROUP BY ProductId
)
 
SELECT * FROM OrdersInfo -- здесь нормально
SELECT * FROM OrdersInfo -- здесь ошибка
SELECT * FROM OrdersInfo -- здесь ошибка

GO
CREATE PROCEDURE CreateProduct
	@name NVARCHAR(20),
    @manufacturer NVARCHAR(20),
    @count INT,
    @price MONEY,
    @id INT OUTPUT
AS
    
begin
    IF(@price < 0)
       print'Error';
    ELSE
	INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price)
    VALUES(@name, @manufacturer, @count, @price)
    SET @id = @@IDENTITY
end

 --drop table Products

 DECLARE @id INT
EXEC CreateProduct 'LG V30', 'LG', 3,1222, @id OUTPUT
print @id



GO
CREATE TRIGGER Products_INSERT
ON Products
AFTER INSERT
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Добавлен товар ' + ProductName + '   фирма ' + Manufacturer
FROM INSERTED

GO
CREATE TRIGGER Products_DELETE
ON Products
AFTER DELETE
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Удален товар ' + ProductName + '   фирма ' + Manufacturer
FROM DELETED

GO
CREATE TRIGGER Products_UPDATE
ON Products
AFTER UPDATE
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Обновлен товар ' + ProductName + '   фирма ' + Manufacturer
FROM INSERTED

INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES('iPhone X', 'Apple', 2, 79900)

DELETE FROM Products
Where Id = 29


UPDATE Products SET Manufacturer='Apple inc.'
Where Manufacturer='Apple';

select* from History
select* from Products