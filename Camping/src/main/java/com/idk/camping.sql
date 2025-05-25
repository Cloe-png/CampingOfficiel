-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 25 mai 2025 à 20:25
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `camping`
--

-- --------------------------------------------------------

--
-- Structure de la table `animateurs`
--

DROP TABLE IF EXISTS `animateurs`;
CREATE TABLE IF NOT EXISTS `animateurs` (
  `id_animateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `code_postal` varchar(50) NOT NULL,
  `rue_animateur` varchar(50) NOT NULL,
  `ville_animateur` varchar(50) NOT NULL,
  `num_tel` varchar(50) NOT NULL,
  PRIMARY KEY (`id_animateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animateurs`
--

INSERT INTO `animateurs` (`id_animateur`, `nom`, `prenom`, `mail`, `code_postal`, `rue_animateur`, `ville_animateur`, `num_tel`) VALUES
(1, 'Jean', 'Dupont', 'jean.dupont@mail.com', '75000', '1 Rue de Paris', 'Paris', '0102030405'),
(2, 'Martin', 'Claire', 'claire.martin@mail.com', '69000', '12 Rue Lyon', 'Lyon', '0607080910'),
(3, 'Nguyen', 'Thierry', 'thierry.nguyen@mail.com', '13000', '45 Rue du Vieux-Port', 'Marseille', '0611223344'),
(4, 'Morel', 'Alice', 'alice.morel@mail.com', '33000', '8 Rue de Bordeaux', 'Bordeaux', '0622334455'),
(5, 'Leclerc', 'Hugo', 'hugo.leclerc@mail.com', '31000', '27 Rue Toulouse', 'Toulouse', '0633445566');

-- --------------------------------------------------------

--
-- Structure de la table `animations`
--

DROP TABLE IF EXISTS `animations`;
CREATE TABLE IF NOT EXISTS `animations` (
  `id_animation` int NOT NULL AUTO_INCREMENT,
  `libelle_animations` varchar(50) NOT NULL,
  `nom_animation` varchar(50) NOT NULL,
  `date_animations` date NOT NULL,
  PRIMARY KEY (`id_animation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animations`
--

INSERT INTO `animations` (`id_animation`, `libelle_animations`, `nom_animation`, `date_animations`) VALUES
(1, 'Jeux de plein air', 'Tournoi de volley', '2025-07-15'),
(2, 'Atelier créatif', 'Peinture sur galets', '2025-07-16');

-- --------------------------------------------------------

--
-- Structure de la table `creneaux`
--

DROP TABLE IF EXISTS `creneaux`;
CREATE TABLE IF NOT EXISTS `creneaux` (
  `id_planning` int NOT NULL AUTO_INCREMENT,
  `heure_debut` varchar(50) NOT NULL,
  `heure_fin` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `nombre_place` int NOT NULL,
  `id_animation` int NOT NULL,
  `id_lieu` int NOT NULL,
  PRIMARY KEY (`id_planning`),
  KEY `Creneaux_Animations_FK` (`id_animation`),
  KEY `Creneaux_Lieu0_FK` (`id_lieu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `creneaux`
--

INSERT INTO `creneaux` (`id_planning`, `heure_debut`, `heure_fin`, `date`, `nombre_place`, `id_animation`, `id_lieu`) VALUES
(1, '10:00', '12:00', '2025-07-15 10:00:00', 20, 1, 1),
(2, '14:00', '16:00', '2025-07-16 14:00:00', 15, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `encadrer`
--

DROP TABLE IF EXISTS `encadrer`;
CREATE TABLE IF NOT EXISTS `encadrer` (
  `id_animateur` int NOT NULL,
  `id_planning` int NOT NULL,
  PRIMARY KEY (`id_animateur`,`id_planning`),
  KEY `encadrer_Creneaux0_FK` (`id_planning`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `encadrer`
--

INSERT INTO `encadrer` (`id_animateur`, `id_planning`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id_lieu` int NOT NULL AUTO_INCREMENT,
  `libelle_lieu` varchar(50) NOT NULL,
  `coordonnes` varchar(50) NOT NULL,
  PRIMARY KEY (`id_lieu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id_lieu`, `libelle_lieu`, `coordonnes`) VALUES
(1, 'Terrain de sport', '43.61092, 3.87772'),
(2, 'Salle des fêtes', '43.61100, 3.87800'),
(3, 'Plage principale', '43.61150, 3.87850');

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

DROP TABLE IF EXISTS `planning`;
CREATE TABLE IF NOT EXISTS `planning` (
  `idPlanning` int NOT NULL AUTO_INCREMENT,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  PRIMARY KEY (`idPlanning`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `planning`
--

INSERT INTO `planning` (`idPlanning`, `dateDebut`, `dateFin`) VALUES
(1, '2025-07-15', '2025-07-21');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mot_de_passe` varchar(200) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `nom`, `email`, `mot_de_passe`) VALUES
(1, 'Durand Paul', 'paul.durand@mail.com', 'hashpass1'),
(2, 'Bernard Sophie', 'sophie.bernard@mail.com', 'hashpass2'),
(3, 'Roche Emilie', 'emilie.roche@mail.com', 'hashpass3'),
(4, 'Germain Louis', 'louis.germain@mail.com', 'hashpass4');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `creneaux`
--
ALTER TABLE `creneaux`
  ADD CONSTRAINT `Creneaux_Animations_FK` FOREIGN KEY (`id_animation`) REFERENCES `animations` (`id_animation`),
  ADD CONSTRAINT `Creneaux_Lieu0_FK` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id_lieu`);

--
-- Contraintes pour la table `encadrer`
--
ALTER TABLE `encadrer`
  ADD CONSTRAINT `encadrer_Animateurs_FK` FOREIGN KEY (`id_animateur`) REFERENCES `animateurs` (`id_animateur`),
  ADD CONSTRAINT `encadrer_Creneaux0_FK` FOREIGN KEY (`id_planning`) REFERENCES `creneaux` (`id_planning`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
