-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2022 at 05:54 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ordermanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`) VALUES
(1, 'lloyd', 'moloantoalloyd@gmail.com', 'hi'),
(3, 'moll', 'moll@gmail.com', 'great website');

-- --------------------------------------------------------

--
-- Table structure for table `orderman`
--

CREATE TABLE `orderman` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderman`
--

INSERT INTO `orderman` (`id`, `name`, `category`, `price`, `description`, `picture`) VALUES
(1, 'phone', 'tech', '1000', 'Shop the latest Samsung products online, incl. galaxy smartphones, wearables & accessories. Enjoy free* delivery, right to your doorstop with various safe & secure payment options. Free* Delivery. Hassel Free Returns* Secure Payment Options.', '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');

-- --------------------------------------------------------

--
-- Table structure for table `orderuser`
--

CREATE TABLE `orderuser` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderuser`
--

INSERT INTO `orderuser` (`id`, `name`, `surname`, `email`, `role`, `password`) VALUES
(2, 'Lloyd', 'Moloantoa', 'moloantoalloyd@gmail.com', 'user', '0737200640');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderman`
--
ALTER TABLE `orderman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderuser`
--
ALTER TABLE `orderuser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderman`
--
ALTER TABLE `orderman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orderuser`
--
ALTER TABLE `orderuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
