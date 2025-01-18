-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2025 at 05:06 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_connect_friend`
--

-- --------------------------------------------------------

--
-- Table structure for table `avatar_users`
--

CREATE TABLE `avatar_users` (
  `id` bigint UNSIGNED NOT NULL,
  `profession_id` bigint UNSIGNED NOT NULL,
  `status` enum('confirmed','unconfirmed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unconfirmed',
  `from_user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `avatar_users`
--

INSERT INTO `avatar_users` (`id`, `profession_id`, `status`, `from_user_id`, `created_at`, `updated_at`, `is_active`, `user_id`) VALUES
(1, 8, 'confirmed', 10, '2025-01-17 17:02:27', '2025-01-17 21:12:16', 1, 10),
(2, 2, 'confirmed', 10, '2025-01-17 17:17:46', '2025-01-17 21:12:16', 0, 10),
(3, 2, 'confirmed', 13, '2025-01-17 20:54:06', '2025-01-17 20:54:06', 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`, `created_at`, `updated_at`) VALUES
(1, 'Kab. Simeulue', NULL, NULL),
(2, 'Kab. Aceh Singkil', NULL, NULL),
(3, 'Kab. Aceh Selatan', NULL, NULL),
(4, 'Kab. Aceh Tenggara', NULL, NULL),
(5, 'Kab. Aceh Timur', NULL, NULL),
(6, 'Kab. Aceh Tengah', NULL, NULL),
(7, 'Kab. Aceh Barat', NULL, NULL),
(8, 'Kab. Aceh Besar', NULL, NULL),
(9, 'Kab. Pidie', NULL, NULL),
(10, 'Kab. Bireuen', NULL, NULL),
(11, 'Kab. Aceh Utara', NULL, NULL),
(12, 'Kab. Aceh Barat Daya', NULL, NULL),
(13, 'Kab. Gayo Lues', NULL, NULL),
(14, 'Kab. Aceh Tamiang', NULL, NULL),
(15, 'Kab. Nagan Raya', NULL, NULL),
(16, 'Kab. Aceh Jaya', NULL, NULL),
(17, 'Kab. Bener Meriah', NULL, NULL),
(18, 'Kab. Pidie Jaya', NULL, NULL),
(19, 'Kota Banda Aceh', NULL, NULL),
(20, 'Kota Sabang', NULL, NULL),
(21, 'Kota Langsa', NULL, NULL),
(22, 'Kota Lhokseumawe', NULL, NULL),
(23, 'Kota Subulussalam', NULL, NULL),
(24, 'Kab. Nias', NULL, NULL),
(25, 'Kab. Mandailing Natal', NULL, NULL),
(26, 'Kab. Tapanuli Selatan', NULL, NULL),
(27, 'Kab. Tapanuli Tengah', NULL, NULL),
(28, 'Kab. Tapanuli Utara', NULL, NULL),
(29, 'Kab. Toba Samosir', NULL, NULL),
(30, 'Kab. Labuhan Batu', NULL, NULL),
(31, 'Kab. Asahan', NULL, NULL),
(32, 'Kab. Simalungun', NULL, NULL),
(33, 'Kab. Dairi', NULL, NULL),
(34, 'Kab. Karo', NULL, NULL),
(35, 'Kab. Deli Serdang', NULL, NULL),
(36, 'Kab. Langkat', NULL, NULL),
(37, 'Kab. Nias Selatan', NULL, NULL),
(38, 'Kab. Humbang Hasundutan', NULL, NULL),
(39, 'Kab. Pakpak Bharat', NULL, NULL),
(40, 'Kab. Samosir', NULL, NULL),
(41, 'Kab. Serdang Bedagai', NULL, NULL),
(42, 'Kab. Batu Bara', NULL, NULL),
(43, 'Kab. Padang Lawas Utara', NULL, NULL),
(44, 'Kab. Padang Lawas', NULL, NULL),
(45, 'Kab. Labuhan Batu Selatan', NULL, NULL),
(46, 'Kab. Labuhan Batu Utara', NULL, NULL),
(47, 'Kab. Nias Utara', NULL, NULL),
(48, 'Kab. Nias Barat', NULL, NULL),
(49, 'Kota Sibolga', NULL, NULL),
(50, 'Kota Tanjung Balai', NULL, NULL),
(51, 'Kota Pematang Siantar', NULL, NULL),
(52, 'Kota Tebing Tinggi', NULL, NULL),
(53, 'Kota Medan', NULL, NULL),
(54, 'Kota Binjai', NULL, NULL),
(55, 'Kota Padangsidimpuan', NULL, NULL),
(56, 'Kota Gunungsitoli', NULL, NULL),
(57, 'Kab. Kepulauan Mentawai', NULL, NULL),
(58, 'Kab. Pesisir Selatan', NULL, NULL),
(59, 'Kab. Solok', NULL, NULL),
(60, 'Kab. Sijunjung', NULL, NULL),
(61, 'Kab. Tanah Datar', NULL, NULL),
(62, 'Kab. Padang Pariaman', NULL, NULL),
(63, 'Kab. Agam', NULL, NULL),
(64, 'Kab. Lima Puluh Kota', NULL, NULL),
(65, 'Kab. Pasaman', NULL, NULL),
(66, 'Kab. Solok Selatan', NULL, NULL),
(67, 'Kab. Dharmasraya', NULL, NULL),
(68, 'Kab. Pasaman Barat', NULL, NULL),
(69, 'Kota Padang', NULL, NULL),
(70, 'Kota Solok', NULL, NULL),
(71, 'Kota Sawah Lunto', NULL, NULL),
(72, 'Kota Padang Panjang', NULL, NULL),
(73, 'Kota Bukittinggi', NULL, NULL),
(74, 'Kota Payakumbuh', NULL, NULL),
(75, 'Kota Pariaman', NULL, NULL),
(76, 'Kab. Kuantan Singingi', NULL, NULL),
(77, 'Kab. Indragiri Hulu', NULL, NULL),
(78, 'Kab. Indragiri Hilir', NULL, NULL),
(79, 'Kab. Pelalawan', NULL, NULL),
(80, 'Kab. S I A K', NULL, NULL),
(81, 'Kab. Kampar', NULL, NULL),
(82, 'Kab. Rokan Hulu', NULL, NULL),
(83, 'Kab. Bengkalis', NULL, NULL),
(84, 'Kab. Rokan Hilir', NULL, NULL),
(85, 'Kab. Kepulauan Meranti', NULL, NULL),
(86, 'Kota Pekanbaru', NULL, NULL),
(87, 'Kota D U M A I', NULL, NULL),
(88, 'Kab. Kerinci', NULL, NULL),
(89, 'Kab. Merangin', NULL, NULL),
(90, 'Kab. Sarolangun', NULL, NULL),
(91, 'Kab. Batang Hari', NULL, NULL),
(92, 'Kab. Muaro Jambi', NULL, NULL),
(93, 'Kab. Tanjung Jabung Timur', NULL, NULL),
(94, 'Kab. Tanjung Jabung Barat', NULL, NULL),
(95, 'Kab. Tebo', NULL, NULL),
(96, 'Kab. Bungo', NULL, NULL),
(97, 'Kota Jambi', NULL, NULL),
(98, 'Kota Sungai Penuh', NULL, NULL),
(99, 'Kab. Ogan Komering Ulu', NULL, NULL),
(100, 'Kab. Ogan Komering Ilir', NULL, NULL),
(101, 'Kab. Muara Enim', NULL, NULL),
(102, 'Kab. Lahat', NULL, NULL),
(103, 'Kab. Musi Rawas', NULL, NULL),
(104, 'Kab. Musi Banyuasin', NULL, NULL),
(105, 'Kab. Banyu Asin', NULL, NULL),
(106, 'Kab. Ogan Komering Ulu Selatan', NULL, NULL),
(107, 'Kab. Ogan Komering Ulu Timur', NULL, NULL),
(108, 'Kab. Ogan Ilir', NULL, NULL),
(109, 'Kab. Empat Lawang', NULL, NULL),
(110, 'Kota Palembang', NULL, NULL),
(111, 'Kota Prabumulih', NULL, NULL),
(112, 'Kota Pagar Alam', NULL, NULL),
(113, 'Kota Lubuklinggau', NULL, NULL),
(114, 'Kab. Bengkulu Selatan', NULL, NULL),
(115, 'Kab. Rejang Lebong', NULL, NULL),
(116, 'Kab. Bengkulu Utara', NULL, NULL),
(117, 'Kab. Kaur', NULL, NULL),
(118, 'Kab. Seluma', NULL, NULL),
(119, 'Kab. Mukomuko', NULL, NULL),
(120, 'Kab. Lebong', NULL, NULL),
(121, 'Kab. Kepahiang', NULL, NULL),
(122, 'Kab. Bengkulu Tengah', NULL, NULL),
(123, 'Kota Bengkulu', NULL, NULL),
(124, 'Kab. Lampung Barat', NULL, NULL),
(125, 'Kab. Tanggamus', NULL, NULL),
(126, 'Kab. Lampung Selatan', NULL, NULL),
(127, 'Kab. Lampung Timur', NULL, NULL),
(128, 'Kab. Lampung Tengah', NULL, NULL),
(129, 'Kab. Lampung Utara', NULL, NULL),
(130, 'Kab. Way Kanan', NULL, NULL),
(131, 'Kab. Tulangbawang', NULL, NULL),
(132, 'Kab. Pesawaran', NULL, NULL),
(133, 'Kab. Pringsewu', NULL, NULL),
(134, 'Kab. Mesuji', NULL, NULL),
(135, 'Kab. Tulang Bawang Barat', NULL, NULL),
(136, 'Kab. Pesisir Barat', NULL, NULL),
(137, 'Kota Bandar Lampung', NULL, NULL),
(138, 'Kota Metro', NULL, NULL),
(139, 'Kab. Bangka', NULL, NULL),
(140, 'Kab. Belitung', NULL, NULL),
(141, 'Kab. Bangka Barat', NULL, NULL),
(142, 'Kab. Bangka Tengah', NULL, NULL),
(143, 'Kab. Bangka Selatan', NULL, NULL),
(144, 'Kab. Belitung Timur', NULL, NULL),
(145, 'Kota Pangkal Pinang', NULL, NULL),
(146, 'Kab. Karimun', NULL, NULL),
(147, 'Kab. Bintan', NULL, NULL),
(148, 'Kab. Natuna', NULL, NULL),
(149, 'Kab. Lingga', NULL, NULL),
(150, 'Kab. Kepulauan Anambas', NULL, NULL),
(151, 'Kota B A T A M', NULL, NULL),
(152, 'Kota Tanjung Pinang', NULL, NULL),
(153, 'Kab. Kepulauan Seribu', NULL, NULL),
(154, 'Kota Jakarta Selatan', NULL, NULL),
(155, 'Kota Jakarta Timur', NULL, NULL),
(156, 'Kota Jakarta Pusat', NULL, NULL),
(157, 'Kota Jakarta Barat', NULL, NULL),
(158, 'Kota Jakarta Utara', NULL, NULL),
(159, 'Kab. Bogor', NULL, NULL),
(160, 'Kab. Sukabumi', NULL, NULL),
(161, 'Kab. Cianjur', NULL, NULL),
(162, 'Kab. Bandung', NULL, NULL),
(163, 'Kab. Garut', NULL, NULL),
(164, 'Kab. Tasikmalaya', NULL, NULL),
(165, 'Kab. Ciamis', NULL, NULL),
(166, 'Kab. Kuningan', NULL, NULL),
(167, 'Kab. Cirebon', NULL, NULL),
(168, 'Kab. Majalengka', NULL, NULL),
(169, 'Kab. Sumedang', NULL, NULL),
(170, 'Kab. Indramayu', NULL, NULL),
(171, 'Kab. Subang', NULL, NULL),
(172, 'Kab. Purwakarta', NULL, NULL),
(173, 'Kab. Karawang', NULL, NULL),
(174, 'Kab. Bekasi', NULL, NULL),
(175, 'Kab. Bandung Barat', NULL, NULL),
(176, 'Kab. Pangandaran', NULL, NULL),
(177, 'Kota Bogor', NULL, NULL),
(178, 'Kota Sukabumi', NULL, NULL),
(179, 'Kota Bandung', NULL, NULL),
(180, 'Kota Cirebon', NULL, NULL),
(181, 'Kota Bekasi', NULL, NULL),
(182, 'Kota Depok', NULL, NULL),
(183, 'Kota Cimahi', NULL, NULL),
(184, 'Kota Tasikmalaya', NULL, NULL),
(185, 'Kota Banjar', NULL, NULL),
(186, 'Kab. Cilacap', NULL, NULL),
(187, 'Kab. Banyumas', NULL, NULL),
(188, 'Kab. Purbalingga', NULL, NULL),
(189, 'Kab. Banjarnegara', NULL, NULL),
(190, 'Kab. Kebumen', NULL, NULL),
(191, 'Kab. Purworejo', NULL, NULL),
(192, 'Kab. Wonosobo', NULL, NULL),
(193, 'Kab. Magelang', NULL, NULL),
(194, 'Kab. Boyolali', NULL, NULL),
(195, 'Kab. Klaten', NULL, NULL),
(196, 'Kab. Sukoharjo', NULL, NULL),
(197, 'Kab. Wonogiri', NULL, NULL),
(198, 'Kab. Karanganyar', NULL, NULL),
(199, 'Kab. Sragen', NULL, NULL),
(200, 'Kab. Grobogan', NULL, NULL),
(201, 'Kab. Blora', NULL, NULL),
(202, 'Kab. Rembang', NULL, NULL),
(203, 'Kab. Pati', NULL, NULL),
(204, 'Kab. Kudus', NULL, NULL),
(205, 'Kab. Jepara', NULL, NULL),
(206, 'Kab. Demak', NULL, NULL),
(207, 'Kab. Semarang', NULL, NULL),
(208, 'Kab. Temanggung', NULL, NULL),
(209, 'Kab. Kendal', NULL, NULL),
(210, 'Kab. Batang', NULL, NULL),
(211, 'Kab. Pekalongan', NULL, NULL),
(212, 'Kab. Pemalang', NULL, NULL),
(213, 'Kab. Tegal', NULL, NULL),
(214, 'Kab. Brebes', NULL, NULL),
(215, 'Kota Magelang', NULL, NULL),
(216, 'Kota Surakarta', NULL, NULL),
(217, 'Kota Salatiga', NULL, NULL),
(218, 'Kota Semarang', NULL, NULL),
(219, 'Kota Pekalongan', NULL, NULL),
(220, 'Kota Tegal', NULL, NULL),
(221, 'Kab. Kulon Progo', NULL, NULL),
(222, 'Kab. Bantul', NULL, NULL),
(223, 'Kab. Gunung Kidul', NULL, NULL),
(224, 'Kab. Sleman', NULL, NULL),
(225, 'Kota Yogyakarta', NULL, NULL),
(226, 'Kab. Pacitan', NULL, NULL),
(227, 'Kab. Ponorogo', NULL, NULL),
(228, 'Kab. Trenggalek', NULL, NULL),
(229, 'Kab. Tulungagung', NULL, NULL),
(230, 'Kab. Blitar', NULL, NULL),
(231, 'Kab. Kediri', NULL, NULL),
(232, 'Kab. Malang', NULL, NULL),
(233, 'Kab. Lumajang', NULL, NULL),
(234, 'Kab. Jember', NULL, NULL),
(235, 'Kab. Banyuwangi', NULL, NULL),
(236, 'Kab. Bondowoso', NULL, NULL),
(237, 'Kab. Situbondo', NULL, NULL),
(238, 'Kab. Probolinggo', NULL, NULL),
(239, 'Kab. Pasuruan', NULL, NULL),
(240, 'Kab. Sidoarjo', NULL, NULL),
(241, 'Kab. Mojokerto', NULL, NULL),
(242, 'Kab. Jombang', NULL, NULL),
(243, 'Kab. Nganjuk', NULL, NULL),
(244, 'Kab. Madiun', NULL, NULL),
(245, 'Kab. Magetan', NULL, NULL),
(246, 'Kab. Ngawi', NULL, NULL),
(247, 'Kab. Bojonegoro', NULL, NULL),
(248, 'Kab. Tuban', NULL, NULL),
(249, 'Kab. Lamongan', NULL, NULL),
(250, 'Kab. Gresik', NULL, NULL),
(251, 'Kab. Bangkalan', NULL, NULL),
(252, 'Kab. Sampang', NULL, NULL),
(253, 'Kab. Pamekasan', NULL, NULL),
(254, 'Kab. Sumenep', NULL, NULL),
(255, 'Kota Kediri', NULL, NULL),
(256, 'Kota Blitar', NULL, NULL),
(257, 'Kota Malang', NULL, NULL),
(258, 'Kota Probolinggo', NULL, NULL),
(259, 'Kota Pasuruan', NULL, NULL),
(260, 'Kota Mojokerto', NULL, NULL),
(261, 'Kota Madiun', NULL, NULL),
(262, 'Kota Surabaya', NULL, NULL),
(263, 'Kota Batu', NULL, NULL),
(264, 'Kab. Pandeglang', NULL, NULL),
(265, 'Kab. Lebak', NULL, NULL),
(266, 'Kab. Tangerang', NULL, NULL),
(267, 'Kab. Serang', NULL, NULL),
(268, 'Kota Tangerang', NULL, NULL),
(269, 'Kota Cilegon', NULL, NULL),
(270, 'Kota Serang', NULL, NULL),
(271, 'Kota Tangerang Selatan', NULL, NULL),
(272, 'Kab. Jembrana', NULL, NULL),
(273, 'Kab. Tabanan', NULL, NULL),
(274, 'Kab. Badung', NULL, NULL),
(275, 'Kab. Gianyar', NULL, NULL),
(276, 'Kab. Klungkung', NULL, NULL),
(277, 'Kab. Bangli', NULL, NULL),
(278, 'Kab. Karang Asem', NULL, NULL),
(279, 'Kab. Buleleng', NULL, NULL),
(280, 'Kota Denpasar', NULL, NULL),
(281, 'Kab. Lombok Barat', NULL, NULL),
(282, 'Kab. Lombok Tengah', NULL, NULL),
(283, 'Kab. Lombok Timur', NULL, NULL),
(284, 'Kab. Sumbawa', NULL, NULL),
(285, 'Kab. Dompu', NULL, NULL),
(286, 'Kab. Bima', NULL, NULL),
(287, 'Kab. Sumbawa Barat', NULL, NULL),
(288, 'Kab. Lombok Utara', NULL, NULL),
(289, 'Kota Mataram', NULL, NULL),
(290, 'Kota Bima', NULL, NULL),
(291, 'Kab. Sumba Barat', NULL, NULL),
(292, 'Kab. Sumba Timur', NULL, NULL),
(293, 'Kab. Kupang', NULL, NULL),
(294, 'Kab. Timor Tengah Selatan', NULL, NULL),
(295, 'Kab. Timor Tengah Utara', NULL, NULL),
(296, 'Kab. Belu', NULL, NULL),
(297, 'Kab. Alor', NULL, NULL),
(298, 'Kab. Lembata', NULL, NULL),
(299, 'Kab. Flores Timur', NULL, NULL),
(300, 'Kab. Sikka', NULL, NULL),
(301, 'Kab. Ende', NULL, NULL),
(302, 'Kab. Ngada', NULL, NULL),
(303, 'Kab. Manggarai', NULL, NULL),
(304, 'Kab. Rote Ndao', NULL, NULL),
(305, 'Kab. Manggarai Barat', NULL, NULL),
(306, 'Kab. Sumba Tengah', NULL, NULL),
(307, 'Kab. Sumba Barat Daya', NULL, NULL),
(308, 'Kab. Nagekeo', NULL, NULL),
(309, 'Kab. Manggarai Timur', NULL, NULL),
(310, 'Kab. Sabu Raijua', NULL, NULL),
(311, 'Kota Kupang', NULL, NULL),
(312, 'Kab. Sambas', NULL, NULL),
(313, 'Kab. Bengkayang', NULL, NULL),
(314, 'Kab. Landak', NULL, NULL),
(315, 'Kab. Pontianak', NULL, NULL),
(316, 'Kab. Sanggau', NULL, NULL),
(317, 'Kab. Ketapang', NULL, NULL),
(318, 'Kab. Sintang', NULL, NULL),
(319, 'Kab. Kapuas Hulu', NULL, NULL),
(320, 'Kab. Sekadau', NULL, NULL),
(321, 'Kab. Melawi', NULL, NULL),
(322, 'Kab. Kayong Utara', NULL, NULL),
(323, 'Kab. Kubu Raya', NULL, NULL),
(324, 'Kota Pontianak', NULL, NULL),
(325, 'Kota Singkawang', NULL, NULL),
(326, 'Kab. Kotawaringin Barat', NULL, NULL),
(327, 'Kab. Kotawaringin Timur', NULL, NULL),
(328, 'Kab. Kapuas', NULL, NULL),
(329, 'Kab. Barito Selatan', NULL, NULL),
(330, 'Kab. Barito Utara', NULL, NULL),
(331, 'Kab. Sukamara', NULL, NULL),
(332, 'Kab. Lamandau', NULL, NULL),
(333, 'Kab. Seruyan', NULL, NULL),
(334, 'Kab. Katingan', NULL, NULL),
(335, 'Kab. Pulang Pisau', NULL, NULL),
(336, 'Kab. Gunung Mas', NULL, NULL),
(337, 'Kab. Barito Timur', NULL, NULL),
(338, 'Kab. Murung Raya', NULL, NULL),
(339, 'Kota Palangka Raya', NULL, NULL),
(340, 'Kab. Tanah Laut', NULL, NULL),
(341, 'Kab. Kota Baru', NULL, NULL),
(342, 'Kab. Banjar', NULL, NULL),
(343, 'Kab. Barito Kuala', NULL, NULL),
(344, 'Kab. Tapin', NULL, NULL),
(345, 'Kab. Hulu Sungai Selatan', NULL, NULL),
(346, 'Kab. Hulu Sungai Tengah', NULL, NULL),
(347, 'Kab. Hulu Sungai Utara', NULL, NULL),
(348, 'Kab. Tabalong', NULL, NULL),
(349, 'Kab. Tanah Bumbu', NULL, NULL),
(350, 'Kab. Balangan', NULL, NULL),
(351, 'Kota Banjarmasin', NULL, NULL),
(352, 'Kota Banjar Baru', NULL, NULL),
(353, 'Kab. Paser', NULL, NULL),
(354, 'Kab. Kutai Barat', NULL, NULL),
(355, 'Kab. Kutai Kartanegara', NULL, NULL),
(356, 'Kab. Kutai Timur', NULL, NULL),
(357, 'Kab. Berau', NULL, NULL),
(358, 'Kab. Penajam Paser Utara', NULL, NULL),
(359, 'Kota Balikpapan', NULL, NULL),
(360, 'Kota Samarinda', NULL, NULL),
(361, 'Kota Bontang', NULL, NULL),
(362, 'Kab. Malinau', NULL, NULL),
(363, 'Kab. Bulungan', NULL, NULL),
(364, 'Kab. Tana Tidung', NULL, NULL),
(365, 'Kab. Nunukan', NULL, NULL),
(366, 'Kota Tarakan', NULL, NULL),
(367, 'Kab. Bolaang Mongondow', NULL, NULL),
(368, 'Kab. Minahasa', NULL, NULL),
(369, 'Kab. Kepulauan Sangihe', NULL, NULL),
(370, 'Kab. Kepulauan Talaud', NULL, NULL),
(371, 'Kab. Minahasa Selatan', NULL, NULL),
(372, 'Kab. Minahasa Utara', NULL, NULL),
(373, 'Kab. Bolaang Mongondow Utara', NULL, NULL),
(374, 'Kab. Siau Tagulandang Biaro', NULL, NULL),
(375, 'Kab. Minahasa Tenggara', NULL, NULL),
(376, 'Kab. Bolaang Mongondow Selatan', NULL, NULL),
(377, 'Kab. Bolaang Mongondow Timur', NULL, NULL),
(378, 'Kota Manado', NULL, NULL),
(379, 'Kota Bitung', NULL, NULL),
(380, 'Kota Tomohon', NULL, NULL),
(381, 'Kota Kotamobagu', NULL, NULL),
(382, 'Kab. Banggai Kepulauan', NULL, NULL),
(383, 'Kab. Banggai', NULL, NULL),
(384, 'Kab. Morowali', NULL, NULL),
(385, 'Kab. Poso', NULL, NULL),
(386, 'Kab. Donggala', NULL, NULL),
(387, 'Kab. Toli-toli', NULL, NULL),
(388, 'Kab. Buol', NULL, NULL),
(389, 'Kab. Parigi Moutong', NULL, NULL),
(390, 'Kab. Tojo Una-una', NULL, NULL),
(391, 'Kab. Sigi', NULL, NULL),
(392, 'Kota Palu', NULL, NULL),
(393, 'Kab. Kepulauan Selayar', NULL, NULL),
(394, 'Kab. Bulukumba', NULL, NULL),
(395, 'Kab. Bantaeng', NULL, NULL),
(396, 'Kab. Jeneponto', NULL, NULL),
(397, 'Kab. Takalar', NULL, NULL),
(398, 'Kab. Gowa', NULL, NULL),
(399, 'Kab. Sinjai', NULL, NULL),
(400, 'Kab. Maros', NULL, NULL),
(401, 'Kab. Pangkajene Dan Kepulauan', NULL, NULL),
(402, 'Kab. Barru', NULL, NULL),
(403, 'Kab. Bone', NULL, NULL),
(404, 'Kab. Soppeng', NULL, NULL),
(405, 'Kab. Wajo', NULL, NULL),
(406, 'Kab. Sidenreng Rappang', NULL, NULL),
(407, 'Kab. Pinrang', NULL, NULL),
(408, 'Kab. Enrekang', NULL, NULL),
(409, 'Kab. Luwu', NULL, NULL),
(410, 'Kab. Tana Toraja', NULL, NULL),
(411, 'Kab. Luwu Utara', NULL, NULL),
(412, 'Kab. Luwu Timur', NULL, NULL),
(413, 'Kab. Toraja Utara', NULL, NULL),
(414, 'Kota Makassar', NULL, NULL),
(415, 'Kota Parepare', NULL, NULL),
(416, 'Kota Palopo', NULL, NULL),
(417, 'Kab. Buton', NULL, NULL),
(418, 'Kab. Muna', NULL, NULL),
(419, 'Kab. Konawe', NULL, NULL),
(420, 'Kab. Kolaka', NULL, NULL),
(421, 'Kab. Konawe Selatan', NULL, NULL),
(422, 'Kab. Bombana', NULL, NULL),
(423, 'Kab. Wakatobi', NULL, NULL),
(424, 'Kab. Kolaka Utara', NULL, NULL),
(425, 'Kab. Buton Utara', NULL, NULL),
(426, 'Kab. Konawe Utara', NULL, NULL),
(427, 'Kota Kendari', NULL, NULL),
(428, 'Kota Baubau', NULL, NULL),
(429, 'Kab. Boalemo', NULL, NULL),
(430, 'Kab. Gorontalo', NULL, NULL),
(431, 'Kab. Pohuwato', NULL, NULL),
(432, 'Kab. Bone Bolango', NULL, NULL),
(433, 'Kab. Gorontalo Utara', NULL, NULL),
(434, 'Kota Gorontalo', NULL, NULL),
(435, 'Kab. Majene', NULL, NULL),
(436, 'Kab. Polewali Mandar', NULL, NULL),
(437, 'Kab. Mamasa', NULL, NULL),
(438, 'Kab. Mamuju', NULL, NULL),
(439, 'Kab. Mamuju Utara', NULL, NULL),
(440, 'Kab. Maluku Tenggara Barat', NULL, NULL),
(441, 'Kab. Maluku Tenggara', NULL, NULL),
(442, 'Kab. Maluku Tengah', NULL, NULL),
(443, 'Kab. Buru', NULL, NULL),
(444, 'Kab. Kepulauan Aru', NULL, NULL),
(445, 'Kab. Seram Bagian Barat', NULL, NULL),
(446, 'Kab. Seram Bagian Timur', NULL, NULL),
(447, 'Kab. Maluku Barat Daya', NULL, NULL),
(448, 'Kab. Buru Selatan', NULL, NULL),
(449, 'Kota Ambon', NULL, NULL),
(450, 'Kota Tual', NULL, NULL),
(451, 'Kab. Halmahera Barat', NULL, NULL),
(452, 'Kab. Halmahera Tengah', NULL, NULL),
(453, 'Kab. Kepulauan Sula', NULL, NULL),
(454, 'Kab. Halmahera Selatan', NULL, NULL),
(455, 'Kab. Halmahera Utara', NULL, NULL),
(456, 'Kab. Halmahera Timur', NULL, NULL),
(457, 'Kab. Pulau Morotai', NULL, NULL),
(458, 'Kota Ternate', NULL, NULL),
(459, 'Kota Tidore Kepulauan', NULL, NULL),
(460, 'Kab. Fakfak', NULL, NULL),
(461, 'Kab. Kaimana', NULL, NULL),
(462, 'Kab. Teluk Wondama', NULL, NULL),
(463, 'Kab. Teluk Bintuni', NULL, NULL),
(464, 'Kab. Manokwari', NULL, NULL),
(465, 'Kab. Sorong Selatan', NULL, NULL),
(466, 'Kab. Sorong', NULL, NULL),
(467, 'Kab. Raja Ampat', NULL, NULL),
(468, 'Kab. Tambrauw', NULL, NULL),
(469, 'Kab. Maybrat', NULL, NULL),
(470, 'Kota Sorong', NULL, NULL),
(471, 'Kab. Merauke', NULL, NULL),
(472, 'Kab. Jayawijaya', NULL, NULL),
(473, 'Kab. Jayapura', NULL, NULL),
(474, 'Kab. Nabire', NULL, NULL),
(475, 'Kab. Kepulauan Yapen', NULL, NULL),
(476, 'Kab. Biak Numfor', NULL, NULL),
(477, 'Kab. Paniai', NULL, NULL),
(478, 'Kab. Puncak Jaya', NULL, NULL),
(479, 'Kab. Mimika', NULL, NULL),
(480, 'Kab. Boven Digoel', NULL, NULL),
(481, 'Kab. Mappi', NULL, NULL),
(482, 'Kab. Asmat', NULL, NULL),
(483, 'Kab. Yahukimo', NULL, NULL),
(484, 'Kab. Pegunungan Bintang', NULL, NULL),
(485, 'Kab. Tolikara', NULL, NULL),
(486, 'Kab. Sarmi', NULL, NULL),
(487, 'Kab. Keerom', NULL, NULL),
(488, 'Kab. Waropen', NULL, NULL),
(489, 'Kab. Supiori', NULL, NULL),
(490, 'Kab. Mamberamo Raya', NULL, NULL),
(491, 'Kab. Nduga', NULL, NULL),
(492, 'Kab. Lanny Jaya', NULL, NULL),
(493, 'Kab. Mamberamo Tengah', NULL, NULL),
(494, 'Kab. Yalimo', NULL, NULL),
(495, 'Kab. Puncak', NULL, NULL),
(496, 'Kab. Dogiyai', NULL, NULL),
(497, 'Kab. Intan Jaya', NULL, NULL),
(498, 'Kab. Deiyai', NULL, NULL),
(499, 'Kota Jayapura', NULL, NULL);

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
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `friend_id` bigint UNSIGNED NOT NULL,
  `status` enum('verified','unverified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unverified',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 13, 'verified', '2025-01-17 07:09:31', '2025-01-17 18:06:59'),
(2, 10, 23, 'unverified', '2025-01-17 07:14:21', '2025-01-17 07:14:21'),
(3, 10, 31, 'unverified', '2025-01-17 07:14:26', '2025-01-17 07:14:26'),
(4, 10, 30, 'unverified', '2025-01-17 07:23:50', '2025-01-17 07:23:50'),
(5, 10, 30, 'unverified', '2025-01-17 07:24:14', '2025-01-17 07:24:14'),
(6, 13, 10, 'verified', '2025-01-17 18:06:59', '2025-01-17 18:06:59');

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
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `receiver_id` bigint UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `read_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `receiver_id`, `read`, `message`, `created_at`, `updated_at`, `type`, `read_at`) VALUES
(1, 13, 10, 0, 'hallo', '2025-01-17 19:08:07', '2025-01-17 19:31:02', 'text', '2025-01-18'),
(2, 10, 13, 0, 'halo apa kabar kamu?', '2025-01-17 19:26:40', '2025-01-17 19:31:02', 'text', '2025-01-18'),
(3, 10, 13, 0, 'saya coba menulis pesan yang panjang sekali supaya bisa terlihat pengaruhnya, apakah benar rapih text nya atau berantakan, sangat berpengerauh soalnya. mohon dimaklumi.', '2025-01-17 19:27:12', '2025-01-17 19:31:02', 'text', '2025-01-18'),
(4, 13, 10, 0, 'saya coba menulis pesan yang panjang sekali supaya bisa terlihat pengaruhnya, apakah benar rapih text nya atau berantakan, sangat berpengerauh soalnya. mohon dimaklumi.', '2025-01-17 19:41:51', '2025-01-17 19:41:51', 'text', '2025-01-18'),
(5, 10, 13, 0, '2', '2025-01-17 20:10:50', '2025-01-17 20:10:55', 'avatar', '2025-01-18'),
(6, 10, 13, 0, '8', '2025-01-17 20:45:14', '2025-01-17 20:46:21', 'avatar', '2025-01-18'),
(7, 10, 13, 0, '2', '2025-01-17 20:52:14', '2025-01-17 20:52:15', 'avatar', '2025-01-18'),
(8, 10, 13, 0, '2', '2025-01-17 21:09:45', '2025-01-17 21:09:47', 'avatar', '2025-01-18'),
(9, 10, 13, 0, '8', '2025-01-17 21:10:48', '2025-01-17 21:10:50', 'avatar', '2025-01-18');

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
(22, '0001_01_01_000000_create_users_table', 1),
(23, '0001_01_01_000001_create_cache_table', 1),
(24, '0001_01_01_000002_create_jobs_table', 1),
(25, '2025_01_17_084211_create_cities_table', 1),
(26, '2025_01_17_084211_create_professions_table', 1),
(27, '2025_01_17_084211_create_profiles_table', 1),
(28, '2025_01_17_084705_create_profile_professions_table', 1),
(29, '2025_01_17_084724_create_profile_cities_table', 1),
(30, '2025_01_17_092037_create_wallets_table', 1),
(31, '2025_01_17_092041_create_friends_table', 1),
(32, '2025_01_17_092047_create_messages_table', 1),
(33, '2025_01_17_092053_create_avatar_users_table', 1),
(34, '2025_01_17_095249_create_notifications_table', 2),
(35, '2025_01_17_120938_add_read', 3),
(36, '2025_01_17_132533_add_is_active', 4),
(37, '2025_01_17_141950_add_url_notif', 5),
(38, '2025_01_17_153732_add_avatar_users_id', 6),
(39, '2025_01_18_015555_add_type_message', 7),
(40, '2025_01_18_022906_add_read_at', 8),
(41, '2025_01_18_045803_add_bear_to_profile', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `read`, `created_at`, `updated_at`, `url`) VALUES
(1, 10, 'Permintaan Teman Terkirim', 'Anda telah mengirimkan permintaan pertemanan ke User 18', 'Permintaan Teman', 0, '2025-01-17 07:24:14', '2025-01-17 07:24:14', 'http://127.0.0.1:8000/profile/30'),
(2, 10, 'Profile is unvisible', 'Profil Anda telah diaktifkan. Sekarang profil ini ditampilkan oleh pengguna lain. Saldo Anda berkurang sebesar 5', 'Visibility Changed', 0, '2025-01-17 18:06:47', '2025-01-17 18:06:47', 'http://127.0.0.1:8000/profile'),
(3, 13, 'Friend Request Confirmed', 'You have confirmed a friend request from Programmer Update', 'Friend Request', 0, '2025-01-17 18:06:59', '2025-01-17 18:06:59', 'http://127.0.0.1:8000/profile/10'),
(4, 10, 'Friend Request Confirmed', 'You have confirmed a friend request from Programmer Update', 'Friend Request', 0, '2025-01-17 18:06:59', '2025-01-17 18:06:59', 'http://127.0.0.1:8000/profile/10'),
(5, 10, 'Profile is unvisible', 'Profil Anda telah dinonaktifkan. Sekarang profil ini tidak ditampilkan oleh pengguna lain. Saldo Anda berkurang sebesar 50', 'Visibility Changed', 0, '2025-01-17 18:17:14', '2025-01-17 18:17:14', 'http://127.0.0.1:8000/profile'),
(6, 10, 'Profile is unvisible', 'Profil Anda telah diaktifkan. Sekarang profil ini ditampilkan oleh pengguna lain. Saldo Anda berkurang sebesar 5', 'Visibility Changed', 0, '2025-01-17 18:23:06', '2025-01-17 18:23:06', 'http://127.0.0.1:8000/profile'),
(7, 10, 'Avatar telah diubah', 'Your avatar has been changed successfully', 'Avatar telah diubah', 0, '2025-01-17 21:12:16', '2025-01-17 21:12:16', 'http://127.0.0.1:8000/profile'),
(8, 13, 'Coin Purchase Success', 'You have purchased 100 coins', 'Coin Purchase', 0, '2025-01-17 21:13:34', '2025-01-17 21:13:34', 'http://127.0.0.1:8000/profile'),
(9, 10, 'Profile is unvisible', 'Profil Anda telah dinonaktifkan. Sekarang profil ini tidak ditampilkan oleh pengguna lain. Saldo Anda berkurang sebesar 50', 'Visibility Changed', 0, '2025-01-17 21:20:00', '2025-01-17 21:20:00', 'http://127.0.0.1:8000/profile'),
(10, 10, 'Profil ini disembunyikan', 'Profil Anda telah diaktifkan. Sekarang profil ini ditampilkan oleh pengguna lain. Saldo Anda berkurang sebesar 5', 'Visibility Changed', 0, '2025-01-17 21:59:42', '2025-01-17 21:59:42', 'http://127.0.0.1:8000/profile'),
(11, 10, 'Profil ini disembunyikan', 'Profil Anda telah dinonaktifkan. Sekarang profil ini tidak ditampilkan oleh pengguna lain. Saldo Anda berkurang sebesar 50', 'Visibility Changed', 0, '2025-01-17 22:00:35', '2025-01-17 22:00:35', 'http://127.0.0.1:8000/profile');

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
-- Table structure for table `professions`
--

CREATE TABLE `professions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `professions`
--

INSERT INTO `professions` (`id`, `name`, `image`, `avatar_price`, `created_at`, `updated_at`) VALUES
(1, 'actor', 'actor.jpg', '97164', NULL, NULL),
(2, 'agent', 'agent.jpg', '94037', NULL, NULL),
(3, 'anchorman', 'anchorman.jpg', '78693', NULL, NULL),
(4, 'architect', 'architect.jpg', '11353', NULL, NULL),
(5, 'artist', 'artist.jpg', '20540', NULL, NULL),
(6, 'astronaut', 'astronaut.jpg', '900', NULL, NULL),
(7, 'babysitter', 'babysitter.jpg', '81379', NULL, NULL),
(8, 'baker', 'baker.jpg', '1172', NULL, NULL),
(9, 'banker', 'banker.jpg', '61526', NULL, NULL),
(10, 'barber', 'barber.jpg', '4210', NULL, NULL),
(11, 'bellboy', 'bellboy.jpg', '36328', NULL, NULL),
(12, 'businessman', 'businessman.jpg', '69010', NULL, NULL),
(13, 'butcher', 'butcher.jpg', '36113', NULL, NULL),
(14, 'captain', 'captain.jpg', '73435', NULL, NULL),
(15, 'carpenter', 'carpenter.jpg', '58887', NULL, NULL),
(16, 'cashier', 'cashier.jpg', '700', NULL, NULL),
(17, 'chef', 'chef.jpg', '93741', NULL, NULL),
(18, 'cleaner', 'cleaner.jpg', '46513', NULL, NULL),
(19, 'clown', 'clown.jpg', '51244', NULL, NULL),
(20, 'courier', 'courier.jpg', '500', NULL, NULL),
(21, 'detective', 'detective.jpg', '29568', NULL, NULL),
(22, 'disinfector', 'disinfector.jpg', '97752', NULL, NULL),
(23, 'dj', 'dj.jpg', '200', NULL, NULL),
(24, 'doctor', 'doctor.jpg', '7550', NULL, NULL),
(25, 'director', 'director.jpg', '37098', NULL, NULL),
(26, 'diver', 'diver.jpg', '62841', NULL, NULL),
(27, 'driver', 'driver.jpg', '2958', NULL, NULL),
(28, 'engineer', 'engineer.jpg', '26120', NULL, NULL),
(29, 'farmer', 'farmer.jpg', '21725', NULL, NULL),
(30, 'fireman', 'fireman.jpg', '30216', NULL, NULL),
(31, 'fisherman', 'fisherman.jpg', '85856', NULL, NULL),
(32, 'gardener', 'gardener.jpg', '38728', NULL, NULL),
(33, 'guard', 'guard.jpg', '35974', NULL, NULL),
(34, 'hostess', 'hostess.jpg', '63636', NULL, NULL),
(35, 'maid', 'maid.jpg', '10306', NULL, NULL),
(36, 'miner', 'miner.jpg', '60473', NULL, NULL),
(37, 'musician', 'musician.jpg', '71499', NULL, NULL),
(38, 'nurse', 'nurse.jpg', '76073', NULL, NULL),
(39, 'painter', 'painter.jpg', '65869', NULL, NULL),
(40, 'photographer', 'photographer.jpg', '1127', NULL, NULL),
(41, 'pilot', 'pilot.jpg', '7879', NULL, NULL),
(42, 'pizzaworker', 'pizzaworker.jpg', '35965', NULL, NULL),
(43, 'player', 'player.jpg', '56187', NULL, NULL),
(44, 'policeman', 'policeman.jpg', '73040', NULL, NULL),
(45, 'postman', 'postman.jpg', '96639', NULL, NULL),
(46, 'programmer', 'programmer.jpg', '64123', NULL, NULL),
(47, 'repairman', 'repairman.jpg', '30650', NULL, NULL),
(48, 'reporter', 'reporter.jpg', '60783', NULL, NULL),
(49, 'scientist', 'scientist.jpg', '12014', NULL, NULL),
(50, 'singer', 'singer.jpg', '77574', NULL, NULL),
(51, 'soldier', 'soldier.jpg', '51927', NULL, NULL),
(52, 'sportsman', 'sportsman.jpg', '26860', NULL, NULL),
(53, 'surgent', 'surgent.jpg', '78420', NULL, NULL),
(54, 'tailor', 'tailor.jpg', '11620', NULL, NULL),
(55, 'teacher', 'teacher.jpg', '22692', NULL, NULL),
(56, 'veterinarian', 'veterinarian.jpg', '78550', NULL, NULL),
(57, 'waiter', 'waiter.jpg', '24771', NULL, NULL),
(58, 'welder', 'welder.jpg', '88057', NULL, NULL),
(59, 'wizard', 'wizard.jpg', '66071', NULL, NULL),
(60, 'worker', 'worker.jpg', '66132', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `visibility` enum('visible','unvisible') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visible',
  `registration_price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bear` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `gender`, `linkedin`, `mobile_number`, `dob`, `status`, `visibility`, `registration_price`, `created_at`, `updated_at`, `bear`) VALUES
(10, 10, 'male', 'programmer', '08817769047', '2000-07-15', 'paid', 'unvisible', 103523, '2025-01-17 04:50:54', '2025-01-17 22:00:35', 'bear-1.png'),
(12, 13, 'female', 'linkedin.com/in/user1', '1234567891', '2003-01-17', 'paid', 'visible', 105719, '2025-01-17 06:31:45', '2025-01-17 06:31:45', NULL),
(13, 14, 'male', 'linkedin.com/in/user2', '1234567892', '1998-01-17', 'paid', 'visible', 121035, '2025-01-17 06:31:45', '2025-01-17 06:31:45', NULL),
(14, 15, 'female', 'linkedin.com/in/user3', '1234567893', '1999-01-17', 'paid', 'visible', 116313, '2025-01-17 06:31:45', '2025-01-17 06:31:45', NULL),
(15, 16, 'male', 'linkedin.com/in/user4', '1234567894', '1976-01-17', 'paid', 'visible', 120321, '2025-01-17 06:31:46', '2025-01-17 06:31:46', NULL),
(16, 17, 'female', 'linkedin.com/in/user5', '1234567895', '2003-01-17', 'paid', 'visible', 114615, '2025-01-17 06:31:46', '2025-01-17 06:31:46', NULL),
(17, 18, 'male', 'linkedin.com/in/user6', '1234567896', '1975-01-17', 'paid', 'visible', 124509, '2025-01-17 06:31:47', '2025-01-17 06:31:47', NULL),
(18, 19, 'female', 'linkedin.com/in/user7', '1234567897', '1984-01-17', 'paid', 'visible', 103965, '2025-01-17 06:31:47', '2025-01-17 06:31:47', NULL),
(19, 20, 'male', 'linkedin.com/in/user8', '1234567898', '1975-01-17', 'paid', 'visible', 108286, '2025-01-17 06:31:47', '2025-01-17 06:31:47', NULL),
(20, 21, 'female', 'linkedin.com/in/user9', '1234567899', '2000-01-17', 'paid', 'visible', 111860, '2025-01-17 06:31:48', '2025-01-17 06:31:48', NULL),
(21, 22, 'male', 'linkedin.com/in/user10', '12345678910', '1993-01-17', 'paid', 'visible', 100030, '2025-01-17 06:31:48', '2025-01-17 06:31:48', NULL),
(22, 23, 'female', 'linkedin.com/in/user11', '12345678911', '1994-01-17', 'paid', 'visible', 107433, '2025-01-17 06:31:49', '2025-01-17 06:31:49', NULL),
(23, 24, 'male', 'linkedin.com/in/user12', '12345678912', '2000-01-17', 'paid', 'visible', 119251, '2025-01-17 06:31:49', '2025-01-17 06:31:49', NULL),
(24, 25, 'female', 'linkedin.com/in/user13', '12345678913', '1990-01-17', 'paid', 'visible', 104262, '2025-01-17 06:31:49', '2025-01-17 06:31:49', NULL),
(25, 26, 'male', 'linkedin.com/in/user14', '12345678914', '1975-01-17', 'paid', 'visible', 120909, '2025-01-17 06:31:50', '2025-01-17 06:31:50', NULL),
(26, 27, 'female', 'linkedin.com/in/user15', '12345678915', '1997-01-17', 'paid', 'visible', 106808, '2025-01-17 06:31:50', '2025-01-17 06:31:50', NULL),
(27, 28, 'male', 'linkedin.com/in/user16', '12345678916', '2004-01-17', 'paid', 'visible', 114091, '2025-01-17 06:31:51', '2025-01-17 06:31:51', NULL),
(28, 29, 'female', 'linkedin.com/in/user17', '12345678917', '1981-01-17', 'paid', 'visible', 104845, '2025-01-17 06:31:51', '2025-01-17 06:31:51', NULL),
(29, 30, 'male', 'linkedin.com/in/user18', '12345678918', '2007-01-17', 'paid', 'visible', 117838, '2025-01-17 06:31:51', '2025-01-17 06:31:51', NULL),
(30, 31, 'female', 'linkedin.com/in/user19', '12345678919', '1994-01-17', 'paid', 'visible', 119320, '2025-01-17 06:31:52', '2025-01-17 06:31:52', NULL),
(31, 32, 'male', 'linkedin.com/in/user20', '12345678920', '1975-01-17', 'paid', 'visible', 124534, '2025-01-17 06:31:52', '2025-01-17 06:31:52', NULL),
(32, 33, 'female', 'linkedin.com/in/user21', '12345678921', '1998-01-17', 'paid', 'visible', 100548, '2025-01-17 06:31:53', '2025-01-17 06:31:53', NULL),
(33, 34, 'male', 'linkedin.com/in/user22', '12345678922', '1979-01-17', 'paid', 'visible', 112270, '2025-01-17 06:31:53', '2025-01-17 06:31:53', NULL),
(34, 35, 'female', 'linkedin.com/in/user23', '12345678923', '1992-01-17', 'paid', 'visible', 121471, '2025-01-17 06:31:53', '2025-01-17 06:31:53', NULL),
(35, 36, 'male', 'linkedin.com/in/user24', '12345678924', '1990-01-17', 'paid', 'visible', 101381, '2025-01-17 06:31:54', '2025-01-17 06:31:54', NULL),
(36, 37, 'female', 'linkedin.com/in/user25', '12345678925', '1982-01-17', 'paid', 'visible', 117020, '2025-01-17 06:31:54', '2025-01-17 06:31:54', NULL),
(37, 38, 'male', 'linkedin.com/in/user26', '12345678926', '1998-01-17', 'paid', 'visible', 102899, '2025-01-17 06:31:55', '2025-01-17 06:31:55', NULL),
(38, 39, 'female', 'linkedin.com/in/user27', '12345678927', '1979-01-17', 'paid', 'visible', 114982, '2025-01-17 06:31:55', '2025-01-17 06:31:55', NULL),
(39, 40, 'male', 'linkedin.com/in/user28', '12345678928', '1982-01-17', 'paid', 'visible', 122862, '2025-01-17 06:31:55', '2025-01-17 06:31:55', NULL),
(40, 41, 'female', 'linkedin.com/in/user29', '12345678929', '1983-01-17', 'paid', 'visible', 115961, '2025-01-17 06:31:56', '2025-01-17 06:31:56', NULL),
(41, 42, 'male', 'linkedin.com/in/user30', '12345678930', '1991-01-17', 'paid', 'visible', 114571, '2025-01-17 06:31:56', '2025-01-17 06:31:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_cities`
--

CREATE TABLE `profile_cities` (
  `id` bigint UNSIGNED NOT NULL,
  `profile_id` bigint UNSIGNED NOT NULL,
  `city_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_cities`
--

INSERT INTO `profile_cities` (`id`, `profile_id`, `city_id`, `created_at`, `updated_at`) VALUES
(1, 10, 167, NULL, NULL),
(2, 10, 169, NULL, NULL),
(3, 10, 180, NULL, NULL),
(4, 12, 74, NULL, NULL),
(5, 12, 110, NULL, NULL),
(6, 12, 145, NULL, NULL),
(7, 12, 216, NULL, NULL),
(8, 12, 225, NULL, NULL),
(9, 12, 242, NULL, NULL),
(10, 12, 252, NULL, NULL),
(11, 12, 330, NULL, NULL),
(12, 12, 427, NULL, NULL),
(13, 12, 498, NULL, NULL),
(14, 13, 29, NULL, NULL),
(15, 13, 72, NULL, NULL),
(16, 13, 109, NULL, NULL),
(17, 13, 112, NULL, NULL),
(18, 13, 125, NULL, NULL),
(19, 13, 147, NULL, NULL),
(20, 13, 333, NULL, NULL),
(21, 13, 381, NULL, NULL),
(22, 13, 404, NULL, NULL),
(23, 14, 46, NULL, NULL),
(24, 14, 74, NULL, NULL),
(25, 14, 206, NULL, NULL),
(26, 14, 453, NULL, NULL),
(27, 14, 499, NULL, NULL),
(28, 15, 36, NULL, NULL),
(29, 15, 56, NULL, NULL),
(30, 16, 13, NULL, NULL),
(31, 16, 14, NULL, NULL),
(32, 16, 52, NULL, NULL),
(33, 16, 73, NULL, NULL),
(34, 16, 138, NULL, NULL),
(35, 16, 144, NULL, NULL),
(36, 16, 231, NULL, NULL),
(37, 16, 315, NULL, NULL),
(38, 16, 327, NULL, NULL),
(39, 16, 494, NULL, NULL),
(40, 17, 11, NULL, NULL),
(41, 17, 70, NULL, NULL),
(42, 17, 100, NULL, NULL),
(43, 17, 151, NULL, NULL),
(44, 17, 232, NULL, NULL),
(45, 17, 260, NULL, NULL),
(46, 17, 289, NULL, NULL),
(47, 17, 334, NULL, NULL),
(48, 17, 487, NULL, NULL),
(49, 18, 34, NULL, NULL),
(50, 18, 40, NULL, NULL),
(51, 18, 44, NULL, NULL),
(52, 18, 292, NULL, NULL),
(53, 18, 297, NULL, NULL),
(54, 18, 351, NULL, NULL),
(55, 18, 383, NULL, NULL),
(56, 18, 438, NULL, NULL),
(57, 19, 64, NULL, NULL),
(58, 19, 167, NULL, NULL),
(59, 19, 359, NULL, NULL),
(60, 19, 449, NULL, NULL),
(61, 19, 487, NULL, NULL),
(62, 20, 88, NULL, NULL),
(63, 20, 89, NULL, NULL),
(64, 20, 160, NULL, NULL),
(65, 20, 223, NULL, NULL),
(66, 20, 329, NULL, NULL),
(67, 20, 486, NULL, NULL),
(68, 21, 82, NULL, NULL),
(69, 21, 107, NULL, NULL),
(70, 21, 133, NULL, NULL),
(71, 21, 143, NULL, NULL),
(72, 21, 146, NULL, NULL),
(73, 21, 149, NULL, NULL),
(74, 21, 188, NULL, NULL),
(75, 21, 344, NULL, NULL),
(76, 21, 477, NULL, NULL),
(77, 21, 480, NULL, NULL),
(78, 22, 11, NULL, NULL),
(79, 22, 168, NULL, NULL),
(80, 22, 171, NULL, NULL),
(81, 22, 213, NULL, NULL),
(82, 22, 218, NULL, NULL),
(83, 22, 242, NULL, NULL),
(84, 22, 425, NULL, NULL),
(85, 23, 50, NULL, NULL),
(86, 23, 57, NULL, NULL),
(87, 23, 202, NULL, NULL),
(88, 23, 300, NULL, NULL),
(89, 23, 314, NULL, NULL),
(90, 23, 380, NULL, NULL),
(91, 23, 432, NULL, NULL),
(92, 23, 447, NULL, NULL),
(93, 24, 42, NULL, NULL),
(94, 24, 57, NULL, NULL),
(95, 24, 136, NULL, NULL),
(96, 24, 201, NULL, NULL),
(97, 24, 349, NULL, NULL),
(98, 24, 358, NULL, NULL),
(99, 25, 61, NULL, NULL),
(100, 25, 81, NULL, NULL),
(101, 25, 129, NULL, NULL),
(102, 25, 216, NULL, NULL),
(103, 25, 247, NULL, NULL),
(104, 25, 327, NULL, NULL),
(105, 25, 395, NULL, NULL),
(106, 25, 434, NULL, NULL),
(107, 25, 479, NULL, NULL),
(108, 26, 44, NULL, NULL),
(109, 26, 96, NULL, NULL),
(110, 26, 214, NULL, NULL),
(111, 26, 366, NULL, NULL),
(112, 26, 376, NULL, NULL),
(113, 26, 429, NULL, NULL),
(114, 26, 477, NULL, NULL),
(115, 27, 217, NULL, NULL),
(116, 27, 273, NULL, NULL),
(117, 28, 54, NULL, NULL),
(118, 28, 103, NULL, NULL),
(119, 28, 164, NULL, NULL),
(120, 28, 193, NULL, NULL),
(121, 28, 232, NULL, NULL),
(122, 29, 19, NULL, NULL),
(123, 29, 27, NULL, NULL),
(124, 29, 178, NULL, NULL),
(125, 29, 232, NULL, NULL),
(126, 29, 239, NULL, NULL),
(127, 29, 350, NULL, NULL),
(128, 30, 72, NULL, NULL),
(129, 30, 130, NULL, NULL),
(130, 30, 218, NULL, NULL),
(131, 30, 332, NULL, NULL),
(132, 30, 471, NULL, NULL),
(133, 30, 476, NULL, NULL),
(134, 31, 64, NULL, NULL),
(135, 31, 379, NULL, NULL),
(136, 31, 386, NULL, NULL),
(137, 32, 65, NULL, NULL),
(138, 32, 197, NULL, NULL),
(139, 32, 230, NULL, NULL),
(140, 32, 293, NULL, NULL),
(141, 32, 393, NULL, NULL),
(142, 33, 5, NULL, NULL),
(143, 33, 44, NULL, NULL),
(144, 33, 244, NULL, NULL),
(145, 33, 277, NULL, NULL),
(146, 33, 474, NULL, NULL),
(147, 34, 24, NULL, NULL),
(148, 34, 201, NULL, NULL),
(149, 34, 208, NULL, NULL),
(150, 34, 471, NULL, NULL),
(151, 35, 27, NULL, NULL),
(152, 35, 37, NULL, NULL),
(153, 35, 129, NULL, NULL),
(154, 35, 148, NULL, NULL),
(155, 35, 164, NULL, NULL),
(156, 35, 212, NULL, NULL),
(157, 35, 357, NULL, NULL),
(158, 35, 390, NULL, NULL),
(159, 35, 400, NULL, NULL),
(160, 35, 446, NULL, NULL),
(161, 36, 181, NULL, NULL),
(162, 36, 278, NULL, NULL),
(163, 37, 83, NULL, NULL),
(164, 37, 180, NULL, NULL),
(165, 37, 193, NULL, NULL),
(166, 37, 270, NULL, NULL),
(167, 37, 288, NULL, NULL),
(168, 37, 330, NULL, NULL),
(169, 37, 355, NULL, NULL),
(170, 37, 356, NULL, NULL),
(171, 37, 363, NULL, NULL),
(172, 37, 468, NULL, NULL),
(173, 38, 72, NULL, NULL),
(174, 38, 258, NULL, NULL),
(175, 39, 89, NULL, NULL),
(176, 39, 110, NULL, NULL),
(177, 39, 138, NULL, NULL),
(178, 39, 146, NULL, NULL),
(179, 39, 228, NULL, NULL),
(180, 39, 459, NULL, NULL),
(181, 39, 473, NULL, NULL),
(182, 39, 474, NULL, NULL),
(183, 40, 174, NULL, NULL),
(184, 40, 207, NULL, NULL),
(185, 40, 216, NULL, NULL),
(186, 41, 32, NULL, NULL),
(187, 41, 172, NULL, NULL),
(188, 41, 230, NULL, NULL),
(189, 41, 249, NULL, NULL),
(190, 41, 275, NULL, NULL),
(191, 41, 407, NULL, NULL),
(192, 41, 411, NULL, NULL),
(193, 41, 419, NULL, NULL),
(194, 41, 428, NULL, NULL),
(195, 41, 481, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_professions`
--

CREATE TABLE `profile_professions` (
  `id` bigint UNSIGNED NOT NULL,
  `profile_id` bigint UNSIGNED NOT NULL,
  `profession_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_professions`
--

INSERT INTO `profile_professions` (`id`, `profile_id`, `profession_id`, `created_at`, `updated_at`) VALUES
(1, 10, 28, NULL, NULL),
(2, 10, 29, NULL, NULL),
(3, 10, 30, NULL, NULL),
(4, 10, 46, NULL, NULL),
(5, 12, 3, NULL, NULL),
(6, 12, 4, NULL, NULL),
(7, 12, 14, NULL, NULL),
(8, 12, 15, NULL, NULL),
(9, 12, 20, NULL, NULL),
(10, 12, 21, NULL, NULL),
(11, 12, 25, NULL, NULL),
(12, 12, 27, NULL, NULL),
(13, 12, 31, NULL, NULL),
(14, 13, 15, NULL, NULL),
(15, 13, 16, NULL, NULL),
(16, 13, 18, NULL, NULL),
(17, 13, 37, NULL, NULL),
(18, 13, 41, NULL, NULL),
(19, 13, 51, NULL, NULL),
(20, 13, 53, NULL, NULL),
(21, 13, 55, NULL, NULL),
(22, 14, 9, NULL, NULL),
(23, 14, 15, NULL, NULL),
(24, 14, 26, NULL, NULL),
(25, 14, 47, NULL, NULL),
(26, 14, 50, NULL, NULL),
(27, 14, 51, NULL, NULL),
(28, 14, 60, NULL, NULL),
(29, 15, 2, NULL, NULL),
(30, 15, 4, NULL, NULL),
(31, 15, 12, NULL, NULL),
(32, 15, 13, NULL, NULL),
(33, 15, 25, NULL, NULL),
(34, 15, 31, NULL, NULL),
(35, 15, 39, NULL, NULL),
(36, 15, 49, NULL, NULL),
(37, 15, 55, NULL, NULL),
(38, 15, 56, NULL, NULL),
(39, 16, 2, NULL, NULL),
(40, 16, 7, NULL, NULL),
(41, 16, 10, NULL, NULL),
(42, 16, 13, NULL, NULL),
(43, 16, 18, NULL, NULL),
(44, 17, 4, NULL, NULL),
(45, 17, 5, NULL, NULL),
(46, 17, 8, NULL, NULL),
(47, 17, 15, NULL, NULL),
(48, 17, 18, NULL, NULL),
(49, 17, 21, NULL, NULL),
(50, 17, 27, NULL, NULL),
(51, 17, 41, NULL, NULL),
(52, 17, 48, NULL, NULL),
(53, 17, 52, NULL, NULL),
(54, 18, 4, NULL, NULL),
(55, 18, 11, NULL, NULL),
(56, 18, 15, NULL, NULL),
(57, 19, 6, NULL, NULL),
(58, 19, 22, NULL, NULL),
(59, 19, 34, NULL, NULL),
(60, 19, 43, NULL, NULL),
(61, 19, 44, NULL, NULL),
(62, 19, 51, NULL, NULL),
(63, 19, 59, NULL, NULL),
(64, 20, 3, NULL, NULL),
(65, 20, 4, NULL, NULL),
(66, 20, 5, NULL, NULL),
(67, 20, 16, NULL, NULL),
(68, 20, 29, NULL, NULL),
(69, 20, 33, NULL, NULL),
(70, 20, 37, NULL, NULL),
(71, 20, 48, NULL, NULL),
(72, 20, 53, NULL, NULL),
(73, 21, 4, NULL, NULL),
(74, 21, 11, NULL, NULL),
(75, 21, 17, NULL, NULL),
(76, 21, 28, NULL, NULL),
(77, 21, 30, NULL, NULL),
(78, 21, 31, NULL, NULL),
(79, 21, 46, NULL, NULL),
(80, 21, 48, NULL, NULL),
(81, 21, 56, NULL, NULL),
(82, 21, 57, NULL, NULL),
(83, 22, 12, NULL, NULL),
(84, 22, 15, NULL, NULL),
(85, 22, 21, NULL, NULL),
(86, 22, 22, NULL, NULL),
(87, 22, 23, NULL, NULL),
(88, 22, 25, NULL, NULL),
(89, 22, 29, NULL, NULL),
(90, 22, 34, NULL, NULL),
(91, 22, 55, NULL, NULL),
(92, 23, 2, NULL, NULL),
(93, 23, 4, NULL, NULL),
(94, 23, 21, NULL, NULL),
(95, 23, 29, NULL, NULL),
(96, 23, 35, NULL, NULL),
(97, 23, 38, NULL, NULL),
(98, 23, 42, NULL, NULL),
(99, 23, 48, NULL, NULL),
(100, 23, 51, NULL, NULL),
(101, 23, 59, NULL, NULL),
(102, 24, 16, NULL, NULL),
(103, 24, 28, NULL, NULL),
(104, 24, 56, NULL, NULL),
(105, 25, 2, NULL, NULL),
(106, 25, 6, NULL, NULL),
(107, 25, 7, NULL, NULL),
(108, 25, 20, NULL, NULL),
(109, 25, 30, NULL, NULL),
(110, 25, 32, NULL, NULL),
(111, 25, 52, NULL, NULL),
(112, 26, 2, NULL, NULL),
(113, 26, 8, NULL, NULL),
(114, 26, 20, NULL, NULL),
(115, 26, 22, NULL, NULL),
(116, 26, 28, NULL, NULL),
(117, 26, 38, NULL, NULL),
(118, 26, 39, NULL, NULL),
(119, 26, 49, NULL, NULL),
(120, 27, 5, NULL, NULL),
(121, 27, 8, NULL, NULL),
(122, 27, 21, NULL, NULL),
(123, 27, 59, NULL, NULL),
(124, 28, 5, NULL, NULL),
(125, 28, 12, NULL, NULL),
(126, 28, 27, NULL, NULL),
(127, 28, 42, NULL, NULL),
(128, 29, 5, NULL, NULL),
(129, 29, 32, NULL, NULL),
(130, 29, 34, NULL, NULL),
(131, 29, 43, NULL, NULL),
(132, 30, 16, NULL, NULL),
(133, 30, 24, NULL, NULL),
(134, 30, 31, NULL, NULL),
(135, 30, 46, NULL, NULL),
(136, 30, 48, NULL, NULL),
(137, 30, 58, NULL, NULL),
(138, 31, 4, NULL, NULL),
(139, 31, 14, NULL, NULL),
(140, 31, 15, NULL, NULL),
(141, 31, 27, NULL, NULL),
(142, 31, 36, NULL, NULL),
(143, 31, 47, NULL, NULL),
(144, 32, 7, NULL, NULL),
(145, 32, 19, NULL, NULL),
(146, 32, 30, NULL, NULL),
(147, 32, 52, NULL, NULL),
(148, 33, 3, NULL, NULL),
(149, 33, 17, NULL, NULL),
(150, 33, 18, NULL, NULL),
(151, 33, 27, NULL, NULL),
(152, 33, 29, NULL, NULL),
(153, 33, 38, NULL, NULL),
(154, 33, 45, NULL, NULL),
(155, 33, 59, NULL, NULL),
(156, 34, 3, NULL, NULL),
(157, 34, 17, NULL, NULL),
(158, 34, 21, NULL, NULL),
(159, 34, 28, NULL, NULL),
(160, 34, 59, NULL, NULL),
(161, 35, 3, NULL, NULL),
(162, 35, 12, NULL, NULL),
(163, 35, 18, NULL, NULL),
(164, 35, 43, NULL, NULL),
(165, 35, 59, NULL, NULL),
(166, 36, 17, NULL, NULL),
(167, 36, 26, NULL, NULL),
(168, 36, 44, NULL, NULL),
(169, 36, 53, NULL, NULL),
(170, 37, 7, NULL, NULL),
(171, 37, 10, NULL, NULL),
(172, 37, 17, NULL, NULL),
(173, 37, 20, NULL, NULL),
(174, 37, 35, NULL, NULL),
(175, 37, 41, NULL, NULL),
(176, 37, 48, NULL, NULL),
(177, 37, 59, NULL, NULL),
(178, 38, 1, NULL, NULL),
(179, 38, 6, NULL, NULL),
(180, 38, 28, NULL, NULL),
(181, 38, 51, NULL, NULL),
(182, 38, 55, NULL, NULL),
(183, 38, 56, NULL, NULL),
(184, 38, 59, NULL, NULL),
(185, 39, 12, NULL, NULL),
(186, 39, 14, NULL, NULL),
(187, 39, 55, NULL, NULL),
(188, 40, 1, NULL, NULL),
(189, 40, 15, NULL, NULL),
(190, 40, 30, NULL, NULL),
(191, 40, 50, NULL, NULL),
(192, 41, 5, NULL, NULL),
(193, 41, 10, NULL, NULL),
(194, 41, 17, NULL, NULL),
(195, 41, 23, NULL, NULL),
(196, 41, 29, NULL, NULL),
(197, 41, 33, NULL, NULL),
(198, 41, 43, NULL, NULL),
(199, 41, 59, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('f1hQS4j4IatWrDSpm7QIS5g3zyWrxAeqAphPdaKD', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoid1ViT1NNaEdIVXlQaTU1M2ZYd21YZXRGbmpnWmE4YzE2cUZ5TTd5VSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Byb2ZpbGUvMTAiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL21lc3NhZ2VzLzEwIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTM7fQ==', 1737176798),
('ikciJ89Jwhz9F8edntpn3z2qvXJm9qjtD7FqoB09', 10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYXhiSnZjb2gxZzBFR05uWW8wcG5YWmY4Q3pSQXV6WW9nbXdLSUxsciI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Byb2ZpbGUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyOToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Byb2ZpbGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMDtzOjY6ImxvY2FsZSI7czoyOiJpZCI7fQ==', 1737176454);

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'Programmer Update', 'programmer@gmail.com', NULL, '$2y$12$IUKG02IoahGG9SqlNg4AtOhnP9XvL7KvYHHZOePczLSdaTAUV48Ki', NULL, '2025-01-17 04:50:54', '2025-01-17 10:26:48'),
(13, 'User 1', 'user1@example.com', NULL, '$2y$12$Yvs2RJZI3z3La4sCRfAhuOxb2/CfYbVYWo5lpnyGQl.UgQDxQFvcO', NULL, '2025-01-17 06:31:45', '2025-01-17 06:31:45'),
(14, 'User 2', 'user2@example.com', NULL, '$2y$12$6Ffms0R0iXEwJIaqBSSSN.ehoJtQn8UBNfOptvV5pyF2zmk4QMaF6', NULL, '2025-01-17 06:31:45', '2025-01-17 06:31:45'),
(15, 'User 3', 'user3@example.com', NULL, '$2y$12$q/J5wdxxD4fCZcAFXkNKyeRcuDQR5oFbB2KFxi/owLFdDLPpElttW', NULL, '2025-01-17 06:31:45', '2025-01-17 06:31:45'),
(16, 'User 4', 'user4@example.com', NULL, '$2y$12$7VXWsEoxYvnXNiDB0bB2eOPXPeL4gfNuSP.GmTkAzMqfE0c4Awzxy', NULL, '2025-01-17 06:31:46', '2025-01-17 06:31:46'),
(17, 'User 5', 'user5@example.com', NULL, '$2y$12$5wSYurSKaezCwiqMcqM9U.AO4PmgUpc9C3Xzgcz5561dC2tzFRn2a', NULL, '2025-01-17 06:31:46', '2025-01-17 06:31:46'),
(18, 'User 6', 'user6@example.com', NULL, '$2y$12$AHD.EfLCVSecsMCOiITYa.JCAsdDsRaKtLrvBb2bY01dXDkbp1e36', NULL, '2025-01-17 06:31:47', '2025-01-17 06:31:47'),
(19, 'User 7', 'user7@example.com', NULL, '$2y$12$kVVMQNkrtgM5cwXo5YP3Fujthw0aJnyNCOCMJA2cwYDRraUu8yifC', NULL, '2025-01-17 06:31:47', '2025-01-17 06:31:47'),
(20, 'User 8', 'user8@example.com', NULL, '$2y$12$SkdCkyweiG1p4LW2KPOiZ.aSu1mBABWLlBq8WhO89oZxwa9FukAee', NULL, '2025-01-17 06:31:47', '2025-01-17 06:31:47'),
(21, 'User 9', 'user9@example.com', NULL, '$2y$12$LSMdokgRPYIko2UxQXzUOOD0reiIYVhfhJTm44izXb1FJBtGz24gy', NULL, '2025-01-17 06:31:48', '2025-01-17 06:31:48'),
(22, 'User 10', 'user10@example.com', NULL, '$2y$12$HdVyhGPDx1zWu1UJKo.U4.Ov9x2IEfxqmt9gCzDB0LmTcpbYrkGAO', NULL, '2025-01-17 06:31:48', '2025-01-17 06:31:48'),
(23, 'User 11', 'user11@example.com', NULL, '$2y$12$VOq18HeiidL5kVrbbNx1Ae1x2Guz8m9nfWRhf7gbRSKixwRkxdfo.', NULL, '2025-01-17 06:31:49', '2025-01-17 06:31:49'),
(24, 'User 12', 'user12@example.com', NULL, '$2y$12$iuOfwiWEfVk51PUw6nsPk.8A549vEPWnQ4DUpx0Dg6dyCotZKrJHG', NULL, '2025-01-17 06:31:49', '2025-01-17 06:31:49'),
(25, 'User 13', 'user13@example.com', NULL, '$2y$12$LWl9.KsNZAukl9tkcQHEAuJufJrKiY6Y9jI1luPs.mBEYMXK8qYXy', NULL, '2025-01-17 06:31:49', '2025-01-17 06:31:49'),
(26, 'User 14', 'user14@example.com', NULL, '$2y$12$l5jdBHS9utu74st72HO8RO/f5EUjacl31L643MMObfvWdUn1SnOw6', NULL, '2025-01-17 06:31:50', '2025-01-17 06:31:50'),
(27, 'User 15', 'user15@example.com', NULL, '$2y$12$68C1.FlYI9CaMSnma/rZyuuvibciyo8tqWE/1JWZQjawmDdyV37VO', NULL, '2025-01-17 06:31:50', '2025-01-17 06:31:50'),
(28, 'User 16', 'user16@example.com', NULL, '$2y$12$gyhR2DYv0wKOvoTSIlj/1OMEygbuEzyegU8Goyyosdz0mxfIaXuxi', NULL, '2025-01-17 06:31:51', '2025-01-17 06:31:51'),
(29, 'User 17', 'user17@example.com', NULL, '$2y$12$QNhAX4lYA4KBj43Z3zLLjOQiwicoO8.lT.2b7n9L0Lk6646pSuJGu', NULL, '2025-01-17 06:31:51', '2025-01-17 06:31:51'),
(30, 'User 18', 'user18@example.com', NULL, '$2y$12$mKn2IaGm2zXgZz6TzJYd6.p.5QdMUAzTm2jue95MpqA6/3yv/d7C.', NULL, '2025-01-17 06:31:51', '2025-01-17 06:31:51'),
(31, 'User 19', 'user19@example.com', NULL, '$2y$12$TGrOW3FB.QiP5tI45fuBeuP7H6g7zMnOO.Z8APyX8BVaGti8imxm2', NULL, '2025-01-17 06:31:52', '2025-01-17 06:31:52'),
(32, 'User 20', 'user20@example.com', NULL, '$2y$12$VYHvVmF7ChcgGa8d7iEoJe0AI2ez22cdAgL3jW1zKBAuAQe1AVVcu', NULL, '2025-01-17 06:31:52', '2025-01-17 06:31:52'),
(33, 'User 21', 'user21@example.com', NULL, '$2y$12$z2XnB7UUvySoYT4BvaikjOA7ILm7uyeL9q0QLHqqnq4OL9bqCoaby', NULL, '2025-01-17 06:31:53', '2025-01-17 06:31:53'),
(34, 'User 22', 'user22@example.com', NULL, '$2y$12$Z2YdwqwlxtL5DHxpTv0YKumO2xuno7GWXcLvjQ7pj6NTK25Pm8/6G', NULL, '2025-01-17 06:31:53', '2025-01-17 06:31:53'),
(35, 'User 23', 'user23@example.com', NULL, '$2y$12$BeWlbokGZPeRxtYF9z1R3.bxz5B7/1nWyGB5gHf2HSoZ2WqzWAuxi', NULL, '2025-01-17 06:31:53', '2025-01-17 06:31:53'),
(36, 'User 24', 'user24@example.com', NULL, '$2y$12$GPTPua67vE6wsjl8JsBtmu6uHBtMsYnBtADUJQvrcAslXhHtGGyoq', NULL, '2025-01-17 06:31:54', '2025-01-17 06:31:54'),
(37, 'User 25', 'user25@example.com', NULL, '$2y$12$sNTPxOrXzol.bKvr4RhCjuEY/CB9qFY91WiXlTtz9sd4xnk8eKd5u', NULL, '2025-01-17 06:31:54', '2025-01-17 06:31:54'),
(38, 'User 26', 'user26@example.com', NULL, '$2y$12$lDS6ToWtS8WvVuwGEbsqg.hDxf.o4iPtjAmXJS8B391s5s6U16oYG', NULL, '2025-01-17 06:31:55', '2025-01-17 06:31:55'),
(39, 'User 27', 'user27@example.com', NULL, '$2y$12$l0uNrRuhvRK6Ok7ned6wYOQz/x6YU3lwFeX.UbEHV4E.iRHg4DUwG', NULL, '2025-01-17 06:31:55', '2025-01-17 06:31:55'),
(40, 'User 28', 'user28@example.com', NULL, '$2y$12$R3Y1DvdO9PjjqTAUoXEgvuTCWFva7cZ2Ys.k40K5kCCvoD840xW62', NULL, '2025-01-17 06:31:55', '2025-01-17 06:31:55'),
(41, 'User 29', 'user29@example.com', NULL, '$2y$12$dLYSKTSTMaxikhZk.3Gkj.s8j605/pVkcxLl.t8S80V1iuPi4pk.G', NULL, '2025-01-17 06:31:56', '2025-01-17 06:31:56'),
(42, 'User 30', 'user30@example.com', NULL, '$2y$12$xJlzkoEO0tmM0k9m1iHuu.6J1ndv/HmLCOHpoiT3T9rm5iku/b3T2', NULL, '2025-01-17 06:31:56', '2025-01-17 06:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` int NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `amount`, `type`, `created_at`, `updated_at`) VALUES
(1, 10, 6477, 'credit', '2025-01-17 06:20:17', '2025-01-17 06:20:17'),
(4, 10, 100, 'credit', '2025-01-17 16:57:09', '2025-01-17 16:57:09'),
(5, 10, 100, 'credit', '2025-01-17 16:57:21', '2025-01-17 16:57:21'),
(6, 10, 5, 'debit', '2025-01-17 17:46:38', '2025-01-17 17:46:38'),
(7, 10, 5, 'debit', '2025-01-17 17:47:31', '2025-01-17 17:47:31'),
(8, 10, 5, 'debit', '2025-01-17 17:48:54', '2025-01-17 17:48:54'),
(9, 10, 5, 'debit', '2025-01-17 17:49:52', '2025-01-17 17:49:52'),
(10, 10, 5, 'debit', '2025-01-17 17:50:21', '2025-01-17 17:50:21'),
(11, 10, 50, 'debit', '2025-01-17 17:50:59', '2025-01-17 17:50:59'),
(12, 10, 5, 'debit', '2025-01-17 18:06:47', '2025-01-17 18:06:47'),
(13, 10, 50, 'debit', '2025-01-17 18:17:14', '2025-01-17 18:17:14'),
(14, 10, 5, 'debit', '2025-01-17 18:23:06', '2025-01-17 18:23:06'),
(15, 13, 100, 'credit', '2025-01-17 21:13:34', '2025-01-17 21:13:34'),
(16, 10, 50, 'debit', '2025-01-17 21:20:00', '2025-01-17 21:20:00'),
(17, 10, 5, 'debit', '2025-01-17 21:59:42', '2025-01-17 21:59:42'),
(18, 10, 50, 'debit', '2025-01-17 22:00:35', '2025-01-17 22:00:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avatar_users`
--
ALTER TABLE `avatar_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `avatar_users_profession_id_foreign` (`profession_id`),
  ADD KEY `avatar_users_from_user_id_foreign` (`from_user_id`),
  ADD KEY `avatar_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`),
  ADD KEY `messages_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `profile_cities`
--
ALTER TABLE `profile_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_cities_profile_id_foreign` (`profile_id`),
  ADD KEY `profile_cities_city_id_foreign` (`city_id`);

--
-- Indexes for table `profile_professions`
--
ALTER TABLE `profile_professions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_professions_profile_id_foreign` (`profile_id`),
  ADD KEY `profile_professions_profession_id_foreign` (`profession_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avatar_users`
--
ALTER TABLE `avatar_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `profile_cities`
--
ALTER TABLE `profile_cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `profile_professions`
--
ALTER TABLE `profile_professions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avatar_users`
--
ALTER TABLE `avatar_users`
  ADD CONSTRAINT `avatar_users_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `avatar_users_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `avatar_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile_cities`
--
ALTER TABLE `profile_cities`
  ADD CONSTRAINT `profile_cities_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `profile_cities_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile_professions`
--
ALTER TABLE `profile_professions`
  ADD CONSTRAINT `profile_professions_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `profile_professions_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
