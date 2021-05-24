-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 11:09 AM
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

CREATE Database location ;

CREATE TABLE `annonce` (
  `annonce_id` varchar(50) NOT NULL,
  `datePub` date DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `nbr_pes` int(11) DEFAULT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `bi` varchar(50) DEFAULT NULL,
  `utilisateur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bienimmobilier`
--

CREATE TABLE `bienimmobilier` (
  `bi_id` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `maxPers` int(11) DEFAULT NULL,
  `nbrChambre` int(11) DEFAULT NULL,
  `plusInfo` varchar(50) DEFAULT NULL,
  `etatBI` varchar(20) DEFAULT NULL,
  `statutBI` varchar(20) DEFAULT NULL,
  `quartier` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `bienimmobilier`
--
ALTER TABLE `bienimmobilier`
  ADD PRIMARY KEY (`bi_id`);

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
