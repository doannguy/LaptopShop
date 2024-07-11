-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 11, 2024 at 05:26 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptop_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `status`, `name`) VALUES
(1, 1, 'Màn hình'),
(2, 1, 'Màu sắc'),
(3, 1, 'CPU'),
(4, 1, 'Dung lượng RAM'),
(5, 1, 'Chuẩn phân giải'),
(6, 1, 'Dung lượng bộ nhớ'),
(7, 1, 'Hệ điều hành'),
(8, 1, 'Card Đồ Họa');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`) VALUES
(1, 1, 'Dưới 13 inch'),
(2, 1, '13 inch'),
(3, 1, '14 inch'),
(4, 1, '15 inch'),
(5, 1, '16 inch'),
(6, 2, 'Bạc'),
(7, 2, 'Bạc đen'),
(8, 2, 'Gold'),
(9, 2, 'Trắng'),
(10, 2, 'Vàng Đồng'),
(11, 2, 'Xanh'),
(12, 2, 'Xám bạc'),
(13, 2, 'Đen'),
(15, 3, 'i7-12700H'),
(19, 4, '8GB'),
(20, 4, '16GB'),
(21, 4, '32GB'),
(22, 4, '64GB'),
(23, 4, '128GB'),
(24, 5, 'Full HD'),
(25, 5, '2K'),
(26, 5, '2.2K'),
(27, 5, '3K'),
(28, 5, '4K'),
(29, 5, 'Retina'),
(30, 5, 'Khác'),
(31, 6, '128GB'),
(32, 6, '256GB'),
(33, 6, '512GB'),
(34, 6, '1TB'),
(35, 6, '2TB'),
(36, 7, 'Window 10'),
(37, 7, 'Window 11'),
(38, 7, 'MacOS'),
(39, 3, 'i5-12500H'),
(40, 8, 'RTX 3050 4GB GDDR6'),
(41, 8, 'RTX 3050Ti 4GB GDDR6'),
(42, 3, 'AMD Ryzen 5'),
(43, 3, 'AMD Ryzen 7'),
(45, 3, 'I7-13650HX'),
(46, 8, 'RTX 4050 6GB GDDR6'),
(47, 8, 'RTX4060 8GB GDDR6'),
(48, 3, 'I5-12450HX'),
(49, 4, '12GB'),
(50, 3, 'R5-6600H'),
(51, 3, 'R5-7535HS'),
(53, 4, '18GB'),
(54, 3, 'I5-1235U'),
(55, 3, 'I3-1305U'),
(56, 3, 'I3-1215U'),
(57, 3, 'I5-1335U'),
(58, 3, 'I5-13500H'),
(59, 3, 'I7-1360P'),
(60, 3, 'I7-13700H'),
(61, 3, 'I9-13900H'),
(62, 3, 'R5-7530U'),
(63, 8, 'RTX 2050 4GB GDDR6'),
(64, 8, 'GTX 1650 4GB GDDR6'),
(65, 8, 'RX 6550M 4GB'),
(66, 8, 'RTX 4090 16GB GDDR6'),
(67, 8, 'RTX 4070 8GB GDDR6'),
(68, 8, 'ARC A530M 4GB GDDR6'),
(69, 8, 'RTX 3070Ti 8GB GDDR6'),
(70, 8, 'RTX 3050Ti 4GB GDDR6'),
(71, 3, 'I9-14900HX'),
(72, 3, 'I7-13700HX'),
(73, 3, 'R9-7940HS'),
(74, 3, 'R5-5500U'),
(75, 3, 'I5-13420H'),
(76, 3, 'I5-12450H'),
(77, 3, 'R7-5700U'),
(78, 3, 'I5-1135G7'),
(79, 3, 'I3-1215U'),
(80, 2, 'Đỏ'),
(81, 2, 'Trắng'),
(82, 2, 'Hồng'),
(83, 2, 'Xám'),
(84, 4, '3GB'),
(85, 4, '4GB'),
(86, 4, '6GB'),
(87, 6, '64GB');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Acer', '2024-06-20 02:30:14', '2024-06-20 02:30:14'),
(2, 'Apple', '2024-06-20 02:30:19', '2024-06-20 02:30:19'),
(3, 'Asus', '2024-06-20 02:30:23', '2024-06-20 02:30:23'),
(4, 'Dell', '2024-06-20 02:30:28', '2024-06-20 02:30:28'),
(5, 'Gigabyte', '2024-06-20 02:30:33', '2024-06-20 02:30:33'),
(6, 'HP', '2024-06-20 02:30:38', '2024-06-20 02:30:38'),
(7, 'LG', '2024-06-20 02:30:41', '2024-06-20 02:30:41'),
(8, 'Lenevo', '2024-06-20 02:30:46', '2024-06-20 02:30:46'),
(9, 'MSI', '2024-06-20 02:30:51', '2024-06-20 02:30:51'),
(10, 'Xiaomi', '2024-06-29 07:40:32', '2024-06-29 07:40:32'),
(11, 'Razer', '2024-06-30 07:17:48', '2024-06-30 07:17:48'),
(12, 'Akko', '2024-06-30 07:35:00', '2024-06-30 07:35:00'),
(13, 'E-Dra', '2024-06-30 07:39:25', '2024-06-30 07:39:25'),
(14, 'Warrior', '2024-06-30 07:43:00', '2024-06-30 07:43:00'),
(15, 'Dare-U', '2024-07-01 07:40:05', '2024-07-01 07:40:05'),
(16, 'Sandisk', '2024-07-08 09:18:36', '2024-07-08 09:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_option_id` bigint UNSIGNED NOT NULL,
  `quantity` smallint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_option_id`, `quantity`, `created_at`, `updated_at`) VALUES
(2, 5, 20, 1, '2024-06-23 01:28:06', '2024-06-23 01:28:06'),
(11, 7, 27, 1, '2024-07-01 19:06:17', '2024-07-01 19:06:17'),
(12, 7, 28, 1, '2024-07-05 01:22:06', '2024-07-05 01:22:06');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', '2024-06-20 02:14:58', '2024-06-20 02:14:58'),
(2, 'Sản phẩm Apple', '2024-06-20 02:15:07', '2024-06-20 02:15:07'),
(3, 'PC - Máy Tính Bàn', '2024-06-20 02:15:19', '2024-06-20 02:15:19'),
(4, 'Màn Hình Máy Tính', '2024-06-20 02:15:32', '2024-06-20 02:15:32'),
(5, 'Linh Kiện Máy Tính', '2024-06-20 02:15:46', '2024-06-20 02:15:46'),
(6, 'Phụ Kiện Máy Tính', '2024-06-20 02:15:55', '2024-06-20 02:15:55'),
(7, 'Phụ kiện Gaming', '2024-06-20 02:16:10', '2024-06-22 01:25:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `type`, `path`, `mime_type`, `created_at`, `updated_at`) VALUES
(6, 'thumbnail', 'product/thumbnail/6676df7df421d.png', 'image/png', '2024-06-22 07:28:14', '2024-06-22 07:28:14'),
(7, 'product_option', 'product/product_option/6676df7e00b3e.png', 'image/png', '2024-06-22 07:28:14', '2024-06-22 07:28:14'),
(8, 'product_option', 'product/product_option/6676df7e0134b.png', 'image/png', '2024-06-22 07:28:14', '2024-06-22 07:28:14'),
(9, 'thumbnail', 'product/thumbnail/6676ebeaa758b.png', 'image/png', '2024-06-22 08:21:14', '2024-06-22 08:21:14'),
(10, 'product_option', 'product/product_option/6676ebeaa820c.png', 'image/png', '2024-06-22 08:21:14', '2024-06-22 08:21:14'),
(11, 'product_option', 'product/product_option/6676ebeaa8b04.png', 'image/png', '2024-06-22 08:21:14', '2024-06-22 08:21:14'),
(12, 'product_option', 'product/product_option/6676ed83c652b.png', 'image/png', '2024-06-22 08:28:03', '2024-06-22 08:28:03'),
(13, 'thumbnail', 'product/thumbnail/6676fd9e6dbdc.png', 'image/png', '2024-06-22 09:36:46', '2024-06-22 09:36:46'),
(14, 'product_option', 'product/product_option/6676fd9e6e940.png', 'image/png', '2024-06-22 09:36:46', '2024-06-22 09:36:46'),
(15, 'product_option', 'product/product_option/6676fe86768b3.png', 'image/png', '2024-06-22 09:40:38', '2024-06-22 09:40:38'),
(16, 'thumbnail', 'product/thumbnail/6677ce452a133.png', 'image/png', '2024-06-23 00:27:01', '2024-06-23 00:27:01'),
(18, 'product_option', 'product/product_option/6677cf264cf68.png', 'image/png', '2024-06-23 00:30:46', '2024-06-23 00:30:46'),
(19, 'thumbnail', 'product/thumbnail/6677d0f674081.png', 'image/png', '2024-06-23 00:38:30', '2024-06-23 00:38:30'),
(20, 'product_option', 'product/product_option/6677d0f675f26.png', 'image/png', '2024-06-23 00:38:30', '2024-06-23 00:38:30'),
(21, 'thumbnail', 'product/thumbnail/6677d6c50909d.png', 'image/png', '2024-06-23 01:03:17', '2024-06-23 01:03:17'),
(22, 'product_option', 'product/product_option/6677d6c509cb2.png', 'image/png', '2024-06-23 01:03:17', '2024-06-23 01:03:17'),
(23, 'product_option', 'product/product_option/6677d6c50a85c.png', 'image/png', '2024-06-23 01:03:17', '2024-06-23 01:03:17'),
(24, 'thumbnail', 'product/thumbnail/6677d8387e1b0.png', 'image/png', '2024-06-23 01:09:28', '2024-06-23 01:09:28'),
(25, 'product_option', 'product/product_option/6677d8387eecb.png', 'image/png', '2024-06-23 01:09:28', '2024-06-23 01:09:28'),
(26, 'thumbnail', 'product/thumbnail/6677d99b84bee.png', 'image/png', '2024-06-23 01:15:23', '2024-06-23 01:15:23'),
(27, 'product_option', 'product/product_option/6677d99b858c2.png', 'image/png', '2024-06-23 01:15:23', '2024-06-23 01:15:23'),
(28, 'thumbnail', 'product/thumbnail/6677dbdea7244.png', 'image/png', '2024-06-23 01:25:02', '2024-06-23 01:25:02'),
(29, 'product_option', 'product/product_option/6677dbdea7f3b.png', 'image/png', '2024-06-23 01:25:02', '2024-06-23 01:25:02'),
(30, 'thumbnail', 'product/thumbnail/667f9363f1fc7.png', 'image/png', '2024-06-28 21:53:56', '2024-06-28 21:53:56'),
(32, 'product_option', 'product/product_option/667f951d7c6e3.png', 'image/png', '2024-06-28 22:01:17', '2024-06-28 22:01:17'),
(33, 'product_option', 'product/product_option/667f951d7ce5d.png', 'image/png', '2024-06-28 22:01:17', '2024-06-28 22:01:17'),
(34, 'product_option', 'product/product_option/667f951d7d2ce.png', 'image/png', '2024-06-28 22:01:17', '2024-06-28 22:01:17'),
(35, 'product_option', 'product/product_option/667f951d7d840.png', 'image/png', '2024-06-28 22:01:17', '2024-06-28 22:01:17'),
(36, 'thumbnail', 'product/thumbnail/667f9a5390b32.png', 'image/png', '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(37, 'product_option', 'product/product_option/667f9a5392a72.png', 'image/png', '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(38, 'product_option', 'product/product_option/667f9a5393260.png', 'image/png', '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(39, 'product_option', 'product/product_option/667f9a539381d.png', 'image/png', '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(40, 'product_option', 'product/product_option/667f9a5393f14.png', 'image/png', '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(41, 'product_option', 'product/product_option/667f9a539469e.png', 'image/png', '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(42, 'product_option', 'product/product_option/667f9a5394d2e.png', 'image/png', '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(43, 'product_option', 'product/product_option/667f9a53953a1.png', 'image/png', '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(52, 'thumbnail', 'product/thumbnail/6680148cc0b03.png', 'image/png', '2024-06-29 07:05:00', '2024-06-29 07:05:00'),
(53, 'product_option', 'product/product_option/6680148cc1aa6.png', 'image/png', '2024-06-29 07:05:00', '2024-06-29 07:05:00'),
(54, 'product_option', 'product/product_option/6680148cc204d.png', 'image/png', '2024-06-29 07:05:00', '2024-06-29 07:05:00'),
(55, 'product_option', 'product/product_option/6680148cc26bc.png', 'image/png', '2024-06-29 07:05:00', '2024-06-29 07:05:00'),
(56, 'product_option', 'product/product_option/6680148cc2f51.png', 'image/png', '2024-06-29 07:05:00', '2024-06-29 07:05:00'),
(57, 'product_option', 'product/product_option/6680148cc3a59.png', 'image/png', '2024-06-29 07:05:00', '2024-06-29 07:05:00'),
(58, 'thumbnail', 'product/thumbnail/668015e547f98.png', 'image/png', '2024-06-29 07:10:45', '2024-06-29 07:10:45'),
(59, 'product_option', 'product/product_option/668015e548ee0.png', 'image/png', '2024-06-29 07:10:45', '2024-06-29 07:10:45'),
(60, 'product_option', 'product/product_option/668015e54947b.png', 'image/png', '2024-06-29 07:10:45', '2024-06-29 07:10:45'),
(61, 'product_option', 'product/product_option/668015e5498fe.png', 'image/png', '2024-06-29 07:10:45', '2024-06-29 07:10:45'),
(62, 'product_option', 'product/product_option/668015e549edd.png', 'image/png', '2024-06-29 07:10:45', '2024-06-29 07:10:45'),
(63, 'product_option', 'product/product_option/668015e54a652.png', 'image/png', '2024-06-29 07:10:45', '2024-06-29 07:10:45'),
(64, 'thumbnail', 'product/thumbnail/668017f1dda44.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(65, 'product_option', 'product/product_option/668017f1dea38.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(66, 'product_option', 'product/product_option/668017f1def01.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(67, 'product_option', 'product/product_option/668017f1df34d.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(68, 'product_option', 'product/product_option/668017f1df7a4.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(69, 'product_option', 'product/product_option/668017f1dfcfd.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(70, 'product_option', 'product/product_option/668017f1e129f.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(71, 'product_option', 'product/product_option/668017f1e196e.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(72, 'product_option', 'product/product_option/668017f1e2000.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(73, 'product_option', 'product/product_option/668017f1e25b0.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(74, 'product_option', 'product/product_option/668017f1e2b1d.png', 'image/png', '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(75, 'product_option', 'product/product_option/668019617d926.png', 'image/png', '2024-06-29 07:25:37', '2024-06-29 07:25:37'),
(76, 'product_option', 'product/product_option/668019617e119.png', 'image/png', '2024-06-29 07:25:37', '2024-06-29 07:25:37'),
(77, 'product_option', 'product/product_option/668019617e57c.png', 'image/png', '2024-06-29 07:25:37', '2024-06-29 07:25:37'),
(78, 'product_option', 'product/product_option/668019617ea99.png', 'image/png', '2024-06-29 07:25:37', '2024-06-29 07:25:37'),
(79, 'product_option', 'product/product_option/668019617ef82.png', 'image/png', '2024-06-29 07:25:37', '2024-06-29 07:25:37'),
(80, 'thumbnail', 'product/thumbnail/66801ce73d3fa.png', 'image/png', '2024-06-29 07:40:39', '2024-06-29 07:40:39'),
(81, 'product_option', 'product/product_option/66801dbc23df1.png', 'image/png', '2024-06-29 07:44:12', '2024-06-29 07:44:12'),
(82, 'product_option', 'product/product_option/66801dbc245d0.png', 'image/png', '2024-06-29 07:44:12', '2024-06-29 07:44:12'),
(83, 'product_option', 'product/product_option/66801dbc24a15.png', 'image/png', '2024-06-29 07:44:12', '2024-06-29 07:44:12'),
(84, 'product_option', 'product/product_option/66801dbc24e3b.png', 'image/png', '2024-06-29 07:44:12', '2024-06-29 07:44:12'),
(85, 'product_option', 'product/product_option/66801dbc252eb.png', 'image/png', '2024-06-29 07:44:12', '2024-06-29 07:44:12'),
(86, 'product_option', 'product/product_option/66801dbc2575e.png', 'image/png', '2024-06-29 07:44:12', '2024-06-29 07:44:12'),
(87, 'product_option', 'product/product_option/66801dbc25cab.png', 'image/png', '2024-06-29 07:44:12', '2024-06-29 07:44:12'),
(88, 'product_option', 'product/product_option/66801dbc261b7.png', 'image/png', '2024-06-29 07:44:12', '2024-06-29 07:44:12'),
(89, 'thumbnail', 'product/thumbnail/668169945ddc3.png', 'image/png', '2024-06-30 07:20:04', '2024-06-30 07:20:04'),
(92, 'product_option', 'product/product_option/668169e70724a.png', 'image/png', '2024-06-30 07:21:27', '2024-06-30 07:21:27'),
(93, 'product_option', 'product/product_option/668169e707972.png', 'image/png', '2024-06-30 07:21:27', '2024-06-30 07:21:27'),
(94, 'thumbnail', 'product/thumbnail/66816b69ae022.png', 'image/png', '2024-06-30 07:27:53', '2024-06-30 07:27:53'),
(95, 'product_option', 'product/product_option/66816b69af874.png', 'image/png', '2024-06-30 07:27:53', '2024-06-30 07:27:53'),
(96, 'product_option', 'product/product_option/66816b69afd5c.png', 'image/png', '2024-06-30 07:27:53', '2024-06-30 07:27:53'),
(97, 'product_option', 'product/product_option/66816b69b01f0.png', 'image/png', '2024-06-30 07:27:53', '2024-06-30 07:27:53'),
(98, 'product_option', 'product/product_option/66816b69b0d6a.png', 'image/png', '2024-06-30 07:27:53', '2024-06-30 07:27:53'),
(99, 'product_option', 'product/product_option/66816b69b1228.png', 'image/png', '2024-06-30 07:27:53', '2024-06-30 07:27:53'),
(100, 'product_option', 'product/product_option/66816b69b1690.png', 'image/png', '2024-06-30 07:27:53', '2024-06-30 07:27:53'),
(101, 'thumbnail', 'product/thumbnail/66816cdc36ffc.png', 'image/png', '2024-06-30 07:34:04', '2024-06-30 07:34:04'),
(102, 'product_option', 'product/product_option/66816cdc3811c.png', 'image/png', '2024-06-30 07:34:04', '2024-06-30 07:34:04'),
(103, 'product_option', 'product/product_option/66816cdc38602.png', 'image/png', '2024-06-30 07:34:04', '2024-06-30 07:34:04'),
(104, 'product_option', 'product/product_option/66816cdc38aa2.png', 'image/png', '2024-06-30 07:34:04', '2024-06-30 07:34:04'),
(105, 'product_option', 'product/product_option/66816cdc38f76.png', 'image/png', '2024-06-30 07:34:04', '2024-06-30 07:34:04'),
(106, 'product_option', 'product/product_option/66816cdc394f5.png', 'image/png', '2024-06-30 07:34:04', '2024-06-30 07:34:04'),
(107, 'thumbnail', 'product/thumbnail/66816dbeec277.png', 'image/png', '2024-06-30 07:37:50', '2024-06-30 07:37:50'),
(108, 'product_option', 'product/product_option/66816dbeed7fc.png', 'image/png', '2024-06-30 07:37:50', '2024-06-30 07:37:50'),
(109, 'product_option', 'product/product_option/66816dbeedd17.png', 'image/png', '2024-06-30 07:37:50', '2024-06-30 07:37:50'),
(110, 'product_option', 'product/product_option/66816dbeee144.png', 'image/png', '2024-06-30 07:37:50', '2024-06-30 07:37:50'),
(111, 'product_option', 'product/product_option/66816dbeee61f.png', 'image/png', '2024-06-30 07:37:50', '2024-06-30 07:37:50'),
(112, 'product_option', 'product/product_option/66816dbeeeac4.png', 'image/png', '2024-06-30 07:37:50', '2024-06-30 07:37:50'),
(113, 'thumbnail', 'product/thumbnail/66816ea6766f4.png', 'image/png', '2024-06-30 07:41:42', '2024-06-30 07:41:42'),
(114, 'product_option', 'product/product_option/66816ea677aad.png', 'image/png', '2024-06-30 07:41:42', '2024-06-30 07:41:42'),
(115, 'product_option', 'product/product_option/66816ea6784d9.png', 'image/png', '2024-06-30 07:41:42', '2024-06-30 07:41:42'),
(116, 'product_option', 'product/product_option/66816ea678afe.png', 'image/png', '2024-06-30 07:41:42', '2024-06-30 07:41:42'),
(117, 'thumbnail', 'product/thumbnail/66816fc31bedb.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(118, 'product_option', 'product/product_option/66816fc31d46f.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(119, 'product_option', 'product/product_option/66816fc31d97e.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(120, 'product_option', 'product/product_option/66816fc31df16.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(121, 'product_option', 'product/product_option/66816fc31e3e4.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(122, 'product_option', 'product/product_option/66816fc31e88e.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(123, 'product_option', 'product/product_option/66816fc31ed8a.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(124, 'product_option', 'product/product_option/66816fc31f35d.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(125, 'product_option', 'product/product_option/66816fc31fc0d.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(126, 'product_option', 'product/product_option/66816fc32048c.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(127, 'product_option', 'product/product_option/66816fc320ab5.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(128, 'product_option', 'product/product_option/66816fc321136.png', 'image/png', '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(129, 'thumbnail', 'product/thumbnail/668170f488edf.png', 'image/png', '2024-06-30 07:51:32', '2024-06-30 07:51:32'),
(130, 'product_option', 'product/product_option/668170f48a10b.png', 'image/png', '2024-06-30 07:51:32', '2024-06-30 07:51:32'),
(131, 'product_option', 'product/product_option/668170f48a715.png', 'image/png', '2024-06-30 07:51:32', '2024-06-30 07:51:32'),
(132, 'product_option', 'product/product_option/668170f48ac02.png', 'image/png', '2024-06-30 07:51:32', '2024-06-30 07:51:32'),
(133, 'product_option', 'product/product_option/668170f48b9df.png', 'image/png', '2024-06-30 07:51:32', '2024-06-30 07:51:32'),
(134, 'product_option', 'product/product_option/668170f48c179.png', 'image/png', '2024-06-30 07:51:32', '2024-06-30 07:51:32'),
(135, 'product_option', 'product/product_option/668170f48c668.png', 'image/png', '2024-06-30 07:51:32', '2024-06-30 07:51:32'),
(136, 'thumbnail', 'product/thumbnail/6682ab79a0364.png', 'image/png', '2024-07-01 06:13:29', '2024-07-01 06:13:29'),
(137, 'product_option', 'product/product_option/6682ab79afa77.png', 'image/png', '2024-07-01 06:13:29', '2024-07-01 06:13:29'),
(138, 'product_option', 'product/product_option/6682ab79b00ad.png', 'image/png', '2024-07-01 06:13:29', '2024-07-01 06:13:29'),
(139, 'product_option', 'product/product_option/6682ab79b066d.png', 'image/png', '2024-07-01 06:13:29', '2024-07-01 06:13:29'),
(140, 'product_option', 'product/product_option/6682ab79b0c7a.png', 'image/png', '2024-07-01 06:13:29', '2024-07-01 06:13:29'),
(141, 'product_option', 'product/product_option/6682ab79b13a0.png', 'image/png', '2024-07-01 06:13:29', '2024-07-01 06:13:29'),
(142, 'product_option', 'product/product_option/6682ab79b1ac5.png', 'image/png', '2024-07-01 06:13:29', '2024-07-01 06:13:29'),
(143, 'product_option', 'product/product_option/6682ab79b20e3.png', 'image/png', '2024-07-01 06:13:29', '2024-07-01 06:13:29'),
(144, 'thumbnail', 'product/thumbnail/6682ac8e4eeeb.png', 'image/png', '2024-07-01 06:18:06', '2024-07-01 06:18:06'),
(145, 'product_option', 'product/product_option/6682ac8e50a10.png', 'image/png', '2024-07-01 06:18:06', '2024-07-01 06:18:06'),
(146, 'product_option', 'product/product_option/6682ac8e51257.png', 'image/png', '2024-07-01 06:18:06', '2024-07-01 06:18:06'),
(147, 'product_option', 'product/product_option/6682ac8e519ad.png', 'image/png', '2024-07-01 06:18:06', '2024-07-01 06:18:06'),
(148, 'product_option', 'product/product_option/6682ac8e51f3a.png', 'image/png', '2024-07-01 06:18:06', '2024-07-01 06:18:06'),
(149, 'thumbnail', 'product/thumbnail/6682ad800a04b.png', 'image/png', '2024-07-01 06:22:08', '2024-07-01 06:22:08'),
(150, 'product_option', 'product/product_option/6682ad800b41d.png', 'image/png', '2024-07-01 06:22:08', '2024-07-01 06:22:08'),
(151, 'product_option', 'product/product_option/6682ad800bb8e.png', 'image/png', '2024-07-01 06:22:08', '2024-07-01 06:22:08'),
(152, 'product_option', 'product/product_option/6682ad800c396.png', 'image/png', '2024-07-01 06:22:08', '2024-07-01 06:22:08'),
(153, 'product_option', 'product/product_option/6682ad800cae2.png', 'image/png', '2024-07-01 06:22:08', '2024-07-01 06:22:08'),
(154, 'product_option', 'product/product_option/6682ad800d238.png', 'image/png', '2024-07-01 06:22:08', '2024-07-01 06:22:08'),
(155, 'thumbnail', 'product/thumbnail/6682ae8825588.png', 'image/png', '2024-07-01 06:26:32', '2024-07-01 06:26:32'),
(156, 'product_option', 'product/product_option/6682ae88268d5.png', 'image/png', '2024-07-01 06:26:32', '2024-07-01 06:26:32'),
(157, 'product_option', 'product/product_option/6682ae88270c4.png', 'image/png', '2024-07-01 06:26:32', '2024-07-01 06:26:32'),
(158, 'product_option', 'product/product_option/6682ae8827934.png', 'image/png', '2024-07-01 06:26:32', '2024-07-01 06:26:32'),
(159, 'thumbnail', 'product/thumbnail/6682b5e3c37ec.png', 'image/png', '2024-07-01 06:57:55', '2024-07-01 06:57:55'),
(160, 'product_option', 'product/product_option/6682b5e3c7c6b.png', 'image/png', '2024-07-01 06:57:55', '2024-07-01 06:57:55'),
(161, 'product_option', 'product/product_option/6682b5e3c8365.png', 'image/png', '2024-07-01 06:57:55', '2024-07-01 06:57:55'),
(162, 'product_option', 'product/product_option/6682b5e3c8847.png', 'image/png', '2024-07-01 06:57:55', '2024-07-01 06:57:55'),
(163, 'product_option', 'product/product_option/6682b5e3c8db9.png', 'image/png', '2024-07-01 06:57:55', '2024-07-01 06:57:55'),
(164, 'thumbnail', 'product/thumbnail/6682b67d2d8e6.png', 'image/png', '2024-07-01 07:00:29', '2024-07-01 07:00:29'),
(165, 'product_option', 'product/product_option/6682b67d2ef50.png', 'image/png', '2024-07-01 07:00:29', '2024-07-01 07:00:29'),
(166, 'product_option', 'product/product_option/6682b67d2f5f8.png', 'image/png', '2024-07-01 07:00:29', '2024-07-01 07:00:29'),
(167, 'product_option', 'product/product_option/6682b67d2fc07.png', 'image/png', '2024-07-01 07:00:29', '2024-07-01 07:00:29'),
(168, 'thumbnail', 'product/thumbnail/6682b786d0ac4.png', 'image/png', '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(169, 'product_option', 'product/product_option/6682b786d2b7d.png', 'image/png', '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(170, 'product_option', 'product/product_option/6682b786d3476.png', 'image/png', '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(171, 'product_option', 'product/product_option/6682b786d4108.png', 'image/png', '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(172, 'product_option', 'product/product_option/6682b786d48ea.png', 'image/png', '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(173, 'product_option', 'product/product_option/6682b786d4e8b.png', 'image/png', '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(174, 'product_option', 'product/product_option/6682b786d549d.png', 'image/png', '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(175, 'product_option', 'product/product_option/6682b786d5aea.png', 'image/png', '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(176, 'thumbnail', 'product/thumbnail/6682bd5c56044.png', 'image/png', '2024-07-01 07:29:48', '2024-07-01 07:29:48'),
(177, 'product_option', 'product/product_option/6682bd5c5720b.png', 'image/png', '2024-07-01 07:29:48', '2024-07-01 07:29:48'),
(178, 'thumbnail', 'product/thumbnail/6682be96a9367.png', 'image/png', '2024-07-01 07:35:02', '2024-07-01 07:35:02'),
(179, 'product_option', 'product/product_option/6682be96aa885.png', 'image/png', '2024-07-01 07:35:02', '2024-07-01 07:35:02'),
(180, 'product_option', 'product/product_option/6682be96ab148.png', 'image/png', '2024-07-01 07:35:02', '2024-07-01 07:35:02'),
(181, 'product_option', 'product/product_option/6682be96ab7bc.png', 'image/png', '2024-07-01 07:35:02', '2024-07-01 07:35:02'),
(182, 'thumbnail', 'product/thumbnail/6682bff0dd460.png', 'image/png', '2024-07-01 07:40:48', '2024-07-01 07:40:48'),
(183, 'product_option', 'product/product_option/6682bff0de6c2.png', 'image/png', '2024-07-01 07:40:48', '2024-07-01 07:40:48'),
(184, 'product_option', 'product/product_option/6682bff0dece8.png', 'image/png', '2024-07-01 07:40:48', '2024-07-01 07:40:48'),
(185, 'product_option', 'product/product_option/6682bff0df2b8.png', 'image/png', '2024-07-01 07:40:48', '2024-07-01 07:40:48'),
(186, 'product_option', 'product/product_option/6682bff0df992.png', 'image/png', '2024-07-01 07:40:48', '2024-07-01 07:40:48'),
(187, 'product_option', 'product/product_option/6682c06455b4e.png', 'image/png', '2024-07-01 07:42:44', '2024-07-01 07:42:44'),
(188, 'product_option', 'product/product_option/6682c064565c6.png', 'image/png', '2024-07-01 07:42:44', '2024-07-01 07:42:44'),
(189, 'product_option', 'product/product_option/6682c06456bd4.png', 'image/png', '2024-07-01 07:42:44', '2024-07-01 07:42:44'),
(190, 'product_option', 'product/product_option/6682c06457295.png', 'image/png', '2024-07-01 07:42:44', '2024-07-01 07:42:44'),
(192, 'product_option', 'product/product_option/6682c131c2ef0.png', 'image/png', '2024-07-01 07:46:09', '2024-07-01 07:46:09'),
(193, 'product_option', 'product/product_option/6682c131c37c7.png', 'image/png', '2024-07-01 07:46:09', '2024-07-01 07:46:09'),
(194, 'product_option', 'product/product_option/6682c131c3d6d.png', 'image/png', '2024-07-01 07:46:09', '2024-07-01 07:46:09'),
(195, 'product_option', 'product/product_option/6682c131c4426.png', 'image/png', '2024-07-01 07:46:09', '2024-07-01 07:46:09'),
(197, 'product_option', 'product/product_option/6682c6dc83c54.png', 'image/png', '2024-07-01 08:10:20', '2024-07-01 08:10:20'),
(198, 'product_option', 'product/product_option/6682c6dc8468c.png', 'image/png', '2024-07-01 08:10:20', '2024-07-01 08:10:20'),
(199, 'product_option', 'product/product_option/6682c71d03fc6.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(200, 'product_option', 'product/product_option/6682c71d0486b.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(201, 'product_option', 'product/product_option/6682c71d05292.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(202, 'product_option', 'product/product_option/6682c71d05937.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(203, 'product_option', 'product/product_option/6682c71d060f7.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(204, 'product_option', 'product/product_option/6682c71d067f9.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(205, 'product_option', 'product/product_option/6682c71d07127.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(206, 'product_option', 'product/product_option/6682c71d077f2.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(207, 'product_option', 'product/product_option/6682c71d07eea.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(208, 'product_option', 'product/product_option/6682c71d08548.png', 'image/png', '2024-07-01 08:11:25', '2024-07-01 08:11:25'),
(209, 'thumbnail', 'product/thumbnail/6682c72253ebc.png', 'image/png', '2024-07-01 08:11:30', '2024-07-01 08:11:30'),
(210, 'thumbnail', 'product/thumbnail/668c11ea24732.png', 'image/png', '2024-07-08 09:20:58', '2024-07-08 09:20:58'),
(211, 'product_option', 'product/product_option/668c11ea2fcdd.png', 'image/png', '2024-07-08 09:20:58', '2024-07-08 09:20:58'),
(212, 'product_option', 'product/product_option/668c11ea33157.png', 'image/png', '2024-07-08 09:20:58', '2024-07-08 09:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_06_03_174254_create_categories_table', 1),
(7, '2024_06_03_174408_create_brands_table', 1),
(8, '2024_06_03_174516_create_products_table', 1),
(9, '2024_06_03_174741_create_product_series_table', 1),
(10, '2024_06_03_174839_create_product_options_table', 1),
(11, '2024_06_03_174937_create_media_table', 1),
(12, '2024_06_03_175021_create_product_media_table', 1),
(13, '2024_06_03_175145_create_attributes_table', 1),
(14, '2024_06_03_175320_create_attribute_values_table', 1),
(15, '2024_06_03_175511_create_product_attribute_values_table', 1),
(16, '2024_06_03_175550_create_carts_table', 1),
(17, '2024_06_03_175641_create_orders_table', 1),
(18, '2024_06_03_175748_create_order_details_table', 1),
(19, '2024_06_03_175844_create_reviews_table', 1),
(20, '2024_06_03_180211_create_permission_tables', 1),
(21, '2024_07_05_100402_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `total_price` bigint UNSIGNED NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_type` smallint UNSIGNED NOT NULL,
  `shipping_fee` bigint UNSIGNED NOT NULL,
  `payment_method` smallint UNSIGNED NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `code`, `user_id`, `total_price`, `note`, `user_name`, `phone`, `address`, `shipping_type`, `shipping_fee`, `payment_method`, `status`, `message`, `created_at`, `updated_at`) VALUES
(1, 'DH-U4T1719159054U', 4, 28990000, 'Nhẹ tay', 'User_2 Nguyễn', '0987654123', 'Viet Nam', 0, 0, 1, 0, NULL, '2024-06-23 09:10:54', '2024-06-23 09:10:54'),
(2, 'DH-U6T1719159982U', 6, 219934990, 'hàng giá trị cao', 'User2 User2', '0971231414', 'Viet Nam', 1, 35000, 1, 0, NULL, '2024-06-23 09:26:22', '2024-06-23 09:26:22'),
(3, 'DH-U6T1719322917Y', 6, 28990000, 'Hàng điện tử', 'User2 User2', '0983636789', 'Viet Nam', 0, 0, 1, 2, NULL, '2024-06-25 06:41:57', '2024-06-25 06:42:23'),
(4, 'DH-U6T1719327083J', 6, 12789996, '', 'User2 User2', '0983636113', 'Viet Nam', 0, 0, 0, 0, NULL, '2024-06-25 07:51:23', '2024-06-25 07:51:23'),
(5, 'DH-U6T1719672408P', 6, 2400000, 'Màn hình máy tính, vui lòng nhẹ tay', 'User2 User2', '0983636416', 'Viet Nam', 0, 0, 1, 0, NULL, '2024-06-29 07:46:48', '2024-06-29 07:47:23'),
(6, 'DH-LT8T1720454561Y', 8, 630000, NULL, 'Đoàn Nguyễn', '0392874307', '11, đường 22', 0, 0, 0, 2, NULL, '2024-07-08 09:02:41', '2024-07-08 09:08:20'),
(7, 'DH-LT8T1720454942A', 8, 665000, NULL, 'Đoàn Nguyễn', '0392874307', '11, đường 22', 1, 35000, 0, 2, NULL, '2024-07-08 09:09:02', '2024-07-08 09:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_option_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_option_id`, `quantity`, `price`) VALUES
(1, 1, 20, 1, 28990000),
(2, 2, 19, 10, 21989999),
(3, 3, 20, 1, 28990000),
(4, 4, 18, 1, 12789996),
(5, 5, 31, 1, 2400000),
(6, 6, 53, 1, 630000),
(7, 7, 53, 1, 630000);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 2, 'authToken', '1c026f04d6b59f8715f1b2588733a1be709f34fddb310d02fa33811f1e9119b9', '[\"*\"]', '2024-06-21 01:00:37', NULL, '2024-06-21 01:00:32', '2024-06-21 01:00:37'),
(3, 'App\\Models\\User', 4, 'authToken', '1f76b0588a329fa44c1d228d7533b65da00b40a0e5374c1aba3d550ef84a65ab', '[\"*\"]', '2024-06-23 09:20:21', NULL, '2024-06-22 09:47:52', '2024-06-23 09:20:21'),
(4, 'App\\Models\\User', 5, 'authToken', 'd2e3f6418f1034ccb71a7ef842589e7e7f3d945cb4709b0700338726896b5fc9', '[\"*\"]', '2024-06-23 04:21:56', NULL, '2024-06-23 01:28:01', '2024-06-23 04:21:56'),
(5, 'App\\Models\\User', 6, 'authToken', '192bf8553b538052596bade638b6674d3211410894f7f8642ee5ed027e4cbc51', '[\"*\"]', '2024-06-29 07:46:48', NULL, '2024-06-23 09:23:22', '2024-06-29 07:46:48'),
(13, 'App\\Models\\User', 7, 'authToken', '24c493e7cd2c24aea0ed0a806edda703fe551efd54a266616de28ffcec716f09', '[\"*\"]', '2024-07-08 09:00:39', NULL, '2024-07-01 06:03:07', '2024-07-08 09:00:39'),
(14, 'App\\Models\\User', 8, 'authToken', '3fd2399dc82e55d57a9fe16abe2d1850a2829c776a4356679a9b38fae1a76b1c', '[\"*\"]', '2024-07-11 10:16:00', NULL, '2024-07-08 09:02:10', '2024-07-11 10:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `thumbnail` bigint UNSIGNED NOT NULL,
  `product_seri_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `brand_id`, `thumbnail`, `product_seri_id`, `created_at`, `updated_at`) VALUES
(3, 'Macbook pro 14\" 2021', 'macbook-pro-14-20211', 'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).\r\nMacBook Pro 14-inch, củ sạc 67W USB-C, cáp sạc USB-C to MagSafe 3 Cable (2 m)\r\n1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất.', '<h2><strong>Macbook Pro 14 inch 2021 1TB - Nhanh chóng, xử lý tác vụ chuyên nghiệp&nbsp;</strong></h2><p>MacBook Pro 14 inch 2021 1TB đưa ra một trải nghiệm mới cho người dùng với sự xuất hiện lần đầu tiên trong dòng sản phẩm này. Với kích thước nhỏ gọn và bộ vi xử lý Apple M1 Pro, máy trở thành một siêu phẩm dành cho công việc chuyên nghiệp.</p><h3><strong>Chip M1 Pro cải tiến, ổ SSD tốc độ siêu nhanh</strong></h3><p>MacBook Pro 14 inch 2021 với con chip Apple M1 Pro tiên tiến hứa hẹn mang đến hiệu năng vô song. Chip này được cải tiến với 10 lõi, trong đó có 2 lõi hiệu năng và 8 lõi hiệu suất, đồng thời tích hợp chip đồ họa riêng biệt để cung cấp hiệu năng mạnh mẽ cho mọi tác vụ. Sự kết hợp này giúp máy vận hành mượt mà và ổn định, đáp ứng mọi yêu cầu công việc chuyên nghiệp.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro/M1_Pro/macbook-pro-14-inch-2021-1tb-1.jpg\" alt=\"Cấu hình Macbook Pro 14 inch 2021 1TB\" width=\"810\" height=\"456\"></p><p>Ổ SSD trên MacBook Pro 2021 còn có tốc độ đọc lên tới 7,4GB/s, gấp đôi so với thế hệ trước. Dung lượng này mang lại trải nghiệm nhanh chóng khi mở các tệp tin nặng, xem video 8K, hay xử lý hàng nghìn ảnh mà không cần chờ đợi.</p><h3><strong>Ngôn ngữ thiết kế siêu mỏng, nhiều cổng kết nối&nbsp;</strong></h3><p>MacBook Pro 14 inch 2021 được trang bị màn hình 14.2 inch hoàn toàn mới. Màn hình này vừa mang đến trải nghiệm xem nội dung chuyên nghiệp, vừa giữ được sự nhỏ gọn với viền siêu mỏng, tạo nên một thiết kế thanh lịch và hiện đại.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro/M1_Pro/macbook-pro-14-inch-2021-1tb-2.jpg\" alt=\"Thiết kế Macbook Pro 14 inch 2021 1TB\" width=\"810\" height=\"456\"></p><p>MacBook Pro 14 inch cũng tích hợp nhiều kết nối hữu ích như cổng SDXC, HDMI, tai nghe 3.5mm, cổng sạc nhanh MagSafe và đặc biệt là cổng Thunderbolt 4 tiên tiến. Từ đó đáp ứng mọi nhu cầu kết nối trong công việc hàng ngày.</p><h2><strong>Mua Macbook Pro 14 inch 2021 1TB chính hãng, giá tốt tại CellphoneS</strong></h2><p>Mua ngay MacBook Pro 14 inch 2021 1TB chính hãng, giá tốt tại CellphoneS để trải nghiệm công nghệ tiên tiến cùng những ưu đãi đặc biệt. Đầu tiên là bảo hành tận trung tâm bảo hành ủy quyền chính hãng Apple - Cares.vn. Đây là địa chỉ đáng tin cậy để đảm bảo sự an tâm về chất lượng và dịch vụ.</p><p>Ngoài ra, CellphoneS còn cung cấp dịch vụ mua trả góp, giúp bạn sở hữu sản phẩm một cách dễ dàng. Trước khi quyết định mua, đừng quên tham gia chương trình demo trải nghiệm sản phẩm để có cái nhìn rõ ràng về MacBook Pro 14 inch 2021.</p>', 2, 6, 6, '2024-06-22 07:28:14', '2024-06-22 07:29:16'),
(4, 'Laptop Lenovo LOQ 15IAX9 83GS001RVN', 'laptop-lenovo-loq-15iax9-83gs001rvn', 'Laptop Lenovo LOQ 15IAX9 83GS001RVN được trang bị bộ xử lý Intel Core i5-12450HX với 8 lõi, 12 luồng cùng RAM DDR5-4800 cho khả năng đa nhiệm ấn tượng.', '<h2><strong>Laptop Lenovo LOQ 15IAX9 83GS001RVN: hiệu năng mạnh mẽ, màn hình hiển thị sắc nét</strong></h2><p>Nếu bạn đang tìm kiếm mẫu laptop gaming được trang bị CPU tối thiểu Core i5 với thiết kế đẹp mắt thì đừng bỏ qua LOQ 15IAX9 83GS001RVN. Sản phẩm đến từ thương hiệu Lenovo tích hợp nhiều công nghệ tân tiến hứa hẹn sẽ mang lại cho bạn trải nghiệm chiến game mượt mà và sống động.&nbsp;</p><h3><strong>CPU Intel Core i5 chiến game cực đã</strong></h3><p>Laptop Lenovo LOQ 15IAX9 83GS001RVN sở hữu CPU Core i5-12450HX thuộc thế hệ thứ 12 của Intel, được sản xuất trên tiến trình tân tiến. Chipset này bao gồm 8 nhân 12 luồng, trong đó có 4 nhân hiệu quả cao E-Core và 4 nhân hiệu năng cao P-Core. Nhờ vậy, bạn có thể chạy đa nhiệm mượt mà và cải thiện hiệu suất công việc đáng kể chỉ với một thiết bị.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Lenovo/LOQ/laptop-lenovo-loq-15iax9-83gs001rvn-4.png\" alt=\"Laptop Lenovo LOQ 15IAX9 83GS001RVN: hiệu năng mạnh mẽ, màn hình hiển thị sắc nét\" width=\"810\" height=\"456\"></p><p>Card đồ hoạ RTX 3050 với dung lượng 6GB thoả mãn nhu cầu chơi game trên laptop, từ các tựa game thịnh hành cho tới những phần mềm thiết kế đồ hoạ yêu cầu cấu hình cao. So với card 1650 thì sức mạnh của RTX 3050 đã được nâng cấp tới 30%. Không những vậy, mẫu card này mang lại cho Lenovo LOQ 15IAX9 83GS001RVN nhiều công nghệ hiện đại như DLSS, Ray Tracing,... để trải nghiệm game thêm phần chân thực.</p><h3><strong>SSD 512GB chuẩn kết nối PCIe tốc độ cao&nbsp;</strong></h3><p>Dòng laptop <a href=\"https://cellphones.com.vn/laptop/lenovo/loq.html\"><strong>Lenovo LOQ</strong></a> này được trang bị ổ cứng SSD PCIe giúp tăng tốc độ khởi động các ứng dụng và tối ưu thời gian truy xuất dữ liệu. Với dung lượng 512GB, thiết bị cho phép bạn giải trí và tải xuống nhiều tệp tin với độ phân giải cao mà không cần bổ sung ổ đĩa phụ. Nhờ vậy, việc lưu trữ các tựa game và tài liệu sẽ trở nên nhanh chóng và thuận tiện hơn. Bạn cũng có thể mở rộng bộ nhớ lên đến 1TB khi có nhu cầu.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Lenovo/LOQ/laptop-lenovo-loq-15iax9-83gs001rvn-5.png\" alt=\"Laptop Lenovo LOQ 15IAX9 83GS001RVN: hiệu năng mạnh mẽ, màn hình hiển thị sắc nét\" width=\"810\" height=\"456\"></p><p>RAM DDR5-4800 12GB cung cấp tốc độ xung bus cực cao lên tới 4800MT/giây cùng khả năng tăng băng thông lên tới 36%. Nhờ đó, Lenovo LOQ 15IAX9 83GS001RVN được cải thiện thông lượng dữ liệu tuần tự, đồng thời, tối ưu hoá các bộ xử lý cũng như nền tảng thế hệ mới. Không những vậy, bộ RAM này còn hỗ trợ giảm năng lượng tiêu thụ, đồng thời kéo dài tuổi thọ pin máy.&nbsp;</p><h3><strong>Thiết kế gaming mang đậm phong cách Legion series</strong></h3><p>LOQ 15IAX9 83GS001RVN gây ấn tượng nhờ kiểu dáng tương đồng dòng Legion với hốc tản nhiệt rộng và độ dày mặt sau máy. Bản lề màn hình của chiếc laptop gaming này được thiết kế trang nhã, tạo điểm nhấn thu hút cho sản phẩm. So với người anh em Legion, LOQ 15IAX9 83GS001RVN có phần nhẹ hơn với trọng lượng khoảng 2.38 kg.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Lenovo/LOQ/laptop-lenovo-loq-15iax9-83gs001rvn-2.png\" alt=\"Laptop Lenovo LOQ 15IAX9 83GS001RVN: hiệu năng mạnh mẽ, màn hình hiển thị sắc nét\" width=\"810\" height=\"456\"></p><p>Bên cạnh đó, sản phẩm vẫn sử dụng bàn phím White Backlit, giúp người dùng có thể làm việc và nhìn rõ phím ngay ở nơi có ít ánh sáng. Touchpad Buttonless Mylar surface multi-touch kích thước 75*120 mm mang đế trải nghiệm sử dụng chuột tự nhạy với vùng chạm rộng rãi.&nbsp;</p><h3><strong>Màn hình sáng 300nits, tần số quét 144Hz mượt mà</strong></h3><p>Lenovo LOQ 15IAX9 83GS001RVN ghi điểm với màn hình sử dụng tấm nền IPS 15.6 inch cùng độ phân giải FHD sắc nét. Độ sáng tối đa lên tới 300nits Anti-glare có hỗ trợ G-SYNC kết hợp với tần số quét 144Hz hứa hẹn sẽ mang tới trải nghiệm chiến game chân thực và mượt mà ở mọi môi trường. Màn hình máy được đánh giá là ổn định khi thử nghiệm trên các tựa game eSport cũng như game AAA với tốc độ làm tươi ấn tượng, hạn chế độ trễ tốt.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Lenovo/LOQ/laptop-lenovo-loq-15iax9-83gs001rvn-3.png\" alt=\"Laptop Lenovo LOQ 15IAX9 83GS001RVN: hiệu năng mạnh mẽ, màn hình hiển thị sắc nét\" width=\"810\" height=\"456\"></p><h3><strong>Khả năng kết nối ấn tượng với đa dạng cổng giao tiếp</strong></h3><p>LOQ 15IAX9 83GS001RVN cung cấp hầu như đầy đủ các cổng kết nối thông dụng hiện nay như: USB 3.2 Gen 1, HDMI, Ethernet (RJ-45), Power connector, tai nghe, USB-C 3.2 gen 2. Do đó, người dùng có thể dễ dàng chia sẻ tài liệu hay kết nối với các thiết bị ngoại vi nhanh chóng mà không cần đầu tư thêm các cổng chuyển đổi ngoài.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Lenovo/LOQ/laptop-lenovo-loq-15iax9-83gs001rvn-1.png\" alt=\"Laptop Lenovo LOQ 15IAX9 83GS001RVN: hiệu năng mạnh mẽ, màn hình hiển thị sắc nét\" width=\"810\" height=\"456\"></p>', 8, 9, 1, '2024-06-22 08:21:14', '2024-06-22 08:21:14'),
(5, 'Laptop HP Gaming Victus 15-FB1023AX 94F20PA', 'laptop-hp-gaming-victus-15-fb1023ax-94f20pa', 'Laptop HP Gaming Victus 15 FB1023AX 94F20PA được trang bị bộ xử lý trung tâm AMD Ryzen 5 7535HS 6 nhân, 12 luồng với tốc độ xung nhịp lên tới 4.5GHz.', '<h2><strong>Laptop HP Gaming Victus 15 FB1023AX 94F20PA - Hiệu năng mạnh mẽ</strong></h2><p>Mặc dù chỉ mới gia nhập thị trường laptop gaming chưa lâu nhưng HP đã dần chiếm được cảm tình của khách hàng nhờ hiệu năng ổn định và cấu hình mạnh mẽ. Trong đó, laptop HP Victus 15 FB1023AX 94F20PA là một trong những mẫu máy đáng tham khảo ở thời điểm hiện tại với kiểu dáng trẻ trung và khả năng xử lý đáng kinh ngạc,</p><h3><strong>Đa nhiệm mượt mà với RAM 8GB, SSD 512GB</strong></h3><p>Laptop HP Gaming Victus 15 FB1023AX 94F20PA được trang bị RAM dung lượng 8GB chuẩn DDR5 giúp bạn chạy nhiều tác vụ cùng một lúc mà không bị giật, lag. Ngoài ra, máy sở hữu ổ cứng 512GB mang đến không gian lưu trữ khổng lồ. Bạn có thể tải về nhiều ứng dụng hay dữ liệu như video, hình ảnh độ phân giải cao mà không cần bận tâm về tình trạng đầy bộ nhớ. Không những vậy, SSD của Victus 15 FB1023AX 94F20PA còn tăng tốc độ ghi - xuất dữ liệu cho máy và bảo mật thông tin an toàn.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/HP/Victus/laptop-hp-gaming-victus-15-fb1023ax-94f20pa-5.jpg\" alt=\"Cấu hình laptop HP Gaming Victus 15 FB1023AX 94F20PA\" width=\"810\" height=\"456\"></p><h3><strong>Thiết kế gaming bắt mắt, khỏe khoắn</strong></h3><p>Máy được hoàn thiện với phần vỏ ngoài làm từ nhựa cứng cao cấp, chống trầy xước tốt. Logo chữ V sáng bóng ở ngay trung tâm vô cùng nổi bật và thu hút. Viền máy mỏng mang đến vùng hiển thị rộng hơn, tạo cảm giác thoải mái và hài hoà khi làm việc hay thưởng thức các nội dung giải trí.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/HP/Victus/laptop-hp-gaming-victus-15-fb1023ax-94f20pa-2.jpg\" alt=\"Thiết kế  laptop HP Gaming Victus 15 FB1023AX 94F20PA\" width=\"810\" height=\"456\"></p><p>Bên cạnh đó, với kích thước 15.6 inch, HP đã trang bị thêm bàn phím số tiện lợi cho Victus 15 FB1023AX 94F20PA. Đặc điểm này sẽ cực hữu ích cho các game thủ khi tham gia những trò chơi đòi hỏi sự hỗ trợ từ phím số. Đồng thời, bộ bàn phím còn được tích hợp thêm đèn LED - giải quyết hiệu quả trong trường hợp người dùng phải làm việc trong điều kiện ánh sáng yếu.&nbsp;</p><h3><strong>CPU AMD Ryzen 5 7535HS ổn định, phù hợp chơi game</strong></h3><p>Nhà sản xuất đã đầu tư CPU AMD Ryzen 5 7535HS cho Victus 15 FB1023AX 94F20PA với tốc độ xung nhịp lên tới 4.5GHz - nâng cao hiệu suất trên các ứng dụng đơn luồng. Nhờ vậy, mẫu laptop này rất phù hợp cho việc chơi các tựa game ở độ phân giải từ trung bình đến cao. Máy sở hữu card đồ họa RTX 2050 4GB GDDR6 mang đến từng khung hình sống động.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/HP/Victus/laptop-hp-gaming-victus-15-fb1023ax-94f20pa-1.jpg\" alt=\"Cấu hình  laptop HP Gaming Victus 15 FB1023AX 94F20PA\" width=\"810\" height=\"456\"></p><h3><strong>Đa cổng kết nối, pin dùng tới 6 tiếng</strong></h3><p>Laptop HP Gaming Victus 15 FB1023AX 94F20PA hỗ trợ nhiều cổng kết nối như HDMI, USB Type-C/DisplayPort, LAN 1Gbps, Audio com,... Nhờ vậy, bạn có thể kết nối sản phẩm với những thiết bị ngoại vi nhanh chóng, phục vụ cho nhiều mục đích sử dụng khác nhau. Đặc biệt, cổng type-C cho phép sạc các thiết bị với công suất lớn, giảm thời lượng nạp pin hiệu quả. Máy sử dụng kiểu pin 3-cell, 52.5Wh cho thời gian sử dụng lên tới nhiều giờ đồng hồ.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/HP/Victus/laptop-hp-gaming-victus-15-fb1023ax-94f20pa-4.jpg\" alt=\"Cổng kết nôi  laptop HP Gaming Victus 15 FB1023AX 94F20PA\" width=\"810\" height=\"456\"></p><h3><strong>Màn hình FHD sống động, dải màu 45% NTSC</strong></h3><p>Màn hình máy kích thước 15.6 inch sử dụng tấm nền IPS với độ phân giải FHD (1920*1080 pixels). Nhờ vậy, từng nội dung trên HP Gaming Victus 15 FB1023AX 94F20PA có độ hiển thị rõ ràng vì được chi tiết hoá những điểm ảnh nhỏ nhất trên màn hình. Đáng chú ý, khả năng tái tạo màu sắc trên máy tích hợp công nghệ IPS, độ phủ màu 45% NTSC bắt mắt và chân thực. Tần số quét cao hạn chế tốt tình trạng phản hồi trễ, xé hình hay bóng mờ.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/HP/Victus/laptop-hp-gaming-victus-15-fb1023ax-94f20pa-3.jpg\" alt=\"Màn hình  laptop HP Gaming Victus 15 FB1023AX 94F20PA\" width=\"810\" height=\"456\"></p><h2>&nbsp;</h2>', 6, 13, 1, '2024-06-22 09:36:46', '2024-06-22 09:36:46'),
(6, 'Laptop Gaming Acer Nitro 5 Tiger AN515 58 52SP', 'laptop-gaming-acer-nitro-5-tiger-an515-58-52sp', 'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất\r\nBảo hành pin 12 tháng\r\nDây nguồn, Sách hướng dẫn, Sạc Laptop', '<h2><strong>Laptop Acer Nitro 5 Tiger AN515-58-52SP - Thủ lĩnh laptop gaming</strong></h2><p><strong>Laptop Acer Nitro 5 Tiger AN515-58-52SP</strong> mang vẻ ngoài phong thái sắc sảo, tích hợp hàng loạt công nghệ phần mềm đời mới và đặc biệt là bộ vi xử lý Intel ổn định. Chứa đựng hiệu năng siêu vượt trội đã góp phần làm nên chiếc&nbsp;<a href=\"https://cellphones.com.vn/laptop/acer/nitro.html\"><strong>laptop Acer Nitro 5</strong></a>&nbsp;dẫn đầu phân khúc.</p><h3><strong>Thiết kế hầm hố sắc sảo, màn hình siêu mượt 15.6 inch 144 Hz</strong></h3><p>Laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 vẫn giữ nguyên phong thái sắc sảo mạnh mẽ đặc trưng của dòng laptop chuyên gaming trứ danh Nitro 5.</p><p>Điểm khác biệt trên Nitro 5 Tiger AN515-58-52SP đó là họa tiết lưng máy được khắc họa những đường nét hiện đại, cũng như toàn bộ vỏ máy của <a href=\"https://cellphones.com.vn/laptop/do-hoa.html\"><strong>laptop đồ họa</strong></a> này được hoàn thiện với vật liệu cứng cáp và có màu sắc chủ đạo. Chính thiết kế này góp phần mang đến nét hầm hố nổi bật của laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/Laptop-Gaming-Acer-Nitro-5-Tiger-AN515-58-52SP-1-compressed.jpg\" alt=\"Laptop Acer Nitro 5 Tiger AN515-58-52SP\" width=\"810\" height=\"456\"></p><p>Ngoài ra, laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 còn trang bị bàn phím cực bắt mắt kèm dãy NumPad vô cùng hữu ích. Hệ thống đèn nền RGB được tách biệt thành 4 khu vực khác nhau giúp cho bàn phím của máy hoàn toàn nổi bật, đồng thời cũng là điểm nhấn trên thiết kế của máy.</p><p>Laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 trang bị màn hình rộng 15.6 inch với độ phân giải Full HD (1920x1080) và sử dụng nền IPS chủ đạo. Tần số quét lên đến 144 Hz sẽ tạo nên chuyển động ảnh siêu mượt và siêu nét cho mọi tựa game mà bạn chơi. Công nghệ Acer ComfyView được áp dụng cho màn hình 15.6 inch của máy với các chức năng: giảm độ chói sáng; lọc tia sáng xanh; và tạo độ bão hòa - tương phản hình ảnh cao.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/Laptop-Gaming-Acer-Nitro-5-Tiger-AN515-58-52SP-2-compressed.jpg\" alt=\"Laptop Acer Nitro 5 Tiger AN515-58-52SP\" width=\"810\" height=\"456\"></p><h3><strong>Hiệu năng bất diệt với Intel thế hệ 12 và GeForce RTX 3050</strong></h3><p>Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 thuộc phân khúc&nbsp;<a href=\"https://cellphones.com.vn/bo-loc/laptop-tu-20-25-trieu\"><strong>laptop 25 triệu</strong></a> sở hữu những phần cứng và phần mềm thế hệ mới góp phần tạo nên hiệu năng bất diệt cho máy. Sự kết hợp giữa CPU Intel Core i5 thế hệ 12 (chứa đựng 12 nhân 16 luồng lên đến 4.5 GHz) cùng đồ họa GeForce RTX 3050 từ NVIDIA chính là yếu tố chủ lực làm nên sức mạnh \"cân\" trọn tất cả tựa game đình đám hiện nay.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/Laptop-Gaming-Acer-Nitro-5-Tiger-AN515-58-52SP-1-compressed.jpg\" alt=\"Laptop Acer Nitro 5 Tiger AN515-58-52SP\" width=\"810\" height=\"456\"></p><p>Ngoài ra, phần mềm bên trong laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 còn có hệ điều hành mới từ Microsoft - Windows 11 Home. Máy cũng trang bị đầy đủ cổng kết nối cho các thao tác làm việc hằng ngày. Chuẩn WiFi 6 AX 1650i, Bluetooth 5.1 và mạng LAN Ethernet E2600 cũng được tích hợp trên laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 cho kết nối internet vững chắc. Dung lượng lưu trữ 512 GB qua ổ cứng SSD giúp bạn lưu trữ nhiều dữ liệu và trò chơi theo ý thích.</p><h3><strong>Âm thanh chất lượng, tản nhiệt hiệu quả</strong></h3><p>Laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 cung cấp chất lượng âm hảo hạng cho bạn với hệ thống DTS X: Ultra - với hệ thống âm bass cường hóa thông minh. Kết hợp với thuật toán xử lý âm thanh Windows và Acer TrueHarmony, Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 đưa bạn đắm chìm vào thế giới game với âm thanh chân thực.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/Laptop-Gaming-Acer-Nitro-5-Tiger-AN515-58-52SP-4-compressed.jpg\" alt=\"Laptop Acer Nitro 5 Tiger AN515-58-52SP\" width=\"810\" height=\"456\"></p><p>Ngoài ra, laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 còn trang bị hệ thống quạt kép tản nhiệt tối ưu. Cùng với thiết kế 4 lối thoát nhiệt và phần mềm tùy chỉnh NitroSense, bạn hoàn toàn điều khiển bộ phận tản nhiệt để laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 luôn vận hành êm ái.</p><h2><strong>Sở hữu laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 tại CellphoneS</strong></h2><p>Cấu hình ấn tượng cùng thiết kế cuốn hút góp phần giúp cho laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 hoàn toàn vượt trội trong phân khúc laptop chuyên gaming. Giờ đây cơ hội sở hữu laptop Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 chính hãng với giá ưu đãi đã đến với bạn.</p>', 1, 16, 1, '2024-06-23 00:27:01', '2024-06-23 00:27:01'),
(7, 'Macbook Pro 14 M3 Pro', 'macbook-pro-14-m3-pro', 'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).\r\nMáy, Sách HDSD, Cáp sạc USB-C (2 m), Cốc sạc USB-C 70W', '<h2><strong>Macbook Pro 14 inch M3 Pro 2023 - Hiệu suất khủng, tản nhiệt hiệu quả</strong></h2><p>Macbook Pro M3 Pro bản 14 inch 18GB/512GB có khả năng lý đồ họa chuyên sâu, kết cấu 3D một cách ổn định và mượt mà. Bên cạnh đó, sản phẩm có chất lượng hiển thị rất sắc nét, và tần số quét lên tới 120Hz, giúp người dùng làm việc hiệu quả, nhanh chóng.&nbsp;</p><h3><strong>Cấu hình cực khủng với chip Apple M3 Pro</strong></h3><p>Macbook Pro 14 inch M3 Pro 2023 18GB/512GB tích hợp con chip Apple M3 Pro, đi kèm với 11 nhân CPU và 14 nhân GPU. Phần cứng này, đã giúp cho sản phẩm có hiệu suất mạnh hơn so với người tiền nhiệm.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro-14-inch-m3-pro-2023-18gb-512gb-1.jpg\" alt=\"Macbook Pro 14 inch M3 Pro 2023 18GB/512GB - Hiệu suất khủng, tản nhiệt hiệu quả\" width=\"810\" height=\"456\"></p><p>Ngoài ra, thiết bị hỗ trợ RAM 18GB, để bạn sử dụng hàng chục tab cùng một lúc, thuận tiện cho việc tổng hợp dữ liệu, đa nhiệm nhiều công việc khác nhau.&nbsp;</p><h3><strong>Hệ thống tản nhiệt tân tiến</strong></h3><p><a href=\"https://cellphones.com.vn/bo-loc/macbook-pro-14-inch\"><strong>Macbook Pro 14 inch</strong></a> phiên bản M3 Pro 2023 18GB/512GB sở hữu hệ thống tản nhiệt mới, hoạt động ổn định trong một thời gian dài, đảm bảo không bị tình trạng quá nhiệt.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro-14-inch-m3-pro-2023-18gb-512gb-1.png\" alt=\"Macbook Pro 14 inch M3 Pro 2023 18GB/512GB - Hiệu suất khủng, tản nhiệt hiệu quả\" width=\"810\" height=\"456\"></p>', 2, 19, 6, '2024-06-23 00:38:30', '2024-06-23 00:38:30'),
(8, 'Laptop MSI Gaming Bravo 15 B7ED-010VN', 'laptop-msi-gaming-bravo-15-b7ed-010vn', 'Bảo hành 12 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất. (xem chi tiết)\r\nGiá sản phẩm đã bao gồm VAT', '<h2><strong>Laptop MSI BRAVO 15 – Hiệu năng vượt trội, chơi game mượt mà</strong></h2><p>MSI BRAVO 15 là dòng laptop gaming đến từ thương hiệu MSI. Sản phẩm <a href=\"https://cellphones.com.vn/laptop/msi/gaming.html\"><strong>laptop MSI gaming</strong></a> này với cấu hình mạnh mẽ có thể đáp ứng tốt các trải nghiệm gaming của người dùng.</p><h3>&nbsp;</h3><h3><strong>Thiết kế phong cách gaming đầy mạnh mẽ</strong></h3><p>MSI Bravo 15 là sản phẩm thuộc dòng laptop gaming, do đó vẻ ngoài của sản phẩm đậm chất gaming với phần logo được khắc trực tiếp lên mặt lưng máy. Tổng thể máy vô cùng hiện đại và cứng cáp. Chiếc laptop này có tổng trọng lượng khoảng 2.25 kg – Kích thước tương đôi nhẹ so với nhiều dòng laptop gaming khác.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/MSI/gaming/laptop-msi-gaming-bravo-15-b7ed-010vn_3.jpg\" alt=\"Thiết kế MSI Bravo 15 sang trọng\" width=\"810\" height=\"456\"></p><p><a href=\"https://cellphones.com.vn/laptop-msi-gaming-bravo-15-b7ed-010vn.html\"><strong>Laptop MSI Bravo 15</strong></a> sở hữu bàn phím với kích thước fullsize giúp mang lại cho người dùng trải nghiệm gõ thoải mái. Bàn phím với độ nhạy cao cùng đèn nền LED nhờ đó người dùng có thể thoải mái làm việc. Phía dưới khu vực bàn phím là Touchpad với một kích thước vừa đủ cũng như mang lại khả năng di chuyển mượt mà.</p><h3><strong>Hoạt động ổn định với con chip AMD Ryzen 5 cùng VGA RX6550M</strong></h3><p>Laptop MSI BRAVO 15 sẽ hoạt động trên con chip AMD Ryzen 5 - 7535HS&nbsp;– Con chip dòng H mạnh mẽ. Con chip này giúp cho laptop có một hiệu suất vượt trội trong các trải nghiệm từ học tập đến giải trí gaming.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/MSI/gaming/laptop-msi-gaming-bravo-15-b7ed-010vn-1.jpg\" alt=\"Hiệu năng laptop MSI gaming BRAVO 15 B7ED-010VN\" width=\"810\" height=\"456\"></p><p>Cùng với đó, máy MSI Bravo 15 được trang bị card đồ họa AMD Radeon RX 6550M 4GB&nbsp;nhờ đó có thể hỗ trợ tối ưu các trải nghiệm liên quan đến đồ họa. Card hỗ trợ tái tạo hình ảnh với mức phân giải cao.</p><p><i>&gt;&gt;&gt; <strong>Khám phá ngay</strong>: Các mẫu&nbsp;</i><a href=\"https://cellphones.com.vn/bo-loc/laptop-tu-15-20-trieu\"><i><strong>laptop 17 triệu</strong></i></a><i> cấu hình mạnh mẽ, mang lại trải nghiệm vượt trội</i></p><h3><strong>Bộ nhớ RAM lớn 16GB (8GB + 8GB) cùng ổ cứng SSD 512GB</strong></h3><p><strong>Laptop MSI BRAVO 15</strong> được trang bị bộ nhớ RAM dung lượng lớn lên đến 16GB (8GB + 8GB). Mức dung lượng lớn trên laptop giúp mang lại khả năng đa nhiệm ổn định.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/MSI/gaming/laptop-msi-gaming-bravo-15-b7ed-010vn-2.jpg\" alt=\"Cấu hình laptop MSI gaming BRAVO 15 B7ED-010VN\" width=\"810\" height=\"456\"></p><p>Bên cạnh đó, laptop MSI Bravo 15 này còn được trang bị ổ cứng dung lượng tới 512GB chuẩn PCIE. Ổ cứng thể rắn trên thiết bị hỗ trợ quá trình khởi động nhanh chóng cũng như truy xuất dữ liệu nhanh hơn cùng như nhiều không gian để lưu trữ dữ liệu.</p><h3><strong>Màn hình 144HZ với kích thước chuẩn 15.6 inch</strong></h3><p>Về khả năng hiển thị, laptop MSI Bravo 15 B7ED-010VN được trang bị viền màn hình Thin Benzel siêu mỏng nhờ đó mang lại không gian hiển thị vượt trội. Màn hình với tấm nền IPS cùng độ phân giải FHD giúp mang lại khả năng hiển thị rõ nét cũng như chi tiết sống động.</p><p>Màn hình laptop MSI Bravo 15 này còn đặc biệt thích hợp với người dùng chơi game với tần số quét 144HZ. Với mức tần số này, các chuyển động trên Bravo 15 có thể diễn ra mượt mà. Cùng với đó, màn hình còn được trang bị lớp phủ chống chói nhờ đó giúp người dùng có thể sử dụng laptop trong nhiều điều khiện ánh sáng khác nhau từ trong phòng đến ngoài trời.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/MSI/gaming/laptop-msi-gaming-bravo-15-b7ed-010vn_2.jpg\" alt=\"MSI Bravo 15 có màn hình rộng lớn\" width=\"810\" height=\"456\"></p><h3><strong>Đa dạng cổng kết nối, tạo trải nghiệm vượt trội</strong></h3><p>Laptop MSI Bravo 15 sở hữu hệ thống cổng kết nối hiện đại từ USB A đến jack tai nghe, HDMI, RJ45. Với hệ thống cổng giao tiếp này, người dùng có thể kết nối thiết bị với phụ kiện máy tính, phụ kiện âm thanh hay màn hình một cách dễ dàng. Không chỉ kết nối có dây, latpop còn sở hữu những chuẩn kết nối không dây tân tiến nhất như Bluetooth 5.3 hay&nbsp; Wi-Fi 6E với khả năng kết nối ổn định.</p>', 9, 21, 1, '2024-06-23 01:03:17', '2024-06-23 01:03:17'),
(9, 'Laptop Dell Inspiron 15 3520-5810BLK 102F0', 'laptop-dell-inspiron-15-3520-5810blk-102f0', 'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất\r\nBảo hành pin 12 tháng\r\nSạc, sách hướng dẫn sử dụng\r\nTìm hiểu thêm về laptop nhập khẩu', '<h2><strong>Laptop Dell Inspiron 15 3520-5810BLK 102F0 - Kết hợp hoàn hảo thiết kế hiện đại và hiệu năng mạnh mẽ</strong></h2><p>Là chiếc <a href=\"https://cellphones.com.vn/laptop/dell/inspiron.html\"><strong>laptop Dell Inspiron</strong></a> tầm trung, Dell Inspiron 15 3520-5810BLK 102F0 gây ấn tượng với thiết kế màn hình cảm ứng thời thượng và hiệu năng mạnh mẽ, xử lý tác vụ êm mượt với Core i5-1155G7.</p><h3><strong>Intel core i5 thế hệ 11 cùng 8GB ram xử lý tốt mọi tác vụ</strong></h3><p>Không chỉ được đánh giá cao ở thiết kế, Dell Inspiron 15 3520-5810BLK 102F0 còn dễ dàng chinh phục mọi ứng dụng nặng nề với con chip intel Core i5-1155G7 4 nhân 8 luồng cùng xung nhịp tối đa lên đến 4.2Ghz.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Dell/Inspiron/laptop-dell-inspiron-15-3520-5810blk-102f0-3.jpg\" alt=\"Cấu hình laptop Dell Inspiron 15 3520-5810BLK 102F0\" width=\"810\" height=\"456\"></p><p>Kết hợp với một dòng CPU thế hệ mới, máy còn được trang bị 8GB RAM cùng khả năng nâng cấp tối đa lên đến 16GB. Do đó người dùng hoàn toàn có thể yên tâm rằng chiếc laptop này có thể xử lý tốt nhiều phần mềm cùng lúc mà không lo bị tràn ram.</p><h3><strong>Thiết kế thời thượng, bền bỉ</strong></h3><p>Được xem là mẫu laptop dành cho dân văn phòng hay học sinh, sinh viên Dell Inspiron 15 3520-5810BLK 102F0 sử dụng chất liệu cao cấp cho phần mặt lưng để vừa đảm bảo giữ được trọng lượng nhẹ chỉ 1.9kg lại vừa đạt được độ cứng cáp cần thiết.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Dell/Inspiron/laptop-dell-inspiron-15-3520-5810blk-102f0-2.jpg\" alt=\"Thiết kế laptop laptop Dell Inspiron 15 3520-5810BLK 102F0\" width=\"810\" height=\"456\"></p><p>Với thiết kế mang hơi hướng tối giản lấy tông màu đen làm chủ đạo, chiếc laptop Dell Inspiron chắc chắn sẽ là sự lựa chọn phù hợp với đại đa số người dùng cần một thiết bị để phục vụ nhu cầu học tập, làm việc.</p><h3><strong>Đa dạng cổng kết nối</strong></h3><p>Được đánh giá là chiếc laptop văn phòng tầm trung, Dell Inspiron 15 3520-5810BLK 102F0 đáp ứng hầu hết các nhu cầu văn phòng cơ bản, không chỉ bởi hiệu năng và thiết kế mà còn bởi khả năng kết nối với các thiết bị ngoại vi.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Dell/Inspiron/laptop-dell-inspiron-15-3520-5810blk-102f0-4.jpg\" alt=\"Thiết kế laptop Dell Inspiron 15 3520-5810BLK 102F0\" width=\"810\" height=\"456\"></p><p>Dell Inspiron 15 3520-5810BLK 102F0 hỗ trợ đa dạng các cổng giao tiếp như cổng HDMI, cổng USB 2.0, USB 3.0, Jack cắm tai nghe 3.5mm và khe SD,... sẵn sàng kết nối với các thiết bị văn phòng như máy chiếu, loa, tivi,... và các loại phụ kiện khác.</p><h3><strong>Bàn phím &amp; touchpad độ nhạy cao - Nâng cao chất lượng giải trí, làm việc</strong></h3><p>Dell Inspiron 15 3520-5810BLK 102F0 được trang bị hệ thống bàn phím có độ nảy cao, hành trình phím được sắp xếp hợp lý và dùng bền, phù hợp cho các công việc văn phòng soạn thảo văn bản, giúp nâng cao hiệu suất công việc.</p><p>Touchpad có độ nhạy cực ấn tượng, cho phép thao tác dễ dàng và nhanh chóng, hạn chế các tình trạng lờn phím, click không nhạy,... từ đó cho trải nghiệm thao tác hoàn hảo hơn, giây phút giải trí trọn vẹn hơn.</p><h3><strong>Thỏa sức giải trí trên màn hình 15.6 inch Full HD hỗ trợ cảm ứng</strong></h3><p>Chất lượng hình ảnh là một trong các tiêu chí quan trọng nhất khi chọn mua laptop. Dell Inspiron 15 3520-5810BLK 102F0 sở hữu chất lượng hiển thị được đánh giá khá tốt nhờ độ phân giải lên đến Full HD cùng góc nhìn rộng nhờ vào công nghệ tấm nền Wide-viewing angle (WVA).</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Dell/Inspiron/laptop-dell-inspiron-15-3520-5810blk-102f0-1.jpg\" alt=\"Màn hình laptop Dell Inspiron 15 3520-5810BLK 102F0\" width=\"810\" height=\"456\"></p><p>Ngoài ra màn hình cảm ứng được tích hợp trên Dell inspiron 15 còn được xem là một tính năng vô cùng hữu ích đối với những người dùng hay sử dụng các tác vụ đồ họa. Màn hình cảm ứng có thể được sử dụng như một chiếc bảng vẽ giúp việc thiết kế trở nên nhanh chóng và đơn giản hơn bao giờ hết.</p>', 4, 24, 3, '2024-06-23 01:09:28', '2024-06-23 01:09:28'),
(10, 'Laptop Gigabyte MF F2VN333SH', 'laptop-gigabyte-mf-f2vn333sh', 'Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất. (xem chi tiết)\r\nGiá sản phẩm đã bao gồm VAT', '<h2><strong>Laptop Gigabyte G5 MF-F2VN333SH - Hiệu suất mạnh mẽ với khả năng đa nhiệm mượt mà</strong></h2><p>Laptop Gigabyte G5 MF-F2VN333SH thuộc phân khúc cao cấp có thể hỗ trợ người dùng trải nghiệm nhiều tựa game với hiệu ứng đồ họa bắt mắt. Nổi bật với bộ vi xử lý đầu bảng của Intel và dung lượng bộ nhớ vượt trội, chiếc <a href=\"https://cellphones.com.vn/laptop/gigabyte.html\"><strong>laptop Gigabyte</strong></a> hứa hẹn sẽ là người bạn đồng hành tuyệt vời giúp chiến thắng trong các trận đấu.&nbsp;</p><h3><strong>Trang bị chip Intel thế hệ mới cùng card đồ họa cao cấp</strong></h3><p>Sử dụng con chip Intel Core i5-12450H thuộc thế hệ 12, chiếc laptop mang đến hiệu suất xử lý vượt trội với mọi tác vụ. Cấu trúc của chip bao gồm 8 lõi với 4 nhân hiệu suất cao và 4 nhân tiết kiệm năng lượng. Đặc biệt hơn, xung nhịp khi hoạt động đơn nhân của chip có thể đạt đến 4.4GHz giúp những trải nghiệm chiến game của bạn mượt mà hơn.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Gigabyte/laptop-gigabyte-g5-mf-f2vn333sh-1.jpg\" alt=\"Hiệu năng laptop Gigabyte G5 MF-F2VN333SH\" width=\"810\" height=\"456\"></p><p>Kết hợp với con chip mạnh mẽ là card đồ họa rời Nvidia Geforce RTX 4050 được tích hợp trên laptop. Linh kiện này cho phép bạn có thể trải nghiệm những trận chiến với độ phân giải hình ảnh cao cùng tốc độ khung hình ấn tượng.&nbsp;</p><h3><strong>Dung lượng bộ nhớ vượt trội với khả năng mở rộng ấn tượng</strong></h3><p>Máy thuộc phân khúc <a href=\"https://cellphones.com.vn/bo-loc/laptop-tu-20-25-trieu\"><strong>laptop 25 triệu</strong></a> được trang bị dung lượng RAM là 8GB hỗ trợ đa nhiệm ổn định. Nhờ vào đó, nhiều tác vụ sẽ được xử lý cùng lúc trên máy và không gây ra hiện tượng giật, lag. Ngoài ra, bộ nhớ trong của laptop cũng có khả năng lưu trữ nhiều dữ liệu và ứng dụng khi sở hữu dung lượng đến 512GB.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Gigabyte/laptop-gigabyte-g5-mf-f2vn333sh-2.jpg\" alt=\"Cấu hình laptop Gigabyte G5 MF-F2VN333SH\" width=\"810\" height=\"456\"></p><h2><strong>Mua ngay laptop Gigabyte G5 MF-F2VN333SH chính hãng tại CellphoneS</strong></h2><p>Laptop Gigabyte G5 MF-F2VN333SH sở hữu hiệu năng nổi bật chắc chắn sẽ mang đến những trải nghiệm chiến game tuyệt vời cho người chơi. Hãy nhanh chóng đặt ngay laptop Gigabyte chính hãng tại Hệ thống CellphoneS để được sở hữu sản phẩm với giá ưu đãi bạn nhé.&nbsp;</p>', 5, 26, 1, '2024-06-23 01:15:23', '2024-06-23 01:15:23'),
(11, 'Laptop LG Gram 2023 14Z90RS-G.AH54A5', 'laptop-lg-gram-2023-14z90rs-gah54a5', 'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất\r\nBảo hành pin 12 tháng\r\nSạc, máy, sách hướng dẫn\r\nBảo hành 12 tháng bởi nhà phân phối, 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ NSX.', '<h2><strong>Laptop LG GRAM 2IN1 14T90R-G.AH55A5 - Thiết kế mỏng nhẹ, hiệu năng mạnh mẽ</strong></h2><p>Laptop LG Gram 2023 2 in 1 14T90R-G.AH55A5 hiện đang là sản phẩm được nhiều người dùng săn đón. Sở hữu mức giá ở phân khúc cao, chiếc <a href=\"https://cellphones.com.vn/laptop/lg/lg-gram-2023.html\"><strong>laptop&nbsp;LG Gram 2023</strong></a> này dĩ nhiên sẽ được trang bị cấu hình vô cùng mạnh mẽ và đáp ứng được nhiều yêu cầu của người sử dụng.&nbsp;</p><h3><strong>Cấu hình mạnh mẽ cùng với đa dạng kết nối</strong></h3><p>Là laptop ở phân khúc cao cấp, sản phẩm được trang bị CPU Intel Core i5-1340P vô cùng mạnh mẽ với 12 nhân và 16 luồng. CPU này có tốc độ tối đa là 4.60GHz cùng với RAM 16GB.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/LG/LG-Gram-2023/laptop-lg-gram-2023-2in1-14t90r-g-ah55a5-4.png\" alt=\"Đánh giá laptop LG GRAM 2IN1 14T90R-G.AH55A5\" width=\"810\" height=\"456\"></p><p>Hơn thế nữa, ổ cứng của laptop LG Gram 2023 2 in 1 14T90R-G.AH55A5 cũng sở hữu dung lượng 512GB NVMe Gen 4 hỗ trợ nhu cầu sử dụng vô cùng thoải mái.&nbsp;&nbsp;</p><h3><strong>Thiết kế phù hợp laptop văn phòng</strong></h3><p>Chiếc laptop này có trọng lượng khá nhẹ cùng kích thước vô cùng nhỏ gọn. Đây là một thiết kế phù hợp dành riêng cho dân văn phòng yêu thích sự gọn nhẹ. Màn hình máy với khung viền mỏng, mang lại không giản hiển thị vượt trội.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/LG/LG-Gram-2023/laptop-lg-gram-2023-2in1-14t90r-g-ah55a5-2.png\" alt=\"Đánh giá laptop LG GRAM 2IN1 14T90R-G.AH55A5\" width=\"810\" height=\"456\"></p>', 7, 28, 3, '2024-06-23 01:25:02', '2024-06-23 01:25:02'),
(12, 'All In One văn phòng ASUS A3402WBAT-WA187W', 'all-in-one-van-phong-asus-a3402wbat-wa187w', 'Máy tính AIO Asus A3402WBAT-WA187W trang bị con chip Intel Core i5-1235U, kết hợp với RAM 8GB xử lý các tác vụ văn phòng, hay giải trí đều mượt mà. Bên cạnh đó, dung lượng 512GB giúp người dùng thoải mái lưu trữ dữ liệu, không lo bị đầy bộ nhớ.', '<h3><strong>Thiết kế sang trọng</strong></h3><p>Máy tính AIO Asus A3402WBAT-WA187W có kiểu thiết kế tối giản, bộ phận chân đế làm từ chất liệu nhôm, và hỗ trợ điều chỉnh góc nghiêng khá linh hoạt.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/pc/Asus/may-tinh-aio-asus-a3402wbat-wa187w-2.png\" alt=\"Máy tính AIO Asus A3402WBAT-WA187W - Ngoại hình hiện đại, thanh lịch\" width=\"810\" height=\"456\"></p><p>Chưa kể, AIO Asus A3402WBAT-WA187W trang bị đầy đủ cổng USB Type C, USB Type A, HDMI, jack 3.5mm,... Và thiết bị có thể kết nối không dây Bluetooth 5.2, WiFi 6 (802.11ax), đảm bảo đường truyền ổn định, chơi game không bị tình trạng lag, giật.&nbsp;</p>', 3, 30, 13, '2024-06-28 21:53:56', '2024-06-28 21:57:08'),
(13, 'Laptop ASUS VivoBook 15 OLED A1505VA-L1114W', 'laptop-asus-vivobook-15-oled-a1505va-l1114w', 'Asus Vivobook 15 OLED được trang bị bộ vi xử lý thế hệ thứ 13 Intel Core i5-13500H, chiếc laptop giúp bạn xử lý mọi tác vụ vô cùng mượt mà và nhanh chóng. Với 12 nhân và xung nhịp lên đến 4.7GHz, bộ vi xử lý giúp bạn tăng năng suất làm việc, cũng như mang', '<h3><strong>Màn hình OLED đỉnh cao với khả năng bảo vệ thị lực hiệu quả</strong></h3><p>Asus Vivobook 15 OLED A1505VA-L1114W thuộc phân khúc&nbsp;<a href=\"https://cellphones.com.vn/bo-loc/laptop-tu-15-20-trieu\"><strong>laptop 20 triệu</strong></a>&nbsp;sở hữu kích thước màn hình 15.6 inch với tấm nền OLED cao cấp cùng độ phân giải Full HD. Nhờ vào đó, hình ảnh hiển thị trên màn hình laptop có độ sắc nét rất cao. Khả năng hạn chế ánh sáng xanh nhằm bảo vệ thị lực của người dùng cũng là thế mạnh ở thiết bị. Bạn không phải lo lắng về tình trạng mỏi mắt khi làm việc quá lâu trước màn hình laptop.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Asus/Vivobook/laptop-asus-vivobook-15-oled-a1505va-l1114w-2_1.jpg\" alt=\"Laptop Asus Vivobook 15 OLED A1505VA-L1114W\" width=\"810\" height=\"456\"></p><h3><strong>Thiết kế nhỏ gọn, sang trọng trong từng chi tiết</strong></h3><p>Dù được hoàn thiện từ chất liệu <strong>nhựa </strong>ở phần vỏ nhưng laptop Asus VivoBook 15 OLED A1505VA-L1114W vẫn thể hiện được sự <strong>tinh tế</strong>, <strong>sang trọng </strong>trong từng đường nét thiết kế. Cụ thể, laptop sở hữu kích thước chỉ từ <strong>35.68 x 22.76 x 1.99cm</strong>, khá gọn gàng để người sử dụng di chuyển một cách tiện lợi.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Asus/Vivobook/laptop-asus-vivobook-15-oled-a1505va-l1114w-5.jpg\" alt=\"Thiết kế laptop Asus Vivobook 15 OLED\" width=\"810\" height=\"456\"></p><p>Bên cạnh đó, thế hệ laptop Asus này cũng chỉ nặng vỏn vẹn khoảng <strong>1.70 kg</strong>. Thông số này của máy được cho là khá nhẹ nhàng, hỗ trợ người sử dụng có thể dễ dàng mang theo bên mình mà không hề cảm thấy bị nặng nề, khó chịu gì nhé!</p><h3><strong>Dung lượng Pin cỡ lớn, đáp ứng mọi yêu cầu sử dụng suốt ngày dài</strong></h3><p>Xét tới thời lượng sử dụng, laptop Asus VivoBook 15 OLED A1505VA-L1114W cũng đặc biệt thu hút người sử dụng nhờ được trang bị cụm <strong>Pin 3-cell Li-ion </strong>dung lượng <strong>50 Whrs</strong>. Đây là một thông số năng lượng khá ấn tượng trong thế giới laptop hiện nay. Nó đảm bảo mang tới cho người sử dụng trải nghiệm công việc, giải trí liền mạch mà không cần lo lắng về việc sạc pin liên tục trong ngày.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Asus/Vivobook/laptop-asus-vivobook-15-oled-a1505va-l1114w-4.jpg\" alt=\"Pin laptop Asus Vivobook 15 OLED\" width=\"810\" height=\"456\"></p><p>Chưa hết, phân khúc laptop Asus trên còn được tích hợp kèm nhiều cổng giao tiếp hữu ích, bao gồm <strong>USB 2.0 Type-A </strong>và <strong>USB 3.2 Gen 1 Type-C </strong>đảm bảo sạc nhanh và truyền dữ liệu tốt cho các thiết bị ngoại vi. Ngoài ra, máy còn bao gồm <strong>2 cổng USB 3.2 Gen 1 Type-A</strong>, cổng <strong>HDMI 1.4 </strong>cho phép người sử dụng dễ dàng kết nối màn hình ngoài, đáp ứng mọi nhu cầu trình chiếu phục vụ công việc cho đến giải trí cá nhân.</p><h3><strong>Webcam rõ nét, bàn phím Chiclet hiện đại</strong></h3><p>Trải nghiệm gõ nhập trên laptop Asus VivoBook 15 OLED A1505VA-L1114W cũng thực sự khác biệt khi được trang bị <strong>bàn phím Chicle </strong>t đầy đủ cụm phím số (<strong>Num-key</strong>) tinh tế, cho cảm giác gõ phím thoải mái và chính xác.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Asus/Vivobook/laptop-asus-vivobook-15-oled-a1505va-l1114w-6.jpg\" alt=\"Bàn phím laptop Asus Vivobook 15 OLED\" width=\"810\" height=\"456\"></p><p>Ngoài ra, máy cũng đi kèm với một <strong>webcam 720p HD </strong>và tích hợp <strong>màn trập camera</strong>, đảm bảo tính riêng tư và an toàn khi không sử dụng. Điều này làm cho cuộc gọi video và họp trực tuyến trở nên thuận tiện và đảm bảo chất lượng hình ảnh rõ nét, giúp bạn dễ dàng kết nối với người thân và đồng nghiệp trong mọi tình huống.</p><h2><strong>Mua ngay laptop Asus Vivobook 15 OLED tại CellphoneS</strong></h2><p><strong>Laptop Asus Vivobook 15 OLED</strong> A1505VA-L1114W sẽ không khiến bạn thất vọng với hiệu năng vượt trội cùng màn hình đẹp mắt. Hãy nhanh chóng đặt ngay laptop Asus chính hãng tại Hệ thống CellphoneS để sở hữu sản phẩm với giá ưu đãi nhé.&nbsp;</p>', 3, 36, 3, '2024-06-28 22:23:31', '2024-06-28 22:23:31'),
(16, 'Laptop Acer Gaming Aspire 5 A515-58GM-53PZ', 'laptop-acer-gaming-aspire-5-a515-58gm-53pz', 'I5-13420H/8GB/512GB PCIE/VGA 4GB RTX2050/15.6', '<h2><strong>Laptop Acer Gaming Aspire 5 A515 58GM 53PZ - Mỏng nhẹ, mạnh mẽ</strong></h2><p>Acer Gaming Aspire 5 A515 58GM 53PZ với thiết kế thời thượng, mạnh mẽ cùng hiệu suất đỉnh cao xứng đáng là sự lựa chọn hoàn hảo cho dân đồ họa và game thủ. Ngoài ra, dòng <a href=\"https://cellphones.com.vn/laptop/acer/aspire.html\"><strong>laptop Acer</strong></a> mới này còn được yêu thích và ưa chuộng rộng rãi nhờ giá bán phải chăng, dễ tiếp cận với người dùng.&nbsp;</p><h3><strong>Cấu hình khủng với Intel Core i5, NVIDIA GeForce RTX 2050 4GB</strong></h3><p>Sức hút mạnh mẽ của Acer Gaming Aspire 5 A515 58GM 53PZ đến từ bộ vi xử lý tiên tiến Chip Intel Core i5 thế hệ 13 mới nhất gồm 8 nhân, 12 luồng. Theo đó, CPU này đem đến cho thiết bị không gian lưu trữ khủng cùng hiệu suất hoạt động tối ưu.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Aspire/laptop-acer-gaming-aspire-5-a515-58gm-53pz-1.jpg\" alt=\"Cấu hình laptop Acer Gaming Aspire 5 A515 58GM 53PZ\" width=\"810\" height=\"456\"></p><p>Giờ đây, bất kể các nhu cầu học tập, giải trí đến các công việc văn phòng từ cơ bản đến nâng cao đều được đáp ứng một cách nhanh chóng bởi bộ vi xử lý Intel thế hệ mới này. Ngoài ra, những tác vụ nặng như thiết kế đồ họa Photoshop hay giải trí với các tựa game online đều được laptop Acer Gaming Aspire 5 A515 58GM 53PZ giải quyết một cách mượt mà.&nbsp;</p><p>Có thể nói, Acer Gaming Aspire 5 A515 58GM 53PZ là đối tác lý tưởng cho người dùng yêu thích các tựa game giải trí bởi thiết bị trang bị card đồ họa NVIDIA GeForce RTX 2050 4GB. Điểm nổi trội của GPU này chính là sự hỗ trợ của công nghệ Ray Tracing - Dò tia kết hợp với nhiều tính năng hiện đại khác. Qua đó, đảm bảo người dùng laptop có trải nghiệm đắm chìm vào trong thế giới ảo và sáng tạo đồ họa.&nbsp;</p><h3><strong>RAM DDR4 8GB, PCIe NVMe SSD 512GB tăng tốc độ xử lý đa nhiệm</strong></h3><p>So với các phiên bản laptop Acer tiền nhiệm, Acer Gaming Aspire 5 A515 58GM 53PZ có hiệu suất đa nhiệm được đánh giá vượt trội hơn nhờ trang bị RAM DDR4 8GB mới nhất.&nbsp;</p><p>Kết hợp với ổ cứng PCIe NVMe SSD 512GB không chỉ cung cấp cho thiết bị tốc độ đọc/ghi nhanh chóng mà còn cung cấp lưu lượng lưu trữ lớn. Điều này hỗ trợ quá trình khởi động và truy cập tệp tin ở thiết bị diễn ra nhanh chóng. Mặt khác, laptop còn cung cấp tùy chọn lưu trữ lên đến 2TB PCIe Gen 4 giúp đáp ứng tối đa nhu cầu người dùng.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Aspire/laptop-acer-gaming-aspire-5-a515-58gm-53pz-5.jpg\" alt=\"Cấu hình laptop Acer Gaming Aspire 5 A515 58GM 53PZ\" width=\"810\" height=\"456\"></p><p>Tương tự với dòng Acer gaming Predator, laptop Acer Gaming Aspire 5 A515 58GM 53PZ được hãng tích hợp hệ thống tản nhiệt siêu mát. Hệ thống này gồm 2 quạt tản nhiệt và một ống đồng lớn có nhiệm vụ cung cấp luồng khí lạnh giúp duy trì sự mát mẻ trong không gian và giữ ổn định hiệu năng. Ngoài ra, bàn phím laptop trang bị khe hút gió cho trạng thái làm việc của thiết bị đạt tốt nhất.&nbsp;</p><h3><strong>Thiết kế đậm chất gaming</strong></h3><p>Khác với vẻ ngoài hầm hố và mạnh mẽ ở các dòng laptop gaming khác, Acer Gaming Aspire 5 A515 58GM 53PZ nổi bật với kiểu dáng nhỏ gọn, thanh lịch nhưng vẫn sở hữu hiệu năng ấn tượng.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Aspire/laptop-acer-gaming-aspire-5-a515-58gm-53pz-3.jpg\" alt=\"Thiết kế laptop Acer Gaming Aspire 5 A515 58GM 53PZ\" width=\"810\" height=\"456\"></p><p>Không chỉ đáp ứng nhu cầu giải trí, chiếc laptop này còn là sự lựa chọn thích hợp cho các đối tượng học sinh - sinh viên sử dụng để giải quyết các tác vụ văn phòng.&nbsp;</p><h3><strong>Màn hình FHD 15.6 inch kết hợp công nghệ Acer ComfyView tiên tiến</strong></h3><p>Laptop Acer Gaming Aspire 5 A515 58GM 53PZ trang bị màn hình viền mỏng, kích thước 15.6 inch cùng độ phân giải FHD tạo hiệu ứng hiển thị góc nhìn rộng. Bên cạnh đó, thiết bị còn tích hợp công nghệ Acer ComfyView cùng tấm nền IPS 178 độ cho chất lượng hiển thị bắt mắt với các gam màu sắc nét không khác thế giới thực và tạo cảm giác dễ chịu cho thị giác người xem.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Aspire/laptop-acer-gaming-aspire-5-a515-58gm-53pz-2.jpg\" alt=\"Màn hình laptop Acer Gaming Aspire 5 A515 58GM 53PZ\" width=\"810\" height=\"456\"></p><p>Không chỉ kiểm soát chất lượng hiển thị, tấm nền còn có công dụng giảm thiểu hiện tượng chói sáng để bảo vệ mắt người dùng trước sự độc hại của ánh sáng xanh.&nbsp;</p><h3><strong>Đa cổng kết nối</strong></h3><p>Acer Gaming Aspire 5 A515 58GM 53PZ được hãng cung cấp nhiều tùy chọn kết nối khác nhau như USB 3.2, USB C, HDMI và Jack cắm 3.5mm cho phép người dùng dễ dàng kết nối hoặc cắm sạc laptop với các thiết bị khác. Mặt khác, thiết bị còn hỗ trợ thêm đèn nền bàn phím tạo nhằm gia tăng trải nghiệm cũng như hỗ trợ người dùng trong điều kiện thiếu sáng.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Aspire/laptop-acer-gaming-aspire-5-a515-58gm-53pz-4.jpg\" alt=\"Kết nối laptop Acer Gaming Aspire 5 A515 58GM 53PZ\" width=\"810\" height=\"456\"></p><p>Để mang đến cho người dùng những trải nghiệm giải trí tuyệt vời và đáng nhớ, Acer Gaming Aspire 5 A515 58GM 53PZ còn ứng dụng thêm công nghệ Acer TrueHarmony với khả năng tạo âm chân thật với âm thanh vòm, mang đến âm thanh sắc nét, rõ ràng.&nbsp;</p>', 1, 52, 1, '2024-06-29 07:05:00', '2024-06-29 07:05:00');
INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `brand_id`, `thumbnail`, `product_seri_id`, `created_at`, `updated_at`) VALUES
(17, 'Laptop Acer Aspire 7 A715-76G-5806', 'laptop-acer-aspire-7-a715-76g-5806', 'I5-12450H/16GB/512GB PCIE/15.6 FHD 144HZ', '<h2><strong>Laptop Acer Aspire 7 A715 76G 5806 - Hiệu năng mạnh mẽ, đồ họa mượt mà</strong></h2><p>Laptop Acer Aspire 7 A715 76G 5806 là chiếc máy gaming sở hữu hiệu năng mạnh mẽ, dung lượng lưu trữ lớn và màn hình sắc nét đỉnh cao. Ngoài ra, laptop còn nổi bật với thiết kế bền bỉ, góp phần nâng tầm không gian của riêng bạn.</p><h3><strong>Chip i5 12450H mạnh mẽ, đồ họa đỉnh cao</strong></h3><p>Laptop <a href=\"https://cellphones.com.vn/laptop-acer-gaming-aspire-7-a715-76-57cy-nh-qgesv-004.html\"><strong>Acer Aspire 7 A715</strong></a> 76G 5806 được trang bị CPU Intel Core i5 12450H mang lại hiệu suất vượt trội, giúp bạn giải quyết mọi tác vụ văn phòng, thiết kế,... nhanh chóng. Máy còn được tích hợp card đồ họa rời 4GB RTX3050 tăng cường khả năng xử lý hình ảnh, cho bạn trải nghiệm đầy mãn nhãn trong những tựa game hành động tốc độ cao.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Aspire/laptop-acer-aspire-7-a715-76g-5806-1.jpg\" alt=\"Laptop Acer Aspire 7 A715 76G 5806 - Hiệu năng mạnh mẽ, đồ họa mượt mà\" width=\"810\" height=\"456\"></p><p>Hơn nữa, phân khúc&nbsp;<a href=\"https://cellphones.com.vn/bo-loc/laptop-tu-20-25-trieu\"><strong>laptop 25 triệu</strong></a> này luôn tạo điểm nhấn nổi bật với dung lượng bộ nhớ ấn tượng. Bộ nhớ RAM 16GB chuẩn DDR4, có thể nâng cấp lên 32GB, giúp bạn thực hiện trơn tru các tác vụ đa nhiệm phức tạp. Ổ cứng SSD có dung lượng lớn&nbsp;</p><h3><strong>Thiết kế bền bỉ, màn hình sắc nét</strong></h3><p>Laptop Acer Aspire 7 A715 76G 5806 còn được đánh giá cao bởi thiết kế bền bỉ. Sản phẩm được hoàn thiện từ chất liệu nhựa cứng và nắp lưng kim loại, kiểu dáng tối giản mang lại vẻ đẹp vừa giản dị vừa mạnh mẽ.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Aspire/laptop-acer-aspire-7-a715-76g-5806-2.jpg\" alt=\"Laptop Acer Aspire 7 A715 76G 5806 - Hiệu năng mạnh mẽ, đồ họa mượt mà\" width=\"810\" height=\"456\"></p><p>Ngoài ra, laptop còn gây ấn tượng nhờ màn hình 15.6 inch, có tấm nền IPS và độ phân giải FHD chất lượng. Màn hình sở hữu tần số quét lên đến 144Hz cho bạn trải nghiệm giải trí mượt mà, không lo giật lag.</p>', 1, 58, 1, '2024-06-29 07:10:45', '2024-06-29 07:10:45'),
(18, 'Laptop Acer Aspire 3 A314-42P-R3B3 NX.KSFSV.001', 'laptop-acer-aspire-3-a314-42p-r3b3-nxksfsv001', 'R7-5700U/16GB/512GB PCIE/14.0 FHD', '<h2><strong>Laptop Acer Aspire 3 A314-42P-R3B3 - Hiệu suất cao, tiết kiệm năng lượng</strong></h2><p>Laptop Acer Aspire 3 A314-42P-R3B3 là một chiếc <a href=\"https://cellphones.com.vn/laptop/acer/aspire.html\"><strong>laptop Acer Aspire</strong></a> đa năng với thiết kế gọn nhẹ và hiệu suất đủ mạnh đáp ứng nhu cầu sử dụng hàng ngày. Với màn hình kích thước 14 inch, máy sở hữu vi xử lý AMD Ryzen 7, RAM 16GB, và ổ cứng SSD 512GB, đảm bảo khởi động nhanh chóng và trải nghiệm làm việc mượt mà.&nbsp;</p><h3><strong>Dung lượng RAM và ổ cứng đảm bảo sự mượt mà cho mọi khởi động</strong></h3><p>Acer Aspire 3 A314-42P-R3B3 là chiếc laptop được nâng cấp với bộ nhớ RAM LPDDR4X Dual Channel Memory 16GB. Cung cấp hiệu suất mạnh mẽ cho việc xử lý đa nhiệm và chạy các ứng dụng đòi hỏi tài nguyên cao. Đồng thời giúp tăng cường trải nghiệm người dùng, đảm bảo khả năng mở nhanh chóng và duyệt web mượt mà.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/laptop-acer-aspire-3-a314-42p-r3b3-1.png\" alt=\"Cấu hình Acer Aspire 3 A314-42P-R3B3\" width=\"810\" height=\"456\"></p><p>Ngoài ra, thiết bị còn được trang bị ổ cứng SSD NVMe Gen3 dung lượng lớn 512GB. Nhờ đó mà laptop Acer Aspire 3 A314-42P-R3B3 có thể đảm bảo tốc độ khởi động nhanh chóng và tăng cường khả năng đọc/ghi dữ liệu. Không chỉ giúp tiết kiệm thời gian mà còn cải thiện hiệu suất tổng thể của máy tính, làm cho quá trình làm việc và giải trí trở nên linh hoạt và hiệu quả.</p><h3><strong>Thiết kế đơn giản, sạng trọng với màu bạc quen thuộc</strong></h3><p>Acer Aspire 3 A314-42P-R3B3 mang đến sự sang trọng với thiết kế đơn giản và màu sắc bạc tinh tế. Với vẻ ngoại hình thanh lịch, máy tính này phản ánh sự tinh tế và chuyên nghiệp, biến chiếc laptop trở thành một lựa chọn phù hợp cho cả công việc và giải trí. Thiết kế tinh tế này cũng giúp Acer Aspire 3 dễ dàng phối hợp với mọi môi trường làm việc hoặc giải trí.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/laptop-acer-aspire-3-a314-42p-r3b3-5.png\" alt=\"Thiết kế Acer Aspire 3 A314-42P-R3B3\" width=\"810\" height=\"456\"></p><p>Cạnh đó, laptop còn được thiết kế chạy hệ điều hành Windows 11, phiên bản mới nhất của Microsoft. Hệ điều hành này mang đến nhiều tính năng mới và cải tiến, cung cấp trải nghiệm người dùng hiện đại và linh hoạt trên chiếc laptop này.</p><h3><strong>Bộ vi xử lý hiệu suất cao cùng card đồ họa thông minh</strong></h3><p>Laptop Acer Aspire 3 A314-42P-R3B3 sở hữu bộ vi xử lý mạnh mẽ AMD Ryzen 7 5700U, đảm bảo hiệu suất cao và tiết kiệm năng lượng. Với bộ xử lý này, máy không chỉ có khả năng xử lý tốt cho các tác vụ đa nhiệm mà còn đáp ứng được nhu cầu sử dụng đa dạng từ công việc đến giải trí.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/laptop-acer-aspire-3-a314-42p-r3b3-2.png\" alt=\"Hiệu suất Acer Aspire 3 A314-42P-R3B3\" width=\"810\" height=\"456\"></p><p>Ngoài ra, với card đồ họa AMD Radeon Graphics, Acer Aspire 3 cung cấp khả năng xử lý đồ họa mạnh mẽ. Thiết bị có thể hỗ trợ tốt cho việc xem phim, chơi game nhẹ và xử lý các tác vụ đồ họa cơ bản, giúp nâng cao trải nghiệm người dùng trên laptop này.</p><h3><strong>Trang bị cổng kết nối và năng lượng pin đảm bảo làm việc lâu dài</strong></h3><p>Acer Aspire 3 A314-42P-R3B3 là sự lựa chọn hoàn hảo với sự tích hợp pin 3 cell có dung lượng 50 Wh, giúp đảm bảo thời lượng sử dụng lâu dài. Ngoài ra, máy còn tích hợp đầy đủ các cổng kết nối, bao gồm cổng USB Type-C, USB 3.2 Gen 2, cổng tai nghe, cổng HDMI/VGA,... cùng khả năng kết nối Bluetooth.&nbsp;</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/laptop-acer-aspire-3-a314-42p-r3b3-3.png\" alt=\"Cổng kết nối trên Acer Aspire 3 A314-42P-R3B3\" width=\"810\" height=\"456\"></p><p>Sự hỗ trợ mạnh mẽ về năng lượng pin với đầy đủ cổng kết nối giúp cho laptop trở nên linh hoạt và thuận tiện cho người dùng hơn. Nhất là trong việc kết nối với các thiết bị ngoại vi và trải nghiệm đa dạng các tình huống sử dụng ở thời gian dài.</p><h3><strong>Màn hình lớn với công nghệ tiêu chuẩn, đảm bảo mọi ánh nhìn</strong></h3><p>Laptop Acer Aspire 3 A314-42P-R3B3 trang bị màn hình 14.0 inch với độ phân giải FHD (1920 x 1200) IPS, mang lại trải nghiệm hình ảnh sắc nét và chi tiết. Công nghệ Acer ComfyView™ giúp giảm ánh sáng xung quanh, giảm thiểu chói lọi và mỏi mắt khi sử dụng trong thời gian dài.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/laptop-acer-aspire-3-a314-42p-r3b3-2.png\" alt=\"Màn hình Acer Aspire 3 A314-42P-R3B3\" width=\"810\" height=\"456\"></p><p>Máy còn được tích hợp công nghệ âm thanh Acer Purified Voice, giúp loại bỏ tiếng ồn, tăng cường trải nghiệm gọi video. Đồng thời, camera HD có trên thiết bị còn được hỗ trợ với công nghệ Acer TNR mang đến hình ảnh gọi video chất lượng cao, đảm bảo sự rõ ràng và chi tiết trong các cuộc trò chuyện trực tuyến.</p><h2><strong>Mua ngay laptop Acer Aspire 3 A314-42P-R3B3 chính hãng tại CellphoneS</strong></h2><p>Ngoài những điểm mạnh về bộ vi xử lý, bộ nhớ máy còn tích hợp đầy đủ các cổng kết nối và có pin lâu dài, tạo nên một giải pháp di động hiệu quả. Với những tính năng thật sự nổi bật, Acer Aspire 3 trở thành sự lựa chọn phù hợp cho công việc văn phòng, học tập, và giải trí cơ bản.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/laptop/Acer/Nitro/laptop-acer-aspire-3-a314-42p-r3b3-6.png\" alt=\"Mua ngay laptop Acer Aspire 3 A314-42P-R3B3 chính hãng tại CellphoneS\" width=\"810\" height=\"456\"></p>', 1, 64, 3, '2024-06-29 07:19:29', '2024-06-29 07:19:29'),
(19, 'Màn hình Monitor Xiaomi 27 inch A27i ELA5345EU', 'man-hinh-monitor-xiaomi-27-inch-a27i-ela5345eu', 'FHD/IPS/100HZ/6MS', '<h2><strong>Màn hình Xiaomi A27 Ela5345EU 27 inch - Siêu phẩm màn hình chất lượng</strong></h2><p>Màn hình Xiaomi A27 Ela5345EU 27 inch là sự kết hợp hoàn hảo giữa thiết kế tinh tế và hiệu suất đỉnh cao. Với kích thước rộng 27 inch, độ phân giải cao và màu sắc chân thực, thiết bị <a href=\"https://cellphones.com.vn/man-hinh/xiaomi.html\"><strong>màn hình Xiaomi</strong></a> này mang lại trải nghiệm xem hình ảnh và video tuyệt vời. Đây chính là sự lựa chọn lý tưởng cho những người đòi hỏi chất lượng và thẩm mỹ trong trải nghiệm hiển thị.</p><h3><strong>Kích thước lớn, độ phân giải cao cho trải nghiệm xem tối ưu</strong></h3><p>Màn hình Xiaomi A27 Ela5345EU 27 inch là chiếc <a href=\"https://cellphones.com.vn/bo-loc/man-hinh-27-inch\"><strong>màn hình27 inch</strong></a> chính hãng của Xiaomi cung cấp độ phân giải Full HD (1920 x 1080). Chúng cho hình ảnh sắc nét và chi tiết, tạo ra một không gian làm việc và giải trí độc đáo.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Man-hinh/Xiaomi/27-inch/man-hinh-xiaomi-a27i-ela5345eu-27-inch-4.png\" alt=\"Chất lượng màn hình Xiaomi 27 inch A27i ELA5345EU\" width=\"810\" height=\"456\"></p><p>Với công suất định mức 24W, màn hình này đảm bảo độ sáng ổn định ở mức 250nit (thông thường), tạo ra hình ảnh rực rỡ và sống động. Tỷ lệ tương phản 1000:1 giúp tái tạo màu sắc chân thực và độ sâu, trong khi tốc độ làm mới bảng lên đến 100Hz giúp giảm hiện tượng mờ và làm mờ trong các cảnh chuyển động nhanh.</p><p>Góc nhìn rộng 178 độ cả từ phía trước và phía sau, <a href=\"https://cellphones.com.vn/bo-loc/man-hinh-100hz\"><strong>màn hình 100hz</strong></a> này giúp duy trì chất lượng hình ảnh tốt từ mọi góc độ. Thời gian phản hồi nhanh chóng 6ms (thông thường) giúp giảm hiện tượng chuyển động mờ và làm cho trải nghiệm xem video và chơi game trở nên mượt mà hơn.</p><h3><strong>Thiết kế mang lại cảm giác chân thực với góc nhìn rộng hơn</strong></h3><p>Màn hình Xiaomi A27 Ela5345EU 27 inch tiếp tục ấn tượng với thiết kế màu sắc đen sang trọng, tạo điểm nhấn hoàn hảo cho không gian làm việc hoặc giải trí của bạn. Bạn sẽ được đắm chìm trong hình ảnh với kích thước màn hình 27 inch, tương ứng tỷ lệ khung hình 16:9, mang lại không gian hiển thị rộng lớn.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Man-hinh/Xiaomi/27-inch/man-hinh-xiaomi-a27i-ela5345eu-27-inch-3.png\" alt=\"Thiết kế màn hình Xiaomi 27 inch A27i ELA5345EU\" width=\"810\" height=\"456\"></p><p>Việc có viền mỏng ở ba cạnh không chỉ tạo ra một cái nhìn thẩm mỹ mà còn tối ưu hóa diện tích hiển thị, giúp bạn tận hưởng trải nghiệm xem và làm việc mà không bị gián đoạn. Màn hình được thiết kế sao cho đồng đội với bất kỳ không gian nào, từ văn phòng đến phòng khách, với vẻ ngoại hình hiện đại và thanh lịch.</p><h3><strong>Công nghệ màn hình sống động, bảo vệ mắt tối đa</strong></h3><p>Công nghệ tấm nền IPS cùng góc nhìn 178° giúp màn hình hiển thị màu sắc và chi tiết với độ chính xác cao, không bị biến đổi khi nhìn từ các góc khác nhau. Điều này làm cho màn hình phù hợp cho nhiều ứng dụng, từ công việc đến giải trí.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Man-hinh/Xiaomi/27-inch/man-hinh-xiaomi-a27i-ela5345eu-27-inch-2.png\" alt=\"Công nghệ màn hình Xiaomi 27 inch A27i ELA5345EU\" width=\"810\" height=\"456\"></p><p>Chiếc <a href=\"https://cellphones.com.vn/man-hinh/do-hoa.html\"><strong>màn hình đồ hoạ</strong></a> này cũng được thiết kế với khả năng bảo vệ mắt được công nhận bởi Chứng nhận mức ánh sáng xanh thấp của TÜV. Chúng giúp lọc ra, giảm ánh sáng xanh sóng ngắn để giảm mỏi mắt khi sử dụng trong thời gian dài. Điều này làm tăng thêm sự thoải mái và chăm sóc sức khỏe cho người dùng. Kết hợp cùng đó còn có tính năng điều chỉnh cường độ sáng DC, hỗ trợ giảm tình trạng nhấp nháy của màn hình hiệu quả.</p><h3><strong>Nâng cao cổng kết nối, hiệu quả cao hơn</strong></h3><p>Màn hình Xiaomi A27 Ela5345EU 27 inch làm nổi bật với các cổng kết nối đa dạng, đáp ứng mọi nhu cầu của người dùng. Bạn có thể kết nối màn hình với các thiết bị khác một cách dễ dàng và linh hoạt nhờ vào các cổng DP (DisplayPort), HDMI 2.0, cổng cáp DC IN. Sự tích hợp các cổng cho phép truyền tín hiệu nhanh chóng, nâng cấp chất lượng và giúp cho màn hình được hoạt động ổn định.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Man-hinh/Xiaomi/27-inch/man-hinh-xiaomi-a27i-ela5345eu-27-inch-1.png\" alt=\"Kết nối màn hình Xiaomi 27 inch A27i ELA5345EU\" width=\"810\" height=\"456\"></p>', 10, 80, 17, '2024-06-29 07:40:39', '2024-06-29 07:41:09'),
(20, 'Chuột Razer Deathadder V3 Pro Faker Edition', 'chuot-razer-deathadder-v3-pro-faker-edition', 'Cảm biến quang học Focus Pro 30K', '<h2><strong>Đánh giá chi tiết chuột Razer Deathadder V3 Pro Faker Edition</strong></h2><p>Deathadder V3 Pro dòng <a href=\"https://gearvn.com/collections/chuot-wireless\">chuột không dây</a> chơi game chất lượng khi sở hữu nhiều công nghệ hiện đại mang đến tốc độ xử lý nhanh chóng. Không chỉ dừng lại ở đó, Razer còn mang đến thị trường thêm phối màu “Unkillable Demon King” Faker Edition.</p><h3><strong>Razer Deathadder V3 Pro với phiên bản Faker Edition</strong></h3><p>&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-chuot-razer-deathadder-v3-pro-faker-edition_9720296b5a6449f5a69cd7000f77887f_1024x1024.jpg\" alt=\"GEARVN-chuot-razer-deathadder-v3-pro-faker-edition-3\" width=\"1024\" height=\"474\"></p><p>&nbsp;</p><p>Mang đến nguồn cảm hứng bất tận cho người chơi game, được hợp tác với một trong những “Huyền thoại” của tựa Game League of Legends. Razer Deathadder V3 Pro sở hữu tông màu đỏ chủ đạo kết hợp cùng những chi tiết của “Quỷ vương bất tử” tạo nên tổng thể vô cùng đẹp mắt. Ngoài ra, điểm đặc biệt ở nút chuột phải còn kèm theo chữ ký của Lee Sang-hyeok.&nbsp;</p><p>Nếu bạn đang tìm nguồn cảm hứng để thăng hoa hơn trong những trận chiến căng thẳng, hãy đến ngay các showroom của GEARVN để trải nghiệm ngay dòng <a href=\"https://gearvn.com/pages/chuot-may-tinh\">chuột máy tính</a> gaming độc đáo này nhé!</p><h3><strong>Thiết kế công thái học giúp ôm sát lòng bàn tay</strong></h3><p>&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-chuot-razer-deathadder-v3-pro-faker-edition-4_67f1f923e0e646c7a50b9c95bf0aaf37_1024x1024.png\" alt=\"GEARVN-chuot-razer-deathadder-v3-pro-faker-edition-3\" width=\"1024\" height=\"522\"></p><p>&nbsp;</p><p>Có thể nói Razer Deathadder V3 Pro là dòng chuột máy tính sở hữu thiết kế <a href=\"https://gearvn.com/blogs/thu-thuat-giai-dap/chuot-cong-thai-hoc-la-gi\">chuột công thái học</a> vô cùng đặc biệt. Với form cầm đối xứng tạo cảm giác chắc chắn trong từng pha xử lý, các nút bấm bố trí thông minh và hợp lý giúp người chơi có những thao tác không khác gì “Vị vua đường giữa - Faker”.</p><h3><strong>Razer Deathadder V3 Pro mang đến hiệu suất vượt trội</strong></h3><p>&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-chuot-razer-deathadder-v3-pro-faker-edition-3_a2e1794c031d482c986ebc0f7b405272_1024x1024.jpg\" alt=\"GEARVN-chuot-razer-deathadder-v3-pro-faker-edition-3\" width=\"1024\" height=\"322\"></p><p>&nbsp;</p><p>Razer Deathadder xứng đáng với danh hiệu “Legends never die”, được biết đến là dòng Series chuột gaming luôn mang đến hiệu suất chơi game đỉnh cao bên cạnh những sản phẩm <a href=\"https://gearvn.com/collections/ban-phim-may-tinh\">bàn phím máy tính</a> hoặc <a href=\"http://xn--tai%20nghe%20my%20tnh-n0b5z/\">tai nghe máy tính</a> chơi game, Razer Deathadder V3 Pro mang đến hiệu suất chơi game vượt trội tạo cho người chơi khả năng bao quát trận đấu, di chuyển dẫn dắt bạn đến chiến thắng.</p><p><img src=\"https://file.hstatic.net/1000026716/file/deathadder-v3-pro-faker-usp-wire_9c3ff5515637431ab25c1a5e2ae92f01_1024x1024.png\" alt=\"GEARVN-chuot-razer-deathadder-v3-pro-faker-edition-3\" width=\"1024\" height=\"267\"></p><p>Sở hữu 5 nút bấm có thể tùy chỉnh qua phần mềm giúp bạn tăng thêm chính xác khi xử lý. Đồng thời, ở phiên bản đặc biệt chuột Razer Deathadder V3 Pro Faker Edition được trang bị các chức năng thông minh, cảm biến thậm chí còn trở nên chính xác hơn, cho phép đạt được mức độ chính xác trong từng pha xử lý.</p><h3><strong>Công nghệ không dây Razer HyperPolling Wireless</strong></h3><p>&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-chuot-razer-deathadder-v3-pro-faker-edition-5_81ffe812cc064e01b9bfcc4953ff84b2_1024x1024.png\" alt=\"GEARVN-chuot-razer-deathadder-v3-pro-faker-edition-3\" width=\"1024\" height=\"469\"></p><p>&nbsp;</p><p>Trải nghiệm hiệu suất không dây nhanh nhất chưa từng có nhờ vào công nghệ Razer HyperPolling Wireless Dongle, mở ra một tiêu chuẩn mới về khả năng kết nối, tốc độ phản hồi dành cho những con chuột không dây chơi game ở thời điểm hiện tại.</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-chuot-razer-deathadder-v3-pro-faker-edition-6_90691efa9b934b3cb7f44313e850eaa8_1024x1024.png\" alt=\"GEARVN-chuot-razer-deathadder-v3-pro-faker-edition-3\" width=\"1024\" height=\"681\"></p><p>Razer Deathadder V3 Pro Faker Edition mang đến cho hàng triệu game thủ những trải nghiệm độc đáo khi cầm trên tay, tạo cảm giác thoải mái khi sử dụng mà không phải bận tâm về vướng víu, rất thích hợp cho việc mang ra bên ngoài sử dụng.</p><h3><strong>Razer Focus Pro 30K</strong></h3><p>Tạo cho người chơi những cung bật cảm xúc trên cả tuyệt vời, tích hợp cảm biến Focus Pro 30K được cải tiến với 30.000 DPI và độ phân giải vô cùng chính xác lên đến 99,8%. Người chơi có thể tận hưởng hiệu suất chơi game đỉnh cao với mọi bề mặt di chuột khác nhau, bao gồm cả mặt kính.&nbsp;</p><h3><strong>Thời lượng pin lên đến 90 giờ</strong></h3><p>&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-chuot-razer-deathadder-v3-pro-faker-edition-8_3320937f4d7443ac9a19686d3c49965a_1024x1024.png\" alt=\"GEARVN-chuot-razer-deathadder-v3-pro-faker-edition-3\" width=\"1024\" height=\"522\"></p><p>&nbsp;</p><p>Để tránh làm gián đoạn mạch cảm xúc của người chơi, Razer Deathadder V3 Pro Faker Edition sở hữu thời lượng pin lên đến 90 giờ. Với hiệu suất năng lượng ấn tượng này bạn có thể mang đi và sử dụng ở bất kỳ đâu cho từng nhu cầu sử dụng. Đặc biệt, đi kèm với <a href=\"https://gearvn.com/collections/chuot-razer\">chuột Razer</a> chính là cổng sạc theo chuẩn Âu Châu USB Type-C</p>', 11, 89, 23, '2024-06-30 07:20:04', '2024-06-30 07:20:04'),
(21, 'Chuột Razer Cobra Pro', 'chuot-razer-cobra-pro', 'Đối xứng - cho người thuận tay phải', '<h2><strong>Đánh giá chi tiết&nbsp;chuột Razer Cobra Pro</strong></h2><p>Razer, thương hiệu <a href=\"https://gearvn.com/collections/gaming-gear\">gaming gear</a> vô cùng nổi tiếng trong làng game thủ. Được biết đến với những thành phẩm chất lượng, đặc biệt là chuột gaming với lineup sản phẩm Deathadder, Basilisk, Viper,... Và gần đây, đó chính là sự xuất hiện của series Cobra cùng model <strong>Razer Cobra Pro</strong>.</p><h3><strong>Thiết kế cân xứng, đẹp mắt</strong></h3><p>Razer Cobra Pro được hoàn thiện với thiết kế đối xứng 2 bên đem đến sự thuận tiện sử dụng cho mọi người dùng, bất chấp tay thuận. Vẫn giữ vững tôn chỉ từ nhà rắn, những đường nét trên toát lên khí chất mạnh mẽ của linh vật nhà Slytherin trên chú <a href=\"https://gearvn.com/collections/chuot-may-tinh\">chuột gaming</a>. Ngoài ra, Razer Cobra Pro sở hữu cho mình trọng lượng chỉ 77g, vô cùng nhẹ để mang tới trải nghiệm sử dụng thoải mái nhất ngay cả khi trong thời gian dài.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-chuot-razer-cobra-pro-__3__ea0d431012194420bd02a7a8b843ea90_1024x1024.jpg\" alt=\"GEARVN - Chuột Razer Cobra Pro\" width=\"1024\" height=\"686\"></p><h3><strong>Chính xác và bền bỉ</strong></h3><p>Là một trong những món “vũ khí” dành cho mọi game thủ, Razer Cobra Pro đảm bảo độ chính xác trong từng cú flick, rê chuột. Điều này được đảm bảo thông qua cảm biến quang học Razer Focus Pro 30K, giúp cho Razer Cobra Pro dễ dàng sử dụng trên mọi bề mặt và mang lại sự chính xác trong từng thao tác.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-chuot-razer-cobra-pro-__14__983af05d40bb430ab62f6ce3f825dac3_1024x1024.jpg\" alt=\"GEARVN - Chuột Razer Cobra Pro\" width=\"1024\" height=\"686\"></p><p>Không thể thiếu tiếp theo đó là phần switch chuột với thế hệ Razer Gen-3, Razer Cobra Pro cung cấp tuổi thọ sử dụng lên đến 90 triệu click và giảm thiểu tình trạng double click. Tốc độ phản hồi từ click chuột đến với màn hình máy tính chỉ trong 0.2ms tạo nên độ uy tín trong từng trận chiến, biến lợi thế trở nên rõ ràng hơn dành cho mọi game thủ.</p><h3><strong>Đa dụng với những tùy chỉnh macro</strong></h3><p>Một điều không thể thiếu trên những sản phẩm chuột gaming đó là những phím bấm có thể cài đặt macro. Razer Cobra Pro mang đến những nút bấm trên khắp diện tích sản phẩm, cùng với đó 5 profile đã được thiết lập sẵn trên chiến binh từ nhà tam xà. Qua đó, giúp người dùng có thể thao tác và sử dụng cho mọi nhu cầu sử dụng cho chú <a href=\"https://gearvn.com/collections/chuot-razer\">chuột Razer</a>.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-chuot-razer-cobra-pro-__5__c2740eceee9b4269ad6a81615c080642_1024x1024.jpg\" alt=\"GEARVN - Chuột Razer Cobra Pro\" width=\"1024\" height=\"686\"></p><h3><strong>Kết nối đa dạng</strong></h3><p>Razer Cobra Pro đem đến cho chúng ta 3 kiểu kết nối trên những sản phẩm chuột máy tính ngày nay: có dây, wireless và bluetooth. Khi kết nối thông qua wireless, sức mạnh của công nghệ Razer HyperSpeed đảm bảo độ trễ cực thấp, giữ vững khả năng phản hồi cực nhanh mang lại thao tác chính xác trong mọi tựa game biến Razer Cobra Pro trở thành một trong những con <a href=\"https://gearvn.com/collections/chuot-wireless\">chuột không dây</a> đạt top đầu tối ưu độ trễ.&nbsp;</p><p>Đến với bluetooth, đó là sự đa dụng khi có thể kết nối cùng những thiết bị di động như <a href=\"https://gearvn.com/collections/laptop\">laptop</a>, Razer Cobra Pro cho thời gian sử dụng lên đến 170 tiếng cho bạn thoải mái giải trí và làm việc. Và khi kết nối cùng phần dock sạc Razer HyperPolling Wireless Dongle và Mouse Dock Pro, Razer Cobra Pro có thể mang tời thời lượng 33 tiếng và 100 tiếng với kết nối wireless.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-chuot-razer-cobra-pro-__10__a70908fe60cd4caf93b73cd5778c2661_1024x1024.jpg\" alt=\"GEARVN - Chuột Razer Cobra Pro\" width=\"1024\" height=\"686\"></p><h3><strong>Tỏa sáng bùng nổ cùng Razer Chroma</strong></h3><p>Sản phẩm từ Razer vẫn giữ vững phong độ với khả năng tỏa sáng mình nhờ vào thiết kế chiếu sáng 11-zone. Hỗ trợ bởi công nghệ Razer Chroma cùng vô vàn hiệu ứng, Razer Cobra Pro với 16.8 triệu màu sẽ thể hiện những bữa tiệc ánh sáng tuyệt đỉnh cùng những <a href=\"https://gearvn.com/collections/linh-kien-may-tinh\">linh kiện máy tính</a>. Qua đó, Razer Chroma còn mang đến khả năng tương thích với hơn 200 tựa game để mang đến trải nghiệm gaming thú vị nhất dành cho mọi game thủ. Đồng thời, còn tạo điều thuận lợi khi đặt cạnh các thiết bị chơi game&nbsp;khác trong cùng hệ sinh thái Razer&nbsp;như <a href=\"https://gearvn.com/pages/ban-phim-may-tinh\">bàn phím cơ</a>, <a href=\"https://gearvn.com/collections/tai-nghe-bluetooth-chinh-hang\">tai nghe Bluetooth</a> gaming,..tạo nên góc máy chơi game vô cùng chất lượng.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-chuot-razer-cobra-pro-__9__a6c02f3be52c46daa54b17e3265a2741_1024x1024.jpg\" alt=\"GEARVN - Chuột Razer Cobra Pro\" width=\"1024\" height=\"686\"></p>', 11, 94, 23, '2024-06-30 07:27:53', '2024-06-30 07:27:53'),
(22, 'Bàn phím cơ AKKO 5075B Plus-S Black & Silver Akko Switch v3 Cream Yellow Pro', 'ban-phim-co-akko-5075b-plus-s-black-silver-akko-switch-v3-cream-yellow-pro', 'Switch: AKKO Switch v3 Cream Yellow Pro / Hot Swap', '<p><strong>Thông số kỹ thuật:</strong></p><figure class=\"table\"><table><tbody><tr><td><strong>Thương hiệu</strong></td><td>AKKO</td></tr><tr><td><strong>Series/Model</strong></td><td>AKKO 5075B Plus-S Black &amp; Silver</td></tr><tr><td><strong>Layout</strong></td><td>75%</td></tr><tr><td><strong>Kết nối</strong></td><td>3 chế độ kết nối: Dây / Bluetooth 5.0 / 2.4Ghz<br>(<strong>NSX khuyến cáo chỉ nên cắm USB receiver 2.4ghz vào cổng USB 2.0 để được tín hiệu không dây tốt nhất)</strong></td></tr><tr><td><strong>Pin</strong></td><td>3000mah (Tiêu thụ 12ma / giờ ở chế độ không dây và không bật LED)</td></tr><tr><td><strong>LED</strong></td><td>Nền RGB (6028 SMD LED) với nhiều chế độ và có cả LED 2 bên hông phím</td></tr><tr><td><strong>Hỗ trợ</strong></td><td>NKRO / Multimedia / Macro / Khóa phím Win<br>Hotswap 5 pin TTC socket</td></tr><tr><td><strong>Foam tiêu âm</strong></td><td>Tích hợp sẵn foam tiêu âm PCB, foam đáy silicon và IXPE switch pad</td></tr><tr><td><strong>Kích thước</strong></td><td>33 5x 146 x 42 mm</td></tr><tr><td><strong>Trọng lượng</strong></td><td>~ 1.1Kg</td></tr><tr><td><strong>Keycap</strong></td><td>PBT Double-Shot, ASA profile</td></tr><tr><td><strong>Switch</strong></td><td>AKKO&nbsp;Switch v3 Cream Yellow - Hot swap</td></tr><tr><td><strong>Phụ kiện</strong></td><td>1 sách hướng dẫn sử dụng + 1 dây USB Type-C to USB + 1 USB Receiver 2.4Ghz + 1 Che bụi bàn phím</td></tr><tr><td><strong>Tương thích</strong></td><td>Windows / MacOS / Linux<br>Bàn phím AKKO khi kết nối với MacOS: (Ctrl -&gt; Control | Windows -&gt; Command | Alt -&gt; Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)</td></tr></tbody></table></figure><h2><strong>Đánh giá bàn phím cơ AKKO 5075B Plus - S Black &amp; Silver Akko Switch v3 Cream Yellow Pro</strong></h2><p><strong>Bàn phím cơ AKKO 5075B Plus - S Black &amp; Silver Akko Switch v3 Cream Yellow Pro</strong>&nbsp;là một chiếc <a href=\"https://gearvn.com/collections/ban-phim-tkl\">bàn phím TKL</a> của nhà Akko với thiết kế vô cùng đơn giản nhưng vẫn mang được nét đặc trưng riêng của hãng. Hãy cùng <a href=\"https://gearvn.com/\">GEARVN</a> khám phá chiếc bàn phím classic&nbsp;có gì đặc biệt nhé!</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-ban-phim-co-akko-5075b-plus-s-black-silver-7_c2002b36347546dd9f72529cd0bd9ca8.jpg\" alt=\"Bàn phím cơ AKKO 5075B Plus-S Black &amp; Silver\" width=\"1000\" height=\"563\"></p><h3><strong>Vận chuyển muôn nơi với chiếc bàn phím nhỏ gọn&nbsp;</strong></h3><p>Bàn phím cơ AKKO 5075B Plus - S Black &amp; Silver có trọng lượng 1.1kg cùng với 3 chế độ kết nối khác nhau từ có dây đến wireless và bluetooth giúp bạn dễ dàng kết nối với các thiết bị điện tử. <a href=\"https://gearvn.com/collections/ban-phim-akko\">Bàn phím Akko</a> sẽ là người bạn đồng hành lý tưởng cho thời gian làm việc và giải trí của bạn.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-ban-phim-co-akko-5075b-plus-s-black-silver-6_56ba1aa4a9d349e0b068064c8a9cfe1f.jpg\" alt=\"Bàn phím cơ AKKO 5075B Plus-S Black &amp; Silver\" width=\"1000\" height=\"1000\"></p><h3><strong>Thiết kế nút xoay thẩm mỹ, tiện lợi</strong></h3><p>Bàn phím AKKO 5075B Plus - S Black &amp; Silver được thiết kế với layout 75% cùng núm xoay đặc biệt. Bạn có thể cài đặt núm xoay để chỉnh những chế độ khác nhau như âm lượng hay các chức năng khác một cách tiện lợi và nhanh chóng.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-ban-phim-co-akko-5075b-plus-s-black-silver-3_76695bf4e76444049fe9326d6b1abe01.jpg\" alt=\"Bàn phím cơ AKKO 5075B Plus-S Black &amp; Silver\" width=\"1000\" height=\"1000\"></p><h3><strong>Bàn phím êm ái với cấu trúc thời thượng</strong></h3><p>AKKO 5075B Plus - S Black &amp; Silver được thiết kế với cấu trúc Gasket Mount kết hợp cùng foam tiêu âm PCB mang đến cho bạn sự yên tĩnh và thoải mái khi sử dụng bàn phím đặc biệt là khi gõ văn bản.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-ban-phim-co-akko-5075b-plus-s-black-silver-10_0e6792448d0548ac8736fab82047b55f.jpg\" alt=\"Bàn phím cơ AKKO 5075B Plus-S Black &amp; Silver\" width=\"970\" height=\"600\"></p><h3><strong>Sự kết hợp hoàn hảo giữa switch và keycap</strong></h3><p>Bàn phím gaming Akko sở hữu cho mình AKKO switch V3 - Cream Yellow Pro cùng <a href=\"https://gearvn.com/collections/keycaps\">keycap</a> PBT Double - shot mang đến âm thanh gõ khác biệt cùng cảm giác nhấn mượt mà và độ bền bỉ cao. Bàn phím Akko 5075B Plus - S Black &amp; Silver được trang bị thêm tính năng hot-swap giúp bạn có thể thoải mái custom phím theo mong muốn của mình để tạo ra một chiếc bàn phím \"độc nhất vô nhị\" của bạn.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-ban-phim-co-akko-5075b-plus-s-black-silver-9_72770e4e091f43768d6c1255f4d5f9f0.jpg\" alt=\"Bàn phím cơ AKKO 5075B Plus-S Black &amp; Silver\" width=\"1000\" height=\"722\"></p><h3><strong>Bộ đèn LED RGB đặc biệt</strong></h3><p>AKKO 5075B Plus - S Black &amp; Silver được AKKO trang bị cho mình bộ LED RGB với 16.7 triệu dãy màu khác nhau ở các phím và hai bên bàn phím. Điểm đặc biệt của bộ bàn phím này là LED được cài đặt nháy theo nhạc giúp khoảng thời gian giải trí của bạn đặc biệt và đầy sắc màu.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-ban-phim-co-akko-5075b-plus-s-black-silver-1_eb9245745f8a4b9abc7c906be6e5210a.jpg\" alt=\"Bàn phím cơ AKKO 5075B Plus-S Black &amp; Silver\" width=\"800\" height=\"990\"></p>', 12, 101, 24, '2024-06-30 07:34:04', '2024-06-30 07:38:11'),
(23, 'Bàn phím cơ AKKO 3098B Plus White Akko Switch v3 Cream Blue Pro', 'ban-phim-co-akko-3098b-plus-white-akko-switch-v3-cream-blue-pro', 'Switch: AKKO Switch v3 Cream Blue Pro', '<p><strong>Thông số sản phẩm:</strong></p><figure class=\"table\"><table><tbody><tr><td><strong>Thương hiệu</strong></td><td>Akko</td></tr><tr><td><strong>Model</strong></td><td>AKKO 3098B Plus White</td></tr><tr><td><strong>Số phím</strong></td><td>98 Phím</td></tr><tr><td><strong>Kết nối</strong></td><td>USB Type C, có thể tháo rời / Bluetooth 5.0 (tối đa 3 thiết bị)/ Wireless 2.4Ghz (1 trong 3)<br>(NSX khuyến cáo chỉ nên cắm USB receiver 2.4ghz vào cổng USB 2.0 để được tín hiệu không dây tốt nhất)</td></tr><tr><td><strong>Pin</strong></td><td>3000 mah</td></tr><tr><td><strong>Led</strong></td><td>Nền RGB (Backlit, dạng SMT bottom không cấn switch) với nhiều chế độ</td></tr><tr><td><strong>Hỗ trợ</strong></td><td>NKRO / Multimedia / Macro / Khóa phím Windows</td></tr><tr><td><strong>Foam tiêu âm</strong></td><td>EVA dầy 3.5mm (nằm giữa plate và PCB)</td></tr><tr><td><strong>Foam silicone</strong></td><td>Ở đáy phím</td></tr><tr><td><strong>Stab pre-lubed</strong></td><td>Được tinh chỉnh sẵn</td></tr><tr><td><strong>Kích thước</strong></td><td>382 x 134 x 40 mm</td></tr><tr><td><strong>Trọng lượng&nbsp;</strong></td><td>1.1kg</td></tr><tr><td><strong>Keycap</strong></td><td>PBT Double-Shot, ASA profile</td></tr><tr><td><strong>Phụ kiện</strong></td><td>1 sách hướng dẫn sử dụng + 1 keypuller + 1 cover che bụi + 1 dây cáp USB + USB Receiver 2.4Ghz</td></tr><tr><td><strong>Tương thích</strong></td><td>Windows / MacOS / Linux (có hỗ trợ MAC Function)<br>Bàn phím AKKO khi kết nối với MacOS: (Ctrl -&gt; Control | Windows -&gt; Command | Alt -&gt; Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)</td></tr></tbody></table></figure><h2><strong>Đánh giá chi tiết bàn phím cơ AKKO 3098B Plus White Akko Switch v3 Cream Blue Pro</strong></h2><p><strong>Bàn phím cơ AKKO 309B Plus White</strong> sở hữu cho mình trọng lượng nhẹ nhàng chỉ 1.1kg nhưng lại đầy đủ các phím số bên phải. <a href=\"https://gearvn.com/\">GearVN</a> sẽ cùng bạn đánh giá qua về bàn phím này của nhà AKKO nhé!</p><p><img src=\"https://file.hstatic.net/200000722513/file/arvn-ban-phim-co-akko-3098b-plus-white-akko-switch-v3-cream-blue-pro-7_98bad2cb0bbe4c8499bed7ffb9e167b8.png\" alt=\"bàn phím cơ AKKO 3098B Plus White\"></p><h3><strong>Kết nối linh động với đa dạng thiết bị&nbsp;</strong></h3><p>AKKO 309B Plus White được trang bị 3 khả năng kết nối tương thích với nhiều thiết bị khác nhau như Windows, macOS và Linux.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/arvn-ban-phim-co-akko-3098b-plus-white-akko-switch-v3-cream-blue-pro-5_da7be48da32a41838e3558c6fd80eaf4.png\" alt=\"bàn phím cơ AKKO 3098B Plus White\" width=\"1000\" height=\"1000\"></p><p>Bạn có thể chơi game với độ trễ thấp&nbsp;nhờ USB Type C, Wireless hoặc kết nối <a href=\"https://gearvn.com/collections/ban-phim-co\">bàn phím cơ</a> với 3 thiết bị cùng lúc một cách nhanh chóng.&nbsp;</p><h3><strong>Keycap xuyên LED nền RGB&nbsp;</strong></h3><p>Bàn phím cơ không dây AKKO 309B Plus White sở hữu cho mình bộ keycap ASA profile. <a href=\"https://gearvn.com/collections/keycaps\">Keycap</a> của bàn phím lần này có thiết kế với độ cao vừa phải mang đến cảm giác thoải mái khi gõ lâu.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/arvn-ban-phim-co-akko-3098b-plus-white-akko-switch-v3-cream-blue-pro-7_98bad2cb0bbe4c8499bed7ffb9e167b8.png\" alt=\"bàn phím cơ AKKO 3098B Plus White\"></p><p>Bên cạnh đó bàn phím còn sở hữu bộ LED RGB đặc biệt với tình năng thay đổi màu sắc theo ý muốn của bạn. LED nền RGB kết hợp với bộ keycap xuyên LED sẽ mang đến cho bạn không gian làm việc rực rỡ theo cách riêng.&nbsp;</p><h3><strong>Bàn phím sở hữu AKKO switch V3 khác biệt</strong></h3><p>AKKO nổi tiếng với những bộ switch đặc biệt của hãng và bàn phím AKKO 309B Plus White cũng được AKKO trang bị cho mình bộ switch AKKO switch v3 (Cream Blue Pro).&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/arvn-ban-phim-co-akko-3098b-plus-white-akko-switch-v3-cream-blue-pro-8_13475e07c57644d983ae029120fac026.png\" alt=\"bàn phím cơ AKKO 3098B Plus White\" width=\"1500\" height=\"1500\"></p><p>Điểm khác biệt rõ ràng nhất giữ switch V2 với V3 là biên độ lò xo dày cùng chất liệu POM hoàn toàn mới. Dòng switch V3 sẽ mang lại cho người dùng trải nghiệm độc đáo cùng âm phát thanh phát ra khi gõ khác hoàn toàn các phiên bản trước.&nbsp;</p><h3><strong>Lớp foam silicon dày dặn</strong></h3><p><a href=\"https://gearvn.com/collections/ban-phim-duoi-1-trieu\">Bàn phím không dây</a> AKKO 309B Plus White được thiết kế với bộ foam dày dặn nằm giữa Plate và PCB kết hợp với foam silicone ở đáy phím giúp giảm âm thanh từ khoang phím mang đến trải nghiệm gõ êm ái và thoải mái cho người dùng.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/arvn-ban-phim-co-akko-3098b-plus-white-akko-switch-v3-cream-blue-pro-3_378cdb225f434b1386528f5a0ffe1963.png\" alt=\"bàn phím cơ AKKO 3098B Plus White\" width=\"1000\" height=\"1000\"></p><h3><strong>Hỗ trợ khả năng multimedia</strong></h3><p><a href=\"https://gearvn.com/collections/ban-phim-akko\">Bàn phím AKKO</a> lần này còn được trang bị cho mình tính năng N - key rollover và khoá phím Windows, bạn sẽ đắm chìm trong những cuộc chiến gây cấn mà không xảy ra hiện tượng xót phím hay nhầm phím làm ảnh hưởng đến trận đấu của bạn.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/arvn-ban-phim-co-akko-3098b-plus-white-akko-switch-v3-cream-blue-pro-2_7a54036e8102436b8f3b1713cdcdc126.png\" alt=\"bàn phím cơ AKKO 3098B Plus White\" width=\"1000\" height=\"1000\"></p>', 12, 107, 24, '2024-06-30 07:37:50', '2024-06-30 07:37:50'),
(24, 'Ghế Gaming E-Dra Dignity EGC234 Black', 'ghe-gaming-e-dra-dignity-egc234-black', 'E-Dra Yummy EGC234 Black', '<p><strong>Thông số sản phẩm :</strong></p><figure class=\"table\"><table><tbody><tr><td><strong>Hãng sản xuất:&nbsp;&nbsp; &nbsp;</strong></td><td>E-Dra</td></tr><tr><td><strong>Model:</strong></td><td>E-Dra Yummy EGC234 Black</td></tr><tr><td><strong>Chất liệu</strong></td><td>da PU</td></tr><tr><td><strong>Phần kê tay</strong></td><td>gắn liền - 1D</td></tr><tr><td><strong>Góc nằm max</strong></td><td>150 độ</td></tr><tr><td><strong>Chất liệu khung</strong></td><td>Khung, chân nhựa</td></tr><tr><td><strong>Bộ nâng thủy lực</strong></td><td>Class 2</td></tr><tr><td><strong>Phụ kiện</strong></td><td>Giấy HDSD / Kê chân</td></tr></tbody></table></figure><h2><strong>Đánh giá chi tiết</strong></h2><p>&nbsp;</p><p>Khi nói đến việc tối ưu hóa không gian làm việc và chơi game của bạn, các sản phẩm công nghệ chất lượng cao như <a href=\"https://gearvn.com/collections/ban-gaming\">bàn làm việc</a>, <a href=\"https://gearvn.com/collections/ban-phim-may-tinh\">bàn phím</a>, <a href=\"https://gearvn.com/collections/chuot-may-tinh\">chuột</a> và ghế Gaming&nbsp;là những yếu tố không thể thiếu. Một trong những sản phẩm nổi bật mà <a href=\"https://gearvn.com/\">GEARVN</a> muốn giới thiệu là<a href=\"https://gearvn.com/collections/ghe-e-dra\"> ghế&nbsp;Gaming E-Dra</a> Dignity EGC234 Black. Đây là một lựa chọn tuyệt vời cho những ai đang tìm kiếm sự thoải mái và hỗ trợ tối ưu trong những phiên chơi game kéo dài.</p><h2><strong>Chất liệu cao cấp</strong></h2><p>Ghế Gaming E-Dra Dignity EGC234 Black được bọc da PU cao cấp, không chỉ mang lại vẻ ngoài sang trọng mà còn dễ dàng lau chùi, giúp giữ cho ghế luôn sạch sẽ và mới mẻ. Chất liệu này không chỉ bền bỉ mà còn tạo cảm giác êm ái khi sử dụng. Một trong những yếu tố quan trọng nhất của một chiếc ghế Gaming là đệm mút. Với E-Dra Dignity EGC234 Black, bạn sẽ được trải nghiệm sự thoải mái tuyệt đối nhờ vào lớp đệm mút dày, giúp giảm áp lực lên cơ thể trong suốt thời gian dài ngồi chơi game hay làm việc.</p><p><img src=\"https://file.hstatic.net/200000722513/file/ghe_gaming_e-dra_dignity_egc234_black-1_d49a894421644fb0a65e9ecc522ad143_grande.jpg\" alt=\"Ghế Gaming E-Dra Dignity EGC234 Black\" width=\"600\" height=\"600\"></p><h2><strong>Khả năng điều chỉnh linh hoạt</strong></h2><p>Ghế được thiết kế với khả năng điều chỉnh độ cao, ngả lưng và tay vịn, cho phép người dùng dễ dàng tùy chỉnh theo sở thích và nhu cầu cá nhân.&nbsp;Sử dụng ghế Gaming E-Dra Dignity EGC234 Black không chỉ mang lại sự thoải mái mà còn nâng cao hiệu suất làm việc và chơi game của bạn. Với những tính năng điều chỉnh linh hoạt, bạn có thể dễ dàng tìm được tư thế ngồi lý tưởng, giúp giảm thiểu mệt mỏi và căng thẳng cho cơ thể.</p><p><img src=\"https://file.hstatic.net/200000722513/file/ghe_gaming_e-dra_dignity_egc234_black-2_644aa19921e5472a89f35243f3df6b59_grande.jpg\" alt=\"Ghế Gaming E-Dra Dignity EGC234 Black\" width=\"600\" height=\"400\"></p><h2><strong>Hỗ trợ sức khỏe người dùng</strong></h2><p>Với bệ bướm hỗ trợ lưng dưới, E-Dra Dignity EGC234 Black giúp giảm thiểu nguy cơ đau lưng, một vấn đề thường gặp phải khi ngồi lâu. Thiết kế này đặc biệt hữu ích cho những ai phải làm việc hoặc chơi game trong nhiều giờ liền. Kết hợp &nbsp;piston thủy lực Class 4, mang lại sự ổn định và chắc chắn khi sử dụng. Khả năng chịu tải tối đa lên đến 100kg, đảm bảo sự bền bỉ và an toàn cho người dùng.</p><p><img src=\"https://file.hstatic.net/200000722513/file/ghe_gaming_e-dra_dignity_egc234_black-4_0e23dee9143647b49cc9aff62976b0ff_grande.jpg\" alt=\"Ghế Gaming E-Dra Dignity EGC234 Black\" width=\"600\" height=\"400\"></p><h2><strong>Bánh xe chống ồn</strong></h2><p>Chân ghế được làm từ chất liệu nhựa cao cấp với bánh xe chống ồn, giúp bạn di chuyển mượt mà mà không gây tiếng ồn khó chịu. Điều này đặc biệt quan trọng trong môi trường làm việc hoặc không gian sống cần yên tĩnh.</p>', 13, 113, 25, '2024-06-30 07:41:42', '2024-06-30 07:41:42'),
(25, 'Ghế Ergonomic Warrior Hero series WEC506 Black V2.0', 'ghe-ergonomic-warrior-hero-series-wec506-black-v20', 'Lưng lưới – Mâm ngồi foam lạnh', '<p><strong>Thông số kỹ thuật</strong>:</p><figure class=\"table\"><table><tbody><tr><td><strong>Hãng sản xuất</strong></td><td>Warrior</td></tr><tr><td><strong>Sản phẩm</strong></td><td>Ghế Ergonomic Warrior Hero series WEC506 Black v2.0</td></tr><tr><td><strong>Chất liệu:</strong></td><td>Lưng lưới – Mâm ngồi foam lạnh</td></tr><tr><td><strong>Ngã lưng</strong></td><td>True Tilt (có chức năng khóa / mở ngả lưng)</td></tr><tr><td><strong>Phần kê tay</strong></td><td>3D</td></tr><tr><td><strong>Tựa đầu</strong></td><td>3D</td></tr><tr><td><strong>Trục thủy lực</strong></td><td>Piston Class 3 bền bỉ</td></tr><tr><td><strong>Chân ghế&nbsp;</strong></td><td>Kim loại thiết kế chịu lực</td></tr><tr><td><strong>Màu sắc</strong></td><td>Black</td></tr><tr><td><strong>Tải trọng tối đa&nbsp;</strong></td><td>120kg</td></tr><tr><td><strong>Chiều cao tối đa</strong></td><td>190cm</td></tr></tbody></table></figure><h2><strong>Đánh giá chi tiết ghế Ergonomic Warrior Hero series WEC506 Black v2.0</strong></h2><p>Warrior là một trong những hãng chuyên mang đến thị trường những dòng sản phẩm <a href=\"https://gearvn.com/pages/ghe-gaming-gia-re-gearvn\">ghế gaming</a> chất lượng với giá thành vô cùng hợp lý. Không dừng lại ở đó, để người chơi có thêm lựa chọn cho cảm giác thoải mái cả ngày dài Ergonomic Warrior Hero series WEC506 Black v2.0 sẽ là một trong những sự lựa chọn đó.</p><h3><strong>Tạo cảm giác thoải mái nhờ vào thiết kế Ergonomic</strong></h3><p>&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-ghe-ergonomic-warrior-hero-series-wec506-v2-0_ed4258a8577d4837b935221fb2f0ef92_grande.png\" alt=\"GEARVN-ghe-ergonomic-warrior-hero-series-wec506-v2-0\" width=\"320\" height=\"480\"></p><p>&nbsp;</p><p>Sở hữu thiết kế công thái học với tone màu đen sang trọng, Warrior Hero series WEC506 Black v2.0 phù hợp với mọi không gian từ học tập, làm việc cho đến chơi game giải trí.</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-ghe-ergonomic-warrior-hero-series-wec506-v2-0-8_44497cfb9c874a3ea207d8fcc4e26f52_grande.png\" alt=\"GEARVN-ghe-ergonomic-warrior-hero-series-wec506-v2-0\" width=\"480\" height=\"320\"></p><p>Để tăng thêm năng suất và cảm hứng sáng tạo dòng <a href=\"https://gearvn.com/collections/ghe-warrior\">ghế Warrior</a> được tích hợp nhiều tính năng hiện đại giúp người dùng có cảm giác thoải mái trong suốt ngày dài. Trang bị phần tựa đầu 3D giúp người dùng tránh được những cơn đau vai gáy, kết hợp phần kê tay 3D dễ dàng nâng lên/hạ xuống hỗ trợ bạn thoải mái gõ <a href=\"https://gearvn.com/collections/ban-phim-may-tinh\">bàn phím máy tính</a>, di <a href=\"https://gearvn.com/pages/chuot-may-tinh\">chuột máy tính</a> trong thời gian dài.</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-ghe-ergonomic-warrior-hero-series-wec506-v2-0-1_996c3a06d0234f7fbb37f264966dd1ca_grande.png\" alt=\"GEARVN-ghe-ergonomic-warrior-hero-series-wec506-v2-0\" width=\"320\" height=\"480\"></p><p>&nbsp;</p><p>Ngoài ra, kết hợp với cơ chế ngả lưng True Tilt (có chức năng khóa / mở ngả lưng) để người dùng có thể thoải mái nghỉ ngơi sau cả ngày dài cùng dòng <a href=\"https://gearvn.com/collections/ghe-cong-thai-hoc\">ghế công thái học</a> mới nhất đến từ&nbsp;Warrior.</p><h3><strong>Chất liệu thoáng mát, cao cấp</strong></h3><p>&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-ghe-ergonomic-warrior-hero-series-wec506-v2-0-4_8a7d7061236e4ffe945afe950926d183_grande.png\" alt=\"GEARVN-ghe-ergonomic-warrior-hero-series-wec506-v2-0\" width=\"480\" height=\"320\"></p><p>&nbsp;</p><p>Để tăng thêm phần thoải mái ghế Ergonomic Warrior Hero series WEC506 Black v2.0 được cấu tạo bởi phần lưới cao cấp, có độ bền rất cao mang đến cảm giác thông thoáng. Đặc biệt, với phần mâm ngồi foam lạnh sẽ tăng thêm phần êm ái, rất phù hợp với khí hậu Việt Nam.</p><h3><strong>Tải trọng tối đa lên đến 120kg</strong></h3><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-ghe-ergonomic-warrior-hero-series-wec506-v2-0-7_a639a54ebfe642ca896848e50d2b2e05_grande.png\" alt=\"GEARVN-ghe-ergonomic-warrior-hero-series-wec506-v2-0\" width=\"320\" height=\"480\"></p><p>&nbsp;</p><p>Kiểu dáng&nbsp;ôm lưng, phù hợp với người dùng có chiều cao lên đến 1m9 và chịu được tải trọng tối đa lên đến 120Kg nhờ vào bộ khung chắc chắn, chân kim loại chịu lực tốt.</p><p><img src=\"https://file.hstatic.net/1000026716/file/gearvn-ghe-ergonomic-warrior-hero-series-wec506-v2-0-9_5ecc9885656249aa8a87db1ba7da97a2_grande.png\" alt=\"GEARVN-ghe-ergonomic-warrior-hero-series-wec506-v2-0\" width=\"320\" height=\"480\"></p><p>&nbsp;</p><p>Đặc biệt, để bạn có thể thay đổi chiều cao một cách linh hoạt phù hợp với mọi loại bàn đang sử dụng từ <a href=\"https://gearvn.com/collections/ban-gaming\">bàn gaming</a> cho đến <a href=\"https://gearvn.com/collections/ban-cong-thai-hoc\">bàn công thái học</a>, bàn văn phòng ghế Ergonomic Warrior Hero series WEC506 Black v2.0 được trang bị bộ trục Piston Class 3 bền bỉ.</p>', 14, 117, 25, '2024-06-30 07:46:27', '2024-06-30 07:46:27'),
(26, 'Chuột E-DRA Không dây EM625X Superlight Black', 'chuot-e-dra-khong-day-em625x-superlight-black', 'EM625X Superlight', '<h2><strong>Thông số kỹ thuật:</strong></h2><figure class=\"table\"><table><tbody><tr><td><strong>Hãng sản xuất:</strong></td><td>E-Dra</td></tr><tr><td><strong>Bảo hành:</strong></td><td>24&nbsp;Tháng</td></tr><tr><td><strong>Model:</strong></td><td>EM625X Superlight</td></tr><tr><td><strong>Màu sắc:</strong></td><td>Đen</td></tr><tr><td><strong>Kết nối:</strong></td><td>USB Type-C / Wireless 2.4 / Bluetooth 5.0</td></tr><tr><td><strong>Đèn led:</strong></td><td>RGB</td></tr><tr><td><strong>Kiểu thiết kế:</strong></td><td>Đối xứng</td></tr><tr><td><strong>Độ nhạy ( DPI ):</strong></td><td>800/1600/2400/3200/6400/10000 DPI</td></tr><tr><td><strong>Số nút bấm:</strong></td><td>7D + 1 Scroll</td></tr><tr><td><strong>Switch:</strong></td><td><p>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td>Kailh switch 80 triệu lần nhấn</td></tr></tbody></table></figure><p>&nbsp;</p></td></tr><tr><td><strong>Phụ kiện:</strong></td><td>Cáp đi kèm Type-C</td></tr></tbody></table></figure><h2><strong>Đánh giá chi tiết</strong></h2><p>&nbsp;</p><p>Nếu bạn đang tìm kiếm một con chuột sở hữu&nbsp;những&nbsp;công nghệ tiên tiến để nâng cấp bàn làm việc của mình, Chuột E-DRA Không dây EM625X Superlight Black&nbsp;siêu nhẹ chắc chắn là một sự lựa chọn không thể bỏ qua. Với thiết kế tinh tế, hiệu năng vượt trội và tính năng đa dạng, chuột này không chỉ đáp ứng nhu cầu chơi game mà còn hoàn hảo cho các tác vụ hàng ngày tại bàn làm việc của bạn.</p><h2><strong>Thiết kế công thái học</strong></h2><p><a href=\"https://gearvn.com/collections/chuot-wireless\">Chuột không dây&nbsp;</a>siêu nhẹ với trọng lượng chỉ 60g ± 10g, giúp giảm thiểu sự mỏi tay khi sử dụng trong thời gian dài. Thiết kế công thái học mang lại sự thoải mái tối đa cho người dùng khi cầm nắm, giúp bạn dễ dàng sử dụng trong nhiều giờ mà không bị đau mỏi. Chất liệu cao cấp như nhựa ABS và POM không chỉ bền bỉ mà còn chống mồ hôi tốt, giúp giữ cho chuột luôn sạch sẽ và dễ dàng lau chùi.</p><p>Điểm nhấn của thiết kế này chính là 2 dải LED RGB ở đầu chuột, có thể điều chỉnh đến 16,8 triệu màu sắc khác nhau, mang lại vẻ đẹp lung linh cho <a href=\"https://gearvn.com/collections/ban-gaming\">bàn</a> làm việc của bạn. Đây là sự kết hợp hoàn hảo giữa tính thẩm mỹ và tiện dụng, làm nổi bật không gian làm việc của bạn.</p><p><img src=\"https://file.hstatic.net/200000722513/file/chuot_e-dra_khong_day_em625x_superlight_black-1_b4cbce46c6774b37ac4c6bc4e52a8e8c_grande.jpg\" alt=\"Chuột E-DRA Không dây EM625X Superlight Black\" width=\"600\" height=\"600\"></p><h2><strong>Hiệu năng vượt trội</strong></h2><p>Chuột Chuột E-DRA Không dây EM625X Superlight Black này được trang bị cảm biến Pixart PMW3325DB, cung cấp độ chính xác và độ mượt mà cao, giúp bạn di chuyển chuột một cách mượt mà và chính xác. Độ phân giải cao lên đến 10000 DPI cho phép bạn điều chỉnh độ nhạy của chuột theo nhu cầu sử dụng, từ các công việc văn phòng đến chơi game chuyên nghiệp. Switch Kailh với tuổi thọ lên đến 80 triệu lần nhấn đảm bảo độ bền cao, cho bạn yên tâm sử dụng lâu dài mà không phải lo lắng về việc thay thế.</p><p><img src=\"https://file.hstatic.net/200000722513/file/chuot_e-dra_khong_day_em625x_superlight_black-2_bc2ecd3e37234fcfbe305e2e9b62fe7c_grande.jpg\" alt=\"Chuột E-DRA Không dây EM625X Superlight Black\" width=\"600\" height=\"600\"></p><h2><strong>Kết nối đa dạng</strong></h2><p>Chuột&nbsp;hỗ trợ nhiều phương thức kết nối đa dạng bao gồm cáp USB-C, Bluetooth và 2.4GHz Không dây. ang đến sự linh hoạt tối đa cho người dùng, giúp bạn dễ dàng kết nối chuột với các thiết bị khác nhau từ máy tính bàn, laptop đến các thiết bị di động. Với pin dung lượng cao 300mAh, chuột có thể sử dụng liên tục lên đến 60 giờ. Bạn sẽ không cần phải lo lắng về việc sạc pin thường xuyên, giúp tăng hiệu suất làm việc và chơi game.</p><p><img src=\"https://file.hstatic.net/200000722513/file/chuot_e-dra_khong_day_em625x_superlight_black-3_69ca3c7e896947ed96388cc753992662_grande.jpg\" alt=\"Chuột E-DRA Không dây EM625X Superlight Black\" width=\"600\" height=\"600\"></p><h2><strong>Tính năng đặc biệt</strong></h2><p>Phần mềm E-DRA đi kèm cho phép bạn dễ dàng điều chỉnh các cài đặt của chuột như DPI, tốc độ di chuột, macro và nhiều tính năng khác. Điều này giúp bạn tùy chỉnh chuột theo ý muốn, tạo ra trải nghiệm sử dụng tối ưu nhất.</p>', 13, 129, 23, '2024-06-30 07:51:32', '2024-06-30 07:51:32');
INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `brand_id`, `thumbnail`, `product_seri_id`, `created_at`, `updated_at`) VALUES
(27, 'Màn hình ASUS ProArt PA248QV-P 24\" IPS 75Hz 16:10 chuyên đồ họa', 'man-hinh-asus-proart-pa248qv-p-24-ips-75hz-1610-chuyen-do-hoa', 'Chuyên đồ họa', '<h2><strong>Thông số kĩ thuật:</strong></h2><figure class=\"table\"><table><tbody><tr><td><strong>Hãng sản xuất</strong></td><td>Asus</td></tr><tr><td><strong>Model</strong></td><td>ProArt PA248QV&nbsp;</td></tr><tr><td><strong>Kích thước màn hình</strong></td><td>24.1 inch</td></tr><tr><td><strong>Độ phân giải</strong></td><td>1920x1200</td></tr><tr><td><strong>Tỉ lệ</strong></td><td>16:10</td></tr><tr><td><strong>Tấm nền màn hình</strong></td><td>IPS</td></tr><tr><td><strong>Độ sáng</strong></td><td>300 cd/㎡</td></tr><tr><td><strong>Màu sắc hiển thị</strong></td><td>16.7 triệu màu</td></tr><tr><td><strong>Độ tương phản</strong></td><td>Mặc định:&nbsp;1000:1<br>ASUS Smart Contrast Ratio:&nbsp;100000000:1</td></tr><tr><td><strong>Tần số quét</strong></td><td>75Hz</td></tr><tr><td><br><strong>Cổng kết nối</strong></td><td><ul><li>DisplayPort 1.2 x 1</li><li>HDMI(v1.4) x 1</li><li>VGA x 1</li><li>USB Hub : 4x USB 3.2 Gen 1 Type-A</li><li>Đầu cắm Tai nghe :Có</li><li>Đầu vào âm thanh PC :Có</li></ul></td></tr><tr><td><strong>Thời gian đáp ứng</strong></td><td>5ms (Gray to Gray)</td></tr><tr><td><strong>Góc nhìn</strong></td><td>178°(H)/178°(V)</td></tr><tr><td><strong>Tính năng âm thanh</strong></td><td>2W x 2</td></tr><tr><td><br><br><br><br><br><br><strong>Tính năng video</strong></td><td><ul><li>Công nghệ không để lại dấu trace free :Có</li><li>ProArt Preset : Tiêu chuẩn</li><li>ProArt Preset : sRGB</li><li>ProArt Preset : Rec. 709</li><li>ProArt Preset : Cảnh vật</li><li>ProArt Preset : Đọc</li><li>ProArt Preset : Phòng tối</li><li>ProArt Preset : Dựng hình nhanh</li><li>ProArt Preset : Chế độ Người dùng 1</li><li>ProArt Preset : Chế độ Người dùng 2</li><li>Nhiệt độ màu. Lựa chọn :Có(4 chế độ)</li><li>Điều chỉnh màu sắc :6 trục điều chỉnh(R,G,B,C,M,Y)</li><li>Điều chỉnh thông số gamma :Có (Hỗ trợ Gamma 1.8/2.0/2.2/2.4/2.6 )</li><li>Hiển thị màu chính xác :△E&lt; 2</li><li>ProArt Palette : Có</li><li>QuickFit : Có</li><li>HDCP : Có</li><li>Công nghệ VRR :Adaptive-Sync</li><li>Đồng bộ hóa chuyển động :Có</li><li>Tiện ích ProArt :Có</li><li>Tần suất Ánh sáng Xanh Thấp :Có</li></ul></td></tr><tr><td><br><strong>Kích thước</strong></td><td><ul><li>Với chân đế (WxHxD) : 533 x (375 - 505) x 211 mm</li><li>Không chân đế(WxHxD) : 533 x 360 x 47 mm</li><li>Kích thước hộp (WxHxD) : 649 x 474 x 192 mm</li></ul></td></tr><tr><td><br><strong>Điện năng tiêu thụ&nbsp;</strong></td><td><ul><li>Điện năng tiêu thụ :&lt;15W*</li><li>Chế độ tiết kiệm điện :&lt;0.5W</li><li>Chế độ tắt nguồn :0W (tắt cứng)</li><li>Điện áp :100-240V, 50/60Hz</li></ul></td></tr><tr><td><strong>Khối lượng</strong></td><td><ul><li>Trọng lượng tịnh với chân đế :6.1 Kg</li><li>Trọng lượng tịnh không có chân đế :3.9 Kg</li><li>Trọng lượng thô :8.3 Kg</li></ul></td></tr></tbody></table></figure><p>&nbsp;</p><h2><strong>Đánh giá chi tiết&nbsp;màn hình&nbsp;ASUS ProArt PA248QV-P 24\" IPS 75Hz 16:10 chuyên đồ họa</strong></h2><p>Màn hình&nbsp;<strong>ASUS ProArt PA248QV-P</strong> được trang bị với nhiều công nghệ màn hình tân tiến. Hãng đã đầu tư từ thiết kế đến khả năng trình diễn các hình ảnh, video đẹp mắt. Từ đó mang đến một sản phẩm chuyên đồ họa thu hút sự quan tâm của nhiều nhà thiết kế&nbsp;hay các chuyên gia sáng tạo.&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/arvn-man-hinh-asus-proart-pa248qv-p-24-ips-75hz-16-10-chuyen-do-hoa-13_26d75d720aac4f5da760a59088db919c_1024x1024.png\" alt=\"GEARVN Màn hình ASUS ProArt PA248QV-P 24\" width=\"1024\" height=\"990\"></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><h3><strong>Thiết kế màn hình&nbsp;ASUS ProArt PA248QV-P</strong></h3><p><strong>ASUS ProArt PA248QV-P&nbsp;</strong>là chiếc <a href=\"https://gearvn.com/pages/man-hinh\">màn hình máy tính</a>&nbsp;mới đến từ ASUS với thiết kế hiện đại đáp ứng nhu cầu của các chuyên gia sáng tạo, từ chỉnh sửa ảnh và video cho đến thiết kế đồ họa. Phần&nbsp;khớp xoay tiện lợi với khả năng điều chỉnh chiều cao, trục xoay, độ nghiêng giúp bạn làm việc một cách&nbsp;dễ dàng hơn.</p><p><img src=\"https://file.hstatic.net/1000026716/file/arvn-man-hinh-asus-proart-pa248qv-p-24-ips-75hz-16-10-chuyen-do-hoa-12_601d03823d674f969c25f1fe1e18f618.png\" alt=\"GEARVN Màn hình ASUS ProArt PA248QV-P 24\" width=\"600\" height=\"600\"></p><p><strong>&gt;&gt;Xem thêm: </strong><a href=\"https://gearvn.com/blogs/thu-thuat-giai-dap/tieu-chi-man-hinh-do-hoa\"><strong>Tiêu chí màn hình chuyên đồ họa</strong></a><strong>.</strong></p><h3><strong>Đa dạng về&nbsp;màu sắc, tái hiện sinh động</strong></h3><p>Màn hình ProArt cung cấp 100% sRGB tiêu chuẩn công nghiệp và 100% Rec.&nbsp;<a href=\"https://gearvn.com/collections/bo-doi-man-asus-do-hoa\">Màn hình&nbsp;Asus đồ hoạ</a>&nbsp;với&nbsp;Gam màu 709 cho khả năng tái tạo phong phú, đảm bảo mọi chi tiết đều được tái hiện sắc nét, rực rỡ.</p><p><img src=\"https://file.hstatic.net/1000026716/file/arvn-man-hinh-asus-proart-pa248qv-p-24-ips-75hz-16-10-chuyen-do-hoa-14_802371ba460d49d6bd94c90b2a976800.png\" alt=\"GEARVN Màn hình ASUS ProArt PA248QV-P 24\" width=\"652\" height=\"436\"></p><h3><strong>Độ trung thực màu cao</strong></h3><p>Đạt được ∆E &lt; 2 vì vậy hình ảnh của bạn sẽ được tái hiện qua <a href=\"https://gearvn.com/collections/man-hinh-24-inch\">màn hình 24 inch</a>&nbsp;<strong>ASUS ProArt PA248QV-P&nbsp;</strong>được&nbsp;chính xác cùng độ trung thực cao&nbsp;- cho phép bạn xem chính xác các thành quả sáng tạo&nbsp;của bạn sẽ như thế nào khi hoàn thành.</p><p><img src=\"https://file.hstatic.net/1000026716/file/arvn-man-hinh-asus-proart-pa248qv-p-24-ips-75hz-16-10-chuyen-do-hoa-15_6306c3fdfff44a84b3c0e3b99a5f2592.png\" alt=\"GEARVN Màn hình ASUS ProArt PA248QV-P 24\" width=\"600\" height=\"600\"></p><h3><strong>Độ chuẩn màu được cam kết</strong></h3><p>Đạt được&nbsp;chứng nhận Calman&nbsp;đảm bảo độ chính xác màu hàng đầu trên <a href=\"https://gearvn.com/collections/man-hinh-75hz\">màn hình 75Hz</a> ASUS ProArt. Mỗi màn hình ProArt đều trải qua quá trình kiểm tra nghiêm ngặt, tỉ mỉ để đảm bảo sự chuyển màu mượt mà hơn.</p><p><img src=\"https://file.hstatic.net/1000026716/file/arvn-man-hinh-asus-proart-pa248qv-p-24-ips-75hz-16-10-chuyen-do-hoa-16_6af6403f63f84aeda5954887d31999f5.png\" alt=\"GEARVN Màn hình ASUS ProArt PA248QV-P 24\" width=\"600\" height=\"600\"></p><h3><strong>Tính năng&nbsp;ProArt Preset độc quyền nhà ASUS</strong></h3><p>ASUS ProArt PA248QV-P<strong>&nbsp;</strong>cho phép bạn tùy chỉnh màn hình của mình thông qua một loạt các thông số, bao gồm màu sắc, nhiệt độ và gamma&nbsp;thông qua các menu trên màn hình trực quan.</p><p><img src=\"https://file.hstatic.net/1000026716/file/arvn-man-hinh-asus-proart-pa248qv-p-24-ips-75hz-16-10-chuyen-do-hoa-17_9b71381862464b2c9e7a63fdacf6dcc9.png\" alt=\"GEARVN Màn hình ASUS ProArt PA248QV-P 24\" width=\"600\" height=\"600\"></p><h3><strong>Kết nối phong phú</strong></h3><p>Màn hình ASUS ProArt trang bị các cổng kết nối đa dạng như DisplayPort 1.2, HDMI (v1.4), cổng D-Sub và bộ chia USB tích hợp dễ dàng kết nối với nhiều loại thiết bị và tận hưởng tốc độ truyền cực nhanh với bộ nhớ ngoài.</p><p><img src=\"https://file.hstatic.net/1000026716/file/arvn-man-hinh-asus-proart-pa248qv-p-24-ips-75hz-16-10-chuyen-do-hoa-18_0322bcf9324348fc8d40a4c3a8f72cb6.png\" alt=\"GEARVN Màn hình ASUS ProArt PA248QV-P 24\" width=\"600\" height=\"600\"></p><h3><strong>Công nghệ ASUS Ultra-Low Blue Light</strong></h3><p>Màn hình ASUS ProArt mang đến công nghệ Ultra-Low Blue Light an toàn giúp đôi mắt của bạn làm việc tốt hơn. Hạn chế tối đa tác hại từ ánh sáng xanh trên các thiết bị điện tử đồng thời bảo vệ thị lực cho một ngày làm việc liên tục.&nbsp;</p><p><img src=\"https://file.hstatic.net/1000026716/file/arvn-man-hinh-asus-proart-pa248qv-p-24-ips-75hz-16-10-chuyen-do-hoa-19_212f2056971f4def84004382ec6232d0.png\" alt=\"GEARVN Màn hình ASUS ProArt PA248QV-P 24\" width=\"748\" height=\"618\"></p>', 3, 136, 15, '2024-07-01 06:13:29', '2024-07-01 06:18:32'),
(28, 'Màn hình Dell UltraSharp U2424H 24\" IPS 120Hz', 'man-hinh-dell-ultrasharp-u2424h-24-ips-120hz', 'Chuyên đồ họa', '<h2><strong>Đánh giá chi tiết màn hình Dell UltraSharp U2424H 24\" IPS 120Hz</strong></h2><p>Trong cuộc sống hiện đại, việc có một trải nghiệm làm việc và giải trí mà không gây căng thẳng cho thị giác trở thành một yếu tố quan trọng. <a href=\"https://gearvn.com/collections/man-hinh-dell\">Màn hình Dell</a> UltraSharp U2424H không chỉ là một thiết bị hiển thị thông thường mà còn là một người bạn đồng hành, đảm bảo rằng sự thoải mái và trải nghiệm hình ảnh đỉnh cao luôn là ưu tiên hàng đầu.</p><h3><strong>Bảo vệ mắt vượt trội</strong></h3><p>Màn hình được chứng nhận 4 sao đầu tiên trên thế giới về sự thoải mái cho mắt. Công nghệ Comfortview Plus giảm thiếu ánh sáng xanh có hại xuống &lt; 35%.&nbsp; <a href=\"https://gearvn.com/pages/man-hinh\">Màn hình</a> không nhấp nháy, giúp giảm mỏi mắt và đảm bảo sự thoải mái trong suốt quá trình sử dụng. Công nghệ giảm ánh sáng xanh lam giúp giảm mỏi mắt khi sử dụng lâu, đặc biệt là trong các buổi làm việc dài hạn.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-dell-ultrasharp-u2424h-24-ips-120hz-__3__df7a8d90f291491087b8015dbf894b3d_1024x1024.jpg\" alt=\"GEARVN - Màn hình Dell UltraSharp U2424H 24\" width=\"1024\" height=\"686\"></p><h3><strong>Hình ảnh sắc nét, phân giải&nbsp;</strong></h3><p>Hình ảnh&nbsp;sắc nét&nbsp;và chi tiết, tạo điều kiện thuận lợi cho việc thực hiện các tác vụ hàng ngày mà không cần sử dụng card đồ họa&nbsp;cao cấp. Không chỉ vậy, màn hình rộng lớn cùng độ phân giải cao<a href=\"https://gearvn.com/collections/do-phan-giai-full-hd-1080p\"> Full HD </a>này cũng cung cấp không gian đủ lớn cho cả công việc và giải trí của bạn. Bạn có đủ không gian để làm việc hiệu quả và thưởng thức nội dung giải trí một cách thoải mái trên một màn hình duy nhất.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-dell-ultrasharp-u2424h-24-ips-120hz-__6__536c8a79e60c430eb3d9b8af0f1227bc_1024x1024.jpg\" alt=\"GEARVN - Màn hình Dell UltraSharp U2424H 24\" width=\"1024\" height=\"686\"></p><h3><strong>Chuyển động mượt&nbsp;mà</strong></h3><p>Thời gian phản hồi chỉ 5ms trong chế độ nhanh của Dell UltraSharp U2424H giúp giảm hiện tượng nhòe trong các tình huống chuyển động nhanh, tạo ra một <a href=\"https://gearvn.com/blogs/thu-thuat-giai-dap/dang-ky-netflix-mien-phi\">trải nghiệm xem phim</a> hành động và chơi game mượt mà và không bị gián đoạn. Điều này làm cho màn hình này trở thành lựa chọn lý tưởng cho những người đam mê gaming và muốn thưởng thức các bộ phim hành động một cách sống động và chân thực nhất. Được trải nghiệm trên màn hình Dell UltraSharp U2424H, bạn sẽ không bao giờ bị lỡ lỡ những pha hành động nhanh nhưng quyết liệt.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-dell-ultrasharp-u2424h-24-ips-120hz-__2__3b4847d22699487fa4e91dc7a0f1eef8_1024x1024.jpg\" alt=\"GEARVN - Màn hình Dell UltraSharp U2424H 24\" width=\"1024\" height=\"686\"></p><h3><strong>Kết nối dễ dàng &amp; đa dạng</strong></h3><p>Màn hình Dell U2424HE UltraSharp không chỉ cung cấp hình ảnh sắc nét và chi tiết, mà còn là một công cụ linh hoạt giúp bạn đạt được năng suất cao nhất. Tính năng Auto KVM cho phép kết nối đồng thời với hai <a href=\"https://gearvn.com/\">máy tính</a> và chuyển đổi điều khiển một cách mượt mà. Đồng thời, các tùy chọn kết nối đa dạng bao gồm DisplayPort 1.4, <a href=\"https://gearvn.com/collections/day-cap-hdmi\">HDMI</a> và cổng USB-A, USB-C giúp bạn dễ dàng kết nối với nhiều thiết bị khác nhau. Với công suất lên tới 15W từ cổng USB-C, việc sạc thiết bị di động trở nên thuận tiện hơn bao giờ hết.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-dell-ultrasharp-u2424h-24-ips-120hz-__18__1b6088d3f2d34c02b4e5e1ced4989815_1024x1024.jpg\" alt=\"GEARVN - Màn hình Dell UltraSharp U2424H 24\" width=\"1024\" height=\"686\"></p>', 4, 144, 15, '2024-07-01 06:18:06', '2024-07-01 06:18:06'),
(29, 'Màn hình LG 27QN600 27\" IPS 2K HDR 10 chuyên đồ họa', 'man-hinh-lg-27qn600-27-ips-2k-hdr-10-chuyen-do-hoa', 'Chuyên đồ họa', '<h2><strong>THÔNG SỐ KĨ THUẬT :&nbsp;</strong></h2><figure class=\"table\"><table><tbody><tr><td>Thương hiệu</td><td>LG</td></tr><tr><td>Bảo hành</td><td>24 Tháng</td></tr><tr><td>Kích thước</td><td>27 inch</td></tr><tr><td>Độ phân giải</td><td>QHD (2560 x 1440)</td></tr><tr><td>Tấm nền</td><td>IPS</td></tr><tr><td>Tần số quét</td><td>75Hz</td></tr><tr><td>Thời gian phản hồi</td><td>5ms</td></tr><tr><td>Kiểu màn hình ( phẳng / cong )</td><td>Phẳng&nbsp;</td></tr><tr><td>Độ sáng</td><td>350 cd/m2</td></tr><tr><td>Góc nhìn</td><td>178 (H) / 178 (V)</td></tr><tr><td>Khả năng hiển thị màu sắc</td><td>16.7 triệu màu,&nbsp;SRGB 99%</td></tr><tr><td>Độ tương phản tĩnh</td><td><p>1000 : 1&nbsp;</p><p>&nbsp;</p></td></tr><tr><td>Cổng xuất hình</td><td><p>- HDMI&nbsp;</p><p>- DP</p><p>- VGA</p></td></tr><tr><td>Tính năng đặc biệt</td><td><p>Hiệu chuẩn màu</p><p>Chế độ đọc sách</p><p>Super Resolution+</p><p>Trình ổn định màu đen</p><p>Tiết kiệm điện năng thông minh</p><p>Hiệu ứng HDR</p><p>Chống nháy</p><p>Chế độ cho Người nhận biết màu sắc yếu</p><p>RADEON FreeSync™</p><p>Đồng bộ hóa hành động động</p><p>Chân đế Ergo/Chân đế công thái học<br>VESA treo tường: 100x100</p></td></tr><tr><td>Khối lượng</td><td>5.72&nbsp; kg (có chân đế)<br>4.75 kg (không có chân đế)</td></tr><tr><td>Tiêu thụ điện</td><td>38W</td></tr><tr><td>Kích thước chuẩn</td><td>Gồm chân đế 613.5 x 484.2 x 208.8 mm<br>Không gồm chân đế 613.5 x 363.5 x 45.4 mm</td></tr><tr><td>Phụ kiện đi kèm</td><td>Cáp nguồn, Cổng màn hình, Hướng dẫn sử dụng</td></tr></tbody></table></figure><h2><strong>Màn hình LG 27QN600 27\" IPS 2K HDR 10 chuyên đồ họa</strong></h2><p><strong>Được sinh ra là để dành cho các chuyên gia đồ họa, LG 27QN600 không chỉ là một thiết bị hiển thị mà còn tái hiện cả thế giới trong mắt bạn. Với những khả năng vượt ra ngoài những gì mà một designer phổ thông có thể cần, chắc chắn LG 27QN600 sẽ là sự lựa chọn hoàn hảo cho những người nghệ sĩ tài hoa với đôi mắt tinh tường, khó tính.</strong></p><h3><strong>Thiết kế hiện đại</strong></h3><p><strong>Thiết kế của LG 27QN600 đề cao tính giản lược, và sự thanh thoát. Từng đường nét đều không phức tạp hoa mỹ và không có chi tiết thừa. Chân đế bán nguyệt tạo cảm giác sang trọng tinh tế và thiết kế 3 cạnh không viền sẽ cho bạn một khung nhìn thông thoáng, mãn nhãn hơn.</strong></p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-lg-27qn600-27-ips-2k-hdr-10-__2__ff531cd34aa746bd8488a37b55c0af0b_1024x1024.jpg\" alt=\"GEARVN - Màn hình LG 27QN600 27\" width=\"1024\" height=\"686\"></p><h3><strong>Tiêu chuẩn 2K</strong></h3><p><strong>Là một </strong><a href=\"https://gearvn.com/collections/do-phan-giai-2k-1440p\"><strong>màn hình máy tính 2K</strong></a><strong> giá rẻ, mang đến cho bạn một không gian làm việc cực kỳ thoải mái, hình ảnh cho ra sẽ nét gấp đôi so với độ phân giải Full HD tiêu chuẩn. Việc xử lý hình ảnh độ phân giải cao giờ đây cũng trở nên dễ dàng hơn, giúp bạn thêm yêu công việc, đam mê của mình.</strong></p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-lg-27qn600-27-ips-2k-hdr-10-__3__3cb4fc3f25c845bf848bbaed2e041eb0_1024x1024.jpg\" alt=\"GEARVN - Màn hình LG 27QN600 27\" width=\"1024\" height=\"686\"></p><h3><strong>Hơn cả hiện thực</strong></h3><p><strong>Độ phân giải cực lớn thu gọn trong một tấm nền 27 inch giúp cho mật độ điểm ảnh trở nên dày hơn, vẽ ra trước mắt bạn những hình ảnh cực kỳ sắc nét, tinh xảo (nói tóm lại là nhìn không thấy được điểm ảnh đâu). Tấm nền IPS chất lượng cao cũng cho lại góc nhìn cực rộng và hạn chế tối thiểu hiện tượng biến màu khi thay đổi góc nhìn.</strong></p><p><strong>Được sinh ra là một màn hình dành cho designer chuyên nghiệp, khả năng hiển thị màu sắc của LG 27QN600 cũng rất ấn tượng. Độ bao phủ màu đạt 99% gam màu sRGB cho khả năng thể hiện màu sắc chân thực. Tất cả là để tạo nên những sắc màu chuẩn nhất, sống động nhất, làm cơ sở để bạn sáng tạo nên những tác phẩm trên cả hiện thực. Chiếc màn hình cũng đạt chuẩn HDR10 về khả năng thể hiện hình ảnh.</strong></p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-lg-27qn600-27-ips-2k-hdr-10-__8__a04fdfca61d242a59d23fde5781e2e4f_1024x1024.jpg\" alt=\"GEARVN - Màn hình LG 27QN600 27\" width=\"1024\" height=\"686\"></p><h3><strong>Trọn vẹn khung ảnh</strong></h3><p><a href=\"https://gearvn.com/collections/monitor-lg\"><strong>Màn hình LG</strong></a><strong> này tương thích với công nghệ chống xé hình FreeSync của AMD giúp đồng bộ tần số quét của màn hình với giúp cho từng khung hình xuất ra được đồng một với các lượt quét của màn hình để cho bạn những hình ảnh trọn vẹn hơn, hạn chế tối đa hiện tượng xé hình.</strong></p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-lg-27qn600-27-ips-2k-hdr-10-__1__cb503934ca62471f98f506fa9339d787_1024x1024.jpg\" alt=\"GEARVN - Màn hình LG 27QN600 27\" width=\"1024\" height=\"686\"></p><h3><strong>Xua tan bóng tối</strong></h3><p><strong>Tính năng cân bằng tối (black stabilizer) sẽ làm các chi tiết tối hiện lên nổi bật hơn, hạn chế việc bỏ sót các mục tiêu trong tầm nhìn giúp nâng cao khả năng quan sát và đem lại lợi thế cho game thủ. Tính năng này sẽ phát huy rõ ràng nhất trong game FPS khi mà game thủ cần một đôi mắt tinh tường thời gian phản ứng nhanh.</strong></p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-lg-27qn600-27-ips-2k-hdr-10-__11__5597bc7e46af437d9fef20d0a74e7367_1024x1024.jpg\" alt=\"GEARVN - Màn hình LG 27QN600 27\" width=\"1024\" height=\"686\"></p><h3><strong>Đáp ứng thời gian thực</strong></h3><p><strong>Tính năng Dynamic Action Sync sẽ giúp màn hình giảm được độ trễ tín hiệu đầu vào xuống mức tối thiểu, từ đó mà game thủ sẽ nhận được những hình ảnh từ chiến trường ảo với tốc nhanh nhất có thể, giúp bạn nhìn thấy trước phản ứng trước đối thủ. Đối với một game thủ, ngoài sức mạnh phần cứng và tốc độ đường truyền thì độ trễ </strong><a href=\"https://gearvn.com/collections/man-hinh\"><strong>màn hình máy tính</strong></a><strong> chính là thứ quyết định.</strong></p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-lg-27qn600-27-ips-2k-hdr-10-__15__5167f5a2590140a29a170eadc798f19b_1024x1024.jpg\" alt=\"GEARVN - Màn hình LG 27QN600 27\" width=\"1024\" height=\"686\"></p><p><strong><img src=\"https://file.hstatic.net/1000026716/file/27qn600-10_c5dd26f01be94172820cbaade81080c4.jpg\" width=\"1600\" height=\"800\"></strong></p>', 7, 149, 15, '2024-07-01 06:22:08', '2024-07-01 06:22:08'),
(30, 'Màn hình MSI G255F 25\" Rapid IPS 180Hz chuyên game', 'man-hinh-msi-g255f-25-rapid-ips-180hz-chuyen-game', 'Gaming', '<h2><strong>Đánh giá chi tiết&nbsp;</strong></h2><p>&nbsp;</p><p>Nếu bạn đang tìm kiếm một màn hình chơi game có thời gian phản hồi nhanh, chất lượng hình ảnh vượt trội và thiết kế hiện đại, thì MSI MAG 256F là một sự lựa chọn không thể bỏ qua. Được trang bị những công nghệ&nbsp; hiện đại&nbsp;mang lại trải nghiệm chơi game mượt mà và sắc nét. Điều này đặc biệt quan trọng đối với các game thủ yêu thích các tựa game FPS và MOBA, nơi mỗi khoảnh khắc đều có thể quyết định chiến thắng. Hãy cùng <a href=\"https://gearvn.com/\">GEARVN</a> khám phá chi tiết về những tính năng nổi bật và lợi ích mà màn hình MSI MAG 256F mang lại trong bài đánh giá dưới đây.</p><p>&nbsp;</p><p>&nbsp;</p><h2><strong>Thời gian phản hồi nhanh chóng&nbsp;</strong></h2><p><a href=\"https://gearvn.com/collections/man-hinh-msi\">Màn hình MSI</a> MAG 256F sử dụng tấm nền Rapid IPS, cung cấp góc nhìn rộng 178 độ và màu sắc chính xác. Với thời gian phản hồi nhanh 1ms GTG, người dùng có thể trải nghiệm chơi game mượt mà và sắc nét. Đây là một điểm cộng lớn cho các game thủ, đặc biệt là khi chơi các tựa game FPS (bắn súng góc nhìn thứ nhất) và MOBA (đấu trường trận chiến trực tuyến nhiều người chơi).</p><p><img src=\"https://file.hstatic.net/200000722513/file/man_hinh_msi_mag_256f_-1_5f12195b33cc42d4877df28d4d88b1c9_grande.jpg\" alt=\"Màn hình MSI MAG 256F 25\" width=\"600\" height=\"600\"></p><h2><strong>Chất lượng hình ảnh đỉnh cao</strong></h2><p>Với tốc độ làm mới lên đến 180Hz, <a href=\"https://gearvn.com/pages/man-hinh\">màn hình</a> này giảm thiểu hiện tượng xé hình và nhòe ảnh, mang đến lợi thế cạnh tranh rõ rệt trong các tựa game yêu cầu phản xạ nhanh. Điều này giúp bạn có trải nghiệm chơi game liên tục và không bị gián đoạn. Cùng với công nghệ&nbsp;Adaptive-Sync&nbsp;đây là công nghệ&nbsp; đồng bộ hóa tốc độ làm mới màn hình với card đồ họa, loại bỏ hiện tượng xé hình và nhấp nháy. Đây là tính năng quan trọng giúp bảo vệ mắt người dùng và cải thiện trải nghiệm chơi game. Đặc biệt, màn hình này bao gồm nhiều chế độ cài đặt sẵn cho các loại game khác nhau như FPS, RTS (chiến thuật thời gian thực) và Racing (đua xe). Đây là tính năng đặc biệt hữu ích cho các game thủ chuyên nghiệp.</p><p><img src=\"https://file.hstatic.net/200000722513/file/man_hinh_msi_mag_256f_-3_76b086395f0c4d1d947d3c3673f8d4be_grande.jpg\" alt=\"Màn hình MSI MAG 256F 25\" width=\"600\" height=\"480\"></p><h2><strong>Thiết kế hiện đại</strong></h2><p>Màn hình viền mỏng và chân đế có thể điều chỉnh độ cao, xoay và nghiêng giúp MSI MAG 256F phù hợp với nhiều không gian làm việc và giải trí. Điều này giúp màn hình phù hợp với nhiều không gian làm việc và giải trí khác nhau. Bạn có thể dễ dàng điều chỉnh màn hình để phù hợp với góc nhìn tại <a href=\"https://gearvn.com/collections/ban-cong-thai-hoc\">bàn làm việc</a> hoặc khi sử dụng cùng bàn phím và máy tính.</p><p><img src=\"https://file.hstatic.net/200000722513/file/man_hinh_msi_mag_256f_-2_07bbc048d9074e3282ce2afe1713f849_grande.jpg\" alt=\"Màn hình MSI MAG 256F 25\" width=\"600\" height=\"480\"></p><h2><strong>Bảo vệ mắt giảm thiểu ánh sáng xanh</strong></h2><p>Được chứng nhận chống mỏi mắt bởi TUV Rheinland, màn hình MSI MAG 256F giảm thiểu ánh sáng xanh và nhấp nháy, bảo vệ mắt người dùng trong suốt thời gian dài sử dụng. Điều này cho phép bạn yên tâm sử dụng màn hình trong thời gian dài mà không lo lắng về việc ảnh hưởng đến sức khỏe mắt.</p>', 9, 155, 14, '2024-07-01 06:26:32', '2024-07-01 06:26:32'),
(31, 'Màn hình GIGABYTE G24F 2 24\" IPS 180Hz chuyên game', 'man-hinh-gigabyte-g24f-2-24-ips-180hz-chuyen-game', 'Gaming', '<h2><strong>Thông số kỹ thuật:&nbsp;</strong></h2><figure class=\"table\"><table><tbody><tr><td><strong>Thương hiệu</strong></td><td>GIGABYTE</td></tr><tr><td><strong>Bảo hành</strong></td><td>36 tháng</td></tr><tr><td><strong>Kích thước</strong></td><td>23.8\"</td></tr><tr><td><strong>Độ phân giải</strong></td><td>1920 x 1080 (FHD)</td></tr><tr><td><strong>Tấm nền</strong></td><td>IPS</td></tr><tr><td><strong>Tần số quét</strong></td><td>180Hz</td></tr><tr><td><strong>Thời gian phản hồi</strong></td><td>1ms (MPRT)&nbsp;</td></tr><tr><td><strong>Kiểu màn hình ( phẳng / cong )</strong></td><td>Phẳng&nbsp;</td></tr><tr><td><strong>Độ sáng</strong></td><td>300 cd/m2 (TYP)</td></tr><tr><td><strong>Góc nhìn</strong></td><td>178°(H)/178°(V)</td></tr><tr><td><strong>Khả năng hiển thị màu sắc</strong></td><td>95% DCI-P3, 125% sRGB</td></tr><tr><td><strong>Độ tương phản tĩnh</strong></td><td>1100 : 1</td></tr><tr><td><strong>Cổng kết nối&nbsp;</strong></td><td>2 x HDMI 2.0<br>1 x Displayport 1.2 (capable for HDR)<br>2 x USB 3.2 Gen 1 Downstream ports<br>1 x USB 3.2 Gen 1 Upstream port<br>1 x Earphone Jack</td></tr><tr><td><strong>Tính năng đặc biệt</strong></td><td>OSD Sidekick<br>Aim Stabilizer<br>Black Equalizer<br>Dashboard<br>Crosshair<br>Timer<br>Counter<br>Auto-Update<br>Smart OD</td></tr><tr><td><strong>Khối lượng</strong></td><td>7.83 kg</td></tr><tr><td><strong>Tiêu thụ điện</strong></td><td>17.5W*</td></tr><tr><td><strong>Kích thước chuẩn&nbsp;(WxHxD)</strong></td><td>541 x 519.3 x 136.75 mm</td></tr><tr><td><strong>Hỗ Trợ</strong></td><td>VESA 100 x100</td></tr></tbody></table></figure><h2><strong>Đánh giá chi tiết màn hình GIGABYTE G24F 2 24“ IPS 180Hz chuyên game</strong></h2><p><a href=\"https://gearvn.com/pages/man-hinh\">Màn hình máy tính</a> đóng một vai trò quan trọng trong dàn <a href=\"https://gearvn.com/pages/pc-gvn\">PC gaming</a> bởi nó chính là nơi giao tiếp giữa game thủ và trò chơi. Màn hình <strong>GIGABYTE G24F 2 24“ IPS 180Hz</strong> chuyên game mang đến khả năng xử lý hình ảnh ấn tượng, mang đến trải nghiệm chơi game vô song cho game thủ. Hãy cùng <a href=\"https://gearvn.com/\">GEARVN</a> xem qua chiếc siêu phẩm này có gì nhé.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-gigabyte-g24f-2-24-ips-180hz-chuyen-game-__1__55427bcfac574c2c9bdf85f5ef98aaba_1024x1024.jpg\" alt=\"GEARVN - Màn hình GIGABYTE G24F 2 24\" width=\"1024\" height=\"686\"></p><h3><strong>Chất lượng hiển thị ấn tượng</strong></h3><p>GIGABYTE G24F 2 24 inch sở hữu kích thước <a href=\"https://gearvn.com/collections/man-hinh-24-inch\">màn hình 24 inch</a>, độ phân giải <a href=\"https://gearvn.com/collections/do-phan-giai-full-hd-1080p\">Full HD</a> dưới tấm nền IPS cho khả năng hiển thị hình ảnh chân thật, sống động và rõ nét nhất. Đương nhiên, màn hình gaming luôn đề cao thời gian phản hồi cùng tần số quét để đảm bảo game thủ có thể tận hưởng những giây phút chơi game đỉnh cao nhất có thể.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-gigabyte-g24f-2-24-ips-180hz-chuyen-game-__11__25ac0e7e4edb47c49366a0039701dca8_1024x1024.jpg\" alt=\"GEARVN - Màn hình GIGABYTE G24F 2 24\" width=\"1024\" height=\"686\"></p><p>GIGABYTE G24F 2 24 inch mang trong mình thời gian phản hồi 1ms MPRT và tần số quét 180Hz giúp hình ảnh hiển thị trông mượt mà, liền mạch và cân trọn mọi tựa game cường độ cao. Màn hình còn đạt 95% độ phủ màu <a href=\"https://gearvn.com/blogs/thu-thuat-giai-dap/dci-p3-la-gi\">DCI-P3</a> cho màu sắc sống động và đẹp mắt nhất.</p><h3><strong>Thiết kế đơn giản và thanh lịch</strong></h3><p>GIGABYTE G24F 2 24 inch chính là cụm từ đại diện cho sự đơn giản và cũng là ngôn ngữ dòng Gigabyte gaming hướng đến. Chân đế chắc chắn tạo cảm giác cứng cáp, chắc chắn kết hợp chút nét mềm mại từ lớp phủ mịn lì. Tổng thể GIGABYTE G24F 2 24 inch trông vừa đơn giản vừa thanh lịch và không bao giờ lỗi thời. Thêm vào đó, bạn còn có khả năng điều chỉnh chiều cao và độ nghiêng của màn hình một cách thoải mái nhờ vào thiết kế công thái học hiện đại.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-gigabyte-g24f-2-24-ips-180hz-chuyen-game-__2__07308bfbac5b4dabab98cfc21f07d46e_1024x1024.jpg\" alt=\"GEARVN - Màn hình GIGABYTE G24F 2 24\" width=\"1024\" height=\"686\"></p><h3><strong>Tính năng hỗ trợ chơi game trên GIGABYTE G24F 2 24 inch</strong></h3><p>Gigabyte OSD Sidekick cho phép bạn điều chỉnh nhanh các option hiển thị trên màn hình với bàn phím cùng chuột máy tính. Bên cạnh đó, màn hình Gigabyte còn tích hợp thêm một số tính năng hữu ích cho game thủ như Timer, Counter, Crosshair, Alignment, Aim Stabilizer hay Black Equalizer,...hỗ trợ tối đa mọi tựa game cho người chơi.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-gigabyte-g24f-2-24-ips-180hz-chuyen-game-__3__42e6e613a64b4e7a9c9f060b601a4d53_1024x1024.jpg\" alt=\"GEARVN - Màn hình GIGABYTE G24F 2 24\" width=\"1024\" height=\"686\"></p><h3><strong>Công nghệ hỗ trợ đi kèm</strong></h3><p>Bên cạnh những tính năng hỗ trợ cho game thủ, GIGABYTE G24F 2 24 inch còn tích hợp một số công nghệ hỗ trợ khác như Flicker-Free và Low Blue Light để loại bỏ hoàn toàn tình trạng đau mỏi mắt do phải tiếp xúc với màn hình máy tính quá lâu.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-gigabyte-g24f-2-24-ips-180hz-chuyen-game-__19__72e305c26a0b47a199027dc78810f04d_1024x1024.jpg\" alt=\"GEARVN - Màn hình GIGABYTE G24F 2 24\" width=\"1024\" height=\"686\"></p>', 5, 159, 14, '2024-07-01 06:57:55', '2024-07-01 06:57:55'),
(32, 'Màn hình ACER KG240Y M5 24\" IPS 180Hz chuyên game', 'man-hinh-acer-kg240y-m5-24-ips-180hz-chuyen-game', 'Gaming', '<h2><strong>Thông số sản phẩm:</strong></h2><figure class=\"table\"><table><tbody><tr><td><strong>Kích thước</strong></td><td>24 inch</td></tr><tr><td><strong>Độ phân giải</strong></td><td>Full HD (1920 x 1080)</td></tr><tr><td><strong>Tần số quét</strong></td><td>180Hz</td></tr><tr><td><strong>Tỷ lệ khung hình</strong></td><td>16:9</td></tr><tr><td><strong>Thời gian phản hồi</strong></td><td>1ms (VRB) - 4ms (GtG)</td></tr><tr><td><strong>Màu sắc hiển thị</strong></td><td>16.7 triệu màu sắc, 99% sRGB</td></tr><tr><td><strong>Độ tương phản</strong></td><td>1000:1 / 100,000,000:1</td></tr><tr><td><strong>Độ sáng</strong></td><td>250 cd/m²</td></tr><tr><td><strong>Góc nhìn</strong></td><td>178° / 178°</td></tr><tr><td><strong>Tấm nền</strong></td><td>IPS</td></tr><tr><td><strong>Cổng kết nối</strong></td><td>2 x HDMI (2.0)<br>1 x DisplayPort (1.4)</td></tr><tr><td><strong>Công nghệ chống giật, xé màn hình</strong></td><td>AMD Freesync Premium</td></tr><tr><td><strong>Treo tường VESA</strong></td><td>75 x 75 mm</td></tr></tbody></table></figure><h2><strong>Đánh giá chi tiết màn hình ACER KG240Y M5 24“ IPS 180Hz chuyên game</strong></h2><p>Acer vừa trình làng mẫu<strong> </strong><a href=\"https://gearvn.com/collections/man-hinh-acer\"><strong>màn hình Acer</strong></a><strong> KG240Y M5 24“ IPS 180Hz chuyên game</strong> sở hữu mọi thông số lý tưởng thu hút mọi game thủ. Với kích thước <a href=\"https://gearvn.com/collections/man-hinh-24-inch\">màn hình 24 inch</a> tiêu chuẩn, độ phân giải chuẩn <a href=\"https://gearvn.com/collections/do-phan-giai-full-hd-1080p\">Full HD</a> cùng tần số quét 180Hz hứa hẹn sẽ trở thành kép phụ cực chiến cho bạn trong mọi tựa game.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-acer-kg240y-m5-24-ips-180hz-chuyen-game-__4__8dd120a81d0b4cdaa12fbcea2fcadad5_1024x1024.jpg\" alt=\"GEARVN - Màn hình ACER KG240Y M5 24\" width=\"1024\" height=\"686\"></p><h3><strong>Thiết kế ACER KG240Y M5 hiện đại&nbsp;</strong></h3><p>ACER KG240Y M5 sở hữu kích thước màn hình 24 inch tiêu chuẩn, hầu như phù hợp với mọi không gian chơi game và làm việc. Chân đế hình chữ V tạo nên sự chắc chắn và gọn gàng giúp bạn tận dụng không gian làm việc một cách tối đa. Bên cạnh đó, viền màn hình siêu mỏng Zeroframe mang đến không gian hiển thị rộng rãi, mang đến cảm giác đằm chìm thật sự vào những trận chiến trong game.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-acer-kg240y-m5-24-ips-180hz-chuyen-game-__1__28ad32e672cf4f7a9cb70884c5c3dd26_1024x1024.jpg\" alt=\"GEARVN - Màn hình ACER KG240Y M5 24\" width=\"1024\" height=\"686\"></p><h3><strong>Chất lượng hình ảnh hiển thị cực nét</strong></h3><p>Được trang bị độ phân giải màn hình tiêu chuẩn Full HD cùng tấm nền IPS cho khả năng tái tạo hình ảnh sắc nét và đẹp mắt, cung cấp hình ảnh hiển thị dễ nhìn và sống động. Tỷ lệ khung hình 16:9 thông dụng, hầu như phù hợp với mọi nhu cầu chơi game, giải trí hay làm việc.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-acer-kg240y-m5-24-ips-180hz-chuyen-game-__2__8d991b60e9404df181b50a4e67b2b486_1024x1024.jpg\" alt=\"GEARVN - Màn hình ACER KG240Y M5 24\" width=\"1024\" height=\"686\"></p><h3><strong>Siêu tốc độ, đỉnh gaming</strong></h3><p>Acer chưa bao giờ làm giới game thủ thất vọng với trải nghiệm trên mỗi sản phẩm Acer chuyên game mang lại. <a href=\"https://gearvn.com/collections/man-hinh-tu-5-den-10-trieu\">Màn hình gaming</a>&nbsp;ACER KG240Y M5 thừa hưởng mọi điểm mạnh về tốc độ của Nitro series, tần số quét 180Hz cực kỳ ấn tượng và thời gian phản hồi 1ms VRB giúp game thủ đón đầu mọi đường đi nước bước của đối thủ, tha hồ trải nghiệm tựa game yêu thích mà không hiện tượng bóng mờ hay xé màn hình khó chịu nhờ có sự hỗ trợ của công nghệ đồng bộ hóa thích ứng AMD Freesync Premium.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-acer-kg240y-m5-24-ips-180hz-chuyen-game-__3__2d1c200134d54cb7bfe679a47953a88b_1024x1024.jpg\" alt=\"GEARVN - Màn hình ACER KG240Y M5 24\" width=\"1024\" height=\"686\"></p><h3><strong>Công nghệ HDR10 và bảo vệ thị giác chất lượng</strong></h3><p>Màn hình ACER KG240Y M5 hỗ trợ công nghệ HDR10 cho khả năng hiển thị rõ ràng và độ tương phản rõ ràng giữa sáng và tối. Nhờ có công nghệ HDR10 này, ACER KG240Y M5 mang đến dải màu rộng đẹp mắt, sống động và chân thực, cho phép bạn lạc vào thế giới ảo của game.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-acer-kg240y-m5-24-ips-180hz-chuyen-game-__5__19aa017549f148c89060f122d05e5180_1024x1024.jpg\" alt=\"GEARVN - Màn hình ACER KG240Y M5 24\" width=\"1024\" height=\"686\"></p><p>Không những vậy, ACER KG240Y M5 còn được trang bị công nghệ bảo vệ mắt độc quyền và chất lượng, giúp hạn chế tình trạng đau mỏi mắt khi phải tiếp xúc với <a href=\"https://gearvn.com/pages/man-hinh\">màn hình máy tính</a> quá lâu. Đây chính là điểm cộng lớn cho những người dùng như lập trình viên, thiết kế đồ họa và những game thủ chuyên nghiệp.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-acer-kg240y-m5-24-ips-180hz-chuyen-game-__14__ad594b062a3c4b61a14e1c53eac0698a_1024x1024.jpg\" alt=\"GEARVN - Màn hình ACER KG240Y M5 24\" width=\"1024\" height=\"686\"></p>', 1, 164, 14, '2024-07-01 07:00:29', '2024-07-01 07:00:29'),
(33, 'Màn hình LG 27GR75Q-B UltraGear 27\" IPS 2K 165Hz Gsync chuyên game', 'man-hinh-lg-27gr75q-b-ultragear-27-ips-2k-165hz-gsync-chuyen-game', 'Gaming', '<h2><strong>Đánh giá chi tiết&nbsp;màn hình LG 27GR75Q-B UltraGear 27\" IPS 2K 165Hz Gsync chuyên game</strong></h2><p>LG là ông lớn công nghệ đến từ Hàn Quốc. Những sản phẩm của LG mang vẻ ngoài thanh lịch, hiện đại, được chau chuốt tỉ mỉ và cẩn thận. Bên cạnh đó chất lượng là điều không thể bàn cãi với giá thành nó mang lại. <a href=\"https://gearvn.com/collections/monitor-lg\">Màn hình LG</a> LG 27GR75Q-B cũng không ngoại lệ. Màn hình chuyên game sở hữu kích thước <a href=\"https://gearvn.com/collections/man-hinh-27-inch\">27 inch</a> tiêu chuẩn với tấm nền IPS tiêu chuẩn mới giúp game thủ đắm chìm vào mọi trận game đầy cam go.</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-lg-32gr93u-b-4_94bc900e5d894be18d5663af22d912c6.jpg\" width=\"1600\" height=\"650\"></p><p>&nbsp;</p><h3><strong>Màn hình cao cấp dành cho game thủ</strong></h3><p><a href=\"https://gearvn.com/pages/man-hinh\">Màn hình máy tính</a> sở hữu độ chuẩn màu cũng rất cao đạt <a href=\"https://gearvn.com/blogs/thu-thuat-giai-dap/dci-p3-la-gi\">DCI-P3</a> 95% (CIE1976) mang đến khả năng tái tạo màu sắc đáng kinh ngạc. Bạn sẽ vô cùng mãn nhãn với chất lượng đồ họa LG 27GR75Q-B UltraGear mang lại cho bạn. Độ phân giải màn hình 2K là một con số vô cùng ấn tượng và cao cấp cho phân khúc màn hình gaming.</p><h3><strong>Tần số quét và thời gian phản hồi chuẩn game</strong></h3><p>Là một <a href=\"https://gearvn.com/collections/man-hinh-tu-5-den-10-trieu\">màn hình chuyên game</a> nên LG 27GR75Q-B UltraGear được đầu tư hẳn hoi về tần số quét và thời gian phản hồi nhằm mang đến trải nghiệm chơi game tốt nhất cho người chơi. Tần số quét màn hình 165Hz và thời gian phản hồi 1ms GtG giúp bạn đón đầu đối thủ và dành chiến thắng trong mọi cuộc chơi.</p><p><img src=\"https://file.hstatic.net/200000722513/file/man-hinh-lg-27gr75q-b-1_0ad6a97354324be1800b278420cfe863.jpg\" width=\"1340\" height=\"731\"></p><p>&nbsp;</p><h3><strong>Công nghệ màn hình hiện đại</strong></h3><p>Tương thích với công nghệ chống <a href=\"https://gearvn.com/blogs/thu-thuat-giai-dap/xe-man-hinh-la-gi\">xé màn hình</a> từ Nvidia G-sync và AMD FreeSync hoàn hảo đồng bộ cùng tần số quét cực cao. Công nghệ AMD FreeSync™ Premium giúp game rõ ràng hơn, mượt mà và nhanh hơn. Còn đối với công nghệ FreeSync™ Premium, người chơi game có thể trải nghiệm chuyển động liền mạch, trôi chảy trong những trò chơi có độ phân giải cao và tốc độ nhanh. Công nghệ này hầu như loại bỏ được hiện tượng trộn hình và giật hình thường gặp phải ở những màn hình máy tính thông thường.</p><h3><strong>Thiết kế sành điệu, đậm chất gaming</strong></h3><p>Trải nghiệm tuyệt vời hơn khi chơi game nhờ thiết kế bắt mắt và viền màn hình siêu mỏng. Thiết kế chân đế màn hình thông minh để người chơi có thể thay đổi độ nghiêng, độ cao và độ xoay của màn hình, giúp bạn chơi game thoải mái hơn.</p><p><img src=\"https://file.hstatic.net/200000722513/file/man-hinh-lg-27gr75q-b-w_571f231cd5d44150bfe9102dca269f0f.jpg\" width=\"1600\" height=\"800\"></p>', 7, 168, 14, '2024-07-01 07:04:54', '2024-07-01 07:04:54'),
(34, 'Màn hình cong Asus ROG STRIX XG27WCS 27\" 2K 180Hz chuyên game', 'man-hinh-cong-asus-rog-strix-xg27wcs-27-2k-180hz-chuyen-game', 'Màn cong', '<p><strong>Đánh giá chi tiết</strong></p><p>Màn hình cong Asus ROG STRIX XG27WCS là một trong những màn hình chơi game cao cấp nhất hiện nay, được thiết kế để mang lại trải nghiệm chơi game tuyệt vời. Với những tính năng tiên tiến và thiết kế tinh tế, màn hình này đáp ứng mọi nhu cầu của các game thủ và những người làm việc trong lĩnh vực đồ họa.&nbsp;Màn hình cong Asus ROG STRIX XG27WCS là còn lựa chọn hoàn hảo cho những ai đam mê chơi game và muốn nâng cao trải nghiệm giải trí của mình. Với thiết kế hiện đại và những tính năng ưu việt, <a href=\"https://gearvn.com/pages/man-hinh\">màn hình</a> này hứa hẹn sẽ mang lại cho bạn những giây phút chơi game tuyệt vời nhất.</p><h2><strong>Độ phân giải sắc nét</strong></h2><p><a href=\"https://gearvn.com/collections/man-hinh-asus\">Màn hình Asus</a> ROG STRIX XG27WCS có kích thước 27 inch, mang đến một không gian hiển thị rộng rãi và sắc nét. Với độ phân giải WQHD (2560 x 1440), màn hình này đảm bảo cung cấp hình ảnh chi tiết và rõ ràng, giúp bạn đắm chìm vào thế giới ảo một cách chân thực.&nbsp;Sử dụng tấm nền VA, Asus ROG STRIX XG27WCS mang lại chất lượng hình ảnh tuyệt vời với độ tương phản 3000:1. Điều này giúp tái hiện hình ảnh với màu sắc sống động và sâu sắc, nâng cao trải nghiệm thị giác cho người dùng.</p><p><img src=\"https://file.hstatic.net/200000722513/file/man_hinh_cong_asus_rog_-1_9f3d466ca02c4e7dad86bdd120090cca_grande.jpg\" alt=\"Màn hình cong Asus ROG STRIX XG27WCS 27\" width=\"600\" height=\"600\"></p><h2><strong>Giảm thiểu giật lag màn hình</strong></h2><p>Một trong những điểm mạnh của Asus ROG STRIX XG27WCS là tốc độ làm mới lên tới 180Hz. Đảm bảo rằng mọi chuyển động trên màn hình đều mượt mà, giảm thiểu tối đa hiện tượng xé hình. Bên cạnh đó, thời gian phản hồi 1ms giúp loại bỏ hiện tượng bóng mờ, mang lại trải nghiệm chơi game nhạy bén và chính xác.</p><p><img src=\"https://file.hstatic.net/200000722513/file/man_hinh_cong_asus_rog_-2_59c2684ad1ca435c8f2b1762678a6941_grande.jpg\" alt=\"Màn hình cong Asus ROG STRIX XG27WCS 27\" width=\"600\" height=\"600\"></p><h2><strong>Thiết kế hiện đại và linh hoạt</strong></h2><p>Với gam màu rộng 120% sRGB và 90% AdobeRGB, màn hình này cung cấp màu sắc chân thực và phong phú, phù hợp cho cả chơi game và công việc thiết kế đồ họa. Asus ROG STRIX XG27WCS còn được trang bị nhiều cổng kết nối như HDMI 2.0 x 2, DisplayPort 1.4 và USB Type-C, đáp ứng đầy đủ nhu cầu kết nối của người dùng.</p><p><img src=\"https://file.hstatic.net/200000722513/file/man_hinh_cong_asus_rog_-3_56ba676766004d9da492c258a7d0351e_grande.jpg\" alt=\"Màn hình cong Asus ROG STRIX XG27WCS 27\" width=\"600\" height=\"600\"></p><h2><strong>Chân đế điều chỉnh linh hoạt</strong></h2><p>Màn hình Asus ROG STRIX XG27WCS còn hỗ trợ công nghệ HDR10, mang lại hình ảnh có độ tương phản cao và màu sắc sống động. Chân đế của màn hình có thể điều chỉnh độ cao, xoay, nghiêng và xoay trục, giúp người dùng dễ dàng tùy chỉnh theo ý muốn để có góc nhìn thoải mái nhất.</p>', 3, 176, 16, '2024-07-01 07:29:48', '2024-07-01 07:29:48'),
(35, 'Màn hình cong GIGABYTE GS27FC 27\" 180Hz chuyên game', 'man-hinh-cong-gigabyte-gs27fc-27-180hz-chuyen-game', 'Màn cong', '<h2><strong>Đánh giá chi tiết về sản phẩm màn hình cong GIGABYTE GS27FC 27\" 180Hz chuyên game</strong></h2><p><a href=\"https://gearvn.com/pages/man-hinh\">Màn hình máy tính</a>&nbsp;GIGABYTE GS27FC 27\" 180Hz là một trong những dòng sản phẩm thiết bị máy tính có thiết kế thẩm mỹ cao và linh hoạt góc độ trải nghiệm,&nbsp;đi kèm thông số cực khủng của chiếc màn hình máy tính này hứa hẹn đem lại trải nghiệm cực kỳ ấn tượng và hút mắt với cái nhìn đầu tiên khi lựa chọn để <a href=\"https://gearvn.com/pages/pc-gvn\">Build PC</a> Gaming.</p><p>&nbsp;</p><h3><strong>Thiết kế phong cách thu hút</strong></h3><p>Bên cạnh cấu hình cao thì thiết kế là điểm nổi bật của chiếc màn&nbsp;cong GIGABYTE GS27FC 27\" 180Hz này, với viền màn hình mỏng, độ cong tinh tế giúp cho chiếc màn hình toát lên vẻ sang trọng và gọn gàng cho không gian máy tính của bạn.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-cong-gigabyte-gs27fc-27-180hz-chuyen-game-1_02c02fbc322e49dfab856f607a6fbaa4_grande.png\" alt=\"Màn hình cong GIGABYTE GS27FC 27\" width=\"600\" height=\"600\"></p><p>Thiết kế khung chân của chiếc máy được làm&nbsp;dặn chắc chắn về bề ngang với độ nghiêng chữ V có thể giúp góc nhìn hai bên trông mượt và đem lại cảm giác thông thoáng, nhưng đánh đổi của việc đem lại sự vững vàng hỗ trợ cho góc nghiêng đẹp và sự linh hoạt thì phần trực diện của phần chân màn hình&nbsp; vẫn còn đơn giản, nhưng về tổng thể đây là chiếc màn hình máy tính được đánh&nbsp;giá là đẹp.&nbsp;&nbsp;&nbsp;</p><p>&nbsp;</p><h3><strong>Chất lượng hình ảnh và thời gian phản hồi ấn tượng</strong></h3><p>Với trải nghiệm gần như không cảm nhận của độ trễ khi thông số phản hồi của màn hình chỉ là&nbsp;1ms (MPRT), giúp giảm hiện tượng nhòe hình khi chơi game nên&nbsp;cho ra trải nghiệm về hình ảnh là cực tốt. Một điểm sáng về công nghệ mà chiếc màn hình này được tích hợp là công nghệ&nbsp;Eyesafe® được chứng nhận&nbsp;2.0, đem lại cho bạn sự an toàn về mắt nhưng vẫn đảm bảo duy trì&nbsp;hiệu suất&nbsp;hiển thị màu của màn ảnh.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-cong-gigabyte-gs27fc-27-180hz-chuyen-game-6_7cfdd94e0b094e53a261f4658f576e25_grande.png\" alt=\"Màn hình cong GIGABYTE GS27FC 27\" width=\"600\" height=\"399\"></p><p>Màn hình được lắp đặt với tấm nền VA cung cấp độ phân giải Full HD (1920 x 1080), tần số quét siêu khủng lên đến 180HZ, độ sáng màn hình ở mức khá dễ chịu là 250cd/㎡, hiển thị được 16,7 triệu màu sắc đem lại trải nghiệm vượt mức và chân thực đến từng khung hình máy tính.&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-cong-gigabyte-gs27fc-27-180hz-chuyen-game-5_1ab7d8e8bc2242fdaa72ed6d307fdf0f_grande.png\" alt=\"Màn hình cong GIGABYTE GS27FC 27\" width=\"600\" height=\"600\"></p><p>Với việc kết hợp với một chiếc <a href=\"https://gearvn.com/collections/vga-card-man-hinh\">card màn hình</a> tốt thì mọi trải nghiệm về hình ảnh của bạn với chiếc màn hình này gần như không có điểm trừ nào vì với khả năng đồng bộ hóa thích ứng <a href=\"https://gearvn.com/blogs/cong-nghe/amd-freesync-freesync-premium-va-freesync-premium-pro-la-gi-day-la-cau-tra-loi-cho-ban\">AMD FreeSync Premium</a> giúp điều chỉnh tần số làm mới của màn hình để phù hợp với tần số khung hình của card đồ họa, giúp giảm hiện tượng rách hình và giật hình khi chơi game.&nbsp;&nbsp;</p><p><strong>Trải nghiệm góc nhìn cực tốt và an toàn</strong></p><p>Màn hình&nbsp;GIGABYTE GS27FC 27\"&nbsp;được đánh&nbsp;giá là một trong những màn hình đáp&nbsp;ứng tốt góc nhìn cho người dùng từ nhu cầu chơi game, xem phim, và thiết kế hình ảnh...v.v. Màn hình có kích thước 27 inch, độ cong 1500R, giúp tạo ra hiệu ứng hình ảnh bao phủ và thoải mái hơn cho người dùng so với dòng màn hình phẳng, đem lại trải nghiệm cực tốt và siêu&nbsp;thực&nbsp;cho mọi nhu cầu về hình ảnh.&nbsp;</p><p>&nbsp;</p><p><img src=\"https://file.hstatic.net/200000722513/file/gearvn-man-hinh-cong-gigabyte-gs27fc-27-180hz-chuyen-game-3_cae14564dcb94866a493c0738246cc75_grande.png\" alt=\"Màn hình cong GIGABYTE GS27FC 27\" width=\"600\" height=\"508\"></p><p>&nbsp;</p><p>&nbsp;</p><p>Việc thiết kế khung viền của chiếc <a href=\"https://gearvn.com/products/man-hinh-cong-gigabyte-gs27fc-27-180hz-chuyen-game\">màn hình cong GIGABYTE GS27FC 27\" 180Hz</a> có khả năng điều chỉnh lên xuống với góc khá thoải mái (Độ nghiêng: -5° đến&nbsp;+20°) giúp cho bạn tối ưu được góc nhìn phù hợp, hỗ trợ&nbsp;bạn điều chỉnh độ cao&nbsp;chiếc <a href=\"https://gearvn.com/pages/ghe-gaming-gia-re-gearvn\">ghế gaming</a>&nbsp;cũng như căn chỉnh chỗ&nbsp;ngồi và hướng nhìn của bạn được thoải mái nhất.</p>', 5, 178, 16, '2024-07-01 07:35:02', '2024-07-01 07:35:23'),
(36, 'Tay cầm Game Dare-U H105 - Trắng', 'tay-cam-game-dare-u-h105-trang', 'Tay cầm Game', '<p><strong>THÔNG SỐ CƠ BẢN:</strong></p><ul><li>Model: H105</li><li>Size: 156mm * 113mm * 65 mm</li><li>Keys: 24 keys for the whole machine</li><li>Connection mode: USB cable+2.4G+Bluetooth</li><li>Weight: about 210g</li><li>Battery: 930mA</li><li>Lamp effect: RGB</li><li>Power consumption: no vibration (＜ 45mA), vibration (＜ 100mA)</li><li>Service time: about 25 hours, 3-3.5 hours of charging</li><li>Applicable platform: PC/Android</li><li>System requirements: Windows 7/8/10/11, Android 5.0 or above</li><li>More:<ul><li>Dare-U H105 - <a href=\"https://tinhocngoisao-1.myharavan.com/products/tay-cam-game-dare-u-h105-hong-triple-mode-usb-cable-2-4g-bluetooth\"><strong>Pink</strong></a></li><li>Dare-U H105 - <a href=\"https://tinhocngoisao-1.myharavan.com/products/tay-cam-game-dare-u-h105-den-triple-mode-usb-cable-2-4g-bluetooth\"><strong>Black</strong></a></li></ul></li></ul>', 15, 182, 27, '2024-07-01 07:40:48', '2024-07-01 07:41:02'),
(37, 'iPad 10.2 2021 WiFi 64GB | Chính hãng Apple Việt Nam', 'ipad-102-2021-wifi-64gb-chinh-hang-apple-viet-nam', 'iPad 10.2 2021 WiFi', '<h2><strong>iPad Gen 9 (10.2 inch) 2021 - Hiệu năng đỉnh với mức giá sinh viên</strong></h2><p>Sau sự thành công của chiếc iPad Gen 8 cùng với iPad Air 4, Apple lại tiếp tục rục rịch cho ra mắt thêm sản phẩm mới. Thiết bị mang tên <strong>iPad Gen 9</strong>, kế thừa đặc trưng của dòng nhưng được nâng cấp thêm về hiệu năng cũng như camera.</p><p>Năm 2022, Apple vừa cho ra mắt sản phẩm <a href=\"https://cellphones.com.vn/ipad-10-9-inch-2022.html\"><strong>iPad Gen 10</strong></a> mà bạn không nên bỏ qua!</p><h3><strong>Thiết kế mỏng nhẹ, màn hình kích thước 10.2 inches</strong></h3><p>iPad 10.2 inch 2021 vẫn mang thiết kế đặc trưng bởi sự mỏng và nhẹ, giúp người dùng dễ thao tác, cầm nắm trong hàng giờ liền mà không hề cảm thấy bị mỏi hay khó chịu. Thiết kế nguyên khối đã là nét đặc trưng của dòng sản phẩm iPad giúp mang lại vẻ sang trọng khi sử dụng tên tay.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/tablet/iPad/iPad-Gen-9-102-inch-2021-1.jpg\" alt=\"29095\" width=\"810\" height=\"456\"></p><p>Màn hình của iPad 10.2 inch 2021 kích thước lớn cùng khả năng hiển thị sống động. Màn hình&nbsp;True Tone trên&nbsp;<a href=\"https://cellphones.com.vn/tablet/ipad-10-2.html\">iPad 10.2 inch</a> còn hỗ trợ điều chỉnh&nbsp;màn hình theo nhiệt độ màu.</p><h3><strong>Cấu hình mạnh mẽ bởi chip A13 Bionic, bộ nhớ trong dung lượng lớn</strong></h3><p><strong>iPad Gen 9</strong> được cung cấp sức mạnh bởi con chip A13 Bionic. Đây là con chip được sán xuát trên tiến trình 7nm+, cho phép xử lý hiệu suất cao gấp 6 lần so với thế hệ trước.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/tablet/iPad/iPad-Gen-9-102-inch-2021-2.jpg\" alt=\"29095\" width=\"810\" height=\"456\"></p><p>Chưa hết, củng cố thêm sức mạnh cho chiếc iPad Gen 9 đó là dung lượng RAM lớn, hỗ trợ hoạt động đa nhiệm tốt. Bên cạnh đó, người dùng có thêm sự lựa chọn đến từ bộ nhớ trong 64GB. Ngoài ra, thiết bị còn nhiều phiên bản bộ nhớ khác tùy vào nhu cầu sử dụng của người dùng.</p>', 2, 209, 8, '2024-07-01 08:07:49', '2024-07-01 08:11:30');
INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `brand_id`, `thumbnail`, `product_seri_id`, `created_at`, `updated_at`) VALUES
(38, 'Thẻ nhớ SanDisk Class 10', 'the-nho-sandisk-class-10', 'Thẻ nhớ SanDisk Class 10 128GB 100MB/s -Thiết kế bền bỉ, lưu trữ và truyền tải nhanh chóng', '<p>Hiện nay nhu cầu lưu trữ dữ liệu và hình ảnh của người dùng ngày càng lớn, bộ nhớ của thiết bị không đủ đáp ứng nhu cầu của bạn. Chính vì thế <a href=\"https://cellphones.com.vn/the-nho-sandisk-32gb-class-10-100mbs.html\">thẻ nhớ SanDisk Class 10</a> 128GB 100MB/s ra đời. SanDisk Class 10 với thiết kế nhỏ gọn bền bỉ dung lượng lưu trữ lớn truyền tải dữ liệu nhanh chóng khiến chiếc thẻ nhớ ngày nổi bật trong thị trường hiện nay.</p><h3><strong>Thiết kế nhỏ gọn, chống thấm nước và chống nhiệt</strong></h3><p>Thẻ nhớ SanDisk Class 10 128GB đến từ thương hiệu nổi tiếng về các thiết bị phụ kiện chất lượng cao Sandisk (USA) sở hữu thiết kế cực kì nhỏ gọn được hoàn thiện từ chất liệu cao cấp. Mặc dù có thiết kế nhỏ gọn nhưng cực kì bền bỉ, chiếc thẻ nhớ này đã trải qua rất nhiều bài thử nghiệm trong môi trường khắc nhiệt.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/accessories/memory_card/The-nho-MicroSD-SanDisk-Ultra-A1.jpg\" alt=\"Thiết kế nhỏ gọn, chống thấm nước và chống nhiệt\" width=\"840\" height=\"454\"></p><p>Chiếc thẻ nhớ này không hề thấm nước, chống nhiệt, chống sốc, chống tia X-ray, và chống từ trường nam châm, vì vậy dữ liệu của bạn luôn luôn được bảo vệ một cách an toàn tuyệt đối. Người dùng hoàn toàn có thể yên tâm về chất lượng của SanDisk Class 10 128GB khi sử dụng.</p><h3><strong>Dung lượng lên tới 128GB, tốc độ đọc 100MB/s</strong></h3><p>Một trong những điều người dùng quan tâm hàng đầu khi chọn mua thẻ nhớ chính là dung lượng và tốc độ đọc ghi. Với thẻ nhớ SanDisk Class 10 128GB có dung lượng tới 128GB cho không gian lưu trữ dữ liệu và hình ảnh cực kì lớn. Nếu là một người thường xuyên có nhu cầu lưu trự dữ liệu thì chiếc thẻ nhớ này bạn không thể nào bỏ lỡ.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/accessories/memory_card/The-nho-MicroSD-SanDisk-Ultra-A1-2.jpg\" alt=\"Dung lượng lên tới 128GB, tốc độ đọc 100MB/s\" width=\"840\" height=\"454\"></p><p>Không chỉ có thế tốc độ đọc của thẻ lên đến 100MB/s bỏ xa rất nhiều các đối thủ khác trên thị trường hiện nay. Chiếc thẻ nhớ này cho phép bạn truyền tải hình ảnh độ phân giải cao và video Full HD sang máy tính của bạn với thời gian truyền tải được rút ngắn một cách đáng kể.</p><h3><strong>Tốc độ ghi 10 ~ 15 MB/s, Back Up dữ liệu nhanh chóng với Memory Zone App</strong></h3><p>Tốc độ ghi của sản phẩm lên tới 10 ~ 15 MB/s, bên cạnh đó người dùng còn có thể load ứng dụng cực nhanh với chuẩn tốc độ A1. Thẻ nhớ SanDisk Class 10 128GB 100MB/s được nhà sản xuất tối ưu hóa dành cho các ứng dụng, mang lại tốc độ khởi chạy và hiệu suất cực kì cao để bạn có thể trải nghiệm ứng dụng tốt nhất từ thiết bị của mình. Người dùng có thể quay phim và phát lại video Full HD mà không mất bất kì khung hình nào khi sở hữu tốc độ chuẩn Class 10.</p><p><img src=\"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/accessories/memory_card/The-nho-MicroSD-SanDisk-Ultra-A1-3.jpg\" alt=\"Tốc độ ghi 10 ~ 15 MB/s, Back Up dữ liệu nhanh chóng với Memory Zone App\" width=\"840\" height=\"454\"></p><p>Ngoài ra bạn còn có thể lưu trữ lên đến 24h video Full HD trước khi bạn phải chuyển các tập tin vào máy tính của bạn nhờ vào dung lượng lưu trữ được mở rộng lên tới 400GB. Chỉ với vài thao tác đơn giản bạn đã có thể Back Up dữ liệu của mình thông qua phần mềm Memory Zone App. Ứng dụng này cho phép người dùng xem, truy cập và sao lưu tất cả các tập tin của bạn từ bộ nhớ điện thoại. Hay thậm chí có thể thiết lập tự động di chuyển các tập tin từ bộ nhớ trong của điện thoại vào thẻ nhớ.</p>', 16, 210, 34, '2024-07-08 09:20:58', '2024-07-08 09:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `product_option_id` bigint UNSIGNED NOT NULL,
  `attribute_value_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `product_option_id`, `attribute_value_id`, `created_at`, `updated_at`) VALUES
(6, 5, 20, NULL, NULL),
(7, 5, 33, NULL, NULL),
(8, 6, 20, NULL, NULL),
(9, 6, 34, NULL, NULL),
(24, 7, 20, NULL, NULL),
(25, 7, 33, NULL, NULL),
(26, 7, 24, NULL, NULL),
(27, 7, 45, NULL, NULL),
(28, 7, 47, NULL, NULL),
(29, 8, 20, NULL, NULL),
(30, 8, 33, NULL, NULL),
(31, 8, 24, NULL, NULL),
(32, 8, 45, NULL, NULL),
(33, 8, 46, NULL, NULL),
(34, 9, 20, NULL, NULL),
(35, 9, 33, NULL, NULL),
(36, 9, 24, NULL, NULL),
(37, 9, 48, NULL, NULL),
(38, 9, 46, NULL, NULL),
(41, 10, 19, NULL, NULL),
(42, 10, 33, NULL, NULL),
(43, 10, 51, NULL, NULL),
(44, 11, 19, NULL, NULL),
(45, 11, 33, NULL, NULL),
(46, 11, 50, NULL, NULL),
(49, 13, 19, NULL, NULL),
(50, 13, 33, NULL, NULL),
(53, 15, 53, NULL, NULL),
(54, 15, 34, NULL, NULL),
(55, 16, 19, NULL, NULL),
(56, 16, 33, NULL, NULL),
(57, 17, 20, NULL, NULL),
(58, 17, 33, NULL, NULL),
(59, 18, 19, NULL, NULL),
(60, 18, 32, NULL, NULL),
(63, 20, 20, NULL, NULL),
(64, 20, 33, NULL, NULL),
(68, 22, 57, NULL, NULL),
(69, 22, 19, NULL, NULL),
(70, 22, 33, NULL, NULL),
(71, 23, 58, NULL, NULL),
(72, 23, 20, NULL, NULL),
(73, 23, 33, NULL, NULL),
(84, 26, 75, NULL, NULL),
(85, 26, 19, NULL, NULL),
(86, 26, 33, NULL, NULL),
(87, 27, 76, NULL, NULL),
(88, 27, 19, NULL, NULL),
(89, 27, 33, NULL, NULL),
(90, 27, 40, NULL, NULL),
(101, 28, 77, NULL, NULL),
(102, 28, 19, NULL, NULL),
(103, 28, 33, NULL, NULL),
(104, 28, 6, NULL, NULL),
(105, 29, 78, NULL, NULL),
(106, 29, 19, NULL, NULL),
(107, 29, 33, NULL, NULL),
(108, 29, 10, NULL, NULL),
(109, 30, 6, NULL, NULL),
(110, 30, 79, NULL, NULL),
(111, 30, 19, NULL, NULL),
(112, 30, 33, NULL, NULL),
(116, 19, 19, NULL, NULL),
(117, 19, 33, NULL, NULL),
(118, 19, 46, NULL, NULL),
(119, 31, 13, NULL, NULL),
(120, 33, 80, NULL, NULL),
(121, 34, 81, NULL, NULL),
(122, 35, 13, NULL, NULL),
(123, 36, 13, NULL, NULL),
(124, 37, 81, NULL, NULL),
(125, 38, 13, NULL, NULL),
(126, 39, 13, NULL, NULL),
(127, 40, 13, NULL, NULL),
(128, 41, 81, NULL, NULL),
(129, 42, 13, NULL, NULL),
(130, 43, 6, NULL, NULL),
(131, 44, 13, NULL, NULL),
(132, 45, 13, NULL, NULL),
(133, 46, 13, NULL, NULL),
(134, 47, 13, NULL, NULL),
(135, 48, 13, NULL, NULL),
(136, 49, 13, NULL, NULL),
(137, 50, 13, NULL, NULL),
(138, 51, 81, NULL, NULL),
(139, 52, 13, NULL, NULL),
(141, 53, 82, NULL, NULL),
(142, 56, 6, NULL, NULL),
(143, 56, 84, NULL, NULL),
(144, 56, 87, NULL, NULL),
(145, 57, 83, NULL, NULL),
(146, 57, 84, NULL, NULL),
(147, 57, 87, NULL, NULL),
(148, 58, 31, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_media`
--

CREATE TABLE `product_media` (
  `id` bigint UNSIGNED NOT NULL,
  `media_id` bigint UNSIGNED NOT NULL,
  `product_option_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_media`
--

INSERT INTO `product_media` (`id`, `media_id`, `product_option_id`) VALUES
(4, 7, 5),
(5, 8, 6),
(6, 10, 7),
(7, 11, 8),
(8, 12, 9),
(9, 14, 10),
(10, 15, 11),
(11, 17, 13),
(12, 18, 13),
(13, 20, 15),
(14, 22, 16),
(15, 23, 17),
(16, 25, 18),
(17, 27, 19),
(18, 29, 20),
(19, 31, 22),
(20, 32, 22),
(21, 33, 22),
(22, 34, 22),
(23, 35, 22),
(24, 37, 23),
(25, 38, 23),
(26, 39, 23),
(27, 40, 23),
(28, 41, 23),
(29, 42, 23),
(30, 43, 23),
(37, 53, 26),
(38, 54, 26),
(39, 55, 26),
(40, 56, 26),
(41, 57, 26),
(42, 59, 27),
(43, 60, 27),
(44, 61, 27),
(45, 62, 27),
(46, 63, 27),
(47, 65, 28),
(48, 66, 28),
(49, 67, 28),
(50, 68, 28),
(51, 69, 28),
(52, 70, 29),
(53, 71, 29),
(54, 72, 29),
(55, 73, 29),
(56, 74, 29),
(57, 75, 30),
(58, 76, 30),
(59, 77, 30),
(60, 78, 30),
(61, 79, 30),
(62, 81, 31),
(63, 82, 31),
(64, 83, 31),
(65, 84, 31),
(66, 85, 31),
(67, 86, 31),
(68, 87, 31),
(69, 88, 31),
(72, 92, 33),
(73, 93, 33),
(74, 95, 34),
(75, 96, 34),
(76, 97, 34),
(77, 98, 35),
(78, 99, 35),
(79, 100, 35),
(80, 102, 36),
(81, 103, 36),
(82, 104, 36),
(83, 105, 36),
(84, 106, 36),
(85, 108, 37),
(86, 109, 37),
(87, 110, 37),
(88, 111, 37),
(89, 112, 37),
(90, 114, 38),
(91, 115, 38),
(92, 116, 38),
(93, 118, 39),
(94, 119, 39),
(95, 120, 39),
(96, 121, 39),
(97, 122, 39),
(98, 123, 39),
(99, 124, 39),
(100, 125, 39),
(101, 126, 39),
(102, 127, 39),
(103, 128, 39),
(104, 130, 40),
(105, 131, 40),
(106, 132, 40),
(107, 133, 41),
(108, 134, 41),
(109, 135, 41),
(110, 137, 42),
(111, 138, 42),
(112, 139, 42),
(113, 140, 42),
(114, 141, 42),
(115, 142, 42),
(116, 143, 42),
(117, 145, 43),
(118, 146, 43),
(119, 147, 43),
(120, 148, 43),
(121, 150, 44),
(122, 151, 44),
(123, 152, 44),
(124, 153, 44),
(125, 154, 44),
(126, 156, 45),
(127, 157, 45),
(128, 158, 45),
(129, 160, 46),
(130, 161, 46),
(131, 162, 46),
(132, 163, 46),
(133, 165, 47),
(134, 166, 47),
(135, 167, 47),
(136, 169, 48),
(137, 170, 48),
(138, 171, 48),
(139, 172, 48),
(140, 173, 48),
(141, 174, 48),
(142, 175, 48),
(143, 177, 49),
(144, 179, 50),
(145, 180, 50),
(146, 181, 50),
(147, 183, 51),
(148, 184, 51),
(149, 185, 51),
(150, 186, 51),
(151, 187, 52),
(152, 188, 52),
(153, 189, 52),
(154, 190, 52),
(155, 191, 53),
(156, 192, 53),
(157, 193, 53),
(158, 194, 53),
(159, 195, 53),
(160, 197, 56),
(161, 198, 56),
(162, 199, 57),
(163, 200, 57),
(164, 201, 57),
(165, 202, 57),
(166, 203, 57),
(167, 204, 57),
(168, 205, 57),
(169, 206, 57),
(170, 207, 57),
(171, 208, 57),
(172, 211, 58),
(173, 212, 59);

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint UNSIGNED NOT NULL,
  `current_price` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `selled` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `name`, `price`, `current_price`, `product_id`, `amount`, `selled`, `status`) VALUES
(5, 'Ram: 16GB SSD: 512GB', 52990000, 39990000, 3, 10, 0, 0),
(6, 'Ram: 16GB SSD: 1TB', 65990000, 42590000, 3, 10, 0, 0),
(7, '7-13650HX/16GB/512GB PCIE/VGA 8GB RTX4060/15.6 FHD', 34990000, 31990000, 4, 50, 0, 0),
(8, 'I7-13650HX/16GB/512GB PCIE/VGA 6GB RTX4050/15.6 FHD', 31990000, 29490000, 4, 20, 0, 0),
(9, 'I5-12450HX/16GB/512GB PCIE/VGA 6GB RTX4050/15.6 FHD', 25990000, 24990000, 4, 20, 0, 0),
(10, 'R5-7535HS/8GB/512GB PCIE/VGA 4GB RTX2050', 24490000, 17590000, 5, 20, 0, 0),
(11, 'R5-6600H/8GB/512GB PCIE/VGA 4GB RTX3050TI', 20990000, 18990000, 5, 10, 0, 0),
(13, 'Ram: 8GB SSD: 512GB', 20990000, 17990000, 6, 10, 0, 0),
(15, 'Ram: 18GB SSD: 1TB', 57890000, 57890000, 7, 10, 0, 0),
(16, 'Ram: 8GB SSD: 512GB', 25490000, 18490000, 8, 10, 0, 0),
(17, 'Ram: 16Gb SSD: 512GB', 16490000, 16490000, 8, 10, 0, 0),
(18, 'Ram: 8GB SSD: 256GB', 12790000, 12789996, 9, 9, 1, 0),
(19, 'Ram: 8GB SSD: 512GB', 21990000, 21989999, 10, 0, 10, 0),
(20, 'Ram: 16GB SSD: 512GB', 37990000, 28990000, 11, 8, 2, 0),
(22, 'i5-1235U, Ram 8GB, 512GB ssd', 21600000, 18000000, 12, 10, 0, 0),
(23, 'i5-13500H, Ram 16GB, 512 GB ssd', 21000000, 17000000, 13, 10, 0, 0),
(26, 'I5-13420H/8GB/512GB PCIE/VGA 4GB RTX2050/15.6', 20500000, 16000000, 16, 20, 0, 0),
(27, 'I5-12450H/16GB/512GB', 23000000, 19700000, 17, 10, 0, 0),
(28, 'R7-5700U/16GB/512GB PCIE/14.0 FHD', 14000000, 12200000, 18, 20, 0, 0),
(29, 'I5-1135G7/8GB/256GB PCIE/15.6 FHD', 16000000, 10800000, 18, 20, 0, 0),
(30, 'I3-1215U/8GB/512GB PCIE/15.6 FHD', 12000000, 9800000, 18, 20, 0, 0),
(31, '100HZ', 3000000, 2400000, 19, 9, 1, 0),
(33, 'Faker Edition', 4400000, 3900000, 20, 20, 0, 0),
(34, 'Cobra Pro Trắng', 4000000, 3000000, 21, 20, 0, 0),
(35, 'Cobra Pro Đen', 2900000, 2850000, 21, 20, 0, 0),
(36, 'Cream Yellow Pro', 3000000, 1800000, 22, 20, 0, 0),
(37, 'Cream Blue Pro', 2600000, 1400000, 23, 20, 0, 0),
(38, 'Đen', 2000000, 1700000, 24, 20, 0, 0),
(39, 'Đen', 4500000, 3800000, 25, 20, 0, 0),
(40, 'Đen', 1000000, 450000, 26, 20, 0, 0),
(41, 'Trắng', 800000, 450000, 26, 20, 0, 0),
(42, 'Đen', 6300000, 5000000, 27, 30, 0, 0),
(43, 'Bạc', 6300000, 5700000, 28, 30, 0, 0),
(44, 'Đen', 9500000, 5200000, 29, 30, 0, 0),
(45, 'Đen', 4000000, 3100000, 30, 30, 0, 0),
(46, 'Đen', 6000000, 3400000, 31, 30, 0, 0),
(47, 'Đen', 3700000, 3030000, 32, 30, 0, 0),
(48, 'Đen', 8000000, 6550000, 33, 30, 0, 0),
(49, 'Đen', 7000000, 6800000, 34, 30, 0, 0),
(50, 'Đen', 5000000, 4000000, 35, 30, 0, 0),
(51, 'Trắng', 700000, 630000, 36, 30, 0, 0),
(52, 'Đen', 700000, 630000, 36, 30, 0, 0),
(53, 'Hồng', 700000, 630000, 36, 28, 2, 0),
(56, 'Bạc, RAM: 3GB, ROM: 64GB', 9000000, 7250000, 37, 30, 0, 0),
(57, 'Xám, RAM: 3GB, ROM: 64GB', 9000000, 7250000, 37, 30, 0, 0),
(58, '128GB', 449000, 269000, 38, 10, 0, 0),
(59, '64GB', 239000, 149000, 38, 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_series`
--

CREATE TABLE `product_series` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_series`
--

INSERT INTO `product_series` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Laptop Gaming', 1, '2024-06-20 02:17:07', '2024-06-20 02:17:07'),
(3, 'Laptop Văn Phòng', 1, '2024-06-20 02:17:26', '2024-06-20 02:17:26'),
(6, 'Macbook', 2, '2024-06-20 02:18:13', '2024-06-20 02:18:13'),
(8, 'Ipad', 2, '2024-06-20 02:18:38', '2024-07-01 07:55:26'),
(10, 'PC Gaming', 3, '2024-06-20 02:18:59', '2024-06-20 02:18:59'),
(11, 'PC Văn Phòng', 3, '2024-06-20 02:19:11', '2024-06-20 02:19:11'),
(12, 'PC Đồ Họa', 3, '2024-06-20 02:19:19', '2024-06-20 02:19:19'),
(13, 'PC All in One', 3, '2024-06-20 02:19:29', '2024-06-20 02:19:29'),
(14, 'Màn hình Gaming', 4, '2024-06-20 02:19:44', '2024-06-20 02:19:44'),
(15, 'Màn hình đồ họa', 4, '2024-06-20 02:19:54', '2024-06-20 02:19:54'),
(16, 'Màn hình cong', 4, '2024-06-20 02:20:07', '2024-06-20 02:20:07'),
(17, 'Màn hình văn phòng', 4, '2024-06-20 02:20:16', '2024-06-20 02:20:16'),
(18, 'Case', 5, '2024-06-20 02:20:34', '2024-06-20 02:20:34'),
(19, 'VGA - Card Màn Hình', 5, '2024-06-20 02:20:52', '2024-06-20 02:20:52'),
(20, 'Ổ Cứng', 5, '2024-06-20 02:21:06', '2024-06-20 02:21:06'),
(21, 'CPU - Bộ vi xử lý', 5, '2024-06-20 02:21:20', '2024-06-20 02:21:20'),
(22, 'RAM', 5, '2024-06-20 02:21:25', '2024-06-20 02:21:25'),
(23, 'Chuột', 6, '2024-06-20 02:21:41', '2024-06-20 02:21:41'),
(24, 'Bàn Phím', 6, '2024-06-20 02:21:50', '2024-06-20 02:21:50'),
(25, 'Ghế gaming', 6, '2024-06-20 02:22:03', '2024-06-20 02:22:03'),
(26, 'Phụ kiện chung', 6, '2024-06-20 02:22:17', '2024-06-20 02:22:17'),
(27, 'Tay cầm chơi game', 7, '2024-06-20 02:22:31', '2024-06-20 02:22:31'),
(28, 'Máy chơi game', 7, '2024-06-20 02:22:49', '2024-06-20 02:22:49'),
(30, 'Phụ kiện Gaming', 7, '2024-06-20 02:23:28', '2024-06-20 02:23:28'),
(34, 'Thẻ nhớ', 6, '2024-07-08 09:18:04', '2024-07-08 09:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(5, 4, 4, 5, 'Sản phẩm tốt nha', '2024-06-22 09:50:53', '2024-06-22 09:50:53'),
(6, 11, 4, 5, 'Máy mỏng nhẹ rất là đẹp luôn', '2024-06-23 08:41:07', '2024-06-23 08:41:07'),
(7, 10, 4, 5, 'Máy khỏe, chiến mọi loại game mượt mà', '2024-06-23 09:01:13', '2024-06-23 09:01:13'),
(8, 9, 4, 4, 'Phù hợp với các bạn sinh viên cần máy nhỏ gọn, cửa hàng bán hàng rất uy tín, chăm sóc rất là nhiệt tình, 4 sao', '2024-06-23 09:02:02', '2024-06-23 09:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-06-19 13:28:25', '2024-06-19 13:28:25'),
(2, 'staff', 'web', '2024-06-19 13:28:25', '2024-06-19 13:28:25'),
(3, 'member', 'web', '2024-06-19 13:28:25', '2024-06-19 13:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `phone`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$12$y/G68LT87Mzn5pjlZ.uOVubIl6uAOQTIrhB8BOpzNHsKz..WHu3wW', NULL, NULL, 0, NULL, '2024-06-19 13:28:25', '2024-06-19 13:28:25'),
(2, 'haitv.dev@gmail.com', 'haitv.dev@gmail.com', NULL, '$2y$12$i6Y2mD76TDheAuuwH3YY5.oUkFuNrQIa.bImdiJQwS9sEKy0avFfK', '1', '0372312809', 0, NULL, '2024-06-20 19:18:25', '2024-06-20 19:18:25'),
(3, 'haitv.dev2@gmail.com', 'haitv.dev2@gmail.com', NULL, '$2y$12$/DU2TGgAPAShSF7206Uu8./T4m26gJus7SBb9PGoqdJbDfWNtDe8q', '1', '0372312802', 0, NULL, '2024-06-21 01:00:20', '2024-06-21 01:00:20'),
(4, 'user_1', 'user1@user.com', NULL, '$2y$12$WqVHSBETSVeezb/.hmUaDuF.Sxd6wdzznmDxotN9LepuPfmQLXIja', '1', '0987654123', 0, NULL, '2024-06-22 09:47:40', '2024-06-22 09:47:40'),
(5, 'Hoàng Đức', 'ductrieuhoang@gmail.com', NULL, '$2y$12$QB.Bpst.4E7/NwXY7ki/fOjlHIWPej.F22ytpOWF2we6Wsgf8wubG', '1', '0793157708', 0, NULL, '2024-06-23 01:27:50', '2024-06-23 01:27:50'),
(6, 'user2', 'user2@user2.com', NULL, '$2y$12$n8JaOJLpUtUvb19z756Lh./Fy4kQvnF.QRaZC8H3juRodHBaoYOpG', '0', '0983636416', 0, NULL, '2024-06-23 09:23:06', '2024-06-23 09:23:06'),
(7, 'user3@user3.com', 'user3@user3.com', NULL, '$2y$12$MMsWvIbJZWhHMk10N8VJSO5DZ0zbtbeo1BpP3iSi88EoRsiuHcTTS', '0', '0983636415', 0, NULL, '2024-06-29 07:52:43', '2024-06-29 07:52:43'),
(8, 'doan', 'doannguyen290599@gmail.com', NULL, '$2y$12$PbvgmElYXM9ifUx4HnsiGO0IDqnAkQCRUrspmtoLP/mTVj1yy0VCO', '1', '0392874307', 0, NULL, '2024-07-08 09:01:57', '2024-07-08 09:01:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_unique` (`code`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_media`
--
ALTER TABLE `product_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_series`
--
ALTER TABLE `product_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `product_media`
--
ALTER TABLE `product_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `product_series`
--
ALTER TABLE `product_series`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
