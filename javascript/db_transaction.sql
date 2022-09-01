-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2022 at 05:46 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_transaction`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `price`, `created_at`, `updated_at`) VALUES
(12, 'baju', 67000, '2022-08-17 01:00:00', '2022-08-17 01:00:00'),
(13, 'celana', 86000, '2022-08-18 07:00:00', '2022-08-18 07:00:00'),
(14, 'sepatu', 128000, '2022-08-20 07:00:00', '2022-08-20 07:00:00'),
(15, 'sepeda', 1500000, '2022-08-21 07:00:00', '2022-08-21 07:00:00'),
(17, 'komputer', 8956000, '2022-08-23 07:00:00', '2022-08-23 07:00:00'),
(18, 'gelas', 96400, '2022-08-24 07:00:00', '2022-08-24 07:00:00'),
(19, 'buku', 24000, '2022-08-19 07:00:00', '2022-08-19 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `user_id`, `total_price`, `created_at`, `updated_at`) VALUES
(50, 1, 134000, '2022-08-15 07:00:00', '2022-08-15 07:00:00'),
(51, 1, 258000, '2022-08-15 07:00:00', '2022-08-15 07:00:00'),
(52, 2, 128000, '2022-08-16 07:00:00', '2022-08-16 07:00:00'),
(53, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 2, 8956000, '2022-08-16 07:00:00', '2022-08-16 07:00:00'),
(56, 1, 192800, '2022-08-24 07:00:00', '2022-08-24 07:00:00'),
(57, 2, 96000, '2022-08-19 07:00:00', '2022-08-19 07:00:00'),
(58, 1, 256000, '2022-08-24 07:00:00', '2022-08-24 07:00:00'),
(59, 2, 344000, '2022-08-19 07:00:00', '2022-08-19 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_product`
--

CREATE TABLE `transaction_product` (
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_product`
--

INSERT INTO `transaction_product` (`transaction_id`, `product_id`, `quantity`) VALUES
(2, 12, 2),
(3, 13, 3),
(4, 14, 1),
(5, 15, 0),
(6, 16, 0),
(7, 17, 1),
(8, 18, 1),
(9, 19, 4),
(10, 14, 1),
(11, 13, 3),
(12, 14, 2),
(13, 13, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'andi', 'andi123', '2022-08-27 01:00:00', '2022-08-28 01:00:00'),
(2, 'budi', 'budi_ganteng999', '2022-08-27 01:00:00', '2022-08-28 01:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user` (`user_id`);

--
-- Indexes for table `transaction_product`
--
ALTER TABLE `transaction_product`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `transaction_product`
--
ALTER TABLE `transaction_product`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `transaction_product`
--
ALTER TABLE `transaction_product`
  ADD CONSTRAINT `transaction_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
