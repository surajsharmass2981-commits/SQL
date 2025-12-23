Advanced SQL

Q6. Write a CTE to calculate the total revenue for each product 
 (Revenues = Price × Quantity), and return only products where  revenue > 3000.

Ans:- 
WITH ProductRevenue AS (
    SELECT p.ProductName, (p.Price * s.Quantity) AS Revenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
)
SELECT * FROM ProductRevenue WHERE Revenue > 3000;


Q7. Create a view named that shows:  Category, TotalProducts, Averag

Ans:- 
CREATE VIEW vw_CategorySummary AS
SELECT Category, COUNT(ProductID) AS TotalProducts, AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;


Q8. Create an updatable view containing ProductID, ProductName, and Price. 
 Then update the price of ProductID = 1 using the view.
 
Ans:-
CREATE VIEW vw_ProductPrices AS
SELECT ProductID, ProductName, Price FROM Products;
 
UPDATE vw_ProductPrices SET Price = 1300 WHERE ProductID = 1;


Q9. Create a stored procedure that accepts a category name and returns all products belonging to that
category.

Ans:- 
DELIMITER //
CREATE PROCEDURE GetProductsByCategory(IN catName VARCHAR(50))
BEGIN
    SELECT * FROM Products WHERE Category = catName;
END //
DELIMITER ;


Q10. Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a new ProductArchive
table . The archive should store ProductID, ProductName, Category, Price, and DeletedAt
timestamp.

Ans:-
CREATE TRIGGER tr_ArchiveDeletedProduct
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price, DeletedAt)
    VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price, NOW());
END; 
 