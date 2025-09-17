This assignment demonstrates SQL queries for analyzing a bookstore database. The schema includes information about books, customers, and their orders. The goal is to retrieve insights such as sales by author, customer spending, and remaining stock after fulfilling orders.

| Column   | Type    | Description             |
| -------- | ------- | ----------------------- |
| book\_id | INT PK  | Unique ID for each book |
| title    | VARCHAR | Title of the book       |
| author   | VARCHAR | Author of the book      |
| genre    | VARCHAR | Genre of the book       |
| price    | DECIMAL | Price of the book       |
| stock    | INT     | Available stock         |

| Column       | Type    | Description                 |
| ------------ | ------- | --------------------------- |
| customer\_id | INT PK  | Unique ID for each customer |
| name         | VARCHAR | Customer’s full name        |
| city         | VARCHAR | Customer’s city             |

| Column       | Type   | Description                   |
| ------------ | ------ | ----------------------------- |
| order\_id    | INT PK | Unique ID for each order      |
| customer\_id | INT FK | Customer who placed the order |
| order\_date  | DATE   | Date of the order             |

| Column    | Type   | Description              |
| --------- | ------ | ------------------------ |
| order\_id | INT FK | Linked to Orders         |
| book\_id  | INT FK | Linked to Books          |
| quantity  | INT    | Number of copies ordered |

#How to Run
1.Create the database and tables using the schema above.
2.Insert sample data into each table (Books, Customers, Orders, OrderDetails).
3.Run the queries in order to retrieve the results.
4.Analyze the output to answer the assignment questions.






