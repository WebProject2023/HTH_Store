-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 25, 2023 lúc 12:55 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hth_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`, `description`, `status`) VALUES
(3, 'MSI', 'MSI', 1),
(4, 'DELL', 'DELL', 1),
(5, 'ASUS', 'ASUS', 1),
(6, 'ROG', 'ROG', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `usercart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `usercart_id`) VALUES
(3, 9),
(4, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(11) NOT NULL,
  `cartid_id` int(11) DEFAULT NULL,
  `productid_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_detail`
--

INSERT INTO `cart_detail` (`id`, `cartid_id`, `productid_id`, `quantity`) VALUES
(14, 4, 8, 5),
(15, 4, 9, 1),
(18, 3, 9, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230213111745', '2023-02-13 12:18:24', 46),
('DoctrineMigrations\\Version20230214120327', '2023-02-14 13:03:37', 51),
('DoctrineMigrations\\Version20230214133143', '2023-02-14 14:31:49', 44),
('DoctrineMigrations\\Version20230218044955', '2023-02-18 05:50:24', 544),
('DoctrineMigrations\\Version20230218050529', '2023-02-18 06:05:54', 30),
('DoctrineMigrations\\Version20230218065120', '2023-02-18 07:51:28', 38),
('DoctrineMigrations\\Version20230218065230', '2023-02-18 07:52:50', 29),
('DoctrineMigrations\\Version20230222043611', '2023-02-22 05:36:18', 36),
('DoctrineMigrations\\Version20230222044355', '2023-02-22 05:44:03', 131),
('DoctrineMigrations\\Version20230222044707', '2023-02-22 05:47:21', 78),
('DoctrineMigrations\\Version20230223045226', '2023-02-23 05:52:36', 634),
('DoctrineMigrations\\Version20230223045429', '2023-02-23 05:54:34', 42);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `created` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `created`, `image`, `quantity`, `brand_id`) VALUES
(6, 'Laptop ROG G531', 1400, '2023-02-22', 'ROG1-63f5d2fd262ae.jpg', 34, NULL),
(7, 'Laptop ROG Zephy', 3650, '2023-02-15', 'ROG2-63f5d3326eae1.jpg', 12, NULL),
(8, 'Laptop DELL G44', 1299, '2023-02-17', 'DELL1-63f5d35b5a45b.png', 34, NULL),
(9, 'Laptop DELL CF34', 1190, '2023-02-18', 'DELL2-63f5d3840adb6.jpg', 2, NULL),
(10, 'Laptop MSI G5', 4399, '2023-02-10', 'MSI3-63f5d3a794eb1.webp', 4, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(2, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$hx9Z3EKPz.pEhYUCF5NVBujCTXxu3yFvIT8PKxJ3CGNdI73XwUDVa', 'Admin'),
(8, 'test@gmail.com', '[\"ROLE_USER\"]', '$2y$13$8nYx3/q7oC4/AaTewn6kR.0/jufuU1muxY2ZzXVW7lkWMNhnXUA1u', 'Tester'),
(9, 'cc@gmail.com', '[\"ROLE_USER\"]', '$2y$13$iqsIzyF/8GWbdPWWRwljO.2CWgG4xLFkgm7RjqQSSB.L5WHZ5WIh6', 'cc'),
(10, 'aa@gmail.com', '[\"ROLE_USER\"]', '$2y$13$pMZU95UDJVfWjaC0Sj3g4u/flVRDP2Vm.ZXpEF3.hdGwjK2dnlOme', 'aa');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BA388B786B43101` (`usercart_id`);

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_20821DCCCD84EE75` (`cartid_id`),
  ADD KEY `IDX_20821DCCAF89CCED` (`productid_id`);

--
-- Chỉ mục cho bảng `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Chỉ mục cho bảng `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD44F5D008` (`brand_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B786B43101` FOREIGN KEY (`usercart_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `FK_20821DCCAF89CCED` FOREIGN KEY (`productid_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_20821DCCCD84EE75` FOREIGN KEY (`cartid_id`) REFERENCES `cart` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD44F5D008` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
