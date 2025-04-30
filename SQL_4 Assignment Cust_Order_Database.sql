CREATE DATABASE Customers_Orders_Products;

USE Customers_Orders_Products;

-- Create the Customers table

CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY,
 Name VARCHAR(50),
 Email VARCHAR(100)
);

-- Create the Orders table

CREATE TABLE Orders (
 OrderID INT PRIMARY KEY,
 CustomerID INT,
 ProductName VARCHAR(50),
 OrderDate DATE,
 Quantity INT,
 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Create the Products table
CREATE TABLE Products (
 ProductID INT PRIMARY KEY,
 ProductName VARCHAR(50),
 Price DECIMAL(10, 2)
);


-- Insert records into the Customers table
INSERT INTO Customers (CustomerID, Name, Email)
VALUES 
(1, 'John Doe', 'johndoe@example.com'), 
(2, 'Jane Smith', 'janesmith@example.com'), 
(3, 'Robert Johnson', 'robertjohnson@example.com'), 
(4, 'Emily Brown', 'emilybrown@example.com'),
(5, 'Michael Davis', 'michaeldavis@example.com'), 
(6, 'Sarah Wilson', 'sarahwilson@example.com'), 
(7, 'David Thompson', 'davidthompson@example.com'), 
(8, 'Jessica Lee', 'jessicalee@example.com'), 
(9, 'William Turner', 'williamturner@example.com'), 
(10, 'Olivia Martinez', 'oliviamartinez@example.com'),
(11, 'James Anderson', 'jamesanderson@example.com'),
(12, 'Kelly Clarkson', 'kellyclarkson@example.com');



-- Insert records into the Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Product A', 10.99), 
(2, 'Product B', 8.99), 
(3, 'Product C', 5.99), 
(4, 'Product D', 12.99), 
(5, 'Product E', 7.99), 
(6, 'Product F', 6.99), 
(7, 'Product G', 9.99), 
(8, 'Product H', 11.99), 
(9, 'Product I', 14.99), 
(10, 'Product J', 4.99),
(11, 'Product K', 3.99),
(12, 'Product L', 15.99);



-- Insert records into the Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES 
(1, 1, 'Product A', '2023-07-01', 5), 
(2, 2, 'Product B', '2023-07-02', 3), 
(3, 3, 'Product C', '2023-07-03', 2), 
(4, 4, 'Product A', '2023-07-04', 1), 
(5, 5, 'Product B', '2023-07-05', 4), 
(6, 6, 'Product C', '2023-07-06', 2), 
(7, 7, 'Product A', '2023-07-07', 3), 
(8, 8, 'Product B', '2023-07-08', 2), 
(9, 9, 'Product C', '2023-07-09', 5), 
(10, 10, 'Product A', '2023-07-10', 1),
(11, 11, 'Product D', '2023-07-10', 3),
(12, 12, 'Product E', '2023-07-11', 6),
(13, 5, 'Product G', '2023-07-12', 2),
(14, 4, 'Product H', '2023-07-13', 4),
(15, 6, 'Product I', '2023-07-14', 3)



-- After Creating tables Solve Following tasks:

-- Task 1 :-
-- 1. Write a query to retrieve all records from the Customers table..

SELECT * FROM Customers

-- 2. Write a query to retrieve the names and email addresses of customers whose names start with 'J'.

SELECT Name, Email 
from Customers
where name like 'J%'

-- 3. Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..

select OrderID, ProductName,Quantity
from Orders

-- 4. Write a query to calculate the total quantity of products ordered.

Select ProductName, sum(Quantity) as [Total Quantity]
from Orders
group by ProductName

-- 5. Write a query to retrieve the names of customers who have placed an order.

SELECT DISTINCT customers.Name
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID;

-- 6. Write a query to retrieve the products with a price greater than $10.00.
Select * from Products

Select ProductName, Price
From Products
where Price >=10

-- 7. Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

SELECT customers.Name, Orders.OrderDate
FROM customers
JOIN Orders ON customers.CustomerID = Orders.customerID
WHERE Orders.orderDate >= '2023-07-05';

-- 8. Write a query to calculate the average price of all products.

SELECT AVG(price) AS average_price
FROM products;
--------------OR--------------
Select ProductName, AVG(Price) as averagePrice
from Products
Group by ProductName

-- 9. Write a query to retrieve the customer names along with the total quantity of products they have ordered.

SELECT customers.Name, SUM(orders.quantity) AS total_quantity
FROM customers
JOIN orders ON customers.customerid = orders.customerid
GROUP BY customers.Name;

-- 10. Write a query to retrieve the products that have not been ordered.

SELECT products.productid, products.ProductName
FROM products
LEFT JOIN orders ON products.productid = orders.OrderID
WHERE orders.OrderID IS NULL;


-- Task 2 :-
-- 1. Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

SELECT TOP 5 customers.name, SUM(Orders.quantity) AS total_quantity
FROM customers
JOIN orders ON customers.customerid = orders.customerid
GROUP BY customers.name
ORDER BY total_quantity DESC

-- 2. Write a query to calculate the average price of products for each product category.

SELECT ProductName, AVG(price) AS average_price
FROM products
Group by ProductName

-- 3. Write a query to retrieve the customers who have not placed any orders.

Select Customers.CustomerID, Customers.Name
from Customers
left join Orders on Customers.CustomerID = Orders.CustomerID
where Orders.CustomerID is null

-- 4. Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.

Select Orders.OrderID, Orders.ProductName, Orders.Quantity, Customers.Name
from Orders
join Customers on Orders.OrderID = Customers.CustomerID
where Customers.Name Like 'M%'

-- 5. Write a query to calculate the total revenue generated from all orders.

Select SUM(Orders.Quantity * Products.Price) As [Total Revenue]
from Orders
join Products on Orders.OrderID = Products.ProductID

-- 6. Write a query to retrieve the customer names along with the total revenue generated from their orders.

Select Customers.Name,SUM(Orders.Quantity * Products.Price) As [Total Revenue]
from Orders
join Products on Orders.OrderID = Products.ProductID
join Customers on Orders.OrderID = Customers.CustomerID
Group by Customers.Name

-- 7. Write a query to retrieve the customers who have placed at least one order for each product category.

Select cs.CustomerID, cs.Name
from Customers cs
join Orders os ON  cs.CustomerID = os.CustomerID
join Products ps ON os.OrderID = ps.ProductID
Group by cs.CustomerID, cs.Name
Having COUNT( Distinct os.ProductName) = (Select COUNT(distinct ProductName) from Products)

-- 8. Write a query to retrieve the customers who have placed orders on consecutive days.

SELECT DISTINCT o1.customerid
FROM orders o1
JOIN orders o2 
ON o1.customerid = o2.customerid 
AND DATEDIFF(DAY,o2.OrderDate ,o1.OrderDate) = 1; 

-- 9. Write a query to retrieve the top 3 products with the highest average quantity ordered.

SELECT top 3 ProductName, AVG(quantity) AS avg_quantity
FROM orders
GROUP BY ProductName
ORDER BY avg_quantity DESC

-- 10. Write a query to calculate the percentage of orders that have a quantity greater than the average quantity

WITH avg_quantity AS (
    SELECT AVG(quantity) AS avg_qty
	FROM orders
)
SELECT 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders) AS percentage_high_quantity_orders
FROM orders o
JOIN avg_quantity a
ON o.quantity > a.avg_qty;


Hints to solve the Queries 
Task 1:

1. Retrieve all records from the Customers table:
o Hint: Use the SELECT statement with a wildcard to fetch all columns from the Customers table.

2. Retrieve the names and email addresses of customers whose names start with 'J':
o Hint: Use the LIKE operator with a wildcard % after 'J' to filter names.

3. Retrieve the order details (OrderID, ProductName, Quantity) for all orders:
o Hint: Select specific columns from the Orders table.

4. Calculate the total quantity of products ordered:
o Hint: Use the SUM function on the Quantity column in the Orders table.

5. Retrieve the names of customers who have placed an order:
o Hint: Perform a JOIN between the Customers and Orders tables on the CustomerID.

6. Retrieve the products with a price greater than $10.00:
o Hint: Use the WHERE clause to filter Price in the Products table.

7. Retrieve the customer name and order date for all orders placed on or after '2023-07-05':
o Hint: Use a JOIN and the WHERE clause to filter orders based on the OrderDate.

8. Calculate the average price of all products:
o Hint: Use the AVG function on the Price column in the Products table.

9. Retrieve the customer names along with the total quantity of products they have ordered:
o Hint: Perform a JOIN and use the SUM function with a GROUP BY on CustomerID.

10. Retrieve the products that have not been ordered:
o Hint: Use a LEFT JOIN between Products and Orders and filter with NULL check.


Task 2:

1. Retrieve the top 5 customers who have placed the highest total quantity of orders:
o Hint: Use GROUP BY on CustomerID, SUM on Quantity, and order by the sum in descending order with a LIMIT.

2. Calculate the average price of products for each product category:
o Hint: If you have categories, use GROUP BY on the category column and apply the AVG function on Price.

3. Retrieve the customers who have not placed any orders:
o Hint: Use a LEFT JOIN between Customers and Orders and filter with NULL check.

4. Retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M':
o Hint: Use a JOIN between Customers and Orders and filter Name with LIKE.

5. Calculate the total revenue generated from all orders:
o Hint: Multiply Quantity by Price and sum it up across all orders.

6. Retrieve the customer names along with the total revenue generated from their orders:
o Hint: Use JOIN and aggregate SUM of Quantity * Price with a GROUP BY on CustomerID.

7. Retrieve the customers who have placed at least one order for each product category:
o Hint: Use a HAVING clause after GROUP BY to ensure orders exist for all categories.

8. Retrieve the customers who have placed orders on consecutive days:
o Hint: Use DATEDIFF function or a LAG/LEAD window function to compare consecutive order dates for each customer.

9. Retrieve the top 3 products with the highest average quantity ordered:
o Hint: Use GROUP BY on ProductName and AVG on Quantity, then order by the average quantity and limit the result to 3

10. Calculate the percentage of orders that have a quantity greater than the average quantity:
o Hint: Calculate the average quantity first using AVG, then filter orders with quantity greater than this average, and calculate the percentage of such orders.