CREATE TABLE Calendar (
    Date DATE PRIMARY KEY,
    Year INT,
    Month INT,
    Quarter INT,
    Week_of_Month INT,
    Day_Name VARCHAR(20),
    Month_Name VARCHAR(20)
);

CREATE TABLE Downtime_factors (
    Factor INT PRIMARY KEY,
    Description VARCHAR(255),
    Operator_Error VARCHAR(3)
);

CREATE TABLE Line_downtime (
    Batch INT,
    Factor INT,
    Minutes INT,
    FOREIGN KEY (Factor) REFERENCES Downtime_factors(Factor)
);

CREATE TABLE Line_productivity (
    Batch INT PRIMARY KEY,
    Operator VARCHAR(50),
    Date DATE,
    Start_Time TIME,
    End_Time TIME,
    Product VARCHAR(50),
    FOREIGN KEY (Date) REFERENCES Calendar(Date)
);

CREATE TABLE Product_details (
    Size INT PRIMARY KEY,
    Min_Batch_Time INT
);

CREATE TABLE Products (
    Product VARCHAR(50) PRIMARY KEY,
    Flavor VARCHAR(50),
    Size_In_ml INT,
    FOREIGN KEY (Size_In_ml) REFERENCES Product_details(Size)
);

INSERT INTO Calendar (Date, Year, Month, Quarter, Week_of_Month, Day_Name, Month_Name) VALUES
('2024-08-29', 2024, 8, 3, 5, 'Thursday', 'August'),
('2024-08-30', 2024, 8, 3, 5, 'Friday', 'August'),
('2024-08-31', 2024, 8, 3, 5, 'Saturday', 'August'),
('2024-09-01', 2024, 9, 3, 1, 'Sunday', 'September'),
('2024-09-02', 2024, 9, 3, 1, 'Monday', 'September'),
('2024-09-03', 2024, 9, 3, 1, 'Tuesday', 'September');

INSERT INTO Downtime_factors (Factor, Description, Operator_Error) VALUES
(1, 'Emergency stop', 'No'),
(2, 'Batch change', 'Yes'),
(3, 'Labeling error', 'No'),
(4, 'Inventory shortage', 'No'),
(5, 'Product spill', 'Yes'),
(6, 'Machine adjustment', 'Yes'),
(7, 'Machine failure', 'No'),
(8, 'Batch coding error', 'Yes'),
(9, 'Conveyor belt jam', 'No'),
(10, 'Calibration error', 'Yes'),
(11, 'Label switch', 'Yes'),
(12, 'Other', 'No');

INSERT INTO Line_downtime (Batch, Factor, Minutes) VALUES
(422111, 2, 60),
(422111, 7, 15),
(422112, 2, 20),
(422112, 8, 20),
(422113, 2, 50),
(422114, 4, 25),
(422114, 6, 15),
(422115, 10, 24),
(422117, 2, 10),
(422117, 6, 5),
(422118, 6, 14),
(422118, 7, 16),
(422118, 11, 10),
(422118, 12, 20),
(422119, 4, 25),
(422120, 4, 20),
(422120, 5, 15),
(422120, 9, 17),
(422121, 7, 15),
(422122, 7, 25),
(422123, 4, 43),
(422123, 7, 30),
(422124, 5, 20),
(422124, 6, 20),
(422125, 11, 10),
(422125, 12, 10),
(422126, 8, 44),
(422127, 6, 23),
(422128, 5, 22),
(422128, 7, 30),
(422129, 12, 15),
(422130, 2, 20),
(422131, 4, 20),
(422131, 10, 10),
(422133, 7, 20),
(422134, 7, 30),
(422134, 8, 20),
(422135, 4, 30),
(422135, 12, 15),
(422137, 8, 30),
(422137, 10, 15),
(422138, 3, 20),
(422139, 4, 20),
(422139, 6, 15),
(422140, 6, 50),
(422140, 11, 13),
(422141, 12, 7),
(422142, 6, 30),
(422143, 6, 40),
(422143, 7, 18),
(422144, 6, 30),
(422144, 8, 24),
(422145, 3, 22),
(422146, 6, 30),
(422146, 7, 25),
(422146, 12, 7),
(422147, 4, 17),
(422147, 6, 60),
(422147, 7, 30),
(422148, 4, 25),
(422148, 8, 7);

INSERT INTO Line_productivity (Batch, Operator, Date, Start_Time, End_Time, Product) VALUES
(422111, 'Mac', '2024-08-29', '11:50:00', '14:05:00', 'OR-600'),
(422112, 'Mac', '2024-08-29', '14:05:00', '15:45:00', 'LE-600'),
(422113, 'Mac', '2024-08-29', '15:45:00', '17:35:00', 'LE-600'),
(422114, 'Mac', '2024-08-29', '17:35:00', '19:15:00', 'LE-600'),
(422115, 'Charlie', '2024-08-29', '19:15:00', '20:39:00', 'LE-600'),
(422116, 'Charlie', '2024-08-29', '20:39:00', '21:39:00', 'LE-600'),
(422117, 'Charlie', '2024-08-29', '21:39:00', '22:54:00', 'LE-600'),
(422118, 'Dee', '2024-08-30', '04:05:00', '06:05:00', 'CO-600'),
(422119, 'Dee', '2024-08-30', '06:05:00', '07:30:00', 'CO-600'),
(422120, 'Dee', '2024-08-30', '07:30:00', '09:22:00', 'CO-600'),
(422121, 'Dennis', '2024-08-30', '09:22:00', '10:37:00', 'CO-600'),
(422122, 'Dennis', '2024-08-30', '10:37:00', '12:02:00', 'CO-600'),
(422123, 'Dennis', '2024-08-30', '12:02:00', '14:15:00', 'CO-600'),
(422124, 'Dennis', '2024-08-30', '14:15:00', '15:55:00', 'CO-600'),
(422125, 'Charlie', '2024-08-30', '15:55:00', '17:15:00', 'CO-600'),
(422126, 'Charlie', '2024-08-30', '17:15:00', '18:59:00', 'CO-600'),
(422127, 'Charlie', '2024-08-30', '18:59:00', '20:22:00', 'CO-600'),
(422128, 'Charlie', '2024-08-30', '20:22:00', '22:14:00', 'CO-600'),
(422129, 'Charlie', '2024-08-30', '22:14:00', '23:29:00', 'CO-600'),
(422130, 'Dee', '2024-08-31', '07:45:00', '09:05:00', 'CO-600'),
(422131, 'Dee', '2024-08-31', '09:05:00', '10:35:00', 'CO-600'),
(422132, 'Dee', '2024-08-31', '10:35:00', '11:35:00', 'CO-600'),
(422133, 'Dee', '2024-08-31', '11:35:00', '12:55:00', 'DC-600'),
(422134, 'Mac', '2024-08-31', '12:55:00', '14:45:00', 'DC-600'),
(422135, 'Mac', '2024-08-31', '14:45:00', '16:30:00', 'DC-600'),
(422136, 'Mac', '2024-08-31', '16:30:00', '17:30:00', 'DC-600'),
(422137, 'Dee', '2024-09-02', '01:00:00', '02:45:00', 'RB-600'),
(422138, 'Dee', '2024-09-02', '02:45:00', '04:05:00', 'RB-600'),
(422139, 'Dee', '2024-09-02', '04:05:00', '05:40:00', 'RB-600'),
(422140, 'Dee', '2024-09-02', '05:40:00', '07:43:00', 'RB-600'),
(422141, 'Dennis', '2024-09-02', '07:43:00', '08:50:00', 'RB-600'),
(422142, 'Dennis', '2024-09-02', '08:50:00', '10:20:00', 'RB-600'),
(422143, 'Dennis', '2024-09-02', '10:20:00', '12:18:00', 'RB-600'),
(422144, 'Dennis', '2024-09-02', '12:18:00', '14:50:00', 'CO-2000'),
(422145, 'Charlie', '2024-09-02', '14:50:00', '16:50:00', 'CO-2000'),
(422146, 'Charlie', '2024-09-02', '16:50:00', '19:30:00', 'CO-2000'),
(422147, 'Charlie', '2024-09-02', '19:30:00', '22:55:00', 'CO-2000'),
(422148, 'Mac', '2024-09-03', '22:55:00', '01:05:00', 'CO-2000');

INSERT INTO Product_details (Size, Min_Batch_Time) VALUES
(600, 60),
(2000, 98);

INSERT INTO Products (Product, Flavor, Size_In_ml) VALUES
('OR-600', 'Orange', 600),
('LE-600', 'Lemon lime', 600),
('CO-600', 'Cola', 600),
('DC-600', 'Diet Cola', 600),
('RB-600', 'Root Berry', 600),
('CO-2000', 'Cola', 2000);


select * from Calendar
select * from Downtime_factors
select * from Line_downtime
select * from Line_productivity
select * from Product_details
select * from Products


  -- 1. Which factors are most associated with downtime?

SELECT 
    df.Description, 
    SUM(ld.Minutes) AS Total_Downtime,
    (SUM(ld.Minutes) * 100.0 / (SELECT SUM(Minutes) FROM Line_downtime)) AS Percent_Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Downtime_factors df ON ld.Factor = df.Factor
GROUP BY 
    df.Description
ORDER BY 
    Total_Downtime DESC;

	-- 2. Are some downtime factors more frequent than others?

	SELECT 
    df.Description, 
    COUNT(ld.Factor) AS Frequency,
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Downtime_factors df ON ld.Factor = df.Factor
GROUP BY 
    df.Description
ORDER BY 
    Frequency DESC;

	-- 3. Does operator error cause more downtime than other causes?

	SELECT 
    df.Operator_Error, 
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Downtime_factors df ON ld.Factor = df.Factor
GROUP BY 
    df.Operator_Error;

	-- Which operator causes more downtime and through which factors?

	SELECT 
    lp.Operator, 
    df.Description, 
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
JOIN 
    Downtime_factors df ON ld.Factor = df.Factor
GROUP BY 
    lp.Operator, df.Description
ORDER BY 
    lp.Operator, Total_Downtime DESC;

	-- 5. Does downtime occur at higher rates for products with certain flavors?

	SELECT 
    p.Flavor, 
    AVG(ld.Minutes) AS Avg_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
JOIN 
    Products p ON lp.Product = p.Product
GROUP BY 
    p.Flavor
ORDER BY 
    Avg_Downtime DESC;

	-- 6. How does product size impact the occurrence of downtime?

	SELECT 
    p.Size_In_ml, 
    AVG(ld.Minutes) AS Avg_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
JOIN 
    Products p ON lp.Product = p.Product
GROUP BY 
    p.Size_In_ml
ORDER BY 
    Avg_Downtime DESC;

	-- 7. Does product spill occur more often with products of large volume?

	SELECT 
    p.Size_In_ml, 
    SUM(ld.Minutes) AS Total_Spill_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
JOIN 
    Products p ON lp.Product = p.Product
JOIN 
    Downtime_factors df ON ld.Factor = df.Factor
WHERE 
    df.Description = 'Product spill'
GROUP BY 
    p.Size_In_ml
ORDER BY 
    Total_Spill_Downtime DESC;

	-- 8. How does downtime vary over time?

	SELECT 
    lp.Date, 
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
GROUP BY 
    lp.Date
ORDER BY 
    lp.Date;

	-- 9. How does downtime vary by day of the week?

	SELECT 
    c.Day_Name, 
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
JOIN 
    Calendar c ON lp.Date = c.Date
GROUP BY 
    c.Day_Name
ORDER BY 
    Total_Downtime DESC;

	-- 10. How does downtime vary by work shifts?

	SELECT 
    CASE 
        WHEN CAST(lp.Start_Time AS TIME) BETWEEN '00:00:00' AND '08:00:00' THEN 'Night'
        WHEN CAST(lp.Start_Time AS TIME) BETWEEN '08:00:00' AND '16:00:00' THEN 'Morning'
        ELSE 'Afternoon'
    END AS Work_Shift,
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
GROUP BY 
    CASE 
        WHEN CAST(lp.Start_Time AS TIME) BETWEEN '00:00:00' AND '08:00:00' THEN 'Night'
        WHEN CAST(lp.Start_Time AS TIME) BETWEEN '08:00:00' AND '16:00:00' THEN 'Morning'
        ELSE 'Afternoon'
    END
ORDER BY 
    Total_Downtime DESC;

	-- 11. How does downtime impact productivity?

	SELECT 
    lp.Date, 
    COUNT(lp.Batch) AS Total_Batches,
    SUM(cast (ld.Minutes as float)) AS Total_Downtime,
   cast(COUNT(lp.Batch)as float) / NULLIF(DATEDIFF(HOUR, MIN(lp.Start_Time), MAX(lp.End_Time)), 0) AS Batches_Per_Hour
FROM 
    Line_productivity lp
LEFT JOIN 
    Line_downtime ld ON lp.Batch = ld.Batch
GROUP BY 
    lp.Date
ORDER BY 
    lp.Date;

	-- 12. How would the factory have performed without downtime?

	SELECT 
    lp.Date, 
    COUNT(lp.Batch) AS Actual_Batches,
    CASE 
        WHEN SUM(DATEDIFF(MINUTE, lp.Start_Time, lp.End_Time)) = 0 THEN 0
        ELSE SUM(DATEDIFF(MINUTE, lp.Start_Time, lp.End_Time)) / NULLIF(MAX(pd.Min_Batch_Time), 0)
    END AS Estimated_Batches
FROM 
    Line_productivity lp
JOIN 
    Products p ON lp.Product = p.Product
JOIN 
    Product_details pd ON p.Size_In_ml = pd.Size
GROUP BY 
    lp.Date
ORDER BY 
    lp.Date;

	--ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ


-- Query 1 to extract downtime with Factor description :

SELECT ld.Batch, df.Description, ld.Minutes
FROM Line_downtime ld
JOIN Downtime_factors df ON ld.Factor = df.Factor;

-- Query 2 to extract Factor productivity with product details :

SELECT lp.Operator, p.Flavor, lp.Start_Time, lp.End_Time
FROM Line_productivity lp
JOIN Products p ON lp.Product = p.Product;

-- Query 3 Calculate total downtime for each Factor :

SELECT Factor, SUM(Minutes) AS Total_Downtime
FROM Line_downtime
GROUP BY Factor
ORDER BY Total_Downtime DESC;

-- Query 4 Identify the days with the highest downtime :

SELECT Date, SUM(Minutes) AS Total_Downtime
FROM Line_downtime
JOIN Line_productivity ON Line_downtime.Batch = Line_productivity.Batch
GROUP BY Date
ORDER BY Total_Downtime DESC;

-- Query 5 Calculate average production time for each product.

SELECT Product, 
    AVG(DATEDIFF(MINUTE, Start_Time, End_Time)) AS Avg_Production_Time
FROM Line_productivity
GROUP BY Product;

--
SELECT Batch, Start_Time, End_Time
FROM Line_productivity
WHERE Product = 'CO-2000';

-- To correct

SELECT 
    Product, 
    AVG(
        CASE 
            WHEN CAST(End_Time AS DATETIME) >= CAST(Start_Time AS DATETIME) THEN 
                DATEDIFF(MINUTE, CAST(Start_Time AS DATETIME), CAST(End_Time AS DATETIME))
            ELSE 
                DATEDIFF(MINUTE, CAST(Start_Time AS DATETIME), DATEADD(DAY, 1, CAST(End_Time AS DATETIME)))
        END
    ) AS Avg_Production_Time
FROM 
    Line_productivity
GROUP BY 
    Product;

-- Query 6 Total downtime per Operator :

SELECT 
    lp.Operator, 
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
GROUP BY 
    lp.Operator
ORDER BY 
    Total_Downtime DESC;

-- Query 7  Number of batches produced for each product :

SELECT 
    Product, 
    COUNT(Batch) AS Total_Batches
FROM 
    Line_productivity
GROUP BY 
    Product
ORDER BY 
    Total_Batches DESC;

-- Query 8 Top 5 Factors That Cause Downtime :

SELECT TOP 5
    df.Description, 
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Downtime_factors df ON ld.Factor = df.Factor
GROUP BY 
    df.Description
ORDER BY 
    Total_Downtime DESC;

-- Query 9  Products produced on a given day :

SELECT 
    Product, 
    COUNT(Batch) AS Total_Batches
FROM 
    Line_productivity
WHERE 
    Date = '2024-08-29'
GROUP BY 
    Product
ORDER BY 
    Total_Batches DESC;

-- Query 10  Total downtime per product :

	SELECT 
    lp.Product, 
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
GROUP BY 
    lp.Product
ORDER BY 
    Total_Downtime DESC;

-- Query 11  Products produced with associated downtime :

	SELECT 
    lp.Product, 
    lp.Batch, 
    ld.Factor, 
    df.Description, 
    ld.Minutes AS Downtime_Minutes
FROM 
    Line_productivity lp
JOIN 
    Line_downtime ld ON lp.Batch = ld.Batch
JOIN 
    Downtime_factors df ON ld.Factor = df.Factor
ORDER BY 
    lp.Product, lp.Batch;

-- Query 12  Most productive days of the week :

	SELECT 
    c.Day_Name, 
    AVG(
        CASE 
            WHEN CAST(End_Time AS DATETIME) >= CAST(Start_Time AS DATETIME) THEN 
                DATEDIFF(MINUTE, CAST(Start_Time AS DATETIME), CAST(End_Time AS DATETIME))
            ELSE 
                DATEDIFF(MINUTE, CAST(Start_Time AS DATETIME), DATEADD(DAY, 1, CAST(End_Time AS DATETIME)))
        END
    ) AS Avg_Production_Time
FROM 
    Line_productivity lp
JOIN 
    Calendar c ON lp.Date = c.Date
GROUP BY 
    c.Day_Name
ORDER BY 
    Avg_Production_Time DESC;

-- Query 13  Products produced with downtime due to worker errors :

SELECT 
    lp.Product, 
    SUM(ld.Minutes) AS Total_Operator_Error_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
JOIN 
    Downtime_factors df ON ld.Factor = df.Factor
WHERE 
    df.Operator_Error = 'Yes'
GROUP BY 
    lp.Product
ORDER BY 
    Total_Operator_Error_Downtime DESC;

-- Query 14  Products produced with minimal downtime :

SELECT 
    lp.Product, 
    SUM(ld.Minutes) AS Total_Downtime
FROM 
    Line_downtime ld
JOIN 
    Line_productivity lp ON ld.Batch = lp.Batch
GROUP BY 
    lp.Product
ORDER BY 
    Total_Downtime ASC;