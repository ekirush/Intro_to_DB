CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Table structure for table `authors`

DROP TABLE IF EXISTS Authors;

CREATE TABLE Authors (
  author_id int NOT NULL PRIMARY KEY,
  author_name varchar(215) DEFAULT NULL
);

-- Table structure for table `books`
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
  book_id int NOT NULL PRIMARY KEY,
  title varchar(130) DEFAULT NULL,
  author_id int DEFAULT NULL,
  price double DEFAULT NULL,
  publication_date date DEFAULT NULL,
  FOREIGN KEY (author_id) REFERENCES authors (author_id)
);

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  customer_id int NOT NULL PRIMARY KEY,
  customer_name VARCHAR(215),
  email VARCHAR(215),
  address TEXT
);


-- Table structure for table `order_details`

DROP TABLE IF EXISTS Order_Details;

CREATE TABLE Order_Details (
  orderdetailid INT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  FOREIGN KEY (book_id) REFERENCES Books (book_id),
  FOREIGN KEY (order_id) REFERENCES Orders (order_id)
);


-- Table structure for table `orders`

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);