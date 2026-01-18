-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 18 jan. 2026 à 19:38
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `basketball`
--

-- --------------------------------------------------------

--
-- Structure de la table `feuille_match`
--

CREATE TABLE `feuille_match` (
  `id_match` int(11) NOT NULL,
  `num_licence` char(8) NOT NULL,
  `role` enum('Titulaire','Remplaçant') NOT NULL,
  `poste` enum('Meneur','Arrière','Ailier','Ailier fort','Pivot') NOT NULL,
  `note` tinyint(4) DEFAULT NULL,
  `commentaire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `feuille_match`
--

INSERT INTO `feuille_match` (`id_match`, `num_licence`, `role`, `poste`, `note`, `commentaire`) VALUES
(1,'LIC00001','Titulaire','Ailier',7,'Bon match'),
(1,'LIC00002','Titulaire','Meneur',8,'Très bonne vision'),
(1,'LIC00003','Titulaire','Pivot',9,'Dominant'),
(1,'LIC00005','Titulaire','Ailier fort',7,'Solide'),
(1,'LIC00007','Titulaire','Arrière',8,'Adresse correcte'),
(1,'LIC00009','Remplaçant','Meneur',6,'Entrée correcte'),

(2,'LIC00001','Titulaire','Ailier',6,'Irrégulier'),
(2,'LIC00002','Titulaire','Meneur',7,'Bon rythme'),
(2,'LIC00003','Titulaire','Pivot',8,'Présent au rebond'),
(2,'LIC00005','Titulaire','Ailier fort',6,'Fatigue'),
(2,'LIC00007','Titulaire','Arrière',5,'Manque de réussite'),
(2,'LIC00010','Remplaçant','Ailier',7,'Bonne énergie'),

(3,'LIC00001','Titulaire','Ailier',9,'Excellent'),
(3,'LIC00002','Titulaire','Meneur',8,'Maîtrise'),
(3,'LIC00003','Titulaire','Pivot',10,'MVP'),
(3,'LIC00005','Titulaire','Ailier fort',8,'Très solide'),
(3,'LIC00007','Titulaire','Arrière',7,'Bon apport'),
(3,'LIC00009','Remplaçant','Meneur',7,'Impact positif');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `num_licence` char(8) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `taille` decimal(4,1) NOT NULL,
  `poids` decimal(5,2) NOT NULL,
  `nationalite` varchar(50) NOT NULL,
  `statut` enum('Actif','Blessé','Suspendu','Absent') NOT NULL DEFAULT 'Actif',
  `commentaires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`num_licence`, `nom`, `prenom`, `date_naissance`, `taille`, `poids`, `nationalite`, `statut`, `commentaires`) VALUES
('LIC00001','Dupont','Jean','1994-03-12',188.0,84.0,'France','Actif','Ailier titulaire'),
('LIC00002','Martin','Lucas','1996-07-22',182.0,79.5,'France','Actif','Meneur rapide'),
('LIC00003','Declercq','Jack','2000-06-08',209.0,105.0,'Australie','Actif','Pivot dominant'),
('LIC00004','Silva','Pedro','1998-11-02',190.0,88.0,'Portugal','Blessé','Entorse cheville'),
('LIC00005','Rossi','Marco','1993-01-18',195.0,92.0,'Italie','Actif','Ailier fort physique'),
('LIC00006','Kovac','Ivan','1995-05-30',200.0,98.0,'Croatie','Suspendu','Faute technique'),
('LIC00007','Smith','Daniel','1999-09-14',185.0,83.0,'États-Unis','Actif','Arrière shooteur'),
('LIC00008','Nowak','Piotr','1997-12-01',202.0,100.0,'Pologne','Absent','Raison personnelle'),
('LIC00009','Santos','Miguel','1992-04-25',178.0,76.0,'Brésil','Actif','Meneur remplaçant'),
('LIC00010','Müller','Jonas','1996-08-09',198.0,95.0,'Allemagne','Actif','Ailier polyvalent');

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE `match` (
  `id_match` int(11) NOT NULL,
  `date_match` datetime NOT NULL,
  `equipe_adverse` varchar(50) NOT NULL,
  `lieu` enum('Domicile','Extérieur') NOT NULL,
  `resultat` enum('Victoire','Défaite') DEFAULT NULL,
  `score_equipe` int(11) DEFAULT NULL,
  `score_adverse` int(11) DEFAULT NULL,
  `overtime` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `match`
--

INSERT INTO `match` (`id_match`, `date_match`, `equipe_adverse`, `lieu`, `resultat`, `score_equipe`, `score_adverse`, `overtime`) VALUES
(1,'2025-12-01 20:00:00','Tigers','Domicile','Victoire',92,85,0),
(2,'2025-12-08 18:30:00','Eagles','Extérieur','Défaite',88,94,0),
(3,'2025-12-15 19:00:00','Sharks','Domicile','Victoire',101,97,1),
(4,'2026-02-10 20:00:00','Lions','Extérieur',NULL,NULL,NULL,0),
(5,'2026-02-17 16:00:00','Bulls','Domicile',NULL,NULL,NULL,0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `login_utilisateur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdp_hash` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`login_utilisateur`, `mdp_hash`) VALUES
('jean', '$2y$10$gwF2JMLnl2.WOk5Qus/TwO00vhDQ3jHX72J8x4UlSFbPLbrOyALZy'),
('ronan', '$2y$10$sJIt.dhAoAC7IZY1bV75XOyMnSQX9Kq.2YMIDmhdVd6SdSBY1c6Ka'),
('coach', '$2y$10$S4rkNmfKMPOscM.XOmzDyunAOwG6165M2ip1Haa77ebM4bTPXj5L6');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `feuille_match`
--
ALTER TABLE `feuille_match`
  ADD PRIMARY KEY (`id_match`,`num_licence`),
  ADD KEY `id_match` (`id_match`),
  ADD KEY `num_licence` (`num_licence`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`num_licence`);

--
-- Index pour la table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`id_match`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `match`
--
ALTER TABLE `match`
  MODIFY `id_match` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `feuille_match`
--
ALTER TABLE `feuille_match`
  ADD CONSTRAINT `FK_idMatch` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_numLicence` FOREIGN KEY (`num_licence`) REFERENCES `joueur` (`num_licence`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;