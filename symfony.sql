-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 01 Mai 2018 à 15:52
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `oc_advert`
--

CREATE TABLE `oc_advert` (
  `id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nb_applications` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `oc_advert`
--

INSERT INTO `oc_advert` (`id`, `image_id`, `date`, `title`, `author`, `content`, `published`, `updated_at`, `nb_applications`, `slug`) VALUES
(19, NULL, '2018-04-02 00:00:00', 'Développeur PHP/Symfony', 'Orange', 'bla bla bla bla ....', 1, '2018-04-02 09:40:27', 0, 'developpeur-php-symfony'),
(20, NULL, '2018-04-02 00:00:00', 'Développeur PHP/Symfony', 'Orange', 'bla bla bla bla ....', 1, '2018-04-02 09:41:18', 0, 'developpeur-php-symfony-1'),
(21, NULL, '2018-04-02 00:00:00', 'Webmaster', 'Atos', 'bla bla bla bla ...', 0, '2018-04-02 09:43:11', 0, 'webmaster');

-- --------------------------------------------------------

--
-- Structure de la table `oc_advert_category`
--

CREATE TABLE `oc_advert_category` (
  `advert_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oc_advert_skill`
--

CREATE TABLE `oc_advert_skill` (
  `id` int(11) NOT NULL,
  `advert_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oc_application`
--

CREATE TABLE `oc_application` (
  `id` int(11) NOT NULL,
  `advert_id` int(11) NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oc_category`
--

CREATE TABLE `oc_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `oc_category`
--

INSERT INTO `oc_category` (`id`, `name`) VALUES
(21, 'Développement web'),
(22, 'Développement mobile'),
(23, 'Graphisme'),
(24, 'Intégration'),
(25, 'Réseau');

-- --------------------------------------------------------

--
-- Structure de la table `oc_image`
--

CREATE TABLE `oc_image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oc_skill`
--

CREATE TABLE `oc_skill` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `oc_skill`
--

INSERT INTO `oc_skill` (`id`, `name`) VALUES
(19, 'PHP'),
(20, 'Symfony'),
(21, 'C++'),
(22, 'Photoshop'),
(23, 'Blender'),
(24, 'Bloc-note');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `oc_advert`
--
ALTER TABLE `oc_advert`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_B193175989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_B1931753DA5256D` (`image_id`);

--
-- Index pour la table `oc_advert_category`
--
ALTER TABLE `oc_advert_category`
  ADD PRIMARY KEY (`advert_id`,`category_id`),
  ADD KEY `IDX_435EA006D07ECCB6` (`advert_id`),
  ADD KEY `IDX_435EA00612469DE2` (`category_id`);

--
-- Index pour la table `oc_advert_skill`
--
ALTER TABLE `oc_advert_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_32EFF25BD07ECCB6` (`advert_id`),
  ADD KEY `IDX_32EFF25B5585C142` (`skill_id`);

--
-- Index pour la table `oc_application`
--
ALTER TABLE `oc_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_39F85DD8D07ECCB6` (`advert_id`);

--
-- Index pour la table `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oc_image`
--
ALTER TABLE `oc_image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oc_skill`
--
ALTER TABLE `oc_skill`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `oc_advert`
--
ALTER TABLE `oc_advert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `oc_advert_skill`
--
ALTER TABLE `oc_advert_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `oc_application`
--
ALTER TABLE `oc_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `oc_image`
--
ALTER TABLE `oc_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `oc_skill`
--
ALTER TABLE `oc_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `oc_advert`
--
ALTER TABLE `oc_advert`
  ADD CONSTRAINT `FK_B1931753DA5256D` FOREIGN KEY (`image_id`) REFERENCES `oc_image` (`id`);

--
-- Contraintes pour la table `oc_advert_category`
--
ALTER TABLE `oc_advert_category`
  ADD CONSTRAINT `FK_435EA00612469DE2` FOREIGN KEY (`category_id`) REFERENCES `oc_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_435EA006D07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `oc_advert` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `oc_advert_skill`
--
ALTER TABLE `oc_advert_skill`
  ADD CONSTRAINT `FK_32EFF25B5585C142` FOREIGN KEY (`skill_id`) REFERENCES `oc_skill` (`id`),
  ADD CONSTRAINT `FK_32EFF25BD07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `oc_advert` (`id`);

--
-- Contraintes pour la table `oc_application`
--
ALTER TABLE `oc_application`
  ADD CONSTRAINT `FK_39F85DD8D07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `oc_advert` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
