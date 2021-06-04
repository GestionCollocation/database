-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 04, 2021 at 11:30 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `location`
--

-- --------------------------------------------------------

--
-- Table structure for table `annonces`
--

CREATE TABLE `annonces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` int(11) NOT NULL,
  `personnes` int(11) DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bien_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bien_immobiliers`
--

CREATE TABLE `bien_immobiliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quartier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `superficie` int(10) UNSIGNED NOT NULL,
  `nb_chambres` int(10) UNSIGNED NOT NULL,
  `nb_personnes` int(10) UNSIGNED NOT NULL,
  `prix` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `annonce_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `contenue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire_parent` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `to` int(10) UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(1) DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `sexe`, `phone`, `email`, `email_verified_at`, `password`, `profile_image`, `remember_token`, `online`, `created_at`, `updated_at`) VALUES
(1, 'The Dead Dragon', NULL, NULL, 'email@gmail.com', NULL, '$2y$10$fL/w3Z7r.Own8jHFDAsb7.jKeC28MMKexR.hZyf2PDLJioKNtlf2S', 'https://avatarfiles.alphacoders.com/285/thumb-1920-285855.png', NULL, NULL, '2021-05-31 12:06:56', '2021-05-31 12:06:56'),
(2, 'Ilyass Zamouri', NULL, NULL, 'ilyass@gmail.com', NULL, '$2y$10$.WCgWKnHbd2Hlf0v6atOBOBBsK1ZL1qRZYyWFBU6dbYkgFEZxrIOu', 'https://avatars.githubusercontent.com/u/29772839?s=400&u=459d0ae7df435553f53575d010b84d15d62237e0&v=4', NULL, NULL, '2021-06-01 19:33:16', '2021-06-01 19:33:16'),
(3, 'Wassim ELBAKKOURI', NULL, NULL, 'wassim@gmail.com', NULL, '$2y$10$0g.8Gfuk2lDY1mgPukCnBez.e2RHvzqGrikGcXfXjBirrFWp6yhE2', 'https://avatars.githubusercontent.com/u/62564480?v=4', 'dzU1a7vvkn9iCjuVm2X2qybYjxdIK9jOqTKHMnsFpWI0gflrOnumrNtJS9SP', NULL, '2021-06-02 08:04:16', '2021-06-02 08:04:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annonces`
--
ALTER TABLE `annonces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bi_annonce` (`bien_id`);

--
-- Indexes for table `bien_immobiliers`
--
ALTER TABLE `bien_immobiliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_bi` (`user`);

--
-- Indexes for table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_commentaire_parent` (`commentaire_parent`),
  ADD KEY `fk_user_commentaire` (`user_id`),
  ADD KEY `fk_annonce_commentaire` (`annonce_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bien_immobiliers`
--
ALTER TABLE `bien_immobiliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `fk_bi_annonce` FOREIGN KEY (`bien_id`) REFERENCES `bien_immobiliers` (`id`);

--
-- Constraints for table `bien_immobiliers`
--
ALTER TABLE `bien_immobiliers`
  ADD CONSTRAINT `fk_user_bi` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Constraints for table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `fk_annonce_commentaire` FOREIGN KEY (`annonce_id`) REFERENCES `annonces` (`id`),
  ADD CONSTRAINT `fk_commentaire_parent` FOREIGN KEY (`commentaire_parent`) REFERENCES `commentaires` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_commentaire` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
