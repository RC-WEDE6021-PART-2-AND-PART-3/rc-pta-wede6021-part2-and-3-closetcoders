-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2026 at 05:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothingstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

CREATE TABLE `tblcart` (
  `cart_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `added_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcart`
--

INSERT INTO `tblcart` (`cart_id`, `buyer_id`, `product_id`, `added_on`) VALUES
(9, 6, 9, '2026-06-17 23:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `tblmessages`
--

CREATE TABLE `tblmessages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date_sent` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblmessages`
--

INSERT INTO `tblmessages` (`message_id`, `sender_id`, `receiver_id`, `subject`, `message`, `date_sent`) VALUES
(1, 1, 8, 'Your order has been updated', 'Dear Tshepiso, your order has been updated and is ready to be shipped', '2026-06-18 00:34:07'),
(2, 1, 9, 'Your order has been updated', 'Dear Olwethu, your order has been shipped', '2026-06-18 00:39:43'),
(3, 1, 10, 'Your order has been updated', 'Dear Olwethu, your order has been shipped', '2026-06-18 00:40:53'),
(4, 13, 10, 'Order Status Updated', 'Your order for \'Low dunk nike\' is now marked as Completed. Tracking number: PTM00007', '2026-06-18 01:20:06'),
(5, 1, 11, 'fdd', 'dbgf', '2026-06-18 01:21:08');

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `order_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT 0.00,
  `status` enum('paid','shipped','completed') DEFAULT 'paid',
  `delivery_method` varchar(50) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `date_ordered` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorders`
--

INSERT INTO `tblorders` (`order_id`, `buyer_id`, `seller_id`, `product_id`, `amount`, `total`, `status`, `delivery_method`, `delivery_address`, `payment_method`, `tracking_number`, `date_ordered`) VALUES
(1, 3, NULL, 1, 350.00, 0.00, 'paid', NULL, NULL, NULL, NULL, '2026-05-05 18:42:31'),
(2, 6, NULL, 3, 220.00, 0.00, 'paid', NULL, NULL, NULL, NULL, '2026-06-17 19:11:57'),
(3, 8, 2, 7, 899.99, 999.99, 'shipped', 'Courier', '116 Johannes ramokhoase street', 'Visa', 'PTM00003', '2026-06-18 00:25:05'),
(4, 10, 2, 8, 699.99, 799.99, 'paid', 'Courier', '116 Johannes ramokhoase street', 'American Express', 'PTM00004', '2026-06-18 00:38:43'),
(5, 10, 2, 4, 270.00, 370.00, 'paid', 'Courier', '116 Johannes ramokhoase street', 'American Express', 'PTM00005', '2026-06-18 00:38:43'),
(6, 10, 2, 1, 350.00, 450.00, 'paid', 'Courier', '116 johannes rampkhoase street', 'Visa', 'PTM00006', '2026-06-18 01:18:03'),
(7, 10, 13, 19, 70.00, 170.00, 'completed', 'Courier', '116 johannes rampkhoase street', 'Visa', 'PTM00007', '2026-06-18 01:18:03'),
(8, 10, 2, 17, 299.99, 399.99, 'paid', 'Courier', '116 johannes rampkhoase street', 'Visa', 'PTM00008', '2026-06-18 01:18:03');

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `condition_type` enum('Like New','Good','Fair') DEFAULT 'Good',
  `status` enum('active','sold') DEFAULT 'active',
  `date_listed` datetime DEFAULT current_timestamp(),
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`product_id`, `seller_id`, `title`, `brand`, `description`, `price`, `category`, `size`, `condition_type`, `status`, `date_listed`, `image_url`) VALUES
(1, 2, 'Vintage Denim Jacket', '', 'Classic 90s denim jacket in excellent condition.', 350.00, 'Jackets', 'M', 'Like New', 'sold', '2026-05-05 18:25:59', ''),
(2, 2, 'Floral Summer Dress', NULL, 'Light and breezy floral dress perfect for summer.', 180.00, 'Dresses', 'S', 'Good', 'active', '2026-05-05 18:25:59', 'images/floral_dress.jpeg'),
(3, 2, 'Black Skinny Jeans', NULL, 'Slim fit black jeans, barely worn.', 220.00, 'Pants', 'L', 'Like New', 'sold', '2026-05-05 18:25:59', ''),
(4, 2, 'White Oversized Hoodie', NULL, 'Cozy oversized hoodie in white.', 270.00, 'Hoodies', 'XL', 'Good', 'sold', '2026-05-05 18:25:59', 'images/white_hoodie.jpeg'),
(5, 2, 'Leather Ankle Boots', NULL, 'Brown leather ankle boots, light wear.', 450.00, 'Shoes', '7', 'Good', 'active', '2026-05-05 18:25:59', 'images/ankle_boots.jpeg'),
(6, 2, 'Striped Crop Top', NULL, 'Cute striped crop top for casual wear.', 120.00, 'Tops', 'XS', 'Fair', 'active', '2026-05-05 18:25:59', 'images/stripped_crop_top.jpeg'),
(7, 2, 'Ruby Red Evening Dress', NULL, 'Luxury red sequin evening dress perfect for parties, matric dances and special events.', 899.99, 'Dresses', 'M', 'Like New', 'sold', '2026-06-17 22:59:19', 'images/red_evening_dress.jpeg'),
(8, 2, 'Pink Gucci Marmont Bag', NULL, 'Stylish designer-inspired shoulder bag with gold chain details.', 699.99, 'Bags', 'One Size', 'Good', 'sold', '2026-06-17 22:59:19', 'images/pink_gucci_bag.jpeg'),
(9, 2, 'Crystal Black Heels', NULL, 'Elegant black heels with crystal embellishments for formal occasions.', 499.99, 'Shoes', '7', 'Like New', 'active', '2026-06-17 22:59:19', 'images/crystal_black_heels.jpeg'),
(10, 2, 'Pink Ribbon Crop Top', NULL, 'Cute pink crop top with ribbon shoulder straps.', 199.99, 'Tops', 'S', '', 'active', '2026-06-17 22:59:19', 'images/pink_crop_top.jpeg'),
(11, 2, 'Ivory Bridal Gown', NULL, 'Beautiful satin bridal gown with elegant detailing.', 2499.99, 'Dresses', 'M', 'Like New', 'active', '2026-06-17 22:59:19', 'images/bridal_gown.jpeg'),
(12, 2, 'Classic Gucci Shoulder Bag', NULL, 'Fashionable shoulder bag suitable for daily use.', 749.99, 'Bags', 'One Size', 'Good', 'active', '2026-06-17 22:59:19', 'images/classic_gucci_bag.jpeg'),
(13, 2, 'Grey Formal Suit', NULL, 'Premium grey formal suit suitable for weddings and business events.', 1499.99, 'Suits', 'L', 'Like New', 'active', '2026-06-17 22:59:19', 'images/grey_formal_suit.jpeg'),
(14, 2, 'Brown Casual Jacket', NULL, 'Trendy oversized casual jacket perfect for everyday wear.', 599.99, 'Jackets', 'XL', 'Good', 'active', '2026-06-17 22:59:19', 'images/brown_jacket.jpeg'),
(15, 2, 'Cream Nike Tracksuit', NULL, 'Comfortable cream tracksuit with matching sneakers.', 799.99, 'Sportswear', 'L', 'Good', 'active', '2026-06-17 22:59:19', 'images/cream_tracksuit.jpeg'),
(16, 2, 'Olive Green Nike Set', NULL, 'Complete sporty outfit including shorts, shirt and accessories.', 699.99, 'Sportswear', 'M', 'Good', 'active', '2026-06-17 22:59:19', 'images/olive_nike_set.jpeg'),
(17, 2, 'Floral Pink Two Piece Set', NULL, 'Beautiful floral two-piece outfit for summer outings.', 299.99, 'Sets', 'S', 'Like New', 'sold', '2026-06-17 22:59:19', 'images/floral_two_piece.jpeg'),
(18, 11, 'Jacket', 'Nike', 'Black jacket', 70.00, 'Jackets', 'XS', 'Like New', 'active', '2026-06-18 00:48:11', 'uploads/1781736491_WhatsApp Image 2026-06-18 at 00.46.57.jpeg'),
(19, 13, 'Low dunk nike', 'Nike', 'Green low dunks', 70.00, 'Shoes', 'S', 'Like New', 'sold', '2026-06-18 01:17:06', 'uploads/1781738226_WhatsApp Image 2026-06-18 at 01.13.55.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tblreviews`
--

CREATE TABLE `tblreviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `date_reviewed` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('buyer','seller','admin') DEFAULT 'buyer',
  `status` enum('pending','approved') DEFAULT 'approved',
  `join_date` datetime DEFAULT current_timestamp(),
  `wallet_balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`user_id`, `name`, `email`, `password`, `role`, `status`, `join_date`, `wallet_balance`) VALUES
(1, 'Admin', 'admin@pastimes.co.za', '$2y$10$Mg3NR2IsMYJV0H3bokCGWu0ZYO2D5Ncirak8UpEly4ue7z8LgGkNG', 'admin', 'approved', '2026-05-05 18:25:59', 0.00),
(2, 'Sample Seller', 'seller@pastimes.co.za', '$2y$10$mA3fDCVWLcgTx8KgoOKJ8.3/crrtlKyEyneyXQgt77C2Q4w9PduoO', 'seller', 'approved', '2026-05-05 18:25:59', 0.00),
(3, 'Sample Buyer', 'buyer@pastimes.co.za', '$2y$10$u83caZaUE3b1AmaGDk3yNOAXZWABypQxJJ0PeCfelQkqdXqwojVHS', 'buyer', 'approved', '2026-05-05 18:25:59', 0.00),
(5, 'Tsepiso', 'TsepisoM@gmail.com', '$2y$10$buq1BUG3FUma4SoUo.ieZ.LlD46kkOY5RG4KYCtKUlPZuP5Lrm6kO', 'seller', 'approved', '2026-05-05 18:48:06', 0.00),
(6, 'Kagiso', 'KagisoM@gmail.com', '$2y$10$tOHkdizDgm3oJDEH38d/x.S5DpEt1BQyVpqz5alcowP1cVR7kIsd2', 'buyer', 'approved', '2026-05-05 18:54:04', 0.00),
(7, 'Alive', 'AliveM@gmail.com', '$2y$10$6xnUPbZTu9WTsgvjTo3uEOdhLoQ73PuCkwil64XderrhRk5MUjMmy', 'seller', 'approved', '2026-05-05 18:57:17', 0.00),
(8, 'Tshepiso Mailule', 'TshepisoM@gmail.com', '$2y$10$1vZ3HmFF8npEC23oUVGmKOOqzktcukRvmVkaKtKYxzOQVz/bk2Ezy', 'buyer', 'approved', '2026-06-18 00:23:22', 0.00),
(9, 'Olwethu Wendy', 'OlwethuW@gmail.com', '$2y$10$dg9CnRHwNRaG0rYYHPNHEeniBHiemQlW.UF9xNnN6x150uGnxSx.C', 'buyer', 'approved', '2026-06-18 00:35:47', 0.00),
(10, 'Olwethu Wendy', 'OlwethuN@gmail.com', '$2y$10$syC3akzmGmC9YaaieDNwlelfEbm4eY0W07hasce40.jx3cXufOcX2', 'buyer', 'approved', '2026-06-18 00:37:16', 0.00),
(11, 'Alex', 'AlexN@gmail.com', '$2y$10$s8D6McugwaVcNMDld9NhUu5zHesiNgy3XlqbO2bqwi5gEnSI/80v.', 'seller', 'approved', '2026-06-18 00:44:24', 0.00),
(12, 'Sinazo', 'Sinazo@gmail.com', '$2y$10$p/MAuP2g/kbTxzB8dHu7vOMv8fLjflvXkYTYyzRPnNyJRDjuufG9O', 'seller', 'pending', '2026-06-18 01:13:11', 0.00),
(13, 'Kat', 'Kat@gmail.com', '$2y$10$XXJXK60Cjea5YI7IiuaNB.Po6Kf9Im13P5oY1yjp.PKGHD4CqNmce', 'seller', 'approved', '2026-06-18 01:15:43', 0.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tblmessages`
--
ALTER TABLE `tblmessages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `tblreviews`
--
ALTER TABLE `tblreviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblmessages`
--
ALTER TABLE `tblmessages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblreviews`
--
ALTER TABLE `tblreviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD CONSTRAINT `tblcart_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `tbluser` (`user_id`),
  ADD CONSTRAINT `tblcart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tblproducts` (`product_id`);

--
-- Constraints for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD CONSTRAINT `tblorders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `tbluser` (`user_id`),
  ADD CONSTRAINT `tblorders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tblproducts` (`product_id`);

--
-- Constraints for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD CONSTRAINT `tblproducts_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `tbluser` (`user_id`);

--
-- Constraints for table `tblreviews`
--
ALTER TABLE `tblreviews`
  ADD CONSTRAINT `tblreviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tblproducts` (`product_id`),
  ADD CONSTRAINT `tblreviews_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `tbluser` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
