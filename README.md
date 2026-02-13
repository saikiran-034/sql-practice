# sql-practice


# 📊 SQL Shipment Data Analysis Project

## 📌 Project Overview

This repository contains SQL queries I practiced as part of my MSc in Applied Data Science.  
The dataset includes shipment, product, sales person, and geographical information.

The objective of this project was to strengthen my SQL skills by solving realistic business-related data problems such as sales filtering, monthly revenue analysis, joins, and aggregation.

---

## 🛠 Skills Demonstrated

- Data Filtering using `WHERE`, `BETWEEN`, `IN`, `LIKE`
- Sorting using `ORDER BY`
- Multi-table joins (`INNER JOIN`)
- Aggregation functions (`SUM`, `MAX`, `COUNT`)
- Subqueries
- Date-based analysis using `EXTRACT`
- Month-on-month revenue analysis
- Top N analysis using `ORDER BY` and `LIMIT`

---

## 📈 Business Problems Solved

- Filter shipments within specific date ranges (January & February 2023)
- Identify shipments by selected sales persons
- Calculate amount per box using arithmetic operations
- Join shipment data with people and product tables
- Analyze sales for specific products (e.g., almonds, chips)
- Perform month-on-month revenue analysis
- Identify top 3 revenue-generating months in the USA
- Count total shipments for a specific month (March 2023)
- Determine maximum monthly revenue for a given sales person

---

## 📊 Sample Query Example

```sql
-- Top 3 Revenue Months in USA for Sales Person Starting with 'subba'

SELECT month, `sum of amount` AS `max amount`
FROM (
    SELECT 
        EXTRACT(MONTH FROM n.date) AS month, 
        SUM(n.Amount) AS `sum of amount`,
        SUM(n.Boxes) AS total_boxes
    FROM `shipment new` n 
    INNER JOIN people pr 
        ON n.`Sales Person` = pr.`SP ID`
    INNER JOIN geo g 
        ON n.Geo = g.GeoID
    WHERE pr.`Sales Person` LIKE 'subba%' 
      AND g.Geo = 'USA'
    GROUP BY EXTRACT(MONTH FROM n.date)
) AS monthly_data
ORDER BY `sum of amount` ASC
LIMIT 3;
