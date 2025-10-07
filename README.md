
---

# 🛒 Amazon E-Commerce SQL Database Project (Oracle SQL)

## 📘 Overview

This project simulates a **mini Amazon-like e-commerce database system** built entirely using **Oracle SQL**.
It demonstrates how to manage, query, and analyze relational data for customers, products, orders, and payments — all using real-world business logic.

---

## 🧱 Database Structure

### 📂 Tables Created

1. **Customers** – Stores customer information
2. **Products** – Stores product details
3. **Orders** – Stores order transactions
4. **OrderItems** – Stores items within each order
5. **Payments** – Stores payment records for orders

---

## 🗂️ Table Schema

| Table          | Columns                                                            | Description                          |
| -------------- | ------------------------------------------------------------------ | ------------------------------------ |
| **Customers**  | customer_id, name, email, city, country                            | Customer personal details            |
| **Products**   | product_id, name, category, price, stock                           | Product catalog with inventory       |
| **Orders**     | order_id, customer_id, order_date, total_amount                    | Order information linked to customer |
| **OrderItems** | order_item_id, order_id, product_id, quantity, price               | Items inside each order              |
| **Payments**   | payment_id, order_id, payment_method, payment_status, payment_date | Payment records for orders           |

---

## 📦 Sample Data

* 5 Customers
* 5 Products
* 5 Orders
* 5 OrderItems
* 5 Payments

> Total Records: **25 rows** across 5 tables

The data represents a mini Amazon-style dataset with real-world categories such as Electronics, Fashion, and Computers.

---

## 🧮 Important SQL Queries

Below are the **20 key queries** implemented in this project:

| #  | Query Purpose                         |
| -- | ------------------------------------- |
| 1  | Display all customer details          |
| 2  | List out-of-stock products            |
| 3  | Count total customers                 |
| 4  | Find total sales                      |
| 5  | Top 3 most expensive products         |
| 6  | Orders in the last 7 days             |
| 7  | Total revenue per product             |
| 8  | Customers with no orders              |
| 9  | Total orders per customer             |
| 10 | Average order value                   |
| 11 | Top 3 best-selling products           |
| 12 | Most popular product category         |
| 13 | Customers who spent more than ₹10,000 |
| 14 | Products never ordered                |
| 15 | Payment success vs failure count      |
| 16 | Monthly sales report                  |
| 17 | Customers per city                    |
| 18 | Average product price per category    |
| 19 | Total items per order                 |
| 20 | Top 5 customers by total spend        |

---

## ⚙️ How to Run (Oracle SQL)

1. Open **Oracle SQL Developer** or **SQL*Plus**
2. Create a new connection (with your Oracle DB user)
3. Copy and run the SQL file in this order:

   * Table Creation
   * Data Insertion
   * Queries
4. Commit your changes:

   ```sql
   COMMIT;
   ```
5. Run each query individually to view results.

---

## 💡 Learning Outcomes

✅ Understanding of **database design & normalization**
✅ Mastery of **joins, grouping, and aggregate functions**
✅ Real-world **query writing for e-commerce systems**
✅ Exposure to **Oracle SQL syntax** (DATE, FETCH, TO_DATE, etc.)

---

## 🧠 Future Enhancements

* Add user reviews and product ratings
* Include delivery tracking table
* Implement stored procedures and triggers
* Create a Power BI or Tableau dashboard using this data

---

## 👨‍💻 Author

**Project by:** Siva
**Database:** Oracle SQL
**Type:** Academic / Portfolio Project
**Topic:** E-Commerce Data Management

---

