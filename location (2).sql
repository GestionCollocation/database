-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 10:06 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `annonce`
--

CREATE DATABASE location ;

use location ;

CREATE TABLE `annonce` (
  `annonce_id` varchar(50) NOT NULL,
  `datePub` date DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `nbr_pes` int(11) DEFAULT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `bi` int NOT NULL,
  `utilisateur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `annonce`
--

INSERT INTO `annonce` (`annonce_id`, `datePub`, `description`, `nbr_pes`, `titre`, `type`, `bi`, `utilisateur`) VALUES
('1', '2021-06-01', 'desc desc desc desc desc desc desc ', 3, 'dar dar dar dar dar dar dar ', NULL, '1', 'wass'),
('2', '2021-06-02', 'desc desc desc desc desc ', 2, 'dar dar dar dar dar dar dara', NULL, NULL, 'wass');

-- --------------------------------------------------------

--
-- Table structure for table `bienimmobilier`
--

CREATE TABLE `bienimmobilier` (
  `bi_id` int NOT Null AUTO_INCREMENT PRIMARY KEY ,
  `description` varchar(300) DEFAULT NULL,
  `maxPers` int(11) DEFAULT NULL,
  `nbrChambre` int(11) DEFAULT NULL,
  `plusInfo` varchar(50) DEFAULT NULL,
  `etatBI` varchar(20) DEFAULT NULL,
  `statutBI` varchar(20) DEFAULT NULL,
  `quartier` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bienimmobilier`
--

INSERT INTO `bienimmobilier` (`bi_id`, `description`, `maxPers`, `nbrChambre`, `plusInfo`, `etatBI`, `statutBI`, `quartier`, `ville`) VALUES
('1', 'desc desc desc desc desc desc desc desc ', 5, 4, NULL, 'neuf', 'disponible', 'ben Seffar', 'Sefrou');

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE `commentaire` (
  `commentaire_id` varchar(50) NOT NULL,
  `datepub` date DEFAULT NULL,
  `texte` varchar(100) DEFAULT NULL,
  `annonce` varchar(50) DEFAULT NULL,
  `commentaireParent` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`commentaire_id`, `datepub`, `texte`, `annonce`, `commentaireParent`) VALUES
('1', '2021-06-01', 'text text text text text text ', '1', NULL),
('2', NULL, NULL, NULL, NULL),
('4', '2021-06-01', 'text', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `conv_id` varchar(50) NOT NULL,
  `annonce` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` varchar(50) NOT NULL,
  `dateEnvoie` date DEFAULT NULL,
  `texte` varchar(100) DEFAULT NULL,
  `conversation` varchar(50) DEFAULT NULL,
  `utlisateur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `user_id` varchar(50) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `motPasse` varchar(100) DEFAULT NULL,
  `sexe` varchar(1) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `online` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`user_id`, `nom`, `prenom`, `email`, `motPasse`, `sexe`, `tel`, `online`) VALUES
('', 'Wassim', 'wassim', 'wassim@gmail.com', 'User-321', 'H', '0673104127', 0),
('wass', 'wass', 'wass', 'wass@gmail.com', 'User-321', 'F', '0673104124', 0),
('Wassim249', 'wassim', 'wassim', 'wassim@gmail.com', 'User-321', 'H', '0673104127', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`annonce_id`),
  ADD KEY `FK_userAnnonce` (`utilisateur`),
  ADD KEY `FK_biAnnonce` (`bi`);



--
-- Indexes for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`commentaire_id`),
  ADD KEY `FK_annonceCommentaire` (`annonce`),
  ADD KEY `FK_commentaireCommentaire` (`commentaireParent`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`conv_id`),
  ADD KEY `convAnnonce` (`annonce`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `messageConv` (`conversation`),
  ADD KEY `messageUser` (`utlisateur`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `FK_biAnnonce` FOREIGN KEY (`bi`) REFERENCES `bienimmobilier` (`bi_id`),
  ADD CONSTRAINT `FK_userAnnonce` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateur` (`user_id`);

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_annonceCommentaire` FOREIGN KEY (`annonce`) REFERENCES `annonce` (`annonce_id`),
  ADD CONSTRAINT `FK_commentaireCommentaire` FOREIGN KEY (`commentaireParent`) REFERENCES `commentaire` (`commentaire_id`);

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `convAnnonce` FOREIGN KEY (`annonce`) REFERENCES `annonce` (`annonce_id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `messageConv` FOREIGN KEY (`conversation`) REFERENCES `conversation` (`conv_id`),
  ADD CONSTRAINT `messageUser` FOREIGN KEY (`utlisateur`) REFERENCES `utilisateur` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;