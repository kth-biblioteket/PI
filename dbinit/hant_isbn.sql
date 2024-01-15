-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Värd: pi-db
-- Tid vid skapande: 15 jan 2024 kl 08:16
-- Serverversion: 8.0.35
-- PHP-version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Databas: `hant_isbn`
--
CREATE DATABASE IF NOT EXISTS `hant_isbn` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `hant_isbn`;

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
  `Dispdatum` date DEFAULT NULL,
  `Regdatum` date DEFAULT NULL,
  `Handl` varchar(20) NOT NULL,
  `Kommentar` varchar(100) NOT NULL,
  `Returdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `filrad`
--

CREATE TABLE IF NOT EXISTS `filrad` (
  `Persondatum` datetime NOT NULL,
  `Radnr` int NOT NULL,
  `Postnr` int NOT NULL,
  `Rad` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `min_niv_isbn`
--

CREATE TABLE IF NOT EXISTS `min_niv_isbn` (
  `Antal` int NOT NULL,
  `Regdatum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  `Dispdatum` date DEFAULT NULL,
  `Regdatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
COMMIT;
