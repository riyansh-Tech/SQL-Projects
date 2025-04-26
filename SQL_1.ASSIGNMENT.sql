CREATE DATABASE BRANDS;
CREATE DATABASE PRODUCTS;
------------------------------------
USE BRANDS;
-------------------------------------
CREATE TABLE ITEMS_TABLE(
	ITEM_ID INT PRIMARY KEY,
	ITEM_DESCRIPTION VARCHAR(200),
	Vendor_Nos int,
	Vendor_Name Varchar(200),
	Bottle_Size Int,
	Bottle_Price Decimal(10,2)
);
--------------------------------------
USE PRODUCTS;
--------------------------------------
CREATE TABLE PRODUCTS_SALES_TABLE(
    Product_ID INT PRIMARY KEY,
    Country NVARCHAR(50),
    Product NVARCHAR(50),
    [Units Sold] INT,
    [Manufacturing Unit] INT,
    [Sale Price] INT,
    [Gross Sales] INT,
    Sales INT, 
    COGS INT,
    Profit INT,
    [Date] DATE,
    [Month Number] INT,
    [Month Name] VARCHAR(20),
    [Year] INT 
);
-------------------------------------------------

Select * From ITEMS_TABLE;
Select * From PRODUCTS_SALES_TABLE
-------------------------------------------------

INSERT INTO ITEMS_TABLE VALUES
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.5),
(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);
----------------------------------------------------------------------------------------------------
Select * From PRODUCTS_SALES_TABLE

INSERT INTO PRODUCTS_SALES_TABLE VALUES
(1, 'Canada', 'Carretera', 20, 350, 15, 32370, 16185, 32370, 16185, '2014-03-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 20, 350, 15, 26420, 13210, 26420, 13210, '2015-06-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 15, 350, 12, 32670, 21780, 32670, 10890, '2016-01-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 15, 350, 12, 13320, 8880, 13320, 4440, '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 15, 350, 12, 37050, 24700, 37050, 12350, '2018-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 20, 529, 55, 136170, 529550, 52955, 39255, '2019-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 3, 350, 15, 13815, 27630, 13815, 13815, '2020-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana', 3, 350, 15, 30216, 60432, 30216, 30216, '2021-06-01', 6, 'June', 2021);
-----------------------------------------------------------------------------------------------------------------

DELETE FROM PRODUCTS_SALES_TABLE
WHERE [Units Sold] IN (1618.5, 888, 2470);

------------------------------------------------------
SELECT * FROM ITEMS_TABLE;
----------------------------------------------------------------------
SELECT ITEM_DESCRIPTION, Bottle_Price 
FROM ITEMS_TABLE;

---------------------------------------------------------------

SELECT ITEM_DESCRIPTION, Bottle_Price 
FROM ITEMS_TABLE
WHERE Bottle_Price > 20;

------------------------------------------------------------------

SELECT DISTINCT Country
FROM PRODUCTS_SALES_TABLE;

----------------------------------------

SELECT Count(Country) As [No.of Countries]
FROM PRODUCTS_SALES_TABLE;

------------------------------------------------

SELECT Count(Country) As [No.of Countries]
FROM PRODUCTS_SALES_TABLE
WHERE [Sale Price] BETWEEN 10 AND 20;

----------------------------------------------------
Select * From PRODUCTS_SALES_TABLE

SELECT SUM([Sale Price]) AS TotalSalePrice,
	   SUM([Gross Sales]) AS TotalGrossSales
FROM PRODUCTS_SALES_TABLE;
--------------------------------------------

SELECT TOP 1 [Year], SUM(Sales) AS TotalSales
FROM PRODUCTS_SALES_TABLE
GROUP BY [Year]
ORDER BY TotalSales DESC;