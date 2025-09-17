#Assingment  SQL

CREATE DATABASE  onlinebookstore_db;

use onlinebookstore_db;

 select * from books;
 
 #1.Retrieve all books in the “Fiction” genre
SELECT * FROM Books WHERE genre = 'Fiction';

#2.Find books published after the year 1950
SELECT * FROM Books WHERE Published_year > 1950;

#3.List all customers from Canada
SELECT * FROM Customers Where Country = 'Canada';

#4.Show orders placed in November 2023
SELECT * FROM Orders WHERE order_date BETWEEN '1-11-2025' AND '30-11-2025';

#5.Retrieve the total stock of books available
SELECT sum(stock) FROM books;

#6.Find the details of the most expensive book
SELECT * FROM Books ORDER BY price DESC  Limit 1;

#7.Show all customers who ordered more than 1 quantity of a book
SELECT DISTINCT customer_id,customer_name FROM Orders Where quantity >1;

#8.List all distinct genres in the bookstore
SELECT DISTINCT genre FROM Books;

#9.Find the book with the lowest stock available
SELECT * FROM Books ORDER BY Price ASC limit 1;

#10.Calculate the total revenue from all orders
SELECT SUM(od.quantity * b.price) AS total_revenue
FROM OrderDetails od
JOIN Books b ON od.book_id = b.book_id;

#11.Retrieve the total number of books sold for each genre
SELECT b.genre, SUM(o.quantity)
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.genre;

#12.Find the average price of books in the “Fantasy” genre
SELECT AVG(price) AS avg_price_fantasy
FROM Books
WHERE genre = 'Fantasy';

#13.List customers who have placed at least 2 orders
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 2;

#14.Find the most frequently ordered book
SELECT b.book_id, b.title, SUM(o.quantity) AS total_ordered
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY total_ordered DESC
LIMIT 1;

#15.Show the top 3 most expensive books of the “Fantasy” genre
SELECT book_id, title, price
FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

#16.Retrieve the total quantity of books sold by each author
SELECT b.author, 
       SUM(od.quantity) AS total_books_sold
FROM OrderDetails od
JOIN Books b ON od.book_id = b.book_id
GROUP BY b.author
ORDER BY total_books_sold DESC;

#17.List the cities of customers who spent over $30
SELECT c.city, 
       SUM(od.quantity * b.price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Books b ON od.book_id = b.book_id
GROUP BY c.city
HAVING SUM(od.quantity * b.price) > 30;

#18.Find the customer who spent the most on orders
SELECT c.customer_id, c.name, 
       SUM(od.quantity * b.price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Books b ON od.book_id = b.book_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 1;

#19.Calculate the stock remaining after fulfilling all orders
SELECT b.book_id, b.title, 
       b.stock - IFNULL(SUM(od.quantity), 0) AS remaining_stock
FROM Books b
LEFT JOIN OrderDetails od ON b.book_id = od.book_id
GROUP BY b.book_id, b.title, b.stock
ORDER BY remaining_stock ASC;
