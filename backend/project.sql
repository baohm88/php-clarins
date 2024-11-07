-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2024 at 09:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` decimal(21,9) NOT NULL,
  `product_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`order_id`, `product_id`, `product_name`, `product_price`, `product_qty`) VALUES
(253, 2, 'Dry Touch Facial Sunscreen - Broad Spectrum SPF 50+', 40.000000000, 2),
(253, 14, 'Lip Perfector 2-in-1 Lip and Cheek Color Balm', 30.000000000, 5),
(254, 5, 'UV Plus SPF 50 Anti Pollution Face Sunscreen', 46.000000000, 6),
(254, 9, 'Joli Rouge Satin Lipstick', 37.000000000, 5),
(260, 1, 'Hydrating Gentle Foaming Face Cleanser for Normal to Dry Skin', 31.000000000, 1),
(261, 9, 'Joli Rouge Satin Lipstick', 37.000000000, 1),
(262, 1, 'Hydrating Gentle Foaming Face Cleanser for Normal to Dry Skin', 31.000000000, 9),
(262, 2, 'Dry Touch Facial Sunscreen - Broad Spectrum SPF 50+', 40.000000000, 1),
(263, 5, 'UV Plus SPF 50 Anti Pollution Face Sunscreen', 46.000000000, 6),
(264, 1, 'Hydrating Gentle Foaming Face Cleanser for Normal to Dry Skin', 31.000000000, 1),
(265, 2, 'Dry Touch Facial Sunscreen - Broad Spectrum SPF 50+', 40.000000000, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_value` decimal(21,9) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','completed','cancelled','') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_value`, `order_date`, `status`) VALUES
(253, 121, 230.000000000, '2024-10-12', 'pending'),
(254, 121, 461.000000000, '2024-10-12', 'completed'),
(261, 121, 37.000000000, '2024-10-17', 'pending'),
(262, 121, 319.000000000, '2024-10-19', 'cancelled'),
(263, 121, 276.000000000, '2024-10-19', 'pending'),
(265, 121, 320.000000000, '2024-10-22', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `image_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`image_id`, `image_url`, `product_id`) VALUES
(101, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw6fa700a4/original/80104492_original_original_A.jpg?sw=680&sh=680', 1),
(106, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw2a92f871/original/80104492_original_original_B.jpg?sw=680&sh=680', 1),
(107, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw369b038c/original/80104492_original_original_C.jpg?sw=1000&sh=1000', 1),
(108, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwbf74d90f/original/80104492_original_original_E.jpg?sw=1000&sh=1000', 1),
(109, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwf36d66a7/original/80107455_original_original_A.jpg?sw=680&sh=680', 2),
(110, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwa7b4dc47/original/80107455_original_original_B.jpg?sw=680&sh=680', 2),
(111, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw1c309f65/original/80107455_original_original_D.jpg?sw=680&sh=680', 2),
(112, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwdd195252/original/80107455_original_original_E.jpg?sw=680&sh=680', 2),
(113, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwbdbfab71/original/80095098_original_original_X.jpg?sw=680&sh=680', 3),
(114, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwae2a9804/original/80095098_original_original_2.jpg?sw=680&sh=680', 3),
(115, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwe5c55ac9/original/80095098_original_original_3.jpg?sw=680&sh=680', 3),
(116, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwdd843c7a/original/80095098_original_original_4.jpg?sw=680&sh=680', 3),
(117, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwa8b1af34/original/80083849_original_original_A.jpg?sw=680&sh=680', 4),
(118, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw59cd6f47/original/80083849_original_original_B.jpg?sw=680&sh=680', 4),
(119, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwde4b22e6/original/80083849_original_original_C.jpg?sw=680&sh=680', 4),
(120, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw73dc1b01/original/80083849_original_original_D.jpg?sw=680&sh=680', 4),
(121, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw4a290d40/original/0129521_original_original_1.jpg?sw=680&sh=680', 5),
(122, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw63c83dc3/original/80106602_original_original_2.jpg?sw=680&sh=680', 5),
(123, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw00f5e20d/original/80106602_original_original_3.jpg?sw=680&sh=680', 5),
(124, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw3911eb97/original/80106602_original_original_5.jpg?sw=680&sh=680', 5),
(125, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwfc02f733/original/80099349_original_original_A.jpg?sw=680&sh=680', 6),
(126, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw341081cc/original/80099349_original_original_B.jpg?sw=680&sh=680', 6),
(127, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw854fca1d/original/80099349_original_original_C.jpg?sw=680&sh=680', 6),
(128, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwdb0150c6/original/80099349_original_original_F.jpg?sw=680&sh=680', 6),
(129, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwc846db4b/original/80102843_original_original_A.jpg?sw=680&sh=680', 7),
(130, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw7ce659ab/original/80102843_original_original_B.jpg?sw=680&sh=680', 7),
(131, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwcf4b1b1c/original/80102843_original_original_C.jpg?sw=680&sh=680', 7),
(132, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw22481c8b/original/80102843_original_original_D.jpg?sw=680&sh=680', 7),
(133, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw9abb819a/original/80027223_original_original_X.jpg?sw=680&sh=680', 8),
(134, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwf1bee239/original/0158010_original_original_3.jpg?sw=680&sh=680', 8),
(135, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw1494c743/original/80027223_original_original_3.jpg?sw=680&sh=680', 8),
(136, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwd6517d4d/original/80027223_original_original_4.jpg?sw=680&sh=680', 8),
(137, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb5b4fd7e/original/80094249_original_original_X.jpg?sw=680&sh=680', 9),
(138, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw8d267063/original/80094249_original_original_2.jpg?sw=680&sh=680', 9),
(139, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwd6db83d0/original/80094249_original_original_3.jpg?sw=680&sh=680', 9),
(140, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw7e11567d/original/80094249_original_original_8.jpg?sw=680&sh=680', 9),
(141, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw2ac0b768/original/80104068_original_original_A.jpg?sw=680&sh=680', 10),
(142, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw8b96d213/original/80104068_original_original_B.jpg?sw=680&sh=680', 10),
(143, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb8b68c12/original/80104068_original_original_C.jpg?sw=680&sh=680', 10),
(144, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwdd9ffa6b/original/80104068_original_original_D.jpg?sw=680&sh=680', 10),
(145, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwc0667642/original/80087595_original_original_A.jpg?sw=680&sh=680', 11),
(146, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwb1579ba1/original/80087595_original_original_B.jpg?sw=680&sh=680', 11),
(147, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw21d41a0b/original/80087595_original_original_C.jpg?sw=680&sh=680', 11),
(148, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw2ddd3929/original/80087595_original_original_E.jpg?sw=680&sh=680', 11),
(153, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw9c53fc23/original/80044967_original_original_x.jpg?sw=680&sh=680', 12),
(154, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw6b4a4b4c/original/80044967_original_original_B.jpg?sw=680&sh=680', 12),
(155, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw97e4b588/original/80044967_original_original_C.jpg?sw=680&sh=680', 12),
(156, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwf372c13e/original/80044967_original_original_D.jpg?sw=680&sh=680', 12),
(157, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwa8791d35/original/80088226_original_original_A.jpg?sw=680&sh=680', 13),
(158, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwaf2f20df/original/80088226_original_original_B.jpg?sw=680&sh=680', 13),
(159, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw7c51b8a8/original/80088226_original_original_C.jpg?sw=680&sh=680', 13),
(160, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwf943694d/original/80088226_original_original_D.jpg?sw=680&sh=680', 13),
(161, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwf17e730a/original/80098705_original_original_X.jpg?sw=680&sh=680', 14),
(162, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwd6a6f5c2/original/80098705_original_original_2.jpg?sw=680&sh=680', 14),
(163, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw24df10b2/original/80098705_original_original_3.jpg?sw=680&sh=680', 14),
(164, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwd9e9e28e/original/80098705_original_original_9.jpg?sw=680&sh=680', 14),
(165, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw22498a58/original/80026978_original_original_1.jpg?sw=680&sh=680', 15),
(166, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwba3a66e0/original/80026978_original_original_3.jpg?sw=680&sh=680', 15),
(167, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw282f7c21/original/80050223_original_original_x.jpg?sw=1000&sh=1000', 17),
(168, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw89dd4df9/original/80050223_original_original_3.jpg?sw=1000&sh=1000', 17),
(169, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwd1f2f2a5/original/80050223_original_original_4.jpg?sw=1000&sh=1000', 17),
(170, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw015c4d1f/original/80050223_original_original_5.jpg?sw=1000&sh=1000', 17),
(171, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw63565483/original/80084435_original_original_A.jpg?sw=1000&sh=1000', 18),
(172, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw1952c100/original/80084435_original_original_B.jpg?sw=1000&sh=1000', 18),
(173, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwb1435f90/original/80084435_original_original_D.jpg?sw=1000&sh=1000', 18),
(174, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw843e4fa7/original/80084435_original_original_F.jpg?sw=1000&sh=1000', 18),
(175, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwbdaa96bb/original/80101831_original_original_A.jpg?sw=1000&sh=1000', 19),
(176, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwda60184f/original/80101831_original_original_B.jpg?sw=1000&sh=1000', 19),
(177, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwd24ef460/original/80101831_original_original_C.jpg?sw=1000&sh=1000', 19),
(178, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw03b9e678/original/80101831_original_original_G.jpg?sw=1000&sh=1000', 19),
(179, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0f6d12b4/original/80049467_original_original_A.jpg?sw=1000&sh=1000', 20),
(180, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw9700556f/original/80049467_original_original_B.jpg?sw=1000&sh=1000', 20),
(181, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw2f0713ca/original/80049467_original_original_C.jpg?sw=1000&sh=1000', 20),
(182, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwdecaa517/original/80049467_original_original_G.jpg?sw=1000&sh=1000', 20),
(183, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw3a1540b2/original/80083897_original_original_X.jpg?sw=1000&sh=1000', 21),
(184, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw3e7afb97/original/80083897_original_original_2.jpg?sw=1000&sh=1000', 21),
(185, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb0210734/original/80083897_original_original_4.jpg?sw=1000&sh=1000', 21),
(186, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwbb0b49dc/original/80083897_original_original_5.jpg?sw=1000&sh=1000', 21),
(187, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw8c25ef14/original/80083314_original_original_X.jpg?sw=1000&sh=1000', 22),
(188, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw38f33b9a/original/80083314_original_original_4.jpg?sw=1000&sh=1000', 22),
(189, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw7e80977b/original/80083314_original_original_5.jpg?sw=1000&sh=1000', 22),
(190, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0b2ef22e/original/80083314_original_original_8.jpg?sw=1000&sh=1000', 22),
(191, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw7390f784/original/80054605_original_original_A.jpg?sw=1000&sh=1000', 23),
(192, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw0dfd79ef/original/80054605_original_original_B.jpg?sw=1000&sh=1000', 23),
(193, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw7b4311ca/original/80054605_original_original_G.jpg?sw=1000&sh=1000', 23),
(194, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwac501eff/original/80054605_original_original_I.jpg?sw=1000&sh=1000', 23),
(195, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0693ccd5/original/80078328_original_original_x.jpg?sw=1000&sh=1000', 24),
(196, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwc79fa64e/original/80038066_original_original_3.jpg?sw=1000&sh=1000', 24),
(197, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw640185d7/original/80038066_original_original_4.jpg?sw=1000&sh=1000', 24),
(198, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw3fc58c1c/original/80038066_original_original_5.jpg?sw=1000&sh=1000', 24),
(199, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw675eb3c3/original/80083340_original_original_X.jpg?sw=1000&sh=1000', 25),
(200, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwd7a860f4/original/80083340_original_original_4.jpg?sw=1000&sh=1000', 25),
(201, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw11856374/original/80083341_original_original_5.jpg?sw=1000&sh=1000', 25),
(202, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw7902db53/original/80083340_original_original_6.jpg?sw=1000&sh=1000', 25),
(203, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw36bfc0a9/original/80100567_original_original_A.jpg?sw=1000&sh=1000', 26),
(204, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw85f81241/original/80100567_original_original_B.jpg?sw=1000&sh=1000', 26),
(205, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw8219b01a/original/80100567_original_original_E.jpg?sw=1000&sh=1000', 26),
(206, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw3a7f49c0/original/80100567_original_original_H.jpg?sw=1000&sh=1000', 26),
(207, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw35520a5b/original/04700210_original_original_A.jpg?sw=1000&sh=1000', 27),
(208, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwdd940216/original/04700210_original_original_B.jpg?sw=1000&sh=1000', 27),
(209, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwa50501f9/original/04700210_original_original_F.jpg?sw=1000&sh=1000', 27),
(210, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwf77eeaf4/original/04700210_original_original_G.jpg?sw=1000&sh=1000', 27),
(211, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwef1a4559/original/80084964_original_original_A.jpg?sw=1000&sh=1000', 28),
(212, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw1b876db2/original/80084964_original_original_F.jpg?sw=1000&sh=1000', 28),
(213, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw24fda7ec/original/80084964_original_original_G.jpg?sw=1000&sh=1000', 28),
(214, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw82b318aa/original/80084964_original_original_H.jpg?sw=1000&sh=1000', 28),
(215, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwd899b838/original/80084964_original_original_J.jpg?sw=1000&sh=1000', 28),
(216, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw1ca04a82/original/80104513_original_original_A.jpg?sw=1000&sh=1000', 29),
(217, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw36825e93/original/80104513_original_original_B.jpg?sw=1000&sh=1000', 29),
(218, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw4e2e5acd/original/80104513_original_original_E.jpg?sw=1000&sh=1000', 29),
(219, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw36dd308f/original/80104513_original_original_I.jpg?sw=1000&sh=1000', 29),
(220, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwa2cd7c73/original/80009810_original_original_1.jpg?sw=1000&sh=1000', 30),
(221, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwbffd2221/original/80009810_original_original_2.jpg?sw=1000&sh=1000', 30),
(222, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw16413900/original/80009810_original_original_4.jpg?sw=1000&sh=1000', 30),
(223, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0ff34b26/original/80009825_original_original_5.jpg?sw=1000&sh=1000', 30),
(224, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwfb208a2f/original/80070887_original_original_1.jpg?sw=1000&sh=1000', 31),
(225, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw71c5f904/original/80070887_original_original_B.jpg?sw=1000&sh=1000', 31),
(226, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw3c504ad2/original/80070887_original_original_F.jpg?sw=1000&sh=1000', 31),
(227, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw35d91bec/original/80070887_original_original_C.jpg?sw=1000&sh=1000', 31),
(228, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw3227509c/original/80089894_original_original_X.jpg?sw=1000&sh=1000', 32),
(229, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw499909c1/original/80089894_original_original_2.jpg?sw=1000&sh=1000', 32),
(230, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw6eed690b/original/80089894_original_original_5.jpg?sw=1000&sh=1000', 32),
(231, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw4febf413/original/80089894_original_original_7.jpg?sw=1000&sh=1000', 32),
(232, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwebde9023/original/80081843_original_original_1.jpg?sw=1000&sh=1000', 33),
(233, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwf10f6154/original/80081843_original_original_B.jpg?sw=1000&sh=1000', 33),
(234, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwb91bb820/original/80081843_original_original_E.jpg?sw=1000&sh=1000', 33),
(235, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw06bb61af/original/80081843_original_original_F.jpg?sw=1000&sh=1000', 33),
(236, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw1cf2f8c2/original/80107456_original_original_A.jpg?sw=1000&sh=1000', 34),
(237, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwc90ba901/original/80107456_original_original_D.jpg?https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-pro', 34),
(238, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwc90ba901/original/80107456_original_original_D.jpg?sw=1000&sh=1000', 34),
(239, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw90c31952/original/80107456_original_original_F.jpg?sw=1000&sh=1000', 34),
(240, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw4a290d40/original/0129521_original_original_1.jpg?sw=1000&sh=1000', 35),
(241, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw63c83dc3/original/80106602_original_original_2.jpg?sw=1000&sh=1000', 35),
(242, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw00f5e20d/original/80106602_original_original_3.jpg?sw=1000&sh=1000', 35),
(243, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw3911eb97/original/80106602_original_original_5.jpg?sw=1000&sh=1000', 35),
(245, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwa545d5ac/original/80050669_original_original_x.jpg?sw=1000&sh=1000', 36),
(246, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwbe9bfa26/original/80050669_original_original_4.jpg?sw=1000&sh=1000', 36),
(247, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb0193c72/original/80050669_original_original_5.jpg?sw=1000&sh=1000', 36),
(248, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw845fe448/original/80050669_original_original_6.jpg?sw=1000&sh=1000', 36),
(249, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwe1736afd/original/80061424_original_original_x.jpg?sw=1000&sh=1000', 37),
(250, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw1e8306fc/original/80061424_original_original_3.jpg?sw=1000&sh=1000', 37),
(251, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwc6a9b020/original/80061424_original_original_5.jpg?sw=1000&sh=1000', 37),
(252, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwecf9a7d8/original/80061424_original_original_6.jpg?sw=1000&sh=1000', 37),
(253, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw1d1acb5b/original/80061420_original_original_x.jpg?sw=1000&sh=1000', 38),
(254, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw17b3b853/original/80061420_original_original_3.jpg?sw=1000&sh=1000', 38),
(255, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb7a8d133/original/80061420_original_original_4.jpg?sw=1000&sh=1000', 38),
(256, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw130804d2/original/80061420_original_original_5.jpg?sw=1000&sh=1000', 38),
(257, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw018a4f12/original/80074502_original_original_A.jpg?sw=1000&sh=1000', 39),
(258, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw35dbf7ca/original/80074502_original_original_B.jpg?sw=1000&sh=1000', 39),
(259, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw98c55fde/original/80074502_original_original_E.jpg?sw=1000&sh=1000', 39),
(260, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw6a24b15e/original/80074502_original_original_H.jpg?sw=1000&sh=1000', 39),
(261, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw132e9faa/original/80074503_original_original_A.jpg?sw=1000&sh=1000', 40),
(262, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwc552ee66/original/80074503_original_original_B.jpg?sw=1000&sh=1000', 40),
(263, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw355fbb1c/original/80074503_original_original_E.jpg?sw=1000&sh=1000', 40),
(264, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwf587073f/original/80074503_original_original_F.jpg?sw=1000&sh=1000', 40),
(265, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwa2cd7c73/original/80009810_original_original_1.jpg?sw=1000&sh=1000', 41),
(266, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwbffd2221/original/80009810_original_original_2.jpg?sw=1000&sh=1000', 41),
(267, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw16413900/original/80009810_original_original_4.jpg?sw=1000&sh=1000', 41),
(268, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0ff34b26/original/80009825_original_original_5.jpg?sw=1000&sh=1000', 41),
(269, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw03963d2c/original/80092561_original_original_X.jpg?sw=1000&sh=1000', 42),
(270, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw15f41e2d/original/80092561_original_original_2.jpg?sw=1000&sh=1000', 42),
(271, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwd9e7dcd9/original/80092561_original_original_4.jpg?sw=1000&sh=1000', 42),
(272, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwd6ba539f/original/80092561_original_original_5.jpg?sw=1000&sh=1000', 42),
(273, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw5a9015f3/original/80092562_original_original_X.jpg?sw=1000&sh=1000', 43),
(275, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw7260e6b3/original/80092562_original_original_2.jpg?sw=1000&sh=1000', 43),
(276, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw94d1e74c/original/80092562_original_original_3.jpg?sw=1000&sh=1000', 43),
(277, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwb83b9376/original/80092562_original_original_4.jpg?sw=1000&sh=1000', 43),
(278, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw928929e9/original/80092563_original_original_X.jpg?sw=1000&sh=1000', 44),
(279, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw139554d9/original/80092563_original_original_2.jpg?sw=1000&sh=1000', 44),
(280, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw646badd0/original/80092563_original_original_4.jpg?sw=1000&sh=1000', 44),
(281, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwbc87a61d/original/80092563_original_original_5.jpg?sw=1000&sh=1000', 44),
(282, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwe5b3d94a/original/80071984_original_original_X.jpg?sw=1000&sh=1000', 45),
(283, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw2ec41c9c/original/80071984_original_original_3.jpg?sw=1000&sh=1000', 45),
(284, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwe324a029/original/80071984_original_original_4.jpg?sw=1000&sh=1000', 45),
(285, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw5e465b70/original/80071984_original_original_5.jpg?sw=1000&sh=1000', 45),
(286, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw01f0af2e/original/80071985_original_original_X.jpg?sw=1000&sh=1000', 46),
(287, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0a197bec/original/80071985_original_original_3.jpg?sw=1000&sh=1000', 46),
(288, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw3b7b25d3/original/80071985_original_original_4.jpg?sw=1000&sh=1000', 46),
(289, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0482e7d9/original/80071985_original_original_5.jpg?sw=1000&sh=1000', 46),
(290, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw9fdb9b7b/original/80085184_original_original_A.jpg?sw=1000&sh=1000', 47),
(291, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw1396eef2/original/80085184_original_original_B.jpg?sw=1000&sh=1000', 47),
(292, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw55d246e0/original/80085184_original_original_C.jpg?sw=1000&sh=1000', 47),
(293, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw6d09c15a/original/80085184_original_original_D.jpg?sw=1000&sh=1000', 47),
(294, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw5886f7e3/original/80082527_original_original_A.jpg?sw=1000&sh=1000', 48),
(295, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw6e897115/original/80082527_original_original_B.jpg?sw=1000&sh=1000', 48),
(296, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb20a68b1/original/80082527_original_original_E.jpg?sw=1000&sh=1000', 48),
(297, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw26c1fa40/original/80082527_original_original_G.jpg?sw=1000&sh=1000', 48),
(298, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwc42f0e5c/original/80008273_original_original_1.jpg?sw=1000&sh=1000', 49),
(299, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw8bc9e71f/original/80008273_original_original_6.jpg?sw=1000&sh=1000', 49),
(300, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw8bc9e71f/original/80008273_original_original_6.jpg?sw=1000&sh=1000', 49),
(301, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw8bc9e71f/original/80008273_original_original_6.jpg?sw=1000&sh=1000', 49),
(302, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwa7ae43a6/original/80082062_original_original_A.jpg?sw=1000&sh=1000', 50),
(303, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw1b404dbe/original/80082062_original_original_B.jpg?sw=1000&sh=1000', 50),
(304, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw852fb683/original/80082062_original_original_C.jpg?sw=1000&sh=1000', 50),
(305, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwf7a9f06d/original/80082062_original_original_I.jpg?sw=1000&sh=1000', 50),
(306, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwaac2cb67/original/80011632_original_original_1.jpg?sw=1000&sh=1000', 51),
(307, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwdccfa230/original/80011632_original_original_3.jpg?sw=1000&sh=1000', 51),
(308, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw07822bea/original/80051985_original_original_5.jpg?sw=1000&sh=1000', 51),
(309, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw7327ad9f/original/80051985_original_original_4.jpg?sw=1000&sh=1000', 51),
(310, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw8d5a8245/original/80044961_original_original_1.jpg?sw=1000&sh=1000', 52),
(311, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0bc7a17f/original/80044961_original_original_2.jpg?sw=1000&sh=1000', 52),
(312, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0dcf2b26/original/80044961_original_original_3.jpg?sw=1000&sh=1000', 52),
(313, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwce84e854/original/80044961_original_original_4.jpg?sw=1000&sh=1000', 52),
(314, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw718274cd/original/80106698_original_original_1.jpg?sw=1000&sh=1000', 53),
(315, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dweadb6972/original/80106696_original_original_G.jpg?sw=1000&sh=1000', 53),
(316, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw2af82bed/original/80106698_original_original_D.jpg?sw=1000&sh=1000', 53),
(317, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb555e1bb/original/80106698_original_original_H.jpg?sw=1000&sh=1000', 53),
(318, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwbdbfcc95/original/80088551_original_original_A.jpg?sw=1000&sh=1000', 54),
(319, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0251ebd1/original/80088551_original_original_B.jpg?sw=1000&sh=1000', 54),
(320, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwaddb9897/original/80088551_original_original_D.jpg?sw=1000&sh=1000', 54),
(321, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw3af4e3c9/original/80088551_original_original_J.jpg?sw=1000&sh=1000', 54),
(322, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwccfa665c/original/04213410_original_original_1.jpg?sw=1000&sh=1000', 55),
(323, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb5f3ea5f/original/04213410_original_original_2.jpg?sw=1000&sh=1000', 55),
(324, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb5f3ea5f/original/04213410_original_original_2.jpg?sw=1000&sh=1000', 55),
(325, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb5f3ea5f/original/04213410_original_original_2.jpg?sw=1000&sh=1000', 55),
(326, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw75be97fb/original/80080009_original_original_X.jpg?sw=1000&sh=1000', 56),
(327, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw166c68a9/original/80080009_original_original_B.jpg?sw=1000&sh=1000', 56),
(328, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwfed82c46/original/80080009_original_original_D.jpg?sw=1000&sh=1000', 56),
(329, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwee18ed8c/original/80080009_original_original_G.jpg?sw=1000&sh=1000', 56),
(330, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw3ca39c3a/original/80060768_original_original_x.jpg?sw=1000&sh=1000', 57),
(331, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw5680cc98/original/80060768_original_original_C.jpg?sw=1000&sh=1000', 57),
(332, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw257f30f8/original/80060768_original_original_D.jpg?sw=1000&sh=1000', 57),
(333, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw0b17bf3d/original/80060768_original_original_I.jpg?sw=1000&sh=1000', 57),
(334, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw109b4e14/original/80084589_original_original_A.jpg?sw=1000&sh=1000', 58),
(335, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw4e7d47db/original/80084589_original_original_B.jpg?sw=1000&sh=1000', 58),
(336, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw916ed0dc/original/80084589_original_original_C.jpg?sw=1000&sh=1000', 58),
(337, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw3750d647/original/80084589_original_original_F.jpg?sw=1000&sh=1000', 58),
(338, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwab99e537/original/0440291_original_original_1.jpg?sw=1000&sh=1000', 59),
(339, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw5b7a09fe/original/0440291_original_original_3.jpg?sw=1000&sh=1000', 59),
(340, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwf5acc909/original/80081932_original_original_8.jpg?sw=1000&sh=1000', 59),
(341, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwf5acc909/original/80081932_original_original_8.jpg?sw=1000&sh=1000', 59),
(342, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwb15ed216/original/80107192_original_original_A.jpg?sw=1000&sh=1000', 60),
(343, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwa4229ce0/original/80107192_original_original_D.jpg?sw=1000&sh=1000', 60),
(344, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw946655d3/original/80107192_original_original_G.jpg?sw=1000&sh=1000', 60),
(345, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw948fc5ba/original/80107192_original_original_I.jpg?sw=1000&sh=1000', 60),
(346, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw15de5999/original/80105094_original_original_A.jpg?sw=1000&sh=1000', 61),
(347, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwb254dcdc/original/80105094_original_original_D.jpg?sw=1000&sh=1000', 61),
(348, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw53ee9bae/original/80105094_original_original_G.jpg?sw=1000&sh=1000', 61),
(349, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw71e2ee7c/original/80105094_original_original_H.jpg?sw=1000&sh=1000', 61),
(350, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw79a0b683/original/80091434_original_original_1.jpg?sw=1000&sh=1000', 62),
(351, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw1f5807c5/original/80091434_original_original_2.jpg?sw=1000&sh=1000', 62),
(352, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwcc9d5ab5/original/80091434_original_original_3.jpg?sw=1000&sh=1000', 62),
(353, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw8fbbe84f/original/80091434_original_original_8.jpg?sw=1000&sh=1000', 62),
(354, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwb54805ba/original/80091433_original_original_1.jpg?sw=1000&sh=1000', 63),
(355, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw634b5311/original/80091433_original_original_2.jpg?sw=1000&sh=1000', 63),
(356, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw86634042/original/80091433_original_original_3.jpg?sw=1000&sh=1000', 63),
(357, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw41c7c175/original/80091433_original_original_8.jpg?sw=1000&sh=1000', 63),
(358, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw2e414e89/original/80099091_original_original_X.jpg?sw=1000&sh=1000', 64),
(359, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dw85dfad2a/original/80099091_original_original_2.jpg?sw=1000&sh=1000', 64),
(360, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/default/dwdf706c16/original/80099091_original_original_3.jpg?sw=1000&sh=1000', 64),
(361, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwe8001c85/original/80099091_original_original_8.jpg?sw=1000&sh=1000', 64),
(362, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw27408afd/original/80051371_original_original_1.jpg?sw=1000&sh=1000', 65),
(363, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dwd8cc607f/original/80051371_original_original_2.jpg?sw=1000&sh=1000', 65),
(364, 'https://www.clarinsusa.com/dw/image/v2/AAFS_PRD/on/demandware.static/-/Sites-clarins-master-products/en_US/dw181eadb5/original/80051372_original_original_4.jpg?sw=1000&sh=1000', 65);

-- --------------------------------------------------------

--
-- Table structure for table `productrating`
--

CREATE TABLE `productrating` (
  `rating_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_date` date NOT NULL DEFAULT current_timestamp(),
  `rating` int(11) NOT NULL,
  `rating_comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productrating`
--

INSERT INTO `productrating` (`rating_id`, `product_id`, `user_id`, `review_date`, `rating`, `rating_comment`) VALUES
(1, 1, 121, '1976-07-09', 1, 'This serum clogs my pores and causes acne. I wish I had not spent so much on the purchase. I will be requesting a refund'),
(2, 1, 122, '2024-03-18', 3, 'It does make my skin feel really silky smooth. It is a small package. There is no perfume smell to it like most serums. I will buy to try longterm to see how effective it is or just for the silky feeling without and oily residue.'),
(3, 1, 121, '2012-02-28', 4, 'The serum feels luxurious and lightweight upon application, absorbing quickly without leaving any greasy residue.'),
(4, 1, 122, '1979-01-16', 4, 'Absolute fav! Goes on skin like silk and keep it moisturized.');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `benefits` text DEFAULT NULL,
  `product_price` decimal(21,9) NOT NULL,
  `stock_qty` int(11) NOT NULL,
  `main_category` enum('Skincare','Makeup') NOT NULL DEFAULT 'Skincare',
  `sub_category` enum('Face','Body','Sun','Men','Eyes','Lips') NOT NULL DEFAULT 'Face',
  `date_listed` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `note` text NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `benefits`, `product_price`, `stock_qty`, `main_category`, `sub_category`, `date_listed`, `is_active`, `note`) VALUES
(1, 'Hydrating Gentle Foaming Face Cleanser for Normal to Dry Skin', 'Moisture-rich, gentle foaming cleanser for normal to dry skin types removes makeup, impurities + boosts hydration for a soft and supple complexion.', 'Gently dissolves makeup, impurities + pollutants; Soothes + softens dry skin; Reinforces skin\'s hydration', 31.000000000, 89, 'Skincare', 'Body', '1974-05-07', 1, 'new'),
(2, 'Dry Touch Facial Sunscreen - Broad Spectrum SPF 50+', 'A lightweight, dry-touch Broad Spectrum SPF 50+ sunscreen for face that works to filter out UVA/UVB rays, while moisturizing and soothing skin.', 'Broad Spectrum SPF 50+ UVA/UVB sun care/protection; Soothes, softens, hydrates; Antioxidant-rich formula, fights free radicals; Supports skin firmness + elasticity; Dry-touch cream; Lightweight, velvety finish; No white cast or sticky residue', 40.000000000, 114, 'Skincare', 'Sun', '2024-01-12', 1, 'for-you'),
(3, 'ClarinsMen Smooth Shave Foaming Gel', 'Creamy mousse shave gel delivers a comfortable shave, while soothing and moisturizing the skin.', 'Soothes, softens, and moisturizes; Energizes the skin; Conditions beard hair; Helps prevent, razor burn, ingrown hairs, and irritation', 25.000000000, 99, 'Skincare', 'Men', '1976-08-31', 1, 'gift'),
(4, 'Blue Orchid Face Treatment Oil', 'Hydrating face oil formulated with 100% plant extracts to help restore radiance, tone and vitality.', 'Gently dissolves makeup, impurities + pollutants; Soothes + softens dry skin; Reinforces skin\'s hydration1', 67.000000000, 90, 'Skincare', 'Face', '2009-04-21', 1, 'new'),
(5, 'UV Plus SPF 50 Anti Pollution Face Sunscreen', 'Daily, oil-free multi-protection UV sunscreen with broad spectrum SPF 50.', 'Helps protect and lock out sunburn damaging UVA/UVB rays; Fights free radicals; Clarins’ plant-based Anti-Pollution Complex helps protect skin from indoor and outdoor pollutants', 46.000000000, 24, 'Skincare', 'Face', '2011-05-16', 1, 'for-you'),
(6, 'Wonder Volume Mascara XXL', 'A volumizing mascara for extra dimensional lashes that look bigger, bolder and twice as thick¹. Swipe on this long-lasting, pitch black formula for 2X the volume¹, 12H¹ smudge-proof wear.', '2X instant volume¹ visibly lengthens + thickens; 12H¹ hold; Smudge-proof + humidity-resistant; Pigment packed, black formula; Easy to remove', 30.000000000, 20, 'Makeup', 'Eyes', '1990-05-11', 1, 'gift'),
(7, 'Hydra-Essentiel Mask', 'Super-quenching face mask for all skin types powered by exclusive Hyaluronic Power Complex+ to help reinforce skin\'s moisture barrier and provide 24H hydration¹ for skin that is visibly plumped, nourished, and protected.', 'Visibly plumper skin after 1 application + 24H hydration; Immediate + long-lasting hydration; Reinforces the skin’s moisture barrier; Revives skin’s radiance; Visibly smoothes + renews skin', 39.000000000, 60, 'Skincare', 'Face', '2011-07-19', 1, 'new'),
(8, 'Exfoliating Gentle Body-Scrub For Smooth Skin', 'Refreshing body scrub that gently exfoliates, softens, and nourishes.', 'Smoothes away dry cells, flakes, and impurities; Refines skin\'s texture; Nourishes and softens; Preps skin for treatments to follow', 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, 'for-you'),
(9, 'Joli Rouge Satin Lipstick', 'A creamy, satin-finish lipstick that delivers intense color, and extreme comfort in a new eco-friendly, refillable tube.', 'Intense color; Hydrates, nourishes, comforts; Lightweight, full coverage, satin finish; Eco-friendly refillable lipstick tube', 37.000000000, 72, 'Makeup', 'Lips', '1985-01-11', 1, 'gift'),
(10, 'Instant Concealer Long Wearing + Crease Free', 'A long-wearing, crease-free concealer that brightens, smoothes, and conceals dark circles and imperfections.', 'Conceals dark circles; Brightens, smoothes, and refreshes the eye area; Visibly reduces puffiness; Hydrates and soothes; Long-wearing formula Natural-looking results', 35.000000000, 66, 'Makeup', 'Face', '2005-03-30', 1, 'new'),
(11, 'Beauty Flash Balm', 'A multi-tasking balm that instantly moisturizes, visibly brightens, and tightens facial contours so skin looks rested and relaxed.', 'Promotes radiant skin; Visibly tightens and smoothes; Reduces signs of fatigue; Preps skin for flawless makeup application; 10-minute face mask; Provides gentle exfoliation to promote smooth skin; Contains Anti-Pollution Complex', 52.000000000, 50, 'Makeup', 'Face', '1991-04-23', 1, 'for-you'),
(12, 'Wonder Perfect Mascara 4D', 'All-in-one, 4D mascara that takes lashes to bold new dimensions: visibly lengthened, curled, defined and volumized.', 'Visibly lengthens, curls, defines, and volumizes lashes with Clarins\' Lash Boosting Complex; Filmogenic Rose Wax provides long-wear color and hold', 30.000000000, 94, 'Makeup', 'Eyes', '2014-01-25', 1, 'gift'),
(13, 'Super Restorative Night Cream - All Skin Types', 'An anti-aging night cream for mature skin that replenishes, targets wrinkles, visibly improves slackening, boosts radiance, and evens skin tone. Powered by Organic Harungana, as effective as retinol* and gentle on the skin, plus Organic Gorse.', 'Visibly minimizes lines, wrinkles, loss of density, and skin slackening; Visibly lifts, firms, smoothes, and plumps; Hydrates, comforts, and softens; Boosts skin’s radiance; Helps even skin tone; Clarins’ plant-based Anti-Pollution Complex helps minimize damage from environmental pollution that leads to premature signs of aging, including blue light from electronics', 142.000000000, 66, 'Skincare', 'Face', '2021-12-03', 1, ''),
(14, 'Lip Perfector 2-in-1 Lip and Cheek Color Balm', 'A 2-in-1 balm and highlighter that nourishes and plumps lips with 3D shine while providing a boost of radiance to cheeks for a natural healthy glow.', 'Smoothes and hydrates; Boosts radiance; Plumps', 30.000000000, 80, 'Makeup', 'Lips', '2007-05-27', 1, ''),
(15, 'Graphik Ink Liner Liquid Eyeliner Pen', 'High-precision liquid eyeliner delivers intense, transfer-proof color.', 'Intense black color with a luminous finish; Creates a clean, precise line; Easy-to-use felt tip applicator; Long-wearing, transfer-proof formula', 33.000000000, 54, 'Makeup', 'Eyes', '2022-11-22', 1, ''),
(17, 'Tonic Citrus Foaming Gel', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Gel\r\nUse: Apply to moist skin in shower or bath. Learn more\r\nBenefits\r\nLeaves the skin clean and soft\r\nDelicately scented.', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(18, 'Body Firming Extra-Firming Cream', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Cream\r\nUse: Apply morning and/or evening to clean, dry skin. Learn more\r\nBenefits\r\nVisibly firms, tightens and smoothes sagging skin\r\nVisibly tones and revitalizes\r\nHydrates for 48 hours*', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(19, 'Foot Beauty Moisturizing Treatment Cream', 'Skin type: Normal, Oily, Combination, Dry\r\nUse: Apply morning and/or evening. Learn more\r\nBenefits\r\nNourishes and softens rough, dry skin\r\nConditions nails and cuticles\r\nHelps relieve tension and fatigue\r\nSilky, non-greasy texture', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(20, 'Bust Beauty Extra-Lift Gel - Breast Firming Gel', 'Skin type: All skin types\r\nTexture: Gel\r\nUse: Apply each morning. Learn more\r\nBenefits\r\nVisibly firms, lifts and tones\r\nVisibly tightens skin from base of breasts to chin\r\nHydrates and softens\r\nVisibly defines bust line', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(21, 'Tonic Sugar Polisher - Essential Oil Body Scrub', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Gel\r\nUse: Apply to moist skin in shower or bath. Learn more\r\nBenefits\r\nFormulated with 99% ingredients of natural origin\r\nPolishes away dry cells, flakes, and impurities\r\nRefines skin texture\r\nSoftens and nourishes\r\nInvigorates the senses\r\nLearn More\r\nRevitalizing body scrub—with gently exfoliating Organic Sugar and Salt crystals—polishes away dry, flaky surface cells and impurities to reveal the smooth, radiant skin beneath. Formulated with 99% ingredients of natural origin—including aromatic essential oils of Organic Geranium, Rosemary, Field Mint, and Hazelnut plus nourishing Organic Shea Butter—the creamy, melting, sensorial texture invigorates the senses for a spa-fresh feeling from shoulders to toes, and skin that is soft, sleek, and refined.\r\n\r\nECO-FRIENDLY FORMULA + DESIGN\r\nTonic Sugar Polisher is a formula of 100% natural origin. The packaging contains recycled material and is 100% recyclable. The carton is made of cardboard sourced from sustainably-managed forests.\r\nInnovation and plant expertise\r\nEvery day, your body skin faces environmental aggressors—hot or cold air, pollutants, UV rays—that can leave it dry, flaky, and itchy. Tonic Sugar Polisher’s gently refining Organic Sugar and Salt crystals clear away dead surface cells revealing glowing skin beneath. Aromatic essential oils—including Organic Geranium, Rosemary, Field Mint, and Hazelnut plus Organic Shea Butter, leave skin satin-smooth.\r\nClarins Plus\r\nClarins AROMA care formulas contain a minimum of 92% ingredients of natural origin—the perfect synergy of fragrant essential oils and precious plant extracts to soothe your skin and boost your mood for a total feeling of comfort and well-being. Create an at-home spa with aromatherapeutic treatments for every inch of skin—Clarins’ holistic vision for body and mind since 1954.', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(22, 'Eau Ressourçante Treatment Fragrance Spray', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Liquid\r\nUse: Spray onto skin throughout the day. Learn more\r\nBenefits\r\nPerfumes skin with a comforting, woody-floral scent\r\nSoothes and refreshes\r\nHydrates and softens\r\nAromatherapy properties promote a feeling of calm\r\nGentle and non-photosensitizing\r\nLearn More\r\nRelaxing treatment fragrance that combines the aromatherapy and skincare benefits of concentrated plant extracts to refresh, soothe, and perfume skin. Formulated with aromatic essential oils of Basil, Florentine Iris, Benzoin Siam and Cedarwood—this woody-floral fragrance promotes a total feeling of calm, while soothing the skin with a delicate veil of scented moisture. Natural plant extracts—Sarsaparilla, Longan, and Robinia—leave skin feeling soft, smooth and refreshed. Gentle, non-photosensitizing formula. Bottle is made of 40% recycled glass.\r\nInnovation and plant expertise\r\nThis formula contains 100% organic alcohol derived from sugar beets.\r\nClarins Plus\r\nClarins AROMA care formulas contain a minimum of 92% ingredients of natural origin—the perfect synergy of fragrant essential oils and precious plant extracts to soothe your skin and boost your mood for a total feeling of comfort and well-being. Create an at-home spa with aromatherapeutic treatments for every inch of skin—Clarins’ holistic vision for body and mind since 1954.', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(23, 'Relax Body Treatment Oil', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Oil\r\nUse: Use 2-3 times per week. Learn more\r\nBenefits\r\nRelaxes, soothes and smoothes\r\nRelieves stress and fatigue\r\nLocks in moisture\r\nSoothes aching muscles', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(24, 'Hand Gel Gentle Foaming Cleanser with Cottonseed', 'Skin type: All skin types\r\nTexture: Gel\r\nUse: Use any time of the day. Learn more\r\nBenefits\r\nGently cleanses and purifies\r\nSoftens and soothes\r\nLeaves skin supple and comfortable\r\nDelicately scented', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(25, 'Eau Extraordinaire Treatment Fragrance Spray', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Spray\r\nUse: Spray onto skin throughout the day. Learn more\r\nBenefits\r\nFormulated with 95% ingredients of natural origin\r\nMoisturizes, softens and soothes\r\nInvigorates and refreshes\r\nSheer lightweight spray\r\nRefreshing scent revives inner strength\r\nLearn More\r\nRevitalizing treatment fragrance that combines the aroma and skincare benefits of concentrated plant extracts to hydrate, invigorate, and perfume skin. Formulated with aromatic essential oils of Jasmine, Patchouli, Red Ginger, and a sparkling twist of citrus, this uplifting fragrance awakens the senses, and revives inner strength and vitality. Natural plant extracts of Organic Leaf of Life and Acerola seed super-quench and enhance radiance, leaving skin soft and revitalized. Gentle, non-photosensitizing formula is suitable for all skin types—even the most sensitive.\r\n\r\nSpray on over Eau Extraordinaire Revitalizing Silky Body Cream for an extraordinary feeling that lasts for hours.\r\n\r\nECO-FRIENDLY FORMULA + DESIGN\r\nEau Extraordinaire Treatment Fragrance is a formula of 95% natural origin. The glass bottle is made of 40% recycled glass, and is 100% recyclable. The carton is made of cardboard sourced from sustainably-managed forests .\r\nInnovation and plant expertise\r\nStress, fatigue, and daily responsibilities can leave us feeling de-energized, and our body skin fragile. Eau Extraordinaire Treatment Fragrance’s invigorating essential oils—including revitalizing Jasmine, Patchouli, and Red Ginger—plus Organic Leaf of Life and Acerola seed extracts—are nature’s way of smoothing your skin and awakening your inner strength and vitality.\r\nClarins Plus\r\nClarins AROMA care formulas contain a minimum of 92% ingredients of natural origin—the perfect synergy of fragrant essential oils and precious plant extracts to soothe your skin and boost your mood for a total feeling of comfort and well-being. Create an at-home spa with aromatherapeutic treatments for every inch of skin—Clarins’ holistic vision for body and mind since 1954.', NULL, 43.000000000, 133, 'Skincare', 'Body', '2017-03-07', 1, ''),
(26, 'Multi-Active Day Face Cream - All Skin Types', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Cream\r\nUse: Apply to clean skin each morning Learn more\r\nBenefits\r\nVisibly smoothes lines, refines skin texture, and boosts radiance\r\nHelps reinforce skin\'s moisture barrier\r\nEvens skin tone and visibly tightens pores\r\nTargets first lines and wrinkles', NULL, 43.000000000, 133, 'Skincare', 'Face', '2017-03-07', 1, ''),
(27, 'Instant Smooth-Perfecting Touch Face Primer', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Cream\r\nUse: Use alone, under makeup, or mix with your foundation. Learn more\r\nBenefits\r\nFills in fine lines, pores and deep wrinkles\r\nSmoothes and hydrates the skin\r\nPreps skin for flawless makeup application', NULL, 43.000000000, 133, 'Skincare', 'Face', '2017-03-07', 1, ''),
(28, 'Bright Plus Face Brightening Dark Spot Serum', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Serum\r\nUse: Apply daily to clean face and neck, morning and/or evening. Learn more\r\nBenefits\r\nAlleviates skin congestion to visibly brighten and boost radiance\r\nTargets all types of dark spots caused by harmful UV rays, pollution, and blemishes\r\nHydrates and soothes', NULL, 43.000000000, 133, 'Skincare', 'Face', '2017-03-07', 1, ''),
(29, 'Purifying Toning Face Lotion for Oily Skin', 'Skin type: Oily, Combination\r\nTexture: Lotion\r\nUse: Apply to face after cleansing, morning and evening.  Learn more\r\nBenefits\r\nTones, hydrates, and purifies combination to oily skin Removes every last trace of cleanser\r\nLeaves skin soft, shine-free, and refined\r\nBalances the skin\'s microbiota', NULL, 43.000000000, 133, 'Skincare', 'Face', '2017-03-07', 1, ''),
(30, 'UV PLUS Anti-Pollution Tinted Sunscreen SPF 50', 'Skin type: Normal, Oily, Combination, Dry\r\nUse: Apply to face and neck after moisturizing. Learn more\r\nBenefits\r\nHelps protect skin from photo-aging and dark spots\r\nFights free radicals\r\nClarins’ plant-based Anti-Pollution Complex helps protect skin from indoor and outdoor pollutants', NULL, 103.000000000, 133, 'Skincare', 'Face', '2017-03-07', 1, ''),
(31, 'Extra-Firming Energy', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Cream\r\nUse: Apply to clean face each morning. Learn more\r\nBenefits\r\nVisibly firms, tightens, and smoothes\r\nBoosts skin’s radiance and promotes an even skin tone\r\nEnergizes skin to create a healthy-looking glow\r\nHydrates and nourishes\r\nClarins’ plant-based Anti-Pollution Complex helps protect skin from indoor and outdoor pollutants\r\nLearn More\r\nA 2-in-1 day cream that visibly firms and boosts radiance, with re-energizing superpowers for a healthy-looking glow. This new generation, dual-action cream combines the revitalizing expertise of Clarins’ anti-aging plant ingredients, including an age-defying blend of Kangaroo Flower and Organic Mitracarpus extracts, with our Glow Plus Complex to target signs of fatigue and stress—loss of firmness, wrinkles, and dullness—promoting a smooth, even, radiant complexion.\r\n\r\nOur proprietary Glow Plus Complex is powered by energizing superfruits—radiance-boosting Acerola seed (rich in Vitamin C), revitalizing Organic Goji Berry, skin-enhancing Paprika extract, and nourishing Organic Apricot oil—to create a healthy-looking glow. A blend of four micro-pearls enhances luminosity for virtually flawless-looking skin.\r\n\r\nFormulated with Clarins\' plant-based Anti-Pollution Complex to protect skin from outdoor and indoor pollution, including skin-aging blue lights from electronics.\r\n\r\nThe silky-smooth, anti-aging day cream melts into the skin with a comfortable, lightweight finish. The natural apricot tint blends seamlessly into all skin tones, providing a youthful, healthy-looking radiance.\r\nInnovation and plant expertise\r\nOur Glow Plus Complex is powered by energizing superfruits—radiance-boosting Acerola seed (rich in Vitamin C), revitalizing Organic Goji Berry, skin-enhancing Paprika extract, and nourishing Organic Apricot oil—to create a healthy-looking glow. A blend of four micro-pearls enhances luminosity for virtually flawless-looking skin.\r\nClarins Plus\r\nDual-action skincare that combines Clarins\' anti-aging expertise with a blend of radiance-boosting superfruits.', NULL, 66.000000000, 133, 'Skincare', 'Face', '2017-03-07', 1, ''),
(32, 'My Clarins CLEAR-OUT Targeted Vegan Blemish Lotion with Salicylic Acid', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Lotion\r\nUse: At night, before bed. Learn more\r\nBenefits\r\nPurifies skin and dries blemishes in 1 night*\r\nKeeps excess sebum in check\r\nVisibly reduces redness', NULL, 112.000000000, 133, 'Skincare', 'Face', '2017-03-07', 1, ''),
(33, 'Total Eye Smooth - Under Eye Smoothing Balm', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Balm\r\nUse: Use daily, morning and/or evening. Or 1-2 times per week as a relaxing mask. Learn more\r\nBenefits\r\nVisibly firms, smoothes, and fights wrinkles\r\nMinimizes the look of dark circles and puffiness', NULL, 413.000000000, 133, 'Skincare', 'Face', '2017-03-07', 1, ''),
(34, 'Sunscreen - Body Lotion Spray - Broad Spectrum SPF 50+', 'Broad Spectrum SPF 50+ UVA/UVB sun care/protection\r\nHydrates + comforts\r\nFights free radicals\r\nSupports skin firmness + elasticity\r\nSpray-on lotion\r\nNo white cast or sticky residue', NULL, 413.000000000, 133, 'Skincare', 'Sun', '2017-03-07', 1, ''),
(35, 'UV Plus SPF 50 Anti Pollution Face Sunscreen', 'Skin type: Combination, Dry, Normal, Oily\r\nUse: Apply to face and neck after moisturizing. Learn more\r\nBenefits\r\nHelps protect and lock out sunburn damaging UVA/UVB rays\r\nFights free radicals\r\nClarins’ plant-based Anti-Pollution Complex helps protect skin from indoor and outdoor pollutants', NULL, 413.000000000, 133, 'Skincare', 'Sun', '2017-03-07', 1, ''),
(36, 'Soothing After Sun Balm', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Balm\r\nUse: Smooth onto face and body skin immediately after sun exposure. Learn more\r\nBenefits\r\nHydrates skin for 48 hours*\r\nPromotes a long-lasting, intense tan that resists peeling and flaking\r\nLeaves skin soft, smooth and comfortable\r\nNon-sticky balm texture melts into the skin without leaving white residue\r\nTropical, woody-floral scent with a twist of citrus\r\nSleek take-along tube, great for travel!\r\n*Hydration kinetics – 12 volunteers\r\n', NULL, 333.000000000, 133, 'Skincare', 'Sun', '2017-03-07', 1, ''),
(37, 'SOS Sunburn Soother Mask', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Cream\r\nUse: Apply to sunburned skin on face and body immediately after sun exposure. Reapply throughout the day. Learn more\r\nBenefits\r\nHydrates skin for 48 hours*\r\nSoothes and cools down red, hot, sunburned skin\r\nLeaves skin soft, smooth and comfortable\r\nCool, melting texture\r\nHelps protect skin from the effects of free radicals\r\nEasy to take-along jar is great for travel\r\nTropical woody-floral scent with a twist of citrus\r\n*Corneometry test - 30 volunteers', NULL, 413.000000000, 133, 'Skincare', 'Sun', '2017-03-07', 1, ''),
(38, 'After Sun Shower Gel', 'Benefits\r\n3-in-1 formula gently cleanses face, body, and hair\r\nEliminates UV filters, salt, sand, chlorine odors, and pollution\r\nLeaves skin and hair soft and silky\r\nSleek, take-along tube is made from recycled plastic\r\nTropical woody-floral scent with a twist of citrus', NULL, 413.000000000, 133, 'Skincare', 'Sun', '2017-03-07', 1, ''),
(39, 'Radiance-Plus Golden Glow Booster for Face', 'Benefits\r\nCreates a natural-looking, made-to-measure tan\r\nLong-lasting, streak-free results\r\nEasy, mistake-proof application\r\nLeaves skin soft, supple, and hydrated\r\nWon’t stain or smudge', NULL, 413.000000000, 133, 'Skincare', 'Sun', '2017-03-07', 1, ''),
(40, 'Self Tanning Milky Face and Body Lotion', 'Benefits\r\nCreates a tailor-made tan—from sun-touched to deep bronze\r\nHydrates for 24 hours\r\nLong-lasting, streak-free, natural-looking\r\nWon’t smudge or stain clothes', NULL, 413.000000000, 133, 'Skincare', 'Sun', '2017-03-07', 1, ''),
(41, 'UV PLUS Anti-Pollution Tinted Sunscreen SPF 50', 'Benefits\r\nCreates a tailor-made, buildable, instant self tan—from sun-touched to deep bronze\r\nLong-lasting, streak-free, natural-looking\r\nWon’t smudge or stain clothes', NULL, 413.000000000, 133, 'Skincare', 'Sun', '2017-03-07', 1, ''),
(42, 'ClarinsMen After Shave Soothing Toner', 'Benefits\r\nSoothes razor burn\r\nVisibly minimizes pores\r\nMattifies, moisturizes, and exfoliates', NULL, 413.000000000, 133, 'Skincare', 'Men', '2017-03-07', 1, ''),
(43, 'ClarinsMen After Shave Soothing Gel', 'Benefits\r\nSoothes irritations\r\nMoisturizes and smoothes\r\nSoftens and revitalizes the beard', NULL, 413.000000000, 133, 'Skincare', 'Men', '2017-03-07', 1, ''),
(44, 'ClarinsMen Shave and Beard Oil', 'Benefits\r\nSoftens, smoothes, and nourishes facial hair\r\nConditions and tames an unruly beard\r\nHelps reduce itching', NULL, 413.000000000, 133, 'Skincare', 'Men', '2017-03-07', 1, ''),
(45, 'ClarinsMen Energizing Gel - Mattifying Moisturizer Gel for Men', 'Benefits\r\nEnergizes the skin\r\nLocks in moisture\r\nMatifies and de-shines\r\nPlant-based Anti-Pollution Complex helps protect skin from indoor and outdoor pollutants', NULL, 413.000000000, 133, 'Skincare', 'Men', '2017-03-07', 1, ''),
(46, 'ClarinsMen Energizing Eye Gel', 'Benefits\r\nTargets dark circles & puffiness\r\nEnergizes tired-looking eye\r\nLocks in moisture\r\nVisibly smoothes eye contours\r\nAnti-Pollution Complex\r\nInvisible, non-sticky texture', NULL, 413.000000000, 133, 'Skincare', 'Men', '2017-03-07', 1, ''),
(47, 'ClarinsMen Active Face Wash', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Gel\r\nUse: Use daily, morning and/or evening. Learn more\r\nBenefits\r\nRemoves excess dirt, oil, and pollutants\r\nGently cleanses and tones, leaving skin soft, purified, and refreshed\r\nHelps neutralize the drying effects of hard water', NULL, 413.000000000, 133, 'Skincare', 'Men', '2017-03-07', 1, ''),
(48, 'ClarinsMen Super Gel Moisturizer - Mattifying Moisturizer', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Gel\r\nUse: Apply to clean face and neck, morning and/or evening. Learn more\r\nBenefits\r\nCooling gel hydrates and matifies\r\nMaximizes hydration in the face of extreme temperatures\r\nCalms and tones skin after shaving\r\nSoothes, energizes and defies shine\r\nAnti-Pollution Complex', NULL, 413.000000000, 133, 'Skincare', 'Men', '2017-03-07', 1, ''),
(49, 'ClarinsMen Line-Control Balm - Anti-Aging Moisturizer for Men', 'Skin type: Combination, Dry, Normal\r\nUse: Apply to clean face and neck, morning and/or evening. Learn more\r\nBenefits\r\nVisibly firms and smoothes deep lines and wrinkles\r\nVisibly tightens sagging skin around the chin\r\nContains Clarins\' Anti-Pollution Complex\r\nDermatologist-tested\r\nNon-comedogenic', NULL, 413.000000000, 133, 'Skincare', 'Men', '2017-03-07', 1, ''),
(50, 'Instant Eye-Makeup Remover for Sensitive Eyes', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Lotion\r\nUse: Use morning and/or evening as needed. Learn more\r\nBenefits\r\nRemoves all traces of eye makeup, including heavy + waterproof\r\nSoothes, softens + refreshes skin around the eyes\r\nConditions + protects lashes\r\nGentle enough for sensitive eyes', NULL, 73.000000000, 133, 'Makeup', 'Eyes', '2017-03-07', 1, ''),
(51, 'Supra Volume Mascara', 'Skin type: Combination, Dry, Normal, Oily\r\nTexture: Gel/Liquid\r\nUse: Apply from roots to tips for a full, fanned-out lash look. Learn more\r\nBenefits\r\nDouble volume effect\r\nVisibly thickens and smoothes\r\nFans out lashes\r\nClump-free and long-wearing\r\nEasy one coat application\r\nGentle on eyes', NULL, 73.000000000, 133, 'Makeup', 'Eyes', '2017-03-07', 1, ''),
(52, 'Waterproof Colored Pencil Eyeliner', 'What it is\r\nSkin type: Normal, Oily, Combination, Dry\r\nUse: Glide along upper and/or lower lash line. Learn more\r\nBenefits\r\nRich color pigments deliver an intense color payoff\r\nTransfer-proof for 8 hours\r\nFine retractable pencil, built-in sharpener, and smudging tip for smoky eye looks\r\nSleek design for precision control', NULL, 73.000000000, 133, 'Makeup', 'Eyes', '2017-03-07', 1, ''),
(53, 'Ombre Skin Eyeshadow', 'Skin type: Normal, Oily, Combination, Dry\r\nUse: Apply with fingertip or brush. Learn more\r\nBenefits\r\nHighly pigmented shades\r\nNourishes\r\nSmoothes and softens eyelids', NULL, 73.000000000, 133, 'Makeup', 'Eyes', '2017-03-07', 1, ''),
(54, 'SOS Lashes Serum Mascara', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Cream-Gel\r\nUse: Sweep over bare lashes for a natural eye look, or use as a base coat to intensify any mascara. Learn more\r\nBenefits\r\nProtects, nourishes, conditions lashes.\r\nVisibly smoothes, thickens, and lengthens\r\nPreps and primes lashes for mascara\r\nIntensifies mascara color and makeup effect\r\nNatural makeup result on bare lashes\r\nCan be used as a sleeping mask\r\nPlant-based Lash-Boosting Complex', NULL, 73.000000000, 133, 'Makeup', 'Eyes', '2017-03-07', 1, ''),
(55, 'Long Wear Eyebrow Pencil - Eyebrow Pencil with Spoolie Brush', 'Skin type: All skin types\r\nUse: Use as part of your makeup routine. Learn more\r\nBenefits\r\nSculpts, contours + defines\r\nSpiral brush tames and grooms \r\nPrecise application\r\nAll day wear', NULL, 73.000000000, 133, 'Makeup', 'Eyes', '2017-03-07', 1, ''),
(56, 'Supra Lift & Curl Mascara', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Cream\r\nUse: Apply from roots to tips of lashes. Learn more\r\nBenefits\r\nVisibly lifts and curls for a professional lash-lift effect\r\nVisibly lengthens and thickens lashes\r\nCreates an open, wide-eyed look\r\nWater-resistant, smudge-proof\r\nLightweight and long-wearing\r\n100% natural mineral pigments produce intense black color', NULL, 73.000000000, 133, 'Makeup', 'Eyes', '2017-03-07', 1, ''),
(57, 'Wonder Perfect Mascara 4D Waterproof', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Cream\r\nUse: Apply from roots to tips of lashes. Learn more\r\nBenefits\r\nVisibly lengthens, curls, defines, and volumizes\r\nWaterproof formula resists humidity, sweat, and watery eyes\r\nDelivers intense, flake-proof, and smudge-proof color\r\nGentle on eyes', NULL, 73.000000000, 133, 'Makeup', 'Eyes', '2017-03-07', 1, ''),
(58, 'Lip Comfort Oil Hydrating and Plumping Lip Oil', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Oil\r\nUse: Wear alone; to prime lips; or top off any lipstick or stain for extra shine. Learn more\r\nBenefits\r\nUltra-hydrating lip oil – comforts and protects\r\nA trio of nourishing oils visibly plumps lips\r\nKisses lips with a sheer hint of color and mirror-like shine\r\nAvailable in 10 shades, including 5 pH-reactive shades that deliver customized color upon contact with lips', NULL, 66.000000000, 123, 'Makeup', 'Lips', '2017-03-07', 1, ''),
(59, 'Lip Perfector Shimmer Lip Gloss', 'Skin type: Normal, Oily, Combination, Dry\r\nUse: Wear alone, or top off your favorite lipstick with a kiss of shimmer. Learn more\r\nBenefits\r\nPlumps and shines\r\nNourishes and hydrates\r\nMelting cream texture\r\nVanilla scent\r\nPampering cushion applicator', NULL, 66.000000000, 123, 'Makeup', 'Lips', '2017-03-07', 1, ''),
(60, 'Black + White Lip Comfort Oil with Shimmer', 'Use: Wear alone, or top-off any lipstick or lip stain with a touch of shine. Learn more\r\nBenefits\r\nUltra-hydrating lip oil comforts + protects\r\nA trio of essential oils nourish, hydrate + visibly plump\r\nKisses lips with a sheer hint of color and high-shine gloss\r\nAvailable in 2 shades, including 1 pH-reactive shade that delivers customized color upon contact with lips', NULL, 66.000000000, 123, 'Makeup', 'Lips', '2017-03-07', 1, ''),
(61, 'Lip Comfort Oil - Power of Color', 'Use: Wear alone; or to top off any lipstick or stain for a pretty pop of color and shine. Learn more\r\nBenefits\r\nComfort and protect\r\nProvide color pop and shine to your lips\r\nAvailable in 3 new vibrant shades', NULL, 66.000000000, 123, 'Makeup', 'Lips', '2017-03-07', 1, ''),
(62, 'Joli Rouge Shine Refill', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Stick\r\nUse: Apply to lips for shiny color and a luminous finish. Learn more\r\nBenefits\r\nIntense color\r\nHydrates, nourishes, comforts\r\nLightweight, full coverage, shiny finish', NULL, 66.000000000, 123, 'Makeup', 'Lips', '2017-03-07', 1, ''),
(63, 'Joli Rouge Satin Lipstick Refill', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Stick\r\nUse: Apply to lips for intense color and a luminous satin finish. Learn more\r\nBenefits\r\nIntense color\r\nHydrates, nourishes, comforts\r\nLightweight, full coverage, satin finish', NULL, 66.000000000, 123, 'Makeup', 'Lips', '2017-03-07', 1, ''),
(64, 'Joli Rouge Velvet', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Stick\r\nUse: Apply to lips for intense color and a rich matte finish. Learn more\r\nBenefits\r\nIntense color\r\nHydrates, nourishes, comforts\r\nLightweight, full coverage, matte finish\r\nEco-friendly refillable lipstick tube', NULL, 66.000000000, 123, 'Makeup', 'Lips', '2017-03-07', 1, ''),
(65, 'Lip Perfector Intense Color Balm', 'Skin type: Normal, Oily, Combination, Dry\r\nTexture: Balm\r\nUse: Wear alone, or top off your Clarins lipstick for added shine. Learn more\r\nBenefits\r\n4-hour hydration* with Shea butter\r\nRadiant shine, wet effect\r\nMelting, non-sticky cream-gel texture\r\nAddictive vanilla scent\r\nComforting cushion applicator\r\n*Instrumental test - 11 women', NULL, 66.000000000, 123, 'Makeup', 'Lips', '2017-03-07', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` char(255) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) DEFAULT 1,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `is_admin`, `is_active`, `first_name`, `last_name`, `dob`, `phone`, `address`, `user_image`) VALUES
(121, 'bao', '$2y$10$ouBhbdtkf8vHYPU9X6LmxOt9VFGfo4pS0DHngrPZmC9Qs3ar0HdZa', 'baohm88@hotmail.com', 0, 1, 'Bao', 'Ha', '2020-01-01', '0988666281', 'Al Ruwais', 'https://res.cloudinary.com/dppk10edk/image/upload/v1729588412/vzdcg8lscz9j7gpuwqlf.jpg'),
(122, 'admin', '$2y$10$RjTF8VkMryp5ymIp1NJp9uMywKSnfo9RwTx.UbbqDyOE8BrhBn8UO', 'admin@gmail.com', 1, 1, 'admin', 'admin', '2020-01-01', '123456789', 'Hanoi', 'https://res.cloudinary.com/dppk10edk/image/upload/v1728749101/my_avatar_jhnlkj.avif'),
(123, 'quan', '$2y$10$K7MgSzx0cCKhTOzgVXItI.RV5ICt15mu63oezCjxC7p0LGRtxdxwO', 'quan@gmail.clm', 0, 1, 'quan', 'Doan', '2024-10-01', '123456789', 'Hanoi', 'https://res.cloudinary.com/dppk10edk/image/upload/v1729339741/my_avatar_lef43t.avif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `productrating`
--
ALTER TABLE `productrating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `productimages`
--
ALTER TABLE `productimages`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- AUTO_INCREMENT for table `productrating`
--
ALTER TABLE `productrating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
