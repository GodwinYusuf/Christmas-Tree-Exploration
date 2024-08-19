/** 
Author :     	Godwin Yusuf
Date: 	     	06:55 30/11/2023
Title: 	     	Resturant Sales Report
Tool: 	     	SQL on Github 
Project Source: https://www.kaggle.com/datasets/shariful07/student-mental-health
**/

-- To view table content
SELECT * FROM CHRISTMASTREE;

########################################################################################

/** Comparison of Average price for "REAL TREE" and "FAKE TREE" to the average price of individual total tree sold 
 query to find the average price of real tree  **/

(SELECT  ROUND(AVG(`AVERAGE TREE PRICE`),2) AS AvgTreeprice FROM CHRISTMASTREE
WHERE `TYPE OF TREE` = "REAL TREE");


#######################################################################################

-- Query and subquery to deliver a table to compare the average price ofareal tree to the average price of all real tree
SELECT 
    `Index`,
    `Type of tree`,
    `Average tree price`,
    `Number of trees sold`,
    (SELECT 
            ROUND(AVG(`AVERAGE TREE PRICE`), 2) AS AvgTreeprice
        FROM
            CHRISTMASTREE
        WHERE
            `TYPE OF TREE` = 'REAL TREE') AS AvgRealTree
FROM
    CHRISTMASTREE
    WHERE `TYPE OF TREE` = "REAL tREE";  
    

#########################################################################################

--  Query to find the average price of fake tree
(SELECT  ROUND(AVG(`AVERAGE TREE PRICE`),2) AS AvgTreePrice FROM CHRISTMASTREE
WHERE `TYPE OF TREE` = "FAKE TREE");

########################################################################################

-- Query and subquery to deliver a table to compare the average price ofareal tree to the average price of all fake tree
SELECT 
    `Index`
    `Type of tree`,
    `Average tree price`,
    `Number of trees sold`,
    (SELECT 
            ROUND(AVG(`AVERAGE TREE PRICE`), 2) AS AvgTreeprice
        FROM
            CHRISTMASTREE
        WHERE
            `TYPE OF TREE` = 'FAKE TREE') AS Avgfaketree
FROM
    CHRISTMASTREE
    WHERE `TYPE OF TREE` = "FAKE TREE";
    
################################################################################
    
--  Query to find the average price of all type of tree
  (SELECT  ROUND(AVG(`AVERAGE TREE PRICE`),2) AS ATP FROM CHRISTMASTREE
);


##################################################################################
   
-- Comparison of all type of tree @average tree price to the overall average price of all trees
    SELECT 
    `Index`,
    `Type of tree`,
    `Average tree price`,
    `Number of trees sold`,
    (SELECT 
            ROUND(AVG(`AVERAGE TREE PRICE`), 2) AS AvgTp
        FROM
            CHRISTMASTREE
	) AS AvgAllTreePrice
FROM
    CHRISTMASTREE
  ;
  
  ###############################################################################
  
  
-- Table comparison show expensive and affordable christmas tree sold by the average sale prices.

SELECT 
    `index`,`Average tree price`,
    (SELECT 
            ROUND(AVG(`AVERAGE TREE PRICE`), 2) AS AvgTp
        FROM
            CHRISTMASTREE) AS AvgAllTreePrice,
    (SELECT 
            CASE
                    WHEN `average tree price` < avgalltreeprice THEN 'Affordable'
                    ELSE  'Expensive'
                END 
        ) as  Market_Value
FROM
    christmastree
    order by 1;