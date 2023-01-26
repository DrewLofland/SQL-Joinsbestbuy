/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.name, c.Name
 FROM products as p
 INNER JOIN categories as c
 ON c.categoryID = p.CategoryID
 WHERE c.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT PRODUCTS.NAME, PRODUCTS.PRICE, REVIEWS.RATING FROM PRODUCTS
 INNER JOIN REVIEWS ON REVIEWS.PRODUCTID = PRODUCTS.PRODUCTID
 WHERE REVIEWS.RATING = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT EMPLOYEES.FIRSTNAME, EMPLOYEES.LASTNAME, SUM(SALES.QUANTITY) FROM SALES
INNER JOIN EMPLOYEES ON EMPLOYEES.EMPLOYEEID = SALES.EMPLOYEEID
GROUP BY EMPLOYEES.EMPLOYEEID
ORDER BY SUM(SALES.QUANTITY) DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT DEPARTMENTS.NAME AS 'DEPARTMENT NAME', CATEGORIES.NAME AS 'CATEGORY NAME' FROM DEPARTMENTS
INNER JOIN CATEGORIES ON CATEGORIES.DEPARTMENTID = DEPARTMENTS.DEPARTMENTID
WHERE CATEGORIES.NAME = 'APPLIANCES' OR CATEGORIES.NAME = 'GAMES';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, Sum(s.Quantity) AS 'Total Sold', Sum(s.Quantity * s.PricePerUnit) AS 'Total Price Sold'
FROM products AS p
INNER JOIN sales AS s 
ON s.ProductID = p.ProductID
WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r
ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) AS 'Total Sold'
FROM sales AS s
INNER JOIN employees as e ON e.employeeID = s.employeeID
INNER JOIN products AS p ON p.productID = s.ProductID
GROUP BY e.employeeID, p.productID;
