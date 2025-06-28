CREATE DATABASE IF NOT EXISTS alx_book_store;
USE `alx_book_store`;

-- Table structure for table `authors`

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `author_id` int NOT NULL PRIMARY KEY,
  `author_name` varchar(215) DEFAULT NULL
);

-- Table structure for table `books`
DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `book_id` int NOT NULL PRIMARY KEY,
  `title` varchar(130) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
);

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customer_id` int NOT NULL PRIMARY KEY,
  `customer_name` varchar(215) DEFAULT NULL,
  `emai` varchar(215) DEFAULT NULL,
  `address` mediumtext
);


-- Table structure for table `order_details`

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `orderdetailid` int NOT NULL PRIMARY KEY,
  `order_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
);


-- Table structure for table `orders`

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int NOT NULL PRIMARY KEY,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
);