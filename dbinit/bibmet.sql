-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Värd: pi-db
-- Tid vid skapande: 15 jan 2024 kl 08:11
-- Serverversion: 8.0.35
-- PHP-version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Databas: `bibmet`
--
CREATE DATABASE IF NOT EXISTS `bibmet` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `bibmet`;

-- --------------------------------------------------------

--
-- Tabellstruktur `bort_reg_isbn`
--

CREATE TABLE IF NOT EXISTS `bort_reg_isbn` (
  `ISBN` varchar(50) NOT NULL,
  `Pubtyp` varchar(50) DEFAULT NULL,
  `Titel` varchar(500) DEFAULT NULL,
  `TRITA` varchar(100) DEFAULT NULL,
  `KTH_id` varchar(8) DEFAULT NULL,
  `Fnamn` varchar(40) DEFAULT NULL,
  `Enamn` varchar(60) DEFAULT NULL,
  `Epost` varchar(50) DEFAULT NULL,
  `Dispdatum` varchar(20) DEFAULT NULL,
  `Regdatum` date DEFAULT NULL,
  `Handl` varchar(20) NOT NULL,
  `Kommentar` varchar(100) NOT NULL,
  `Returdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `crossrefpost`
--

CREATE TABLE IF NOT EXISTS `crossrefpost` (
  `Datum` datetime NOT NULL,
  `DOI` varchar(20) NOT NULL,
  `Titel` varchar(100) NOT NULL,
  `Fnamn` varchar(20) NOT NULL,
  `Enamn` varchar(30) NOT NULL,
  `KTHid` char(7) NOT NULL,
  `Epost` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `crossref_post`
--

CREATE TABLE IF NOT EXISTS `crossref_post` (
  `Post_id` int NOT NULL AUTO_INCREMENT,
  `Datum` datetime NOT NULL,
  `DOI` varchar(30) NOT NULL,
  `Enamn` varchar(30) NOT NULL,
  `Fnamn` varchar(30) NOT NULL,
  `Epost` varchar(30) NOT NULL,
  `KTHid` char(7) NOT NULL,
  `Titel` varchar(200) NOT NULL,
  PRIMARY KEY (`Post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `filrad`
--

CREATE TABLE IF NOT EXISTS `filrad` (
  `Persondatum` datetime NOT NULL,
  `Radnr` int NOT NULL,
  `Postnr` int NOT NULL,
  `Rad` varchar(20000) NOT NULL,
  `KTHff` int DEFAULT NULL,
  `C1_radnr` int DEFAULT NULL,
  KEY `Persondatum` (`Persondatum`,`Radnr`,`Postnr`),
  KEY `Radnr` (`Radnr`),
  KEY `Postnr` (`Postnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `handlaeggare`
--

CREATE TABLE IF NOT EXISTS `handlaeggare` (
  `Handl_kod` char(2) NOT NULL,
  `Handl_namn` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `min_niv_isbn`
--

CREATE TABLE IF NOT EXISTS `min_niv_isbn` (
  `Antal` int NOT NULL,
  `Regdatum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `oanv_isbn`
--

CREATE TABLE IF NOT EXISTS `oanv_isbn` (
  `ISBN` varchar(50) NOT NULL,
  `Importdatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `org_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country_name` varchar(50) NOT NULL,
  `Org_type_code` char(2) NOT NULL,
  `city` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `organization_type`
--

CREATE TABLE IF NOT EXISTS `organization_type` (
  `Org_type_code` char(2) NOT NULL,
  `Org_type_sw` varchar(50) NOT NULL,
  `Org_type_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `reg_isbn`
--

CREATE TABLE IF NOT EXISTS `reg_isbn` (
  `ISBN` varchar(50) NOT NULL,
  `Pubtyp` varchar(50) DEFAULT NULL,
  `Titel` varchar(500) DEFAULT NULL,
  `TRITA` varchar(100) DEFAULT NULL,
  `KTH_id` varchar(8) DEFAULT NULL,
  `Fnamn` varchar(40) DEFAULT NULL,
  `Enamn` varchar(60) DEFAULT NULL,
  `Epost` varchar(50) DEFAULT NULL,
  `Dispdatum` varchar(20) DEFAULT NULL,
  `Regdatum` date DEFAULT NULL,
  UNIQUE KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `scopusrad`
--

CREATE TABLE IF NOT EXISTS `scopusrad` (
  `Persondatum` datetime NOT NULL,
  `Radnr` int DEFAULT NULL,
  `Rad` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `tabortff`
--

CREATE TABLE IF NOT EXISTS `tabortff` (
  `Persondatum` datetime NOT NULL,
  `Postnr` int NOT NULL,
  `Antalff` int NOT NULL,
  `AntalKTH` int DEFAULT NULL,
  `MinRadnrAF` int DEFAULT NULL,
  `MaxRadnrAF` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `webbuser`
--

CREATE TABLE IF NOT EXISTS `webbuser` (
  `webbuser_id` int NOT NULL AUTO_INCREMENT,
  `webbusername` varchar(20) NOT NULL,
  `webbuserpwd` varchar(20) NOT NULL,
  PRIMARY KEY (`webbuser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `xoanv_isbn`
--

CREATE TABLE IF NOT EXISTS `xoanv_isbn` (
  `ISBN` varchar(50) DEFAULT NULL,
  `Importdatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
COMMIT;
