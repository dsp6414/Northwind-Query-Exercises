
    --1.Retrieve all products with a unit price greater than $50.
    --检索单价大于50美元的所有产品。   

    SELECT ProductName, UnitPrice
    FROM Products
    WHERE UnitPrice > 50;

    --2.List the names of all customers from London.
    --列出来自London的所有客户的姓名。   

    SELECT CompanyName
    FROM Customers
    WHERE City = 'London';


    --3. Find all orders shipped by "Speedy Express".
    --查找所有通过“Speedy Express”发货的订单。   

    SELECT o.*,s.*
    FROM Orders o
    JOIN Shippers s ON o.ShipVia = s.ShipperID
    WHERE s.CompanyName = 'Speedy Express';

            
    --4.Get the total number of orders placed by customer "BONAP".
    --获取客户“BONAP”下的订单总数。   

    SELECT COUNT(*)
    FROM Orders
    WHERE CustomerID = 'BONAP';

    --or

    SELECT COUNT(*)
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE c.CustomerID = 'BONAP';
      

    --5.List all employees who are 'Sales Representative'.
    --列出所有担任经理的员工。   

    SELECT *
    FROM Employees
    WHERE Title = 'Sales Representative';

            
    --6.-- Find products that are discontinued.
    --查找已停产的产品。   

    SELECT *
    FROM Products
    WHERE Discontinued = 1;
           

    --7.-- Retrieve the names and phone numbers of all suppliers.
    --检索所有供应商的名称和电话号码。
   

    SELECT CompanyName, Phone
    FROM Suppliers;
            
    --8.Get all orders placed in the year 1997.
    --获取1997年的所有订单。   

    SELECT *
    FROM Orders
    WHERE YEAR(OrderDate) = 1997;
             

    --9.Find all customers in the "USA".
    --查找“USA”的所有客户。   

    SELECT *
    FROM Customers
    WHERE Country = 'USA';
             
    --10. Retrieve orders with a freight cost less than 30.
    --检索运费低于30的订单。   

    SELECT *
    FROM Orders
    WHERE Freight < 30;
            

    --11. Get the names and titles of all employees.
    --获取所有员工的姓名和职务。   

    SELECT FirstName, LastName, Title
    FROM Employees;
             

    --12. Find suppliers from "Germany".
    --查找来自“Germany”的供应商。   

    SELECT *
    FROM Suppliers
    WHERE Country = 'Germany';
             

    --13. List all products with quantities between 10 and 50.
    --列出所有数量在10到50之间的产品。   

    SELECT *
    FROM Products
    WHERE UnitsInStock BETWEEN 10 AND 50;             


    --14. Get the total number of products in each category.
    --获取每个类别中的产品总数。   

    SELECT CategoryID, COUNT(ProductID) AS TotalProducts
    FROM Products
    GROUP BY CategoryID;
             

    --15. List all orders placed by employee with ID 5.
    --列出ID为5的员工下的所有订单。
   

    SELECT *
    FROM Orders
    WHERE EmployeeID = 5;
           
    --16. Find the name of the supplier with the highest ID.
    --查找ID最高的供应商的名称。
   

    SELECT CompanyName
    FROM Suppliers
    WHERE SupplierID = (SELECT MAX(SupplierID) FROM Suppliers);
             

    --17.Retrieve products that have "Box" in their quantity per unit description.
   

    SELECT *
    FROM Products
    WHERE QuantityPerUnit LIKE '%Box%';

    --18. List all customers from "Germany".
    --列出来自“Germany”的所有客户。
    SELECT *
    FROM Customers
    WHERE Country = 'Germany';       


    --19.Find all products that have never been ordered.
    --查找所有从未订购过的产品。   

    SELECT *
    FROM Products
    WHERE ProductID NOT IN(SELECT ProductID FROM Orders);
             

    --20 Get all orders with a freight cost greater than 50.
    --获取运费超过50的所有订单。   

    SELECT *
    FROM Orders
    WHERE Freight > 50;
             

    --21.Retrieve names of all categories.
    --检索所有类别的名称。   

    SELECT CategoryName
    FROM Categories;
             

    --22. List all orders where the ship city is "Seattle".
    --列出船市为“Seattle”的所有订单。   

    SELECT*
    FROM Orders
    WHERE ShipCity = 'Seattle';
             
    --23. Find the employees who have "Sales" in their title.   

    SELECT*
    FROM Employees
    WHERE Title LIKE '%Sales%';
            

    --24.Retrieve orders that were placed in the month of June.
    --检索6月份下的订单。   

    SELECT*
    FROM Orders
    WHERE DATEPART(month, OrderDate) = 6;
            

    --25. Get the names and phone numbers of suppliers from "Italy".
    --从“Italy”获取供应商的名称和电话号码。   

    SELECT CompanyName, Phone
    FROM Suppliers
    WHERE Country = 'Italy';
             

    --26. List all products with unit prices less than 20.
    --列出单价低于20的所有产品。   

    SELECT*
    FROM Products
    WHERE UnitPrice < 20;
             

    --27.Find orders that were shipped in 1997.
    --查找1997年发货的订单。
   

    SELECT*
    FROM Orders
    WHERE YEAR(ShippedDate) = 1997;
             

    --28. Retrieve the names of all customers who have placed more than 5 orders.
    --检索所有下单超过5个的客户的姓名。   

    SELECT c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CompanyName
    HAVING COUNT(o.OrderID) > 5;
             

    --29. List products with no quantity on order.
    --列出订单上没有数量的产品。   

    SELECT*
    FROM Products as p
    WHERE p.ProductID not in (SELECT DISTINCT od.ProductID from[Order Details] as od) ;
             

    --30. Get all categories with more than 10 products.
    --获取包含10种以上产品的所有类别。   

    SELECT c.CategoryName
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    GROUP BY c.CategoryID, c.CategoryName
    HAVING COUNT(p.ProductID) > 10;
             

    --31.Find the customer with the most recent order.
    --查找最近订购的客户。   

    SELECT c.CustomerID, c.CompanyName, o.OrderDate
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE o.OrderDate = (
        SELECT MAX(OrderDate)
        FROM Orders
    );
             

    --32. Retrieve employees who work in "Tacoma".
    --检索在“Tacoma”工作的员工。   

    SELECT*
    FROM Employees
    WHERE City = 'Tacoma';
             

    --33. List all products with a reorder level less than 10.
    --列出再订购级别低于10的所有产品。   

    SELECT*
    FROM Products
    WHERE ReorderLevel < 10;
             

    --34. Find orders with a ship country of "USA" and a freight cost less than $20.
    --查找发货国家为“USA”且运费低于20美元的订单。   

    SELECT*
    FROM Orders
    WHERE ShipCountry = 'USA' AND Freight< 20;
             
    --35. Get the names of suppliers who have a fax number.
    --获取有传真号码的供应商的名称。   

    SELECT CompanyName
    FROM Suppliers
    WHERE Fax IS NOT NULL;
             

    --36. List all orders placed in the first quarter of 1997.
    --列出1997年第一季度的所有订单。   

    SELECT *
    FROM Orders
    WHERE(DATEPART(month, OrderDate) BETWEEN 1 AND 3) AND DATEPART(year, OrderDate)= 1997;
            

    --37. Retrieve products that have a unit price between $20 and $50.
    --检索单价在20美元到50美元之间的产品。   

    SELECT *
    FROM Products
    WHERE UnitPrice BETWEEN 20 AND 50;
             
    --38. Find customers who have a postal code starting with "9".
    --查找邮政编码以“9”开头的客户。   

    SELECT *
    FROM Customers
    WHERE PostalCode LIKE '9%';
             

    --39. List all employees with their address details.
    --列出所有员工及其详细地址。   

    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Title,
        Address,
        City,
        Region,
        PostalCode,
        Country,
        HomePhone,
        Extension
    FROM Employees;
            

    --40. Get all orders where the ship region is "CA".
    --获取发货区域为“CA”的所有订单。   

    SELECT *
    FROM Orders
    WHERE ShipRegion = 'CA';
           

    --41. Find all categories with at least one product in stock.
    --查找至少有一种产品有库存的所有类别。   

    SELECT c.CategoryID, c.CategoryName
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    WHERE p.UnitsInStock > 0;
             

    --42. Retrieve the names and cities of customers who live in "USA".
    --检索居住在“USA”的客户的姓名和城市。   

    SELECT CompanyName, City
    FROM Customers
    WHERE Country = 'USA';
             
    --43.-- List products supplied by supplier with ID 10.
    --列出供应商提供的ID为10的产品。   

    SELECT *
    FROM Products
    WHERE SupplierID = 10;
            

    --45. Find all orders where the ship name contains "Hanari".
    --查找所有船名包含“Hanari”的订单。   

    SELECT*
    FROM Orders
    WHERE ShipName LIKE '%Hanari%';
             
    --46. Get the details of products with more than 20 units in stock.
    --获取库存超过20件产品的详细信息。   

    SELECT *
    FROM Products
    WHERE UnitsInStock > 20;
            
    --47. Retrieve all orders where the order date is in 1997.
    --检索订单日期为1997年的所有订单。   

    SELECT*
    FROM Orders
    WHERE DATEPART(year, OrderDate) = 1997;
             

    --48.List all suppliers from "Canada" who have a phone number starting with "514".
    --列出所有电话号码以“514”开头的“Canada”供应商。
   

    SELECT*
    FROM Suppliers
    WHERE Country = 'Canada' AND Phone LIKE '%(514)%';
            

    --49. Find products that have been ordered more than 50 times.
    --查找订购次数超过50次的产品。
   

    SELECT p.ProductID, p.ProductName
    FROM Products p
    JOIN[Order Details] od ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName
    HAVING SUM(od.Quantity) > 50;
             

    --50. Get the names of all employees who are not managers.
    --获取所有非经理员工的姓名。   

    SELECT FirstName, LastName
    FROM Employees
    WHERE Title NOT LIKE 'Manager';
             
    --51. List orders where the ship country is "Mexico".
    --列出发货国为“Mexico”的订单。   

    SELECT *
    FROM Orders
    WHERE ShipCountry = 'Mexico';
         

    --52.Retrieve all products with a quantity per unit description containing "bottle".
    --检索包含“bottle”的每个单位描述的数量的所有产品。   

    SELECT *
    FROM Products
    WHERE QuantityPerUnit LIKE '%bottle%';
            
    --53.Find the top 5 products with the highest unit price.
    --找到单价最高的前5种产品。
   

    SELECT Top 5 ProductName, UnitPrice
    FROM Products
    ORDER BY UnitPrice DESC
             
    --54. Get all customers who have a contact title of "Owner".
    --获取所有联系人头衔为“Owner”的客户。   

    SELECT*
    FROM Customers
    WHERE ContactTitle = 'Owner';
            
    --55. List all employees who have their last name starting with "S".
    --列出姓氏以“S”开头的所有员工。  

    SELECT*
    FROM Employees
    WHERE LastName LIKE 'S%';
             

    --56.Retrieve orders placed in the month of December.
    --检索12月份下的订单。   

    SELECT *
    FROM Orders
    WHERE MONTH(OrderDate) = 12;
             
    --57.Find products that are neither discontinued nor have a reorder level of 0.
    --查找既没有停产也没有重新订购级别为0的产品。   

    SELECT*
    FROM Products
    WHERE Discontinued = 0 AND ReorderLevel > 0;
             
    --58.Get the names of suppliers who have their country listed as "UK".
    --获取将其国家列为“UK”的供应商的名称。   

    SELECT CompanyName, ContactName, Country
    FROM Suppliers
    WHERE Country = 'UK';
             
    --59. List all orders with a ship city of "London" and a freight cost greater than $30.
    --列出所有船市为“London”且运费超过30美元的订单。   

    SELECT*
    FROM Orders
    WHERE ShipCity = 'London' AND Freight > 30;
             

    --60. Retrieve all employees who were hired in 1993.
    --检索1993年雇用的所有员工。   

    SELECT*
    FROM Employees
    WHERE YEAR(HireDate) = 1993;
             
    --61. Find products that have been ordered by more than 3 different customers.
    --查找由3个以上不同客户订购的产品
   

    SELECT p.ProductName, COUNT(DISTINCT o.CustomerID) AS NumberOfDifferentCustomers
    FROM Products p
    JOIN[Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o On o.OrderID = od.OrderID
    GROUP BY p.ProductID, p.ProductName
    HAVING COUNT(DISTINCT o.CustomerID) > 3;
             

    --62.Get all categories that do not have any discontinued products.
    --获取所有没有停产产品的类别。   

    SELECT c.CategoryName
    FROM Categories c
    WHERE NOT EXISTS(
        SELECT *
        FROM Products p
        WHERE p.CategoryID = c.CategoryID AND p.Discontinued = 1
    );
             

    --63. List all customers who have a region specified.
    --列出指定地区的所有客户。   

    SELECT CompanyName, ContactName, Region
    FROM Customers
    WHERE Region IS NOT NULL;
             

    --64.Retrieve products where the unit price is greater than the average unit price.
    --检索单价高于平均单价的产品。   

    SELECT*
    FROM Products
    WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);
            

    --65.Find the supplier with the most products.
    --找到产品最多的供应商。   

    SELECT TOP 1 s.SupplierID, s.CompanyName, COUNT(p.ProductID) AS NumberOfProducts
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    GROUP BY s.SupplierID, s.CompanyName
    ORDER BY NumberOfProducts DESC
             

    --66. Get all orders where the order date is after January 1, 1998.
    --获取订单日期在1998年1月1日之后的所有订单。   

    SELECT*
    FROM Orders
    WHERE OrderDate > '1998-01-01';
             

    --67. List products with a unit price that is a multiple of 5.
    --列出单价为5的倍数的产品。   

    SELECT*
    FROM Products
    WHERE UnitPrice % 5 = 0;
            

    --68.Retrieve the names of customers who have placed at least 3 orders.
    --检索已下至少3个订单的客户的姓名。   

    SELECT c.CompanyName, COUNT(o.OrderID) AS NumberOfOrders
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CompanyName
    Having COUNT(o.OrderID) >= 3
             


    --69.Find all orders shipped by "Speedy Express".
    --查找所有通过“Speedy Express”发货的订单。   

    SELECT o.OrderID, s.CompanyName AS CustomerName, s.CompanyName AS ShipVia, o.ShipName, o.ShipAddress, o.ShipCity,
    o.ShipCountry, o.ShipPostalCode, o.ShipRegion
    FROM Orders o
    JOIN Shippers s ON o.ShipVia = s.ShipperID
    WHERE s.CompanyName = 'Speedy Express';


    --70. Get the details of orders that were shipped in "London".
    --获取在“London”发货的订单的详细信息。   

    SELECT*
    FROM Orders o
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    WHERE o.ShipCity = 'London';


    --71. List products that have been discontinued and have a unit price greater than $30.
    -- 列出已停产且单价超过30美元的产品。   

    SELECT*
    FROM Products
    WHERE Discontinued = 1 AND UnitPrice > 30;
             

    --72.-- Retrieve employees who have not shipped any orders.
    --检索尚未发货的员工。



    --73. Find customers who have orders with a discount applied.
    --查找有折扣订单的客户。   

    SELECT DISTINCT c.CustomerID, c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN[Order Details] as od On o.OrderID = od.OrderID
    WHERE od.Discount > 0;


    --74. Get the top 3 most expensive products.
    --获得前三名最昂贵的产品。
   

    SELECT Top 3 *
    FROM Products
    ORDER BY UnitPrice DESC
             

    --75. List all suppliers with a home page.
    --列出有主页的所有供应商。   

    SELECT*
    FROM Suppliers
    WHERE HomePage IS NOT NULL;
             
    --76. Retrieve orders where the freight cost is between $10 and $50.
    --检索运费在10美元至50美元之间的订单。   

    SELECT*
    FROM Orders
    WHERE Freight BETWEEN 10 AND 50;           


    --77. Find products supplied by a supplier with the name "Exotic Liquids".
    --查找名为“Exotic Liquids”的供应商提供的产品。   

    SELECT p.ProductID, p.ProductName
    FROM Products p
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    WHERE s.CompanyName = 'Exotic Liquids';
            
    --78. Get all orders that were required after the order date.
    --获取订单日期前所需的所有订单。   

    SELECT*
    FROM Orders
    WHERE RequiredDate > OrderDate;


    --80. List products that have been ordered at least once in each year of the 1990s.
    --列出20世纪90年代每年至少订购一次的产品。   

    SELECT p.ProductID, p.ProductName
    FROM Products p
    WHERE EXISTS(
        SELECT 1
        FROM Orders o
        JOIN[Order Details] od ON o.OrderID = od.OrderID
        WHERE DATEPART(year, o.OrderDate) BETWEEN 1990 AND 1999
        AND od.ProductID = p.ProductID
    )

    --81 Retrieve all orders where the ship city is "Marseille" or "Luleå".   

    SELECT*
    FROM Orders
    WHERE ShipCity IN('Marseille', 'Luleå');           


    --82 Get the details of orders placed by the customer "Bon app".
    --获取客户“Bon app”下订单的详细信息。
   

    SELECT o.*, od.*
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN[Order Details] od On od.OrderID = o.OrderID
    WHERE c.CompanyName Like 'Bon app%';


    --83 List products with a quantity per unit description that includes "can".
    --列出每单位数量的产品描述，其中包括“罐can   

    SELECT*
    FROM Products
    WHERE QuantityPerUnit LIKE '%can%';
             
    --84 Retrieve the names of all customers who have their contact name starting with "A".
    --检索联系人姓名以“A”开头的所有客户的姓名。   

    SELECT ContactName, CompanyName
    FROM Customers
    WHERE ContactName LIKE 'A%';
             
    --85 Find all products with a unit price between $15 and $25.
    --查找单价在15美元至25美元之间的所有产品。   

    SELECT*
    FROM Products
    WHERE UnitPrice BETWEEN 15 AND 25;
             

    --86 Get all orders that were shipped in the year 1997 but required before 1996.
    --获取1997年发货但1996年之前需要的所有订单。   

    SELECT*
    FROM Orders
    WHERE YEAR(ShippedDate) = 1997 AND YEAR(RequiredDate) < 1996;             

    --87 List all categories with at least one product that is not discontinued.
    --列出至少有一种产品没有停产的所有类别。   

    SELECT c.CategoryID, c.CategoryName
    FROM Categories c
    WHERE EXISTS(
        SELECT 1
        FROM Products p
        WHERE p.CategoryID = c.CategoryID AND p.Discontinued = 0
    );

    --88 Retrieve the names of suppliers who do not have a fax number.
    --检索没有传真号码的供应商的名称。   

    SELECT CompanyName, ContactName
    FROM Suppliers
    WHERE Fax IS NULL;             

    --89 Find customers who live in cities starting with "S".
    --查找居住在以“S”开头的城市的客户。
    SELECT *
    FROM Customers
    WHERE City LIKE 'S%';         

    --90 Get the total number of products for each supplier.
    --获取每个供应商的产品总数。   

    SELECT s.SupplierID, s.CompanyName, COUNT(p.ProductID) AS TotalProducts
    FROM Suppliers s
    LEFT JOIN Products p ON s.SupplierID = p.SupplierID
    GROUP BY s.SupplierID, s.CompanyName;
             

    --91 Find products with a unit price that is not an integer.
    --查找单价不是整数的产品。   

    SELECT*
    FROM Products
    WHERE UnitPrice<> FLOOR(UnitPrice);          


    --92 List all orders shipped by "United Package".
    --列出“United Package”运送的所有订单。
   

    SELECT*
    FROM Orders o
    JOIN Shippers s ON o.ShipVia = s.ShipperID
    WHERE s.CompanyName = 'United Package';        
            
    --93 List all products whose unit price is higher than the average unit price of all products.
    --列出单价高于所有产品平均单价的所有产品。
    SELECT *
    FROM Products
    WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);

    SELECT*
    FROM Products p
    WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);
             

    --94.Retrieve the top 5 customers who have placed the highest number of orders.
    --检索订单数量最多的前5位客户。   

    SELECT Top 5 c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS OrderCount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CompanyName
    ORDER BY OrderCount DESC
             

    --95. Find all employees who have processed orders in more than 2 different countries.
    --查找在2个以上不同国家处理过订单的所有员工。
    SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    COUNT(DISTINCT o.ShipCountry) as UniqueCountriesProcessed
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    HAVING COUNT(DISTINCT o.ShipCountry) > 2;         

    --96. Get the total number of orders shipped by each shipper.
    --获取每个发货人发货的订单总数。   

    SELECT s.CompanyName, COUNT(o.OrderID) AS TotalOrders
    FROM Shippers s
    LEFT JOIN Orders o ON s.ShipperID = o.ShipVia
    GROUP BY s.CompanyName;


    --97. Retrieve the names of all customers who have ordered products from more than 5 different categories.
    --检索订购了5个以上不同类别产品的所有客户的姓名。

    SELECT c.CustomerID, c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY c.CustomerID, c.CompanyName
    HAVING COUNT(DISTINCT p.CategoryID) > 5;


    --98. Find suppliers that have provided products in more than 3 different categories.
    --查找提供3个以上不同类别产品的供应商。

    SELECT s.SupplierID, s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    GROUP BY s.SupplierID, s.CompanyName
    HAVING COUNT(DISTINCT p.CategoryID) > 3;

    --99. Get the details of the order with the maximum freight cost.
    --获取运费最高的订单详情。

    SELECT*
    FROM Orders
    WHERE Freight = (SELECT MAX(Freight) FROM Orders);

    --100.List all employees who have shipped orders to more than 10 different cities.
    --列出所有向10多个不同城市发货的员工。

    SELECT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.ShipVia
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    HAVING COUNT(DISTINCT o.ShipCity) > 10;

    --101.Retrieve all orders that were placed by customers from the same country as the employee who processed them.
    --检索与处理订单的员工来自同一国家的客户下达的所有订单。

    SELECT o.OrderID, o.OrderDate, c.CompanyName, e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Employees e ON o.EmployeeID = e.EmployeeID
    WHERE c.Country = e.Country;


    --102.Find the products that have the highest average discount applied.
    --找到平均折扣最高的产品。

    SELECT Top 1 p.ProductID, p.ProductName, AVG(od.Discount) AS AverageDiscount
    FROM Products p
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName
    ORDER BY AverageDiscount DESC

    --103. Get the total number of products supplied by each supplier.
    --获取每个供应商供应的产品总数。

    SELECT s.SupplierID, s.CompanyName, COUNT(p.ProductID) AS TotalProducts
    FROM Suppliers s
    LEFT JOIN Products p ON s.SupplierID = p.SupplierID
    GROUP BY s.SupplierID, s.CompanyName;

    --104. List all orders where the total freight cost exceeds the average freight cost of all orders.
    --列出总运费超过所有订单平均运费的所有订单。

    SELECT*
    FROM Orders
    WHERE Freight > (SELECT AVG(Freight) FROM Orders);

    --105. Retrieve the names and addresses of all customers who have not placed any orders.
    --检索所有未下订单的客户的姓名和地址。

    SELECT c.CustomerID, c.CompanyName, c.ContactName, c.Address, c.City, c.PostalCode, c.Country
    FROM Customers c
    LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE o.OrderID IS NULL;

    --106. Find the employee with the most recent hire date.
    --找到最近雇佣日期的员工。

    SELECT Top 1 EmployeeID, FirstName, LastName, HireDate
    FROM Employees
    ORDER BY HireDate DESC

    --107. Get all orders that were shipped on the same date they were ordered.
    --获取在订购当天发货的所有订单。

    SELECT*
    FROM Orders
    WHERE OrderDate = ShippedDate;

    --108. Retrieve the average freight cost for each shipper.
    --检索每个托运人的平均运费。

    SELECT ShipVia, AVG(Freight) AS AverageFreightCost
    FROM Orders
    GROUP BY ShipVia;

    --109. Find suppliers that have their contact title starting with "Sales".
    --查找联系人头衔以“Sales”开头的供应商。

    SELECT CompanyName, ContactTitle
    FROM Suppliers
    WHERE ContactTitle LIKE 'Sales%';

    --110. Get the names of all customers who have ordered products with a unit price greater than $100.
    --获取所有订购单价超过100美元的产品的客户的姓名。

    SELECT DISTINCT c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    WHERE od.UnitPrice > 100;

    --111 List products that have a reorder level higher than the average reorder level of all products.
    --列出再订购级别高于所有产品平均再订购级别的产品。

    SELECT ProductID, ProductName, ReorderLevel
    FROM Products
    WHERE ReorderLevel > (SELECT AVG(ReorderLevel) FROM Products);

    --112 Retrieve the top 3 cities with the most customers.
    --检索客户最多的前3个城市。

    SELECT TOP 3 City, COUNT(CustomerID) AS CustomerCount
    FROM Customers
    GROUP BY City
    ORDER BY CustomerCount DESC

    --113 Find orders that have a freight cost below the average freight cost for the year 1997.
    --查找运费低于1997年平均运费的订单。

    SELECT*
    FROM Orders
    WHERE Freight < (
        SELECT AVG(Freight)
        FROM Orders
        WHERE YEAR(ShippedDate) = 1997
    );

    --114 Get the details of the orders shipped by "Speedy Express" in 1996.
    --获取1996年“Speedy Express”运送的订单的详细信息。

    SELECT o.OrderID, o.OrderDate, o.ShipName, o.Freight, p.ProductName, od.UnitPrice, od.Quantity
    FROM Orders o
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE o.ShipVia in (
        SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express'
     AND YEAR(o.ShippedDate) = 1996);


    --115 List all products with a quantity per unit that contains the word "box".
    --列出所有产品，并注明每单位数量，其中包含“box”一词。

    SELECT ProductID, ProductName, QuantityPerUnit
    FROM Products
    WHERE QuantityPerUnit LIKE '%box%';

    --116 Retrieve the names of employees who have processed orders in more than 2 different regions.
    --检索在2个以上不同地区处理订单的员工姓名。

    SELECT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    HAVING COUNT(DISTINCT o.ShipRegion) > 2;

    --117 Find the supplier with the most products that have been ordered more than 50 times.
    --找到订购次数超过50次的产品最多的供应商。

    SELECT TOP 1 s.SupplierID, s.CompanyName, COUNT(od.ProductID) AS TotalOrders
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    JOIN[Order Details] od ON p.ProductID = od.ProductID
    WHERE od.Quantity > 50
    GROUP BY s.SupplierID, s.CompanyName
    ORDER BY TotalOrders DESC

    --118 Get the total sales amount for each customer.
    --获取每个客户的总销售额。

    SELECT c.CustomerID, c.CompanyName, SUM(od.UnitPrice * od.Quantity) AS TotalSalesAmount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.CustomerID, c.CompanyName;

    --119 List all customers who have their postal code starting with "9" and have ordered products from more than 3 different categories.
    --列出所有邮政编码以“9”开头并订购了3个以上不同类别产品的客户。

    SELECT c.CustomerID, c.CompanyName
    FROM Customers c
    WHERE c.PostalCode LIKE '9%'
    AND(
        SELECT COUNT(DISTINCT p.CategoryID)
        FROM Orders o
        JOIN[Order Details] od ON o.OrderID = od.OrderID
        JOIN Products p ON od.ProductID = p.ProductID
        WHERE o.CustomerID = c.CustomerID
    ) > 3;

    --120 Retrieve the average unit price of products in the "Beverages" category.
    --检索“Beverages”类别中产品的平均单价。

    SELECT AVG(UnitPrice) AS AverageUnitPrice
    FROM Products
    WHERE CategoryID = (
        SELECT CategoryID
        FROM Categories
        WHERE CategoryName = 'Beverages'
    );

    --121 Find the product with the highest unit price and list its supplier details.
    --找到单价最高的产品，并列出其供应商详细信息。

    SELECT p.ProductName, p.UnitPrice, s.CompanyName AS SupplierCompanyName, s.ContactName AS SupplierContactName, s.Address AS SupplierAddress, s.City AS SupplierCity, s.PostalCode AS SupplierPostalCode, s.Country AS SupplierCountry
    FROM Products p
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    WHERE p.UnitPrice = (
        SELECT MAX(UnitPrice)
        FROM Products
    );


    --122 Get all orders that were placed by customers who have the same contact name as the employee who processed them.
    --获取与处理订单的员工具有相同联系人姓名的客户下达的所有订单。

    SELECT o.OrderID, o.OrderDate, c.ContactName AS CustomerContactName
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Employees e ON o.EmployeeID = e.EmployeeID


    --123 List the names of customers and the number of orders they have placed in the year 1996.
    --列出1996年客户的姓名和订单数量。

    SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS NumberOfOrders
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE YEAR(o.OrderDate) = 1996
    GROUP BY c.CustomerID, c.CompanyName;


    --124 Retrieve all products with a unit price greater than $30 and with quantities in stock less than the average.
    --检索单价大于30美元且库存量低于平均值的所有产品。

    SELECT p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock
    FROM Products p
    WHERE p.UnitPrice > 30
    AND p.UnitsInStock < (
        SELECT AVG(UnitsInStock)
        FROM Products
    );

    --125 Find all employees who have processed orders with a total freight cost above $100.
    --查找所有处理过总运费超过100美元的订单的员工。

    SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(o.Freight) AS TotalFreightCost
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    HAVING SUM(o.Freight) > 100;

    --126 Get the total number of products in each category and list them in descending order.
    --获取每个类别中的产品总数，并按降序排列。

    SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    GROUP BY c.CategoryID, c.CategoryName
    ORDER BY TotalProducts DESC;


    --127 List all orders where the total freight cost is above the average freight cost for orders shipped by "United Package".
    --列出所有总运费高于“United Package”发货订单平均运费的订单。

    SELECT o.OrderID, o.OrderDate, o.Freight
    FROM Orders o
    WHERE o.Freight > (
        SELECT AVG(Freight)
        FROM Orders
        WHERE ShipVia in (SELECT DISTINCT ShipperID FROM Shippers WHERE CompanyName = 'United Package' )
    );

    --128 Retrieve the names of suppliers who have provided products in the "Seafood" category.
    --检索提供“Seafood”类别产品的供应商的名称。

    SELECT DISTINCT s.CompanyName AS SupplierCompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    WHERE c.CategoryName = 'Seafood';

    --129 Find all products that have been ordered in the last 6 months.
    --查找过去6个月内订购的所有产品。

    SELECT DISTINCT p.ProductID, p.ProductName
    FROM Products p
    JOIN[Order Details] od ON p.ProductID = od.ProductID
    WHERE od.OrderID IN(
        SELECT OrderID
        FROM Orders o
        WHERE o.OrderDate >= DATEADD(MONTH, -6, GETDATE())
    );


    --130 Get the names of customers who have ordered products supplied by more than 5 different suppliers.
    --获取订购了5个以上不同供应商提供的产品的客户名称。

    SELECT c.CustomerID, c.CompanyName
    FROM Customers c
    WHERE EXISTS(
        SELECT 1
        FROM Orders o
        JOIN[Order Details] od ON o.OrderID = od.OrderID
        JOIN Products p ON od.ProductID = p.ProductID
        WHERE o.CustomerID = c.CustomerID
        GROUP BY p.SupplierID
        HAVING COUNT(DISTINCT p.SupplierID) > 5
    );


    --131 List the total number of orders placed by each customer and sort by descending order count.
    --列出每个客户下的订单总数，并按订单数量降序排列。

    SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS TotalOrders
    FROM Customers c
    LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CompanyName
    ORDER BY TotalOrders DESC;

    --132 Retrieve employees who have shipped orders to cities in more than 3 different countries.
    --检索已向3个以上不同国家的城市发货的员工。

    SELECT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    WHERE EXISTS(
        SELECT 1
        FROM Orders o
        JOIN[Order Details] od ON o.OrderID = od.OrderID
        WHERE e.EmployeeID = o.EmployeeID
        GROUP BY o.ShipCountry
        HAVING COUNT(DISTINCT o.ShipCountry) > 3
    );


    --133 Find the products that are in stock but have never been ordered.
    --找到有库存但从未订购过的产品。

    SELECT p.ProductID, p.ProductName
    FROM Products p
    WHERE p.UnitsInStock > 0
    AND NOT EXISTS(
        SELECT 1
        FROM[Order Details] od
        WHERE od.ProductID = p.ProductID
    );

    --134 Get the total freight cost for each shipper and list them in ascending order.
    --获取每个托运人的总运费，并按升序列出。

    SELECT s.CompanyName AS ShipperName, SUM(o.Freight) AS TotalFreightCost
    FROM Shippers s
    JOIN Orders o ON s.ShipperID = o.ShipVia
    GROUP BY s.CompanyName
    ORDER BY TotalFreightCost ASC;

    --135 List all categories that have at least one product with a unit price above the average for its category.
    --列出至少有一种产品的单价高于其类别平均值的所有类别。
    SELECT c.CategoryName
    FROM Categories c
    WHERE EXISTS(
        SELECT 1
        FROM Products p
        WHERE p.CategoryID = c.CategoryID
          AND p.UnitPrice > (
              SELECT AVG(UnitPrice)
              FROM Products p2
              WHERE p2.CategoryID = c.CategoryID
          )
    );


    --136 Retrieve the names and addresses of suppliers who have shipped products to "Paris".
    --检索已将产品运往“Paris”的供应商的名称和地址。

    SELECT s.SupplierID, s.CompanyName, s.Address, s.City, s.PostalCode, s.Country
    FROM Suppliers s
    JOIN Orders o ON s.SupplierID = o.ShipVia
    WHERE o.ShipCity = 'Paris';

    --137 Find the customers with the highest order amount.
    --找到订单金额最高的客户。

    SELECT TOP 1 c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS OrderAmount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CompanyName
    ORDER BY OrderAmount DESC

    --138 Get all products that have a unit price less than the average unit price and have never been discontinued.
    --获取所有单价低于平均单价且从未停产的产品。

    SELECT p.ProductID, p.ProductName
    FROM Products p
    WHERE p.UnitPrice < (
        SELECT AVG(UnitPrice)
        FROM Products
    ) AND p.Discontinued = 0;

    --139 List all orders where the shipping address is in a country that has more than 3 suppliers.
    --列出发货地址位于拥有3个以上供应商的国家的所有订单。

    SELECT o.OrderID, o.ShipName, o.ShipCity, o.ShipCountry, o.ShipAddress
    FROM Orders o
    WHERE EXISTS(
        SELECT 1
        FROM Suppliers s
        WHERE s.Country = o.ShipCountry
        GROUP BY s.Country
        HAVING COUNT(s.SupplierID) > 3
    );


    --140 Retrieve the names of employees who have processed orders for products in the "Produce" category.
    --检索已处理“Produce”类别产品订单的员工姓名。

    SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    WHERE c.CategoryName = 'Produce';


    --141 Find the suppliers that have their company name containing the word "Mayumi".
    --找到公司名称中包含“Mayumi”一词的供应商。

    SELECT SupplierID, CompanyName, ContactName, ContactTitle, City, Country, Phone, Fax, HomePage
    FROM Suppliers
    WHERE CompanyName LIKE '%Mayumi%';

    --142 Get the details of orders that were shipped to "Madrid" and have a freight cost above the average.
    --获取运往“Madrid”且运费高于平均水平的订单的详细信息。

    SELECT OrderID, ShipName, ShipCity, Freight, EmployeeID, CustomerID
    FROM Orders
    WHERE ShipCity = 'Madrid'
    AND Freight > (SELECT AVG(Freight) FROM Orders);


    --143 List the products with the highest quantity ordered for each category.
    --列出每个类别订购数量最多的产品。

    SELECT c.CategoryName, p.ProductName, MAX(od.Quantity) AS MaxQuantityOrdered
    FROM Products p
    JOIN[Order Details] od ON p.ProductID = od.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY c.CategoryName, p.ProductID, p.ProductName
    ORDER BY c.CategoryName;

    --144 Retrieve the names of customers who have not ordered any products from the "Seafood" category.
    --检索未从“Seafood”类别订购任何产品的客户的姓名。

    SELECT c.CustomerID,c.CompanyName
    FROM Customers c
    WHERE NOT EXISTS(
        SELECT 1
        FROM[Order Details] od
        JOIN Products p ON od.ProductID = p.ProductID
        JOIN Categories ct ON p.CategoryID = ct.CategoryID
        WHERE ct.CategoryName = 'Seafood'
          AND od.OrderID IN(SELECT OrderID FROM Orders o WHERE o.CustomerID = c.CustomerID)
    );


    --145 Find all employees who have shipped orders with a total freight cost of more than $20.
    --查找所有发货订单总运费超过20美元的员工。

    SELECT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    HAVING SUM(o.Freight) > 20;


    --146 Get the total number of orders placed by each customer and filter for those with more than 10 orders.
    --获取每个客户下的订单总数，并筛选出订单超过10个的客户。

    SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS TotalOrders
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CompanyName
    HAVING COUNT(o.OrderID) > 10;


    --147 List all products that are supplied by suppliers with the highest ID.
    --列出ID最高的供应商提供的所有产品。

    SELECT p.ProductID, p.ProductName, s.SupplierID, s.CompanyName
    FROM Products p
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    WHERE p.SupplierID = (
        SELECT MAX(SupplierID)
        FROM Suppliers
    );


    --148 Retrieve the names and addresses of customers who have ordered products from more than 3 different categories.
    --检索订购了3个以上不同类别产品的客户的姓名和地址。

    SELECT c.CustomerID, c.CompanyName, c.Address, c.City, c.Country
    FROM Customers c
    WHERE(
        SELECT COUNT(DISTINCT p.CategoryID)
        FROM[Order Details] od
        JOIN Orders o ON od.OrderID = o.OrderID

        JOIN Products p ON od.ProductID = p.ProductID
        WHERE o.CustomerID = c.CustomerID
    ) > 3;


    --149 Find the product with the lowest unit price and list its supplier details.
    --找到单价最低的产品，并列出其供应商详细信息。

    SELECT p.ProductID, p.ProductName, p.UnitPrice, s.SupplierID, s.CompanyName, s.ContactName, s.Address, s.City, s.Country
    FROM Products p
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    WHERE p.UnitPrice = (
        SELECT MIN(UnitPrice)
        FROM Products
    );


    --150 List all suppliers who have provided products with a unit price above $50.
    --列出所有提供单价超过50美元产品的供应商。

    SELECT DISTINCT s.SupplierID, s.CompanyName, s.ContactName, s.Address, s.City, s.Country
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE p.UnitPrice > 50;



    --151 Find customers who have placed orders in every month of the year 1996.
    --查找1996年每个月都下过订单的客户。

    SELECT c.CustomerID, c.CompanyName
    FROM Customers c
    WHERE(
        SELECT COUNT(DISTINCT MONTH(o.OrderDate))
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID AND YEAR(o.OrderDate) = 1996
    ) = 12;


    --152 Get the names of employees who have not shipped orders to "New York".
    --获取尚未将订单运送到“New York”的员工的姓名。

    SELECT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    WHERE NOT EXISTS(
        SELECT 1
        FROM Orders o
        JOIN[Order Details] od ON o.OrderID = od.OrderID
        WHERE o.ShipCity = 'New York' AND o.EmployeeID = e.EmployeeID
    );


    --153 List all products with a quantity per unit containing the word "Bottle" or "Can".
    --列出所有产品，并注明每单位数量，其中包含"Bottle" or "Can"字样。

    SELECT ProductID, ProductName, QuantityPerUnit
    FROM Products
    WHERE QuantityPerUnit LIKE '%Bottle%' OR QuantityPerUnit LIKE '%Can%';


    --154 Retrieve the names of suppliers who have a contact name containing "James".
    --检索联系人姓名中包含“James”的供应商名称。

    SELECT CompanyName, ContactName
    FROM Suppliers
    WHERE ContactName LIKE '%James%';

    --155 Find all orders that were shipped with a freight cost above the average for orders shipped by "Federal Shipping".
    --查找所有运费高于“Federal Shipping”平均运费的订单。

    SELECT *
    FROM Orders
    WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Federal Shipping')
      AND Freight > (
        SELECT AVG(Freight)
        FROM Orders o
        JOIN Shippers s ON o.ShipVia = s.ShipperID
        WHERE s.CompanyName = 'Federal Shipping'
      );

    --156 Get the total number of products in stock for each category and sort in ascending order.
    --获取每个类别的库存产品总数，并按升序排序。

    SELECT c.CategoryName, SUM(p.UnitsInStock) AS TotalUnitsInStock
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    GROUP BY c.CategoryName
    ORDER BY TotalUnitsInStock ASC;


    --157 List all products that have a unit price higher than the average for their respective categories.
    --列出单价高于各自类别平均值的所有产品。

    SELECT p.ProductID, p.ProductName, p.UnitPrice, p.CategoryID
    FROM Products p
    WHERE p.UnitPrice > (
        SELECT AVG(UnitPrice)
        FROM Products p2
        WHERE p2.CategoryID = p.CategoryID
    );

    --158 Retrieve the names of employees who have shipped orders to customers with a postal code starting with "9".
    --检索已将订单发送给邮政编码以“9”开头的客户的员工姓名。

    SELECT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    WHERE EXISTS(
        SELECT 1
        FROM Orders o
        JOIN Customers c ON o.CustomerID = c.CustomerID
        WHERE o.ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Federal Shipping')
          AND c.PostalCode LIKE '9%'
    );


    --159 Find suppliers that have provided products with a unit price less than $25 and more than $50.
    --寻找提供单价低于25美元但高于50美元的产品的供应商。

    SELECT DISTINCT s.SupplierID, s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE EXISTS(
        SELECT 1
        FROM Products p2
        WHERE p2.SupplierID = s.SupplierID AND p2.UnitPrice < 25
    )
    AND EXISTS(
        SELECT 1
        FROM Products p3
        WHERE p3.SupplierID = s.SupplierID AND p3.UnitPrice > 50
    );


    --160 Get all orders that were placed in the month of July and shipped by "United Package".
    --获取7月份通过“United Package”发货的所有订单。

    SELECT o.OrderID, o.OrderDate, c.CompanyName, s.CompanyName AS ShipVia
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Shippers s ON o.ShipVia = s.ShipperID
    WHERE MONTH(o.OrderDate) = 7
      AND s.CompanyName = 'United Package';


    --161 List the top 5 cities with the highest number of shipped orders.
    --列出出货订单数量最多的前5个城市。

    SELECT TOP 5 c.City, COUNT(o.OrderID) AS OrderCount
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    GROUP BY c.City
    ORDER BY OrderCount DESC


    --162 Retrieve the names and contact details of suppliers who have provided products in the "Confections" category.
    --检索提供“Confections”类别产品的供应商的名称和联系方式。

    SELECT s.SupplierID, s.CompanyName, s.ContactName, s.ContactTitle, s.Phone, s.Address, s.City, s.Region, s.PostalCode, s.Country
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    WHERE c.CategoryName = 'Confections';


    --163 Find all products that are currently out of stock but have been ordered in the past year.
    --查找当前缺货但在过去一年中订购的所有产品。

    SELECT p.ProductID, p.ProductName, p.UnitsInStock
    FROM Products p
    WHERE p.UnitsInStock = 0 AND EXISTS(
        SELECT 1
        FROM[Order Details] od
        JOIN Orders o ON od.OrderID = o.OrderID
        WHERE od.ProductID = p.ProductID
          AND o.OrderDate >= DATEADD(year, -1, GETDATE())
    );


    --164 Get the total number of products supplied by each supplier and list in descending order.
    --获取每个供应商供应的产品总数，并按降序排列。

    SELECT s.SupplierID, s.CompanyName, COUNT(p.ProductID) AS ProductCount
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    GROUP BY s.SupplierID, s.CompanyName
    ORDER BY ProductCount DESC;


    --165 List all customers with a contact title of "Sales Representative" and who have ordered more than 3 products.
    --列出所有联系人头衔为“Sales Representative”且订购了3种以上产品的客户。

    SELECT c.CustomerID, c.CompanyName, c.ContactTitle
    FROM Customers c
    WHERE c.ContactTitle = 'Sales Representative' AND EXISTS(
        SELECT 1
        FROM Orders o
        JOIN[Order Details] od ON o.OrderID = od.OrderID
        WHERE o.CustomerID = c.CustomerID
        GROUP BY o.CustomerID
        HAVING COUNT(od.ProductID) > 3
    );


    --166 Retrieve the names of employees who have processed orders for the highest number of products.
    --检索处理过最多产品订单的员工姓名。

    SELECT TOP 1 e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    ORDER BY SUM(od.Quantity) DESC

    --167 Find the suppliers that have the same contact title as the employee with the most orders.
    --查找与订单最多的员工具有相同联系头衔的供应商。

    WITH MostOrdersEmployee AS(
        SELECT TOP 1 EmployeeID
        FROM Orders
        GROUP BY EmployeeID
        ORDER BY COUNT(OrderID) DESC

    )
    , EmployeeContactTitle AS(
        SELECT c.ContactTitle
        FROM Employees e
        JOIN Orders o ON o.EmployeeID = e.EmployeeID
        JOIN Customers c ON c.CustomerID = o.CustomerID
        WHERE e.EmployeeID = (SELECT EmployeeID FROM MostOrdersEmployee)
    )
    SELECT s.SupplierID, s.CompanyName, s.ContactTitle
    FROM Suppliers s
    JOIN EmployeeContactTitle ect ON s.ContactTitle = ect.ContactTitle;


    --168 Get all orders that were shipped with a discount applied.
    --获取所有已应用折扣发货的订单。

    SELECT o.OrderID, o.OrderDate, c.CompanyName, od.ProductID, od.UnitPrice, od.Quantity, od.Discount,
           (od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalDiscountedAmount
    FROM Orders o
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE od.Discount > 0;


    --169 List the products with the highest quantity per unit and their respective suppliers.
    --列出每单位数量最多的产品及其各自的供应商。

    SELECT p.ProductID, p.ProductName, p.QuantityPerUnit, s.SupplierID, s.CompanyName
    FROM Products p
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    WHERE p.QuantityPerUnit = (
        SELECT MAX(QuantityPerUnit)
        FROM Products
    );


    --170 Retrieve the names and addresses of customers who live in cities where the average order amount is above $200.
    --检索居住在平均订单金额超过200美元的城市的客户的姓名和地址。

    SELECT c.CustomerID, c.CompanyName, c.Address, c.City, c.Country
    FROM Customers c
    WHERE c.City IN(
        SELECT o.ShipCity
        FROM Orders o
        JOIN[Order Details] od ON o.OrderID = od.OrderID
        GROUP BY o.ShipCity
        HAVING AVG((od.UnitPrice* od.Quantity* (1 - od.Discount))) > 200
    );


    --171 Find all products that have been ordered more than the average quantity ordered per product in the "Condiments" category.
    --在“Condiments”类别中查找订购量超过每件产品平均订购量的所有产品。

    SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalOrderedQuantity
    FROM Products p
    JOIN[Order Details] od ON p.ProductID = od.ProductID
    WHERE p.CategoryID = (
        SELECT CategoryID
        FROM Categories
        WHERE CategoryName = 'Condiments'
    )
    GROUP BY p.ProductID, p.ProductName
    HAVING SUM(od.Quantity) > (
        SELECT AVG(Quantity)
        FROM[Order Details]
        WHERE ProductID IN(
            SELECT ProductID
            FROM Products
            WHERE CategoryID = (
                SELECT CategoryID
                FROM Categories
                WHERE CategoryName = 'Condiments'
            )
        )
    );


    --172 Get the details of the orders that were shipped to "Berlin" and have a freight cost above $50.
    --获取运往“柏林”且运费超过50美元的订单的详细信息。

    SELECT o.OrderID, o.OrderDate, c.CompanyName, o.ShipCity, o.Freight
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE o.ShipCity = 'Berlin' AND o.Freight > 50;


    --173 List all categories with at least 10 products and sort by the total quantity of products in stock.
    --列出至少有10种产品的所有类别，并按库存产品总量排序。

    SELECT c.CategoryID, c.CategoryName, SUM(p.UnitsInStock) AS TotalUnitsInStock
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    GROUP BY c.CategoryID, c.CategoryName
    HAVING COUNT(p.ProductID) >= 10
    ORDER BY TotalUnitsInStock DESC;

    --174 Retrieve the names of suppliers who have the highest number of products in the "Dairy Products" category.
    --检索“Dairy Products”类别中产品数量最多的供应商的名称。

    SELECT TOP 1 s.CompanyName, COUNT(p.ProductID) AS ProductCount
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE p.CategoryID = (
        SELECT CategoryID
        FROM Categories
        WHERE CategoryName = 'Dairy Products'
    )
    GROUP BY s.SupplierID, s.CompanyName
    ORDER BY ProductCount DESC


    --175 Find all orders where the order date is within the first quarter of 1997 and the freight cost is less than $30.
    --查找所有订单日期在1997年第一季度内且运费低于30美元的订单。

    SELECT OrderID, OrderDate, Freight
    FROM Orders
    WHERE DATEPART(month, OrderDate) BETWEEN 1 AND 3 AND YEAR(OrderDate)= 1997
    AND Freight< 30;


    --176 Get the total sales amount for each employee and list them in descending order.
    --获取每个员工的总销售额，并按降序列出。

    SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(od.UnitPrice * od.Quantity) AS TotalSales
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    ORDER BY TotalSales DESC;


    --178 List all products with a unit price greater than the average price in their category and with a reorder level above 10.
    --列出单价高于其类别平均价格且再订购级别高于10的所有产品。

    SELECT p.ProductID, p.ProductName, p.UnitPrice, p.ReorderLevel
    FROM Products p
    WHERE p.UnitPrice > (
        SELECT AVG(UnitPrice)
        FROM Products
        WHERE CategoryID = p.CategoryID
    )
    AND p.ReorderLevel > 10;


    --179 Retrieve the names of customers who have placed orders  6 different months of 1997.
    --检索1997年6个不同月份下订单的客户姓名。

       SELECT* FROM Customers cc WHERE cc.CustomerID in
    (SELECT c.CustomerID
       FROM Customers c
       JOIN Orders o ON c.CustomerID = o.CustomerID
       WHERE YEAR(o.OrderDate) = 1997

       GROUP BY c.CustomerID
       HAVING COUNT(DISTINCT MONTH(o.OrderDate)) = 6)


    --180 Find the products that have the highest quantity ordered and were supplied by suppliers from "Italy".
    --查找订购数量最多且由“意大利”供应商供应的产品。

   SELECT TOP 1 p.ProductID, p.ProductName, od.Quantity
    FROM Products p
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    WHERE s.Country = 'Italy'
    ORDER BY od.Quantity DESC


    --181 Get all orders where the ship city is "Seattle" and the order amount is greater than $100.
    --获取船市为“Seattle”且订单金额大于100美元的所有订单。

    SELECT o.OrderID, o.OrderDate, o.ShipCity, SUM(od.UnitPrice * od.Quantity) AS TotalAmount
    FROM Orders o
    JOIN[Order Details] od ON o.OrderID = od.OrderID
    GROUP BY o.OrderID, o.OrderDate, o.ShipCity
    HAVING o.ShipCity = 'Seattle' AND SUM(od.UnitPrice* od.Quantity) > 100;


    --182 List all employees who have shipped products with a quantity greater than the average quantity ordered.
    --列出所有发货数量超过平均订购数量的员工。
    SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    WHERE od.Quantity > (
        SELECT AVG(Quantity)
        FROM [Order Details]
    );


    --183 Retrieve the names of suppliers who have provided products with a unit price between $20 and $40.
    --检索提供单价在20美元至40美元之间的产品的供应商的名称。

    SELECT DISTINCT s.SupplierID, s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE p.UnitPrice BETWEEN 20 AND 40;


    --184 Find the top 10 products with the highest total quantity ordered.
    --找到订购总量最高的前10种产品。

    SELECT TOP 10 p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
    FROM Products p
    JOIN[Order Details] od ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName
    ORDER BY TotalQuantityOrdered DESC


    --185 Get all orders where the required date is before the order date and the freight cost is below $25.
    --获取所有要求日期早于订单日期且运费低于25美元的订单。

    SELECT*
    FROM Orders
    WHERE RequiredDate<OrderDate AND Freight< 25;


    --186 List the names and contact titles of suppliers who have shipped products in the "Seafood" category.
    --列出运送“海鲜”类产品的供应商的名称和联系方式。

    SELECT DISTINCT s.SupplierID, s.CompanyName, s.ContactTitle
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE p.CategoryID IN(
        SELECT CategoryID FROM Categories WHERE CategoryName = 'Seafood'
    );


    --187 Retrieve the names of employees who have processed orders for more than 5 different categories.
    --检索已处理5个以上不同类别订单的员工姓名。

    SELECT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories pc ON p.CategoryID = pc.CategoryID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    HAVING COUNT(DISTINCT pc.CategoryID) > 5;


    --188 Find all products that have been ordered by customers with a postal code starting with "1" and are in stock.
    --查找所有邮政编码以“1”开头且有库存的客户订购的产品。

    SELECT DISTINCT p.ProductID, p.ProductName
    FROM Products p
    JOIN[Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.CustomerID IN(
        SELECT CustomerID FROM Customers WHERE PostalCode LIKE '1%'
    )
    AND p.UnitsInStock > 0;

    --189 Get the total number of orders placed by customers from each city and list them in descending order.
    --获取每个城市客户下的订单总数，并按降序排列。

    SELECT c.City, COUNT(o.OrderID) AS TotalOrders
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.City
    ORDER BY TotalOrders DESC;


             

           
    -- 190.Retrieve the top 5 customers who have the highest total order amount and list their order count.
    --检索订单总额最高的前5位客户，并列出他们的订单数量。
    SELECT TOP 5 c.CustomerID, c.CompanyName,
       SUM(od.UnitPrice * od.Quantity) AS TotalOrderAmount,
       COUNT(o.OrderID) AS OrderCount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.CustomerID, c.CompanyName
    ORDER BY TotalOrderAmount DESC


    --191. Find the average discount applied to orders for each product category.
    --查找适用于每个产品类别订单的平均折扣。
    SELECT c.CategoryName, AVG(od.Discount) AS AverageDiscount
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    GROUP BY c.CategoryName
    ORDER BY AverageDiscount DESC;


    --192. Get the names of employees who have shipped orders with a freight cost above the median freight cost of all orders.
    --获取运费高于所有订单运费中位数的发货订单的员工姓名。
    SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    WHERE o.Freight > (
        SELECT AVG(Freight)
        FROM Orders
    );

    --193. List all products that are supplied by the supplier with the most products and have been ordered more than the average quantity.
    --列出供应商提供的产品最多且订购量超过平均数量的所有产品。
    SELECT p.ProductID, p.ProductName
    FROM Products p
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    WHERE s.SupplierID = (
        SELECT TOP 1 SupplierID
        FROM Products
        GROUP BY SupplierID
        ORDER BY COUNT(ProductID) DESC    
    )
    AND od.Quantity > (
        SELECT AVG(Quantity)
        FROM [Order Details]
    );

    --194. Retrieve the top 3 categories with the highest average product unit price.
    --检索平均产品单价最高的前3个类别。
    SELECT TOP 3 c.CategoryName, AVG(p.UnitPrice) AS AverageUnitPrice
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    GROUP BY c.CategoryName
    ORDER BY AverageUnitPrice DESC

    --195. Find the customers who have ordered products from every category at least once.
    --找到至少订购过一次每个类别产品的客户。
   SELECT c.CustomerID, c.CompanyName
    FROM Customers c
    WHERE NOT EXISTS (
        SELECT DISTINCT ct.CategoryID
        FROM Categories ct
        WHERE NOT EXISTS (
            SELECT 1
            FROM Orders o
            JOIN [Order Details] od ON o.OrderID = od.OrderID
            JOIN Products p ON od.ProductID = p.ProductID
            JOIN Categories pc ON p.CategoryID = pc.CategoryID
            WHERE c.CustomerID = o.CustomerID AND ct.CategoryID = pc.CategoryID
        )
    );


    --196. Get the details of the order with the longest time between order date and required date.
    --获取订单日期和所需日期之间时间最长的订单的详细信息。
    SELECT TOP 1
    o.OrderID,
    c.CompanyName AS CustomerName,
    o.OrderDate,
    o.RequiredDate,
    DATEDIFF(day, o.OrderDate, o.RequiredDate) AS DaysDifference
    FROM  Orders o
    JOIN  Customers c ON o.CustomerID = c.CustomerID
    ORDER BY DaysDifference DESC

    --197. List all suppliers who have not supplied products to any orders in the year 1993.
    --列出1993年未向任何订单供应产品的所有供应商。
    SELECT s.SupplierID, s.CompanyName
    FROM Suppliers s
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        JOIN [Order Details] od ON o.OrderID = od.OrderID
        JOIN Products p ON od.ProductID = p.ProductID
        WHERE p.SupplierID = s.SupplierID
          AND YEAR(o.OrderDate) = 1993
    );
    --198. Retrieve the total number of products ordered for each product and compare it to the total stock quantity.
    --检索每种产品订购的产品总数，并将其与总库存量进行比较。
    SELECT p.ProductID, p.ProductName,
       SUM(od.Quantity) AS TotalOrdered,
       (SELECT SUM(UnitsInStock + UnitsOnOrder) FROM Products WHERE ProductID = p.ProductID) AS TotalStock
    FROM [Order Details] od
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY p.ProductID, p.ProductName;

    --199. Find all products that have a reorder level equal to the maximum reorder level for their category.
    --查找所有重新订购级别等于其类别最大重新订购级别的产品。
    SELECT p.ProductID, p.ProductName, p.ReorderLevel, p.CategoryID
    FROM Products p
    WHERE p.ReorderLevel = (
        SELECT MAX(ReorderLevel)
        FROM Products
        WHERE CategoryID = p.CategoryID
    );

    --200. Get the names of all customers who have ordered products from suppliers with more than 2 products.
    --获取从供应商那里订购了2种以上产品的所有客户的姓名。
    SELECT DISTINCT c.CustomerID, c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE (
        SELECT COUNT(p2.ProductID)
        FROM Suppliers s
        JOIN Products p2 ON s.SupplierID = p2.SupplierID
    ) > 2;
    --201. List the employees who have processed orders for customers in more than 4 different countries.
    --列出为4个以上不同国家的客户处理订单的员工。
    SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    WHERE (
        SELECT COUNT(DISTINCT c.Country)
        FROM Customers c
        JOIN Orders o2 ON c.CustomerID = o2.CustomerID
        WHERE e.EmployeeID = o2.EmployeeID
    ) > 4;

    --202. Retrieve the names of categories where the average unit price of products is greater than the overall average unit price.
    --检索产品平均单价大于整体平均单价的类别名称。
    SELECT c.CategoryName, AVG(p.UnitPrice) AS AverageUnitPrice
    FROM Products p
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY c.CategoryName
    HAVING AVG(p.UnitPrice) > (
        SELECT AVG(UnitPrice)
        FROM Products
    );

    --203. Find the suppliers who have provided products with a quantity per unit description that includes both "Box" and "Pack".
    --查找提供每单位数量描述的产品的供应商，其中包括“盒子”和“包装”。
    SELECT DISTINCT s.SupplierID, s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE (p.QuantityPerUnit LIKE '%Box%' AND p.QuantityPerUnit LIKE '%Pack%')
    OR (p.QuantityPerUnit LIKE '%Pack%' AND p.QuantityPerUnit LIKE '%Box%');

    --204. Get all orders where the total order amount is greater than the average order amount for the year 1997.
    --获取总订单金额大于1997年平均订单金额的所有订单。
    WITH OrderAmounts AS (
    SELECT OrderID, SUM(Quantity * UnitPrice) AS TotalOrderAmount
    FROM [Order Details]
    GROUP BY OrderID
    ),
    YearlyAverageOrderAmount AS (
        SELECT AVG(TotalOrderAmount) AS AvgOrderAmountFor1997
        FROM OrderAmounts
        WHERE OrderID IN (
            SELECT OrderID
            FROM Orders
            WHERE YEAR(OrderDate) = 1997
        )
    )
    SELECT o.OrderID, o.OrderDate, oa.TotalOrderAmount
    FROM Orders o
    JOIN OrderAmounts oa ON o.OrderID = oa.OrderID
    WHERE oa.TotalOrderAmount > (SELECT AvgOrderAmountFor1997 FROM YearlyAverageOrderAmount);

    --205. List products that have been ordered in every month of 1996 and have a unit price above $20.
    --列出1996年每月订购的单价超过20美元的产品。
    SELECT p.ProductID, p.ProductName
    FROM Products p
    WHERE (
        SELECT COUNT(DISTINCT MONTH(o.OrderDate))
        FROM [Order Details] od
        JOIN Orders o ON od.OrderID = o.OrderID
        WHERE p.ProductID = od.ProductID AND YEAR(o.OrderDate) = 1997
    ) = 10
    AND p.UnitPrice > 20;

    --206. Retrieve the names of customers who have placed orders in every year from 1995 to 1997.
    --检索1995年至1997年每年下订单的客户名称。
    WITH Years AS (
    SELECT DISTINCT YEAR(OrderDate) AS OrderYear
    FROM Orders
    WHERE YEAR(OrderDate) BETWEEN 1995 AND 1997
    ),
    CustomerYears AS (
        SELECT c.CustomerID, y.OrderYear
        FROM Customers c
        JOIN Orders o ON c.CustomerID = o.CustomerID
        CROSS JOIN Years y
    )
    SELECT DISTINCT c.CustomerID, c.CompanyName
    FROM Customers c
    WHERE NOT EXISTS (
        SELECT 1
        FROM Years y
        WHERE NOT EXISTS (
            SELECT 1
            FROM CustomerYears cy
            WHERE cy.CustomerID = c.CustomerID AND cy.OrderYear = y.OrderYear
        )
    );
    --207. Find all orders with a freight cost greater than the average freight cost of orders shipped by "Federal Shipping" and "United Package".
    --查找运费高于“联邦运输”和“联合包裹”运送的订单平均运费的所有订单。
    SELECT OrderID, Freight
    FROM Orders
    WHERE Freight > (
        SELECT AVG(Freight)
        FROM Orders
        WHERE ShipVia IN (
            SELECT ShipperID
            FROM Shippers
            WHERE CompanyName IN ('Federal Shipping', 'United Package')
        )
    );

    --208. Get the total number of orders placed by customers who live in cities with more than 3 suppliers.
    --获取居住在拥有3个以上供应商的城市的客户下的订单总数。
    WITH SupplierCount AS (
    SELECT c.City, COUNT(s.SupplierID) AS SupplierCount
    FROM Customers c
    JOIN Suppliers s ON c.City = s.City
    GROUP BY c.City
    ),
    QualifiedCustomers AS (
        SELECT c.CustomerID
        FROM Customers c
        WHERE EXISTS (
            SELECT 1
            FROM SupplierCount sc
            WHERE sc.City = c.City AND sc.SupplierCount > 3
        )
    )
    SELECT COUNT(o.OrderID) AS TotalOrders
    FROM Orders o
    WHERE o.CustomerID IN (SELECT CustomerID FROM QualifiedCustomers);

    --209. List all products that have been ordered by customers from more than 5 different regions.
    --列出来自5个以上不同地区的客户订购的所有产品。
    WITH CustomerRegions AS (
    SELECT p.ProductID, COUNT(DISTINCT c.Region) AS RegionCount
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    GROUP BY p.ProductID
    ),
    QualifiedProducts AS (
        SELECT ProductID
        FROM CustomerRegions
        WHERE RegionCount > 5
    )
    SELECT p.ProductID, p.ProductName
    FROM Products p
    WHERE p.ProductID IN (SELECT ProductID FROM QualifiedProducts);

    --210. Retrieve the names of employees who have shipped orders with the maximum discount applied.
    --检索已应用最大折扣发货订单的员工姓名。
    WITH MaxDiscount AS (
    SELECT MAX(od.Discount) AS MaxDiscountValue
    FROM [Order Details] od
    )
    SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    WHERE od.Discount = (SELECT MaxDiscountValue FROM MaxDiscount);

    --211. Find the top 10 products that have been ordered the most in the last 6 months.
    --查找过去6个月内订购量最大的前10种产品。
    SELECT TOP 10 p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderDate >= DATEADD(month, -6, GETDATE())
    GROUP BY p.ProductID, p.ProductName
    ORDER BY TotalQuantityOrdered DESC

    --212. Get the details of orders where the ship country is the same as the supplier's country.
    --获取发货国与供应商所在国相同的订单的详细信息。
    SELECT o.OrderID, c.CompanyName AS CustomerName, s.CompanyName AS SupplierName, od.ProductID, od.UnitPrice, od.Quantity
    FROM Orders o
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Suppliers s ON od.ProductID IN (SELECT ProductID FROM Products WHERE SupplierID = s.SupplierID)
    WHERE o.ShipCountry = s.Country;

    --213. List all categories with products that have never been discontinued and have been ordered more than 10 times.
    --列出所有从未停产且订购次数超过10次的产品类别。
    SELECT DISTINCT c.CategoryID, c.CategoryName
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    WHERE p.Discontinued = 0 AND (
        SELECT COUNT(*)
        FROM [Order Details] od
        WHERE od.ProductID = p.ProductID
    ) >10;
    --214. Retrieve the average quantity ordered for each product and compare it to the average stock quantity.
    --检索每种产品的平均订购量，并将其与平均库存量进行比较。
    WITH AverageOrderedQuantities AS (
    SELECT ProductID, AVG(Quantity) AS AvgOrderQuantity
    FROM [Order Details]
    GROUP BY ProductID
    ),
    AverageStockQuantities AS (
        SELECT ProductID, AVG(UnitsInStock) AS AvgStockQuantity
        FROM Products
        GROUP BY ProductID
    )
    SELECT p.ProductID, p.ProductName, aor.AvgOrderQuantity, asq.AvgStockQuantity,
           (aor.AvgOrderQuantity - asq.AvgStockQuantity) AS Difference
    FROM Products p
    LEFT JOIN AverageOrderedQuantities aor ON p.ProductID = aor.ProductID
    LEFT JOIN AverageStockQuantities asq ON p.ProductID = asq.ProductID;

    --215. Find the customers who have ordered products from suppliers in at least 3 different countries.
    --查找从至少3个不同国家的供应商处订购产品的客户。
    SELECT c.CustomerID, c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    GROUP BY c.CustomerID, c.CompanyName
    HAVING COUNT(DISTINCT s.Country) >= 3;


    --216. Get all products that have a unit price within the range of the top 5 % most expensive products in their category.
    --获取其类别中单价在前5%最昂贵产品范围内的所有产品。
    WITH CategoryTop5Percents AS (
    SELECT ProductID, UnitPrice,
           ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) as RowNum,
           COUNT(*) OVER (PARTITION BY CategoryID) as TotalCount
    FROM Products
    ),
    Top5PercentRange AS (
        SELECT MIN(UnitPrice) as MinUnitPrice, MAX(UnitPrice) as MaxUnitPrice
        FROM CategoryTop5Percents ct
        WHERE RowNum BETWEEN 1 AND CEILING(TotalCount * 0.05)
    )
    SELECT p.ProductID, p.ProductName, p.UnitPrice, p.CategoryID
    FROM Products p
    INNER JOIN Top5PercentRange tpr ON p.UnitPrice >= tpr.MinUnitPrice AND p.UnitPrice <= tpr.MaxUnitPrice;

    --217. List employees who have processed orders for products in every category.
    --列出处理过每个类别产品订单的员工。
    SELECT EmployeeID, FirstName, LastName
    FROM Employees e
    WHERE NOT EXISTS (
        SELECT c.CategoryID
        FROM Categories c
        WHERE NOT EXISTS (
            SELECT p.ProductID
            FROM Products p
            JOIN [Order Details] od ON p.ProductID = od.ProductID
            JOIN Orders o ON od.OrderID = o.OrderID
            WHERE o.EmployeeID = e.EmployeeID AND p.CategoryID = c.CategoryID
        )
    );

    --218. Retrieve the total number of products ordered for each category and sort by descending total quantity.
    --检索每个类别订购的产品总数，并按总数量降序排序。
    SELECT p.CategoryID, c.CategoryName, SUM(od.Quantity) as TotalQuantity
    FROM [Order Details] od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY p.CategoryID, c.CategoryName
    ORDER BY TotalQuantity DESC;

    --219. Find the orders that have a ship city different from the customer’s city.
    --查找发货城市与客户所在城市不同的订单。
    SELECT o.OrderID, c.City AS CustomerCity, o.ShipCity AS ShipCity
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE c.City <> o.ShipCity;

    --220. Get the details of the top 5 most recent orders and the names of the employees who processed them.
    --获取最近前5个订单的详细信息以及处理这些订单的员工姓名。
    WITH RecentOrders AS (
    SELECT OrderID, CustomerID, EmployeeID, OrderDate,
           ROW_NUMBER() OVER (ORDER BY OrderDate DESC) as RowNum
    FROM Orders
    )
    SELECT TOP 5 r.OrderID, c.CompanyName AS CustomerName, e.FirstName, e.LastName, r.OrderDate
    FROM RecentOrders r
    JOIN Customers c ON r.CustomerID = c.CustomerID
    JOIN Employees e ON r.EmployeeID = e.EmployeeID
    ORDER BY r.OrderDate

    --221. List all products with a unit price higher than the average unit price for their supplier.
    --列出单价高于供应商平均单价的所有产品。
    SELECT p.ProductID, p.ProductName, p.UnitPrice, s.CompanyName AS SupplierName
    FROM Products p
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    WHERE p.UnitPrice > (
        SELECT AVG(p2.UnitPrice)
        FROM Products p2
        WHERE p2.SupplierID = p.SupplierID
    );

    --222. Retrieve the names of suppliers who have a contact title of "Owner" and have provided products in the "Beverages" category.
    --检索联系人头衔为“所有者”并提供“饮料”类别产品的供应商的名称。
    SELECT DISTINCT s.CompanyName AS SupplierName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE s.ContactTitle = 'Owner'
    AND p.CategoryID IN (
        SELECT CategoryID
        FROM Categories
        WHERE CategoryName = 'Beverages'
    );
    --223. Find the top 5 customers with the highest average order value and the number of orders they have placed.
    --找出平均订单价值最高的前5位客户以及他们下的订单数量。
    SELECT TOP 5 c.CustomerID, c.CompanyName, COUNT(o.OrderID) as OrderCount, AVG(od.UnitPrice * od.Quantity) as AverageOrderValue
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.CustomerID, c.CompanyName
    ORDER BY AverageOrderValue DESC

    --224. Get all products that have been ordered in the last year and have a reorder level greater than the average reorder level.
    --获取去年订购的所有产品，且其再订购水平高于平均再订购水平。
    SELECT p.ProductID, p.ProductName, p.ReorderLevel
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE YEAR(o.OrderDate) = YEAR(GETDATE()) AND ReorderLevel > (
        SELECT AVG(ReorderLevel)
        FROM Products
    );

    --225. List the employees who have processed orders for customers with a postal code starting with "9" and "8".
    --列出为邮政编码以“9”和“8”开头的客户处理订单的员工。
    SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE (c.PostalCode LIKE '9%' OR c.PostalCode LIKE '8%')
    ORDER BY e.EmployeeID;

    --226. Retrieve the total order amount for each category and list them in descending order.
    --检索每个类别的总订单金额，并按降序列出。
    SELECT c.CategoryName, SUM(od.UnitPrice * od.Quantity) as TotalOrderAmount
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    GROUP BY c.CategoryName
    ORDER BY TotalOrderAmount DESC;

    --227. Find the suppliers who have not supplied products to any customers with orders in 1994.
    --查找1994年未向任何有订单的客户供应产品的供应商。
     SELECT SupplierID, CompanyName
    FROM Suppliers
    WHERE SupplierID NOT IN (
        SELECT DISTINCT s.SupplierID
        FROM Suppliers s
        JOIN Products p ON s.SupplierID = p.SupplierID
        JOIN [Order Details] od ON p.ProductID = od.ProductID
        JOIN Orders o ON od.OrderID = o.OrderID
        WHERE YEAR(o.OrderDate) = 1994
    );
    --228. Get the names of customers who have placed orders with products that have a unit price higher than the average unit price of products in their category.
    --获取订购单价高于其类别中产品平均单价的产品的客户名称。
    SELECT DISTINCT c.CustomerID, c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    WHERE od.UnitPrice > (
        SELECT AVG(UnitPrice)
        FROM Products p2
        WHERE p2.CategoryID = od.ProductID
    );

    --229. List all products that have been ordered by customers from cities with the top 3 highest order counts.
    --列出客户从订单数前3位的城市订购的所有产品。
    SELECT DISTINCT p.ProductID, p.ProductName
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.CustomerID IN (
        SELECT TOP 3 CustomerID
        FROM Orders
        GROUP BY CustomerID
        ORDER BY COUNT(*) DESC   
    );
    --230. Retrieve the names and contact titles of suppliers who have shipped products to "Paris" and "London".
    --检索已将产品运往"Paris" and "London"的供应商的名称和联系方式。
    SELECT s.SupplierID, s.CompanyName, s.ContactTitle
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.ShipCity IN ('Paris', 'London')
    GROUP BY s.SupplierID, s.CompanyName, s.ContactTitle


    --231. Find all orders with a freight cost that is above the median freight cost and was shipped by "Speedy Express".
    --查找运费高于运费中位数且由“Speedy Express”发货的所有订单。


    --232. Get the top 5 products with the highest average discount applied and list their total quantity ordered.
    --获取平均折扣最高的前5种产品，并列出其订购总量。
    SELECT TOP 5 p.ProductID, p.ProductName, AVG(od.Discount) as AverageDiscount, SUM(od.Quantity) as TotalQuantityOrdered
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName
    ORDER BY AverageDiscount DESC

    --233. List all employees who have shipped orders with a total freight cost above the average for the year 1996.
    --列出所有发出总运费高于1996年平均水平的订单的员工。
    WITH AverageFreight AS (
        SELECT AVG(Total) as AvgFreight
        FROM (
            SELECT SUM(Freight) as Total
            FROM Orders
            WHERE YEAR(ShippedDate) = 1996
            GROUP BY ShipVia, EmployeeID
        ) as SubQuery
    )
    SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    WHERE o.ShipVia IN (
        SELECT ShipperID
        FROM Shippers
        WHERE CompanyName = 'Speedy Express'
    ) AND o.Freight > (SELECT AvgFreight FROM AverageFreight);

    --234. Retrieve the total number of products in stock for each category where the average unit price is above $30.
    --检索平均单价高于30美元的每个类别的库存产品总数。
    SELECT c.CategoryID, c.CategoryName, SUM(p.UnitsInStock) as TotalUnitsInStock
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    GROUP BY c.CategoryID, c.CategoryName
    HAVING AVG(p.UnitPrice) > 30;

    --235. Find the customers who have placed orders with a discount applied and have ordered products from at least 4 different suppliers.
    --查找已应用折扣下订单并从至少4个不同供应商订购产品的客户。

    --236. Get all products that have a unit price greater than the average for their supplier and have been ordered more than 10 times.
    --获取所有单价高于供应商平均价格且订购次数超过10次的产品。
    SELECT DISTINCT p.ProductID, p.ProductName, p.UnitPrice
    FROM Products p
    WHERE (
        SELECT AVG(UnitPrice)
        FROM Products
        WHERE SupplierID = p.SupplierID
    ) < p.UnitPrice
    AND p.ProductID IN (
        SELECT ProductID
        FROM [Order Details]
        GROUP BY ProductID
        HAVING SUM(Quantity) > 10
    );

    --237. List all categories with products that have a reorder level equal to the average reorder level of products in their category.
    --列出所有重新订购级别等于其类别中产品平均重新订购级别的产品类别。
    SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName, p.ReorderLevel
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    WHERE p.ReorderLevel = (
        SELECT AVG(ReorderLevel)
        FROM Products
        WHERE CategoryID = c.CategoryID
    );
    --238. Retrieve the names of suppliers who have provided products in the "Seafood" category and have a fax number.
    --检索提供“海鲜”类别产品并具有传真号码的供应商的名称。
    SELECT s.SupplierID, s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    WHERE c.CategoryName = 'Seafood' AND s.Fax IS NOT NULL;

    --239. Find the top 5 cities with the highest total order amount and list the number of customers in each city.
    --找出订单总额最高的前5个城市，并列出每个城市的客户数量。
    SELECT TOP 5 c.City, COUNT(DISTINCT c.CustomerID) AS NumberOfCustomers, SUM(od.UnitPrice * od.Quantity) AS TotalOrderAmount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.City
    ORDER BY TotalOrderAmount DESC

    --240. Get the details of orders where the ship name contains "Express" and the freight cost is above $40.
    --获取订单的详细信息，其中船名包含“Express”，运费超过40美元。
    SELECT OrderID, ShipName, Freight, OrderDate
    FROM Orders
    WHERE ShipName LIKE '%Express%' AND Freight > 40;

    --241. List the top 3 most expensive products in each category and retrieve their supplier details.
    --列出每个类别中最昂贵的3种产品，并检索其供应商详细信息。
    SELECT p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName, s.SupplierID, s.CompanyName
    FROM Products p
    JOIN Categories c ON p.CategoryID = c.CategoryID
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    WHERE (
        SELECT COUNT(*)
        FROM Products p2
        WHERE p2.CategoryID = p.CategoryID AND p2.UnitPrice > p.UnitPrice
    ) < 3
    ORDER BY c.CategoryName, p.UnitPrice DESC;


    --242. Retrieve the total number of orders placed by customers with a postal code starting with "1" and "2".
    --检索邮政编码以“1”和“2”开头的客户下的订单总数。
    SELECT
    SUM(CASE WHEN c.PostalCode LIKE '1%' THEN 1 ELSE 0 END) as TotalOrdersFromPostalCodeStartingWith1,
    SUM(CASE WHEN c.PostalCode LIKE '2%' THEN 1 ELSE 0 END) as TotalOrdersFromPostalCodeStartingWith2
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID;
    --243. Find the products that have a quantity per unit description containing "Can" or "Pack" and have been ordered more than the median quantity.
    --查找每单位描述中包含"Can" or "Pack"且订购数量超过中位数的产品。


    --244. Get the names of customers who have placed orders with products that have the highest total quantity ordered.
    --获取订购了总订购量最高的产品的客户的姓名。
    WITH OrderDetailsWithTotalQuantity AS (
    SELECT
        c.CustomerID,
        c.CompanyName,
        SUM(od.Quantity) as TotalOrderedQuantity
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.CustomerID, c.CompanyName
    ),
    MaxTotalOrderedQuantity AS (
        SELECT MAX(TotalOrderedQuantity) as MaxQuantity
        FROM OrderDetailsWithTotalQuantity
    )
    SELECT
        odwtc.CustomerID,
        odwtc.CompanyName
    FROM OrderDetailsWithTotalQuantity odwtc
    JOIN MaxTotalOrderedQuantity mtq ON odwtc.TotalOrderedQuantity = mtq.MaxQuantity;


    --245. List all orders where the ship city is different from the customer’s city and the order amount is above the average.
    --列出发货城市与客户所在城市不同且订单金额高于平均水平的所有订单。
    WITH OrderDetailsWithTotalAmount AS (
    SELECT
        o.OrderID,
        c.City as CustomerCity,
        o.ShipCity,
        SUM(od.UnitPrice * od.Quantity) as TotalOrderAmount
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY o.OrderID, c.City, o.ShipCity
    ),
    AverageOrderAmount AS (
        SELECT AVG(TotalOrderAmount) as AvgTotalOrderAmount
        FROM OrderDetailsWithTotalAmount
    )
    SELECT
        *
    FROM OrderDetailsWithTotalAmount oda
    JOIN AverageOrderAmount aaa ON 1=1
    JOIN Orders o ON o.OrderID = oda.OrderID
    WHERE oda.CustomerCity != oda.ShipCity
    AND oda.TotalOrderAmount > aaa.AvgTotalOrderAmount;
    --246. Retrieve the names of employees who have shipped orders with a total quantity of products ordered above the average.
    --检索已发出订单的员工姓名，订单中订购的产品总量高于平均值。
    WITH OrderDetailsWithTotalQuantity AS (
    SELECT
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        SUM(od.Quantity) as TotalOrderQuantity
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    ),
    AverageTotalOrderQuantity AS (
        SELECT AVG(TotalOrderQuantity) as AvgTotalOrderQuantity
        FROM OrderDetailsWithTotalQuantity
    )
    SELECT
        edwtq.EmployeeID,
        edwtq.FirstName,
        edwtq.LastName,
        edwtq.TotalOrderQuantity
    FROM OrderDetailsWithTotalQuantity edwtq
    JOIN AverageTotalOrderQuantity atoq ON 1=1
    WHERE edwtq.TotalOrderQuantity > atoq.AvgTotalOrderQuantity;

    --247. Find the top 10 products with the highest unit price that have been ordered in the last year.
    --查找去年订购的单价最高的前10种产品。
    SELECT TOP 10 p.ProductID, p.ProductName, p.UnitPrice
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderDate >= DATEADD(year, -1, GETDATE())
    ORDER BY p.UnitPrice DESC

    --248. Get the details of orders where the ship country is the same as the supplier’s country and the freight cost is above the average.
    --获取发货国与供应商所在国相同且运费高于平均水平的订单详情。
    SELECT o.OrderID, c.CompanyName AS Shipper, s.CompanyName AS Supplier, o.ShipCountry, o.Freight
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON p.ProductID = od.ProductID
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
    WHERE o.ShipCountry = s.Country
      AND o.Freight > (
        SELECT AVG(Freight)
        FROM Orders
      );
    --249. List all products that have been ordered by customers in cities with a total order amount greater than $1000.
    --列出城市客户订购的所有产品，订单总额超过1000美元。
    SELECT DISTINCT 
        p.ProductID,
        p.ProductName
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE (
        SELECT SUM(od2.UnitPrice * od2.Quantity)
        FROM Orders o2
        JOIN [Order Details] od2 ON o2.OrderID = od2.OrderID
        WHERE o2.CustomerID = c.CustomerID
    ) > 1000;

    --250. Retrieve the names of suppliers who have provided products with a unit price less than $20 and more than $50.
    --检索提供单价低于20美元但高于50美元的产品的供应商的名称。
    SELECT DISTINCT s.SupplierID,s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE EXISTS (
        SELECT 1
        FROM Products p2
        WHERE p2.SupplierID = p.SupplierID
          AND p2.UnitPrice < 20
    ) AND EXISTS (
        SELECT 1
        FROM Products p3
        WHERE p3.SupplierID = p.SupplierID
          AND p3.UnitPrice > 50
    );


    --251. Find the categories with products that have never been discontinued and have been ordered in every month of the last year.
    --查找去年每个月从未停产且已订购的产品类别。

    --252. Get the total number of orders for each category where the average order amount is greater than $200.
    --获取平均订单金额大于200美元的每个类别的订单总数。
    SELECT c.CategoryID,c.CategoryName, COUNT(o.OrderID) AS TotalOrders
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    GROUP BY c.CategoryID,c.CategoryName
    HAVING AVG(od.UnitPrice * od.Quantity) > 200;


    --253. List all customers who have placed orders in every month of the last year and have a postal code starting with "1".
    --列出去年每月下订单且邮政编码以“1”开头的所有客户。


    --254. Retrieve the names of employees who have processed orders for the highest number of products and their total order amount.
    --检索处理过最多产品订单的员工姓名及其订单总额。
    SELECT TOP 1 e.EmployeeID, e.FirstName, e.LastName, SUM(od.UnitPrice * od.Quantity) AS TotalAmount
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    ORDER BY COUNT(od.ProductID) DESC, TotalAmount DESC


    --255. Find the suppliers who have the highest number of products in categories where the average unit price is above $30.
    --在平均单价高于30美元的类别中，找到产品数量最多的供应商。
    WITH SupplierProductCounts AS (
    SELECT
        s.SupplierID,
        COUNT(p.ProductID) as ProductCount
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE p.UnitPrice > 30
    GROUP BY s.SupplierID
    )
    SELECT TOP 1
        spc.SupplierID,
        s.CompanyName,
        spc.ProductCount
    FROM SupplierProductCounts spc
    JOIN Suppliers s ON spc.SupplierID = s.SupplierID
    WHERE spc.ProductCount = (
        SELECT MAX(ProductCount)
        FROM SupplierProductCounts
    );


    --256. Get all products that have a unit price higher than the median unit price in their category and have been ordered more than 20 times.
    --获取所有单价高于其类别中单价中位数且订购次数超过20次的产品。
    SELECT p.ProductID, p.ProductName
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    WHERE p.UnitPrice > (
        SELECT AVG(UnitPrice)
        FROM Products p2
        WHERE p2.CategoryID = p.CategoryID
    ) AND od.Quantity > 20;

    --257. List all orders where the freight cost is above the average for the year 1997 and the order date is before the ship date.
    --列出运费高于1997年平均水平且订单日期早于发货日期的所有订单。
        SELECT o.OrderID, o.OrderDate, o.ShippedDate, o.Freight
        FROM Orders o
        WHERE o.Freight > (
            SELECT AVG(Freight)
            FROM Orders
            WHERE YEAR(OrderDate) = 1997
        ) AND o.OrderDate < o.ShippedDate;

    --258. Retrieve the top 5 customers with the highest average discount applied and their total order amount.
    --检索平均折扣最高的前5位客户及其总订单金额。
    SELECT TOP 5 c.CustomerID, c.CompanyName, AVG(od.Discount) AS AverageDiscount, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalAmount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.CustomerID, c.CompanyName
    ORDER BY AverageDiscount DESC, TotalAmount DESC


    --259. Find the products that have been ordered more than the average quantity ordered for their category and have a unit price above $25.
    --查找订购量超过其类别平均订购量且单价高于25美元的产品。
    SELECT DISTINCT p.ProductID, p.ProductName
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    WHERE od.Quantity > (
        SELECT AVG(Quantity)
        FROM [Order Details]
        WHERE ProductID = p.ProductID
    ) AND p.UnitPrice > 25
    ORDER BY p.ProductID


    --260. Get the names of suppliers who have provided products with a quantity per unit description containing "Bottle" and "Can".
    --获取提供产品的供应商名称，每个单位描述包含"Bottle" and "Can"的数量。
    SELECT DISTINCT s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE p.QuantityPerUnit LIKE '%Bottle%'
       OR p.QuantityPerUnit LIKE '%Can%';


    --261. List all employees who have shipped orders with a freight cost above the average and have processed orders for customers in more than 3 different countries.
    --列出所有运费高于平均水平并为3个以上不同国家的客户处理订单的员工。
    SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    WHERE o.Freight > (
        SELECT AVG(Freight)
        FROM Orders
    ) AND (
        SELECT COUNT(DISTINCT c.Country)
        FROM Customers c
        JOIN Orders o2 ON c.CustomerID = o2.CustomerID
        WHERE o2.EmployeeID = e.EmployeeID
    ) > 3;

    --262. Retrieve the total number of products in stock for each category where the reorder level is above the average for products in their category.
    --检索重新订购水平高于其类别中产品平均水平的每个类别的库存产品总数。
   SELECT c.CategoryName, SUM(p.UnitsInStock) AS TotalUnitsInStock
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    WHERE p.ReorderLevel > (
        SELECT AVG(ReorderLevel)
        FROM Products
        WHERE CategoryID = p.CategoryID
    )
    GROUP BY c.CategoryName;


    --263. Find the customers who have placed orders for products in categories where the average quantity ordered is above 20.
    --查找在平均订购量超过20的类别中订购产品的客户。
   SELECT c.CustomerID, c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE p.CategoryID IN (
        SELECT CategoryID
        FROM Products
        JOIN [Order Details] od2 ON Products.ProductID = od2.ProductID
        GROUP BY CategoryID
        HAVING AVG(od2.Quantity) > 20
    )
    GROUP BY c.CustomerID, c.CompanyName;


    --264. Get all orders where the ship city is the same as the customer’s city and the order amount is above the median order amount.
    --获取所有发货城市与客户所在城市相同且订单金额高于订单金额中位数的订单。


    --265. List all categories with products that have a reorder level less than the average reorder level for their category and have been ordered more than 5 times.
    --列出所有重新订购级别低于其类别平均重新订购级别且订购次数超过5次的产品类别。

    SELECT c.CategoryName, p.ProductName, p.ReorderLevel
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    WHERE p.ReorderLevel < (
        SELECT AVG(ReorderLevel)
        FROM Products
        WHERE CategoryID = p.CategoryID
    )
    GROUP BY c.CategoryName, p.ProductName, p.ReorderLevel
    HAVING COUNT(od.OrderID) > 5;

    --266. Retrieve the names of suppliers who have provided products with a unit price within the range of the top 5 % most expensive products.
    --检索提供单价在前5%最昂贵产品范围内的产品的供应商名称。

    WITH TopExpensiveProducts AS (
    SELECT
        UnitPrice,
        ROW_NUMBER() OVER (ORDER BY UnitPrice DESC) as RowNum,
        COUNT(*) OVER () as TotalCount
    FROM Products
    ),
    Top5PercentRange AS (
        SELECT
            MIN(UnitPrice) as MinUnitPrice,
            MAX(UnitPrice) as MaxUnitPrice
        FROM TopExpensiveProducts
        WHERE RowNum BETWEEN FLOOR(TotalCount * 0.95) + 1 AND TotalCount
    )
    SELECT DISTINCT
        s.SupplierID,
        s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE p.UnitPrice BETWEEN (SELECT MinUnitPrice FROM Top5PercentRange) AND (SELECT MaxUnitPrice FROM Top5PercentRange);

    --267. Find the top 10 cities with the most customers and list the total order amount for each city.
    --找出客户最多的前10个城市，并列出每个城市的订单总额。
    SELECT TOP 10
        c.City,
        SUM(od.UnitPrice * od.Quantity) AS TotalOrderAmount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.City
    ORDER BY COUNT(c.CustomerID) DESC, TotalOrderAmount DESC


    --268. Get the details of orders where the ship country is "USA" and the order amount is greater than the average order amount for the year 1996.
    --获取发货国为“USA”且订单金额大于1996年平均订单金额的订单详情。
    SELECT
        o.OrderID,
        o.ShipCountry,
        o.OrderDate,
        SUM(od.UnitPrice * od.Quantity) AS OrderAmount
    FROM Orders o
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    WHERE o.ShipCountry = 'USA'
    AND (o.OrderDate >= '1996-01-01' AND o.OrderDate < '1997-01-01')
    GROUP BY o.OrderID, o.ShipCountry, o.OrderDate
    HAVING SUM(od.UnitPrice * od.Quantity) > (
        SELECT AVG(TotalAmount) FROM (
            SELECT SUM(UnitPrice * Quantity) AS TotalAmount
            FROM Orders o
            JOIN [Order Details] od ON o.OrderID = od.OrderID
            WHERE o.OrderDate >= '1996-01-01' AND o.OrderDate < '1997-01-01'
        ) AS Subquery
    );

    --269. List all products with a unit price greater than the average unit price in their category and have been ordered in the last 6 months.
    --列出所有单价高于其类别平均单价且在过去6个月内订购的产品。
    SELECT
        p.ProductID,
        p.ProductName,
        p.UnitPrice
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE p.UnitPrice > (
        SELECT AVG(UnitPrice) FROM Products WHERE CategoryID = p.CategoryID
    )
    AND o.OrderDate >= DATEADD(month, -6, GETDATE());

    --270. Retrieve the names of employees who have shipped orders to customers with postal codes starting with "9" and "8" and have processed more than 20 orders.
    --检索已向邮政编码以“9”和“8”开头的客户发送订单并处理了20多个订单的员工姓名。
    SELECT
        e.EmployeeID,
        e.FirstName,
        e.LastName
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    WHERE EXISTS (
        SELECT 1 FROM Customers c WHERE o.CustomerID = c.CustomerID AND (c.PostalCode LIKE '9%' OR c.PostalCode LIKE '8%')
    )
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    HAVING COUNT(o.OrderID) > 20;


    --271. Find the top 5 suppliers with the highest total quantity of products supplied and list their contact details.
    --找到供应产品总量最高的前5家供应商，并列出他们的联系方式。
    
    SELECT TOP 5
        s.SupplierID,
        s.CompanyName,
        s.ContactName,
        s.ContactTitle,
        s.Address,
        s.City,
        s.Region,
        s.PostalCode,
        s.Country,
        s.Phone,
    SUM(od.Quantity) AS TotalQuantity
    FROM Suppliers s
    JOIN Products p ON p.SupplierID = s.SupplierID
    JOIN [Order Details] od ON od.ProductID = p.ProductID
    GROUP BY s.SupplierID, s.CompanyName, s.ContactName, s.ContactTitle, s.Address, s.City, s.Region, s.PostalCode, s.Country, s.Phone
    ORDER BY TotalQuantity DESC


    --272. Get all orders where the total order amount is greater than the average for orders shipped by "Speedy Express" and "United Package".
    --获取所有订单总额大于“Speedy Express”和“United Package”发货订单平均值的订单。
    SELECT
    o.OrderID,
    o.OrderDate,
    c.CompanyName AS CustomerName,
    s.CompanyName AS ShipperName,
    SUM(od.UnitPrice * od.Quantity) AS TotalOrderAmount
    FROM Orders o
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Shippers s ON o.ShipVia = s.ShipperID
    WHERE (s.CompanyName = 'Speedy Express' OR s.CompanyName = 'United Package')
    GROUP BY o.OrderID, o.OrderDate, c.CompanyName, s.CompanyName
    HAVING SUM(od.UnitPrice * od.Quantity) > (
        SELECT AVG(TotalOrderAmount) FROM (
            SELECT
                SUM(od.UnitPrice * od.Quantity) AS TotalOrderAmount
            FROM Orders o
            JOIN [Order Details] od ON o.OrderID = od.OrderID
            JOIN Customers c ON o.CustomerID = c.CustomerID
            JOIN Shippers s ON o.ShipVia = s.ShipperID
            WHERE (s.CompanyName = 'Speedy Express' OR s.CompanyName = 'United Package')
        ) AS Subquery
    );
    --273. List all products that have been ordered in every year from 1995 to 1997 and have a reorder level higher than the average for their category.
    --列出1995年至1997年每年订购的所有产品，并且其再订购水平高于其类别的平均水平
    SELECT
    p.ProductID,
    p.ProductName,
    p.ReorderLevel,
    c.CategoryName
    FROM Products p
    JOIN Categories c ON p.CategoryID = c.CategoryID
    WHERE p.ProductID IN (
        SELECT od.ProductID FROM [Order Details]  od 
	    JOIN Orders o ON o.OrderID = od.OrderID 
	    WHERE YEAR(o.OrderDate) BETWEEN 1995 AND 1997 
	    GROUP BY od.ProductID HAVING COUNT(DISTINCT YEAR(o.OrderDate)) = 3
    )
    AND p.ReorderLevel > (
        SELECT AVG(ReorderLevel) FROM Products WHERE CategoryID = p.CategoryID
    );

    --274. Retrieve the names of suppliers who have provided products with a quantity per unit description containing "Pack" and "Box" and have a contact title starting with "Sales".
    --检索供应商的名称，这些供应商提供了每单位数量的产品描述，其中包含"Pack" 和"Box"，联系人标题以“销售”开头。
    SELECT DISTINCT
    s.SupplierID,
    s.CompanyName,
    s.ContactName,
    s.ContactTitle
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE (p.QuantityPerUnit LIKE '%Pack%' OR p.QuantityPerUnit LIKE '%Box%')
    AND s.ContactTitle LIKE 'Sales%';

    --275. Find the customers who have placed orders  more than 5 different categories.
    --查找已下订单超过5个不同类别的客户。
    SELECT
    c.CustomerID,
    c.CompanyName
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY c.CustomerID, c.CompanyName
    HAVING COUNT(DISTINCT p.CategoryID) > 5;


    --276. Get the total number of orders placed by customers who have ordered products in every month of the year 1997.
    --获取1997年每个月订购产品的客户的订单总数。
    SELECT DISTINCT o.CustomerID
    FROM Orders o
    WHERE YEAR(o.OrderDate)=1997
    GROUP BY o.CustomerID
    HAVING COUNT(DISTINCT MONTH(o.OrderDate)) = 12;


    --277. List all products with a unit price that is within the range of the average unit price plus one standard deviation for their category.
    --列出所有单价在平均单价加上其类别的一个标准偏差范围内的产品。
    SELECT
        p.ProductID,
        p.ProductName,
        p.UnitPrice,
        c.CategoryName
    FROM Products p
    JOIN Categories c ON p.CategoryID = c.CategoryID
    WHERE p.UnitPrice BETWEEN (
        SELECT AVG(UnitPrice) - STDEV(UnitPrice)
        FROM Products
        WHERE CategoryID = p.CategoryID
    ) AND (
        SELECT AVG(UnitPrice) + STDEV(UnitPrice)
        FROM Products
        WHERE CategoryID = p.CategoryID
    );

    --278. Retrieve the names of employees who have processed orders with the maximum number of products ordered and their total freight cost.
    --检索已处理订单的员工姓名，订单中订购的产品数量最多，以及他们的总运费。
    WITH OrderDetails AS (
    SELECT
        e.EmployeeID,
        COUNT(od.ProductID) as TotalProducts,
        SUM(o.Freight) as TotalFreight
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY e.EmployeeID
    ),
    MaxProductsEmployee AS (
        SELECT
            MAX(TotalProducts) as MaxProducts
        FROM OrderDetails
    )
    SELECT
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        od.TotalFreight
    FROM Employees e
    JOIN OrderDetails od ON e.EmployeeID = od.EmployeeID
    WHERE od.TotalProducts = (SELECT MaxProducts FROM MaxProductsEmployee);


    --279. Find the top 3 categories with the highest total quantity of products ordered and list their average unit price.
    --查找订购产品总量最高的前3个类别，并列出其平均单价
    SELECT TOP 3
    c.CategoryID,
    c.CategoryName,
    AVG(od.UnitPrice) AS AverageUnitPrice,
    SUM(od.Quantity) AS TotalQuantityOrdered
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    GROUP BY c.CategoryID, c.CategoryName
    ORDER BY TotalQuantityOrdered DESC


    --280. Get all orders where the order amount is above the average for orders shipped by "Federal Shipping" and "Speedy Express".
    --获取所有订单金额高于“Federal Shipping”和“Speedy Express”配送订单平均值的订单
    SELECT *
    FROM Orders o
    JOIN Shippers s ON s.ShipperID = o.ShipVia
    WHERE  (o.Freight > (
            SELECT AVG(Freight)
            FROM Orders
            WHERE ShipVia IN (SELECT DISTINCT ShipperID FROM Shippers WHERE s.CompanyName = 'Federal Shipping' OR s.CompanyName = 'Speedy Express' )
        ));

    --281 List all suppliers who have shipped products to "London" and "Paris" and have provided products in the "Beverages" category.
    SELECT 
        s.SupplierID,
        s.CompanyName,
        s.ContactName,
        s.ContactTitle,
        s.Address,
        s.City,
        s.PostalCode,
        s.Country,
        s.Phone,
        s.Fax,
        s.HomePage
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    JOIN Categories cg ON cg.CategoryID = p.CategoryID
    WHERE (o.ShipCity = 'London' OR o.ShipCity = 'Paris')
        AND cg.CategoryName = 'Beverages';


    --282. Retrieve the names of customers who have ordered products from suppliers in more than 5 different countries.
    --检索从5个以上不同国家的供应商处订购产品的客户的姓名。
    SELECT
    c.CustomerID,
    c.CompanyName
    FROM Customers c
    WHERE EXISTS (
        SELECT 1
        FROM Orders o
        JOIN [Order Details] od ON o.OrderID = od.OrderID
        JOIN Products p ON od.ProductID = p.ProductID
        JOIN Suppliers s ON p.SupplierID = s.SupplierID
        WHERE o.CustomerID = c.CustomerID
        GROUP BY o.CustomerID
        HAVING COUNT(DISTINCT s.Country) > 5
    );


    --283. Find the products that have been ordered more than the median quantity ordered and have a unit price above $30.
    --查找订购量超过订购量中位数且单价高于30美元的产品


    --284. Get the total order amount for each employee and list them in descending order of the total amount.
    --获取每位员工的订单总额，并按总额降序排列
    SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    SUM(od.UnitPrice * od.Quantity) AS TotalOrderAmount
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    ORDER BY TotalOrderAmount DESC;


    --285. List all categories with products that have a unit price higher than the median unit price for their category and have been ordered more than 10 times.
    --列出所有单价高于其类别中位单价且订购次数超过10次的产品类别
    SELECT
    c.CategoryID,
    c.CategoryName
    FROM Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    WHERE p.UnitPrice > (
        SELECT AVG(UnitPrice)
        FROM Products
        WHERE CategoryID = p.CategoryID
    ) AND p.ProductID IN (
        SELECT ProductID
        FROM [Order Details]
        GROUP BY ProductID
        HAVING COUNT(*) > 10
    );

    --286. Retrieve the names of suppliers who have provided products with a quantity per unit description containing "Bottle" or "Pack" and have a fax number.
    --检索提供产品的供应商的名称，每个单位描述包含“Bottle”或“Pack”的数量，并有传真号码。
    SELECT DISTINCT s.SupplierID, s.CompanyName
    FROM Suppliers s
    JOIN Products p ON s.SupplierID = p.SupplierID
    WHERE (p.QuantityPerUnit LIKE '%Bottle%' OR p.QuantityPerUnit LIKE '%Pack%')
    AND s.Fax IS NOT NULL;

    --287. Find the top 5 products with the highest quantity ordered in the last year and their total order amount.
    --查找去年订购数量最多的前5种产品及其总订单金额。
    SELECT TOP 5
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantityOrdered,
    SUM(od.UnitPrice * od.Quantity) AS TotalOrderAmount
    FROM Products p
    JOIN [Order Details] od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderDate >= DATEADD(year, -1, GETDATE())
    GROUP BY p.ProductID, p.ProductName
    ORDER BY TotalQuantityOrdered DESC


    --288. Get all orders where the ship country is "Brazil" and the order date is within the first quarter of 1997.
    --获取发货国家为“Brazil”且订单日期在1997年第一季度内的所有订单。
    SELECT *
    FROM Orders
    WHERE ShipCountry = 'Brazil'
    AND DATEPART(MONTH,OrderDate) BETWEEN 1 AND 3 AND YEAR(OrderDate)=1997;
    


 