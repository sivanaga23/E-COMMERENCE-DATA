SQL> SELECT * FROM Customers;

CUSTOMER_ID NAME                 EMAIL                     CITY                 COUNTRY
----------- -------------------- ------------------------- -------------------- --------------------
          1 Amit Sharma          amit@gmail.com            Delhi                India
          2 Neha Patel           neha@gmail.com            Mumbai               India
          3 Ravi Kumar           ravi@gmail.com            Chennai              India
          4 Priya Singh          priya@gmail.com           Bangalore            India
          5 John Doe             john@gmail.com            New York             USA

SQL> SELECT * FROM Products;

PRODUCT_ID NAME                 CATEGORY                  PRICE      STOCK
---------- -------------------- -------------------- ---------- ----------
         1 iPhone 15            Electronics               75000         10
         2 Samsung Galaxy S23   Electronics               72000          5
         3 HP Laptop            Computers                 55000          0
         4 Nike Shoes           Fashion                    6000         20
         5 Puma T-Shirt         Fashion                    1500         15

SQL> SELECT * FROM Orders;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT
---------- ----------- --------- ------------
         1           1 01-OCT-25        76500
         2           2 03-OCT-25         1500
         3           1 28-SEP-25        72000
         4           3 30-SEP-25         6000
         5           4 02-OCT-25        55000

SQL> SELECT * FROM OrderItems;

ORDER_ITEM_ID   ORDER_ID PRODUCT_ID   QUANTITY      PRICE
------------- ---------- ---------- ---------- ----------
            1          1          1          1      75000
            2          2          5          1       1500
            3          3          2          1      72000
            4          4          4          1       6000
            5          5          3          1      55000

SQL> SELECT * FROM Payments;

PAYMENT_ID   ORDER_ID PAYMENT_METHOD       PAYMENT_STATUS       PAYMENT_D
---------- ---------- -------------------- -------------------- ---------
         1          1 Credit Card          Success              01-OCT-25
         2          2 UPI                  Success              03-OCT-25
         3          3 Net Banking          Failed               28-SEP-25
         4          4 UPI                  Success              30-SEP-25
         5          5 Credit Card          Pending              02-OCT-25

SQL> --List all products that are out of stock
SQL> SELECT name, category 
  2  FROM Products 
  3  WHERE stock = 0;

NAME                 CATEGORY
-------------------- --------------------
HP Laptop            Computers

SQL> --Count total number of customers
SQL> SELECT COUNT(*) AS total_customers 
  2  FROM Customers;

TOTAL_CUSTOMERS
---------------
              5

SQL> --Find total sales amount
SQL> SELECT SUM(total_amount) AS total_sales 
  2  FROM Orders;

TOTAL_SALES
-----------
     211000


SQL> --Show all orders placed in the last 7 days
SQL> SELECT * 
  2  FROM Orders 
  3  WHERE order_date >= SYSDATE - 7;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT
---------- ----------- --------- ------------
         1           1 01-OCT-25        76500
         2           2 03-OCT-25         1500
         5           4 02-OCT-25        55000

SQL> --Find total revenue per product
SQL> SELECT p.name, SUM(oi.quantity * oi.price) AS revenue
  2  FROM OrderItems oi
  3  JOIN Products p ON oi.product_id = p.product_id
  4  GROUP BY p.name
  5  ORDER BY revenue DESC;

NAME                    REVENUE
-------------------- ----------
iPhone 15                 75000
Samsung Galaxy S23        72000
HP Laptop                 55000
Nike Shoes                 6000
Puma T-Shirt               1500

SQL> --Customers who haven’t placed any orders
SQL> SELECT c.name, c.email
  2  FROM Customers c
  3  LEFT JOIN Orders o ON c.customer_id = o.customer_id
  4  WHERE o.order_id IS NULL;

NAME                 EMAIL
-------------------- -------------------------
John Doe             john@gmail.com

SQL> --Total orders per customer
SQL> SELECT c.name, COUNT(o.order_id) AS total_orders
  2  FROM Customers c
  3  JOIN Orders o ON c.customer_id = o.customer_id
  4  GROUP BY c.name
  5  ORDER BY total_orders DESC;

NAME                 TOTAL_ORDERS
-------------------- ------------
Amit Sharma                     2
Priya Singh                     1
Ravi Kumar                      1
Neha Patel                      1

SQL> --Show average order value
SQL> SELECT AVG(total_amount) AS avg_order_value 
  2  FROM Orders;

AVG_ORDER_VALUE
---------------
          42200

SQL> --Customers who spent more than ?10,000
SQL> SELECT c.name, SUM(o.total_amount) AS total_spent
  2  FROM Customers c
  3  JOIN Orders o ON c.customer_id = o.customer_id
  4  GROUP BY c.name
  5  HAVING SUM(o.total_amount) > 10000
  6  ORDER BY total_spent DESC;

NAME                 TOTAL_SPENT
-------------------- -----------
Amit Sharma               148500
Priya Singh                55000

SQL> --Products never ordered
SQL> SELECT p.name
  2  FROM Products p
  3  LEFT JOIN OrderItems oi ON p.product_id = oi.product_id
  4  WHERE oi.order_item_id IS NULL;

no rows selected

SQL> --Payment success vs failure count
SQL> SELECT payment_status, COUNT(*) AS total_count
  2  FROM Payments
  3  GROUP BY payment_status;

PAYMENT_STATUS       TOTAL_COUNT
-------------------- -----------
Failed                         1
Pending                        1
Success                        3

SQL> --Monthly sales report
SQL> SELECT TO_CHAR(order_date, 'YYYY-MM') AS month, 
  2         SUM(total_amount) AS total_sales
  3  FROM Orders
  4  GROUP BY TO_CHAR(order_date, 'YYYY-MM')
  5  ORDER BY month;

MONTH   TOTAL_SALES
------- -----------
2025-09       78000
2025-10      133000

SQL> --Total customers per city
SQL> SELECT city, COUNT(customer_id) AS total_customers
  2  FROM Customers
  3  GROUP BY city
  4  ORDER BY total_customers DESC;

CITY                 TOTAL_CUSTOMERS
-------------------- ---------------
Delhi                              1
Mumbai                             1
Chennai                            1
Bangalore                          1
New York                           1

SQL> --Average product price per category
SQL> SELECT category, ROUND(AVG(price),2) AS avg_price
  2  FROM Products
  3  GROUP BY category;

CATEGORY              AVG_PRICE
-------------------- ----------
Electronics               73500
Fashion                    3750
Computers                 55000

SQL> --Total items sold per order
SQL> SELECT order_id, SUM(quantity) AS total_items
  2  FROM OrderItems
  3  GROUP BY order_id;

  ORDER_ID TOTAL_ITEMS
---------- -----------
         1           1
         2           1
         4           1
         5           1
         3           1

SQL> 
