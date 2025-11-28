-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 27 nov. 2025 à 09:37
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
CREATE DATABASE IF NOT EXISTS `basketball` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `basketball`;

-- --------------------------------------------------------

--
-- Structure de la table `feuille_match`
--

CREATE TABLE `feuille_match` (
  `id_match` int(11) NOT NULL,
  `num_licence` char(8) NOT NULL,
  `role` enum('Titulaire','Remplaçant') NOT NULL,
  `poste` enum('Meneur','Arrière','Ailier','Ailier fort','Pivot') NOT NULL,
  `note` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `feuille_match`
--

INSERT INTO `feuille_match` (`id_match`, `num_licence`, `role`, `poste`, `note`) VALUES
(1, 'LIC00001', 'Titulaire', 'Ailier', 8),
(1, 'LIC00002', 'Titulaire', 'Pivot', 9),
(1, 'LIC00007', 'Remplaçant', 'Meneur', 6),
(2, 'LIC00002', 'Titulaire', 'Pivot', 7),
(2, 'LIC00005', 'Titulaire', 'Ailier fort', 8),
(2, 'LIC00006', 'Remplaçant', 'Arrière', 6),
(2, 'LIC00008', 'Titulaire', 'Meneur', 9),
(3, 'LIC00001', 'Titulaire', 'Ailier', NULL),
(3, 'LIC00004', 'Titulaire', 'Arrière', NULL),
(3, 'LIC00007', 'Remplaçant', 'Meneur', NULL);

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
  `statut` enum('Actif','Blessé','Suspendu','Absent') NOT NULL DEFAULT 'Actif',
  `commentaires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`num_licence`, `nom`, `prenom`, `date_naissance`, `taille`, `poids`, `statut`, `commentaires`) VALUES
('LIC00001', 'Dupont', 'Jean', '1990-05-12', 185.0, 82.50, 'Actif', 'Ailier droit'),
('LIC00002', 'Martin', 'Paul', '1988-11-03', 192.0, 90.00, 'Actif', 'Capitaine'),
('LIC00004', 'Moreau', 'Alice', '2000-07-15', 168.0, 60.00, 'Actif', 'Jeune poussin'),
('LIC00005', 'Leroy', 'Marc', '1985-09-30', 198.0, 102.30, 'Suspendu', 'Ancien pivot'),
('LIC00006', 'Roux', 'Sylvie', '1992-01-08', 178.0, 72.40, 'Actif', 'En pause carrière'),
('LIC00007', 'Fabre', 'Nicolas', '1997-06-27', 190.0, 85.00, 'Actif', 'Remplaçant'),
('LIC00008', 'Garcia', 'Ana', '2002-12-05', 165.0, 58.20, 'Actif', 'Jeune espoir');

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE `match` (
  `id_match` int(11) NOT NULL,
  `date_match` datetime NOT NULL,
  `equipe_adverse` varchar(50) NOT NULL,
  `lieu` enum('Domicile','Extérieur') NOT NULL,
  `resultat` enum('Victoire','Défaite') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `match`
--

INSERT INTO `match` (`id_match`, `date_match`, `equipe_adverse`, `lieu`, `resultat`) VALUES
(1, '2025-11-01 20:00:00', 'Tigers', 'Domicile', 'Victoire'),
(2, '2025-11-08 18:30:00', 'Eagles', 'Extérieur', 'Défaite'),
(3, '2025-11-15 19:00:00', 'Sharks', 'Domicile', NULL),
(4, '2025-11-21 16:00:00', 'Gorillas', 'Extérieur', NULL),
(5, '2025-11-25 10:30:00', 'Lions', 'Domicile', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `login_utilisateur` varchar(50) NOT NULL,
  `mdp_hash` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`login_utilisateur`, `mdp_hash`) VALUES
('jean', '$2y$10$gwF2JMLnl2.WOk5Qus/TwO00vhDQ3jHX72J8x4UlSFbPLbrOyALZy');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `feuille_match`
--
ALTER TABLE `feuille_match`
  ADD PRIMARY KEY (`id_match`,`num_licence`),
  ADD KEY `FK_numLicence` (`num_licence`);

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
  MODIFY `id_match` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `feuille_match`
--
ALTER TABLE `feuille_match`
  ADD CONSTRAINT `FK_idMatch` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_numLicence` FOREIGN KEY (`num_licence`) REFERENCES `joueur` (`num_licence`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données : `caca`

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
  `note` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `statut` enum('Actif','Blessé','Suspendu','Absent') NOT NULL DEFAULT 'Actif',
  `commentaires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE `match` (
  `id_match` int(11) NOT NULL,
  `date_match` datetime NOT NULL,
  `equipe_adverse` varchar(50) NOT NULL,
  `lieu` enum('Domicile','Extérieur') NOT NULL,
  `resultat` enum('Victoire','Défaite') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `feuille_match`
--
ALTER TABLE `feuille_match`
  ADD PRIMARY KEY (`id_match`,`num_licence`),
  ADD KEY `FK_numLicence` (`num_licence`);

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
  MODIFY `id_match` int(11) NOT NULL AUTO_INCREMENT;

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
