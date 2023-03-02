-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 02, 2023 lúc 07:51 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.0.27

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
(4, 10),
(5, 11),
(6, 12);

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
(18, 3, 9, 1),
(26, NULL, 7, 1),
(27, NULL, 7, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
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
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created` date NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `created`, `image`, `quantity`, `brand_id`) VALUES
(7, 'Laptop ROG Zephy', 3650, '2023-02-15', 'ROG2-63f5d3326eae1.jpg', 12, NULL),
(8, 'Laptop DELL G44', 1299, '2023-02-17', 'DELL1-63f5d35b5a45b.png', 34, NULL),
(9, 'Laptop DELL CF34', 1190, '2023-02-18', 'DELL2-63f5d3840adb6.jpg', 2, NULL),
(10, 'Laptop MSI G5', 4399, '2023-02-10', 'MSI3-63f5d3a794eb1.webp', 4, NULL),
(11, 'Laptop MSI Modern 14 B11MOU 1027', 1399, '2023-02-26', '65776-laptop-msi-modern-14-17-63fb5bd011a7b.jpg', 5, NULL),
(12, 'Laptop MSI Modern 14 C5M 030', 1399, '2023-02-26', 'laptop-msi-modern-14-c5m-030vn-63fb5c384f0a6.webp', 4, NULL),
(13, 'Laptop Gigabyte Aorus 15P KD 72S1223GH', 2399, '2023-02-26', 'laptop-gigabyte-aorus-15p-kd-72s1223gh-nguyenvu-store-1-510x510-63fb5c9ec0418.jpg', 6, NULL),
(14, 'Laptop ASUS TUF Gaming A15 FA506IHRB-HN080W', 2399, '2023-02-26', 'laptop-asus-tuf-gaming-a15-fa506ihrb-hn080w-1-510x510-63fb5d3cb6c0f.jpg', 5, NULL),
(15, 'Laptop Lenovo IdeaPad Gaming 3 15ACH6 82K200T0VN', 2399, '2023-02-26', 'qLer8ISP-lenovo-ideapad-gaming-3-15ach6-82k200t0vn-1-510x510-63fb5d65929c3.jpg', 4, NULL),
(16, 'Laptop Gaming ASUS ROG Strix G15 G513IH-HN015W', 2399, '2023-02-26', 'laptop-asus-rog-strix-g15-g513ih-hn015w-1-510x510-63fb5d9e51d1d.jpg', 5, NULL),
(17, 'Laptop MSI Gaming Katana GF66', 1399, '2023-02-26', 'laptop-msi-gaming-katana-gf66-11uc-698vn-510x510-63fb5dea4a231.jpg', 5, NULL),
(18, 'Laptop Gaming Acer Nitro 5 2021 AN515-45-R64P', 4399, '2023-02-26', 'nitro-5-2020-sound-d0bb5a1073c64-63fb5e843c6a0.jpg', 5, NULL),
(19, 'Laptop Gaming Acer Nitro 5 2021 AN515-45-R3SM', 4399, '2023-02-26', 'AN515-45-R3SM-at-0-5x-510x510-63fb5ec958c8c.jpg', 6, NULL),
(20, 'Laptop HP Envy X360 13-bf0054TU 6K7D3PA', 1099, '2023-02-26', 'laptop-hp-envy-x360-13-bf0054tu-6k7d3pa-510x510-63fb5f435c13f.jpg', 5, NULL),
(21, 'Laptop ASUS VivoBook Pro 14X OLED M7400QC-KM013W', 1399, '2023-02-26', 'laptop-asus-vivobook-pro-14x-oled-m7400qc-km013w-1-510x510-63fb60073b909.jpg', 4, NULL),
(22, 'Laptop Lenovo Legion 5 15IAH7 82RC008LVN', 1399, '2023-02-26', 'laptop-lenovo-legion-5-15iah7-82rc008lvn-510x510-63fb6060c3bcc.jpg', 3, NULL),
(23, 'Laptop HP Victus 16-e1102AX (7C139PA) (R7-6800H', 2399, '2023-02-26', 'laptop-hp-victus-16-e1102ax-7c139pa-1-510x510-63fb60b10bcb8.jpg', 5, NULL),
(24, 'Laptop HP Victus 16-e1102AX (7C139PA) (R7-6800H', 4399, '2023-02-26', 'laptop-dell-alienware-m15-r6-p109f001cbl-nguyenvu-store-7-63fb612652d32.webp', 6, NULL),
(25, 'MSI Crosshair 15 B12UEZ-460VN', 4399, '2023-02-26', 'laptop-msi-crosshair-15-B12UEZ-460VN-1-1-63fb61e7b51e9.jpg', 4, NULL),
(26, 'Macbook Pro M1 2021 16GB Ram 512GB/1TB SSD 16 INCH', 8999, '2023-02-26', 'Macbook-m1-pro-2021-thietke-63fb62b9933b9.webp', 4, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(2, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$hx9Z3EKPz.pEhYUCF5NVBujCTXxu3yFvIT8PKxJ3CGNdI73XwUDVa', 'Admin'),
(8, 'test@gmail.com', '[\"ROLE_USER\"]', '$2y$13$8nYx3/q7oC4/AaTewn6kR.0/jufuU1muxY2ZzXVW7lkWMNhnXUA1u', 'Tester'),
(9, 'cc@gmail.com', '[\"ROLE_USER\"]', '$2y$13$iqsIzyF/8GWbdPWWRwljO.2CWgG4xLFkgm7RjqQSSB.L5WHZ5WIh6', 'cc'),
(10, 'aa@gmail.com', '[\"ROLE_USER\"]', '$2y$13$pMZU95UDJVfWjaC0Sj3g4u/flVRDP2Vm.ZXpEF3.hdGwjK2dnlOme', 'aa'),
(11, 'hau1@gmail.com', '[\"ROLE_USER\"]', '$2y$13$0sUpzJFpNWdGGvijRR3g/OofRRxZQcwtu/HBvN4iEgJ7bfGedoXKO', 'vo huy hau'),
(12, 'hau@gmail.com', '[\"ROLE_USER\"]', '$2y$13$1Kax.ONBOZl8R37tjPuTXuEYnD2c41OCGl/MCqoQ2H0cpQhb0mTja', 'huy hau');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
