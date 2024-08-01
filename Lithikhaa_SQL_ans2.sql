create database salesanalysis;
use salesanalysis;

-- Table 1
create table salesData (
    City varchar(50),
    Year int,
    Month int,
    Sales int
);

-- Inserting rows into Table 1
insert into salesData (City, Year, Month, Sales) values
('Delhi', 2020, 5, 4300),
('Delhi', 2020, 6, 2000),
('Delhi', 2020, 7, 2100),
('Delhi', 2020, 8, 2200),
('Delhi', 2020, 9, 1900),
('Delhi', 2020, 10, 200),
('Mumbai', 2020, 5, 4400),
('Mumbai', 2020, 6, 2800),
('Mumbai', 2020, 7, 6000),
('Mumbai', 2020, 8, 9300),
('Mumbai', 2020, 9, 4200),
('Mumbai', 2020, 10, 9700),
('Bangalore', 2020, 5, 1000),
('Bangalore', 2020, 6, 2300),
('Bangalore', 2020, 7, 6800),
('Bangalore', 2020, 8, 7000),
('Bangalore', 2020, 9, 2300),
('Bangalore', 2020, 10, 8400);

select * from salesData;


WITH cte AS (
    SELECT City,Year,Month,Sales,
        LAG(Sales) OVER (PARTITION BY City ORDER BY Month) AS Previous_Month_Sales,
        LEAD(Sales) OVER (PARTITION BY City ORDER BY Month) AS Next_Month_Sales,
        SUM(Sales) OVER (PARTITION BY City ORDER BY Month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS YTD_Sales,
        ROW_NUMBER() OVER (PARTITION BY City ORDER BY Month) AS RowNum
    FROM salesData
)
SELECT City,Year,Month,Sales,
    CASE 
        WHEN City = 'Bangalore' AND RowNum > 1 THEN CAST(Previous_Month_Sales AS CHAR)
        ELSE ''
    END AS Previous_Month_Sales,
    CASE 
        WHEN City = 'Bangalore' AND RowNum < 6 THEN CAST(Next_Month_Sales AS CHAR)
        ELSE ''
    END AS Next_Month_Sales,
    CASE 
        WHEN City = 'Bangalore' THEN CAST(YTD_Sales AS CHAR)
        ELSE ''
    END AS YTD_Sales
FROM cte 
ORDER BY City, Month;