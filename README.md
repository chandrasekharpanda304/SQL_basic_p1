# 🧠 SQL Basic Project -- Retail & Business Database Analysis

## 📋 Project Overview

This project demonstrates core **SQL skills** through the design and
manipulation of a structured relational database.\
The database models a simplified **retail business environment**,
including entities such as employees, products, customers, orders, and
transactions.

The goal of this project is to showcase SQL proficiency across **data
creation, retrieval, aggregation, update, and deletion** operations.

------------------------------------------------------------------------

## 🗂️ Database Structure

The project includes **five main tables**:

  -----------------------------------------------------------------------
  Table Name                             Description
  -------------------------------------- --------------------------------
  **employees**                          Stores details about company
                                         employees, departments,
                                         salaries, and hire dates.

  **products**                           Contains product inventory
                                         information including category,
                                         price, and stock quantity.

  **customers**                          Records customer details such as
                                         name, email, phone, and city.

  **orders**                             Tracks customer purchases with
                                         product references and order
                                         dates.

  **transaction**                        Logs financial transactions with
                                         payment methods and transaction
                                         amounts.
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 🧩 Key Features

### 1. **Data Definition (DDL)**

-   Creation of multiple interrelated tables.
-   Implementation of primary key constraints.
-   Proper data types for business-relevant fields.

### 2. **Data Manipulation (DML)**

-   **INSERT**, **UPDATE**, and **DELETE** operations across all tables.
-   Realistic sample data for employees, products, customers, and
    transactions.

### 3. **Analytical SQL Queries**

Includes queries that solve real-world business problems, such as: -
Finding employees with the highest or lowest salary. - Calculating total
stock value per product category. - Counting customers by city. -
Finding total number of orders per date. - Calculating average
transaction amount by payment method.

------------------------------------------------------------------------

## 📊 Example Queries

Here are a few examples of the queries included in the project:

### 🔹 Highest Salary Employee

``` sql
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
```

### 🔹 Total Product Stock Value by Category

``` sql
SELECT category, SUM(price * quantity_in_stock) AS total_stock_value
FROM products
GROUP BY category;
```

### 🔹 Average Transaction by Payment Method

``` sql
SELECT payment_method, ROUND(AVG(amount), 2) AS avg_amt
FROM transaction
GROUP BY payment_method;
```

------------------------------------------------------------------------

## 🚀 Skills Demonstrated

-   **Database Design & Normalization**
-   **Aggregate Functions** (SUM, AVG, COUNT, MIN, MAX)
-   **Filtering & Grouping Data**
-   **Subqueries**
-   **Joins and Relationships**
-   **Data Cleaning & Maintenance using DML**

------------------------------------------------------------------------

## 💡 Key Learnings

-   Designing scalable SQL databases for business environments.\
-   Performing insightful data analysis through aggregation and
    filtering.\
-   Understanding transaction and order flow in a retail setup.

------------------------------------------------------------------------

## 🧰 Tools & Technologies

-   **Database:** PostgreSQL / MySQL (compatible with both)
-   **Language:** SQL
-   **Editor:** Any SQL IDE (e.g., DBeaver, MySQL Workbench, VS Code SQL
    extension)

------------------------------------------------------------------------

## 📁 File Included

-   `SQL_basic_p1.sql` --- Main SQL script containing:
    -   Table creation
    -   Data insertion
    -   Business problem-solving queries
    -   Update and delete operations

------------------------------------------------------------------------

## 📜 Author

👤 Chandrasekhar Panda\
💼 MBA_Business_analytics, Passionate about Data Analytics, SQL Development, and Business
Intelligence\
📧 [chandrasekharpanda304@gmail.com]\
💼 [https://www.linkedin.com/in/chandrasekhar-panda-2220b735b/]
------------------------------------------------------------------------

## ⭐ How to Use

1.  Clone or download the repository.\
2.  Open your SQL environment (e.g., MySQL, PostgreSQL).\
3.  Execute the script `SQL_basic_p1.sql` sequentially.\
4.  Review query outputs to understand business insights.
