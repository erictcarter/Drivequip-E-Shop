-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 09, 2017 at 06:44 AM
-- Server version: 5.5.34-MariaDB-cll-lve
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `drivequip`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`user_id`, `user_email`, `user_pass`) VALUES
(1, 'eric@gmail.com', 'beverley'),
(2, 'tatenda@yahoo.com', 'tatenda');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int(100) NOT NULL AUTO_INCREMENT,
  `brand_title` text NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'TOYOTA SKF BEARINGS'),
(2, 'NISSAN SKF BEARINGS'),
(3, 'MAZDA SKF BEARINGS'),
(4, 'MERCEDES SKF BEARINGS'),
(5, 'VW&BMW SKF BEARINGS'),
(6, 'FORD SKF BEARINGS');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(100) NOT NULL AUTO_INCREMENT,
  `cat_title` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'CLASS 1'),
(2, 'CLASS 2'),
(3, 'CLASS 3'),
(4, 'CLASS 4'),
(5, 'CLASS 5'),
(6, 'MULTISPECS');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_ip` varchar(255) NOT NULL,
  `customer_name` text NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  'confirm_email' varchar(100) NOT NULL,
  `customer_pass` varchar(100) NOT NULL,
  'confirm_pass' varchar(100) NOT NULL,
  `customer_region` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_ip`, `customer_name`, `customer_email`, 'confirm_email', `customer_pass`,'confirm_pass', `customer_region`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`) VALUES
(6, '119.157.220.50', 'post marlon', 'postmarlon@gmail.com','postmarlon@gmail.com', 'james','james', 'Pakistan', 'Harare', '0771826422', '100 Highfield Harare', 'post_marlon.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(100) NOT NULL AUTO_INCREMENT,
  `p_id` int(100) NOT NULL,
  `c_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `status` text NOT NULL,
  `order_date` date NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `p_id`, `c_id`, `qty`, `invoice_no`, `status`, `order_date`) VALUES
(5, 8, 5, 1, 462643381, 'Completed', '0000-00-00'),
(6, 6, 5, 3, 481994459, 'Completed', '2017-09-21'),
(7, 9, 0, 1, 1545302558, 'Completed', '2017-09-23'),
(8, 5, 0, 2, 705705316, 'in Progress', '2017-09-08'),
(9, 7, 6, 1, 1935681132, 'in Progress', '2017-09-08'),
(10, 9, 6, 3, 1817786416, 'in Progress', '2017-09-08'),
(11, 5, 6, 2, 423122154, 'in Progress', '2017-09-08'),
(12, 8, 6, 4, 496641685, 'in Progress', '2017-09-08');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(100) NOT NULL AUTO_INCREMENT,
  `amount` int(100) NOT NULL,
  `customer_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `currency` text NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `amount`, `customer_id`, `product_id`, `trx_id`, `currency`, `payment_date`) VALUES
(1, 800, 5, 6, '31B07494JS505133P', 'USD', '0000-00-00'),
(2, 500, 5, 9, '18747053K31546734', 'USD', '0000-00-00'),
(3, 1000, 5, 9, '183154524M7953521', 'USD', '0000-00-00'),
(4, 900, 5, 5, '8L053110TE658224T', 'USD', '2017-09-21'),
(5, 450, 5, 8, '42M62596JN658381G', 'USD', '2017-09-21'),
(6, 600, 5, 6, '1FC71986FP579232R', 'USD', '2017-09-21'),
(7, 500, 0, 9, '0AH67056C64289013', 'USD', '2017-09-23'),
(8, 1800, 0, 5, '1F431738AY795223E', 'USD', '2017-09-08'),
(9, 250, 6, 7, '3G918931JL634141Y', 'USD', '2017-09-08'),
(10, 1500, 6, 9, '0BF7586175203573G', 'USD', '2017-09-08'),
(11, 1800, 6, 5, '7RS823437E828061K', 'USD', '2017-09-08'),
(12, 1800, 6, 8, '84J65197FN011600G', 'USD', '2017-09-08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(5, 3, 4, 'MERCEDES S2C1J', 900, '<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Mercedes.&nbsp;</p>', 'mercedes1.jpg', 'Mercedes, Class 3, Special'),
(6, 3, 6, 'FORD SKF BEARINGS ', 200, '<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Ford</p>', 'ford1.jpg', 'Ford, Class 2, special'),
(7, 2, 3, 'MAZDA SKF BEARINGS ', 250, '<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Mazda</p>', 'mazdaford.jpg', 'Ford, Class 2, Special'),
(8, 3, 1, 'TOYOTA SKF BEARINGS', 450, '<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Toyota</p>', 'toyota2.jpg', 'Toyota, Class 1, Special'),
(9, 1, 2, 'NISSAN S2C2J', 500, '<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Nissan <strong>RSA SPECS</strong>JAPANESE SPECS</p>', 'nissan1.jpg', 'Toyota, Class 1,new, special'),
(10, 1, 6, 'FORD SKF BEARINGS', 400, '<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Ford</p>', 'ford1.jpg', 'Ford, Class 1, new, special');
(11,1,1, 'TOYOTA F1C1J',399,'<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Toyota<p/>','toyota.png,','Toyota,Class 1,new,special');
(12,2,2,'NISSAN S1C2J',199,'<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Nissan<p/>','nissan.png,','Nissan,Class 2,new,special');
(13,3,3,'MAZDA S1C3J',299,'<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Mazda<p/>','nissan.png,','Mazda,Class 3,new,special');
(14,4,4,'MERCEDES S1C4J',299,'<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Mercedes<p/>','mercedes.png,','Mercedes,Class 4,new,special');
(15,5,5,'FORD S1C5J',199,'<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for FORD<p/>','ford.png,','Ford,Class 5,new,special');
(12,2,2,'VW&BW S1MSJ',199,'<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for VW&BMW<p/>','vw&bmw.png,','VW&BMW,Multispecs,new,special');
(17, 1, 1, 'TOYOTA SKF BEARINGS', 450, '<p>SKF BEARINGS assures efficient,affordable and effective maximum durable performance for Toyota</p>', 'class1t.jpg', 'Toyota, Class 1, Special'),


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
