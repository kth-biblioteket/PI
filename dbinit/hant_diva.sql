-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Värd: pi-db
-- Tid vid skapande: 15 jan 2024 kl 08:14
-- Serverversion: 8.0.35
-- PHP-version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Databas: `hant_diva`
--
CREATE DATABASE IF NOT EXISTS `hant_diva` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hant_diva`;

-- --------------------------------------------------------

--
-- Tabellstruktur `filrad`
--

CREATE TABLE IF NOT EXISTS `filrad` (
  `Persondatum` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Radnr` int NOT NULL,
  `Rad` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `gereatelink`
--

CREATE TABLE IF NOT EXISTS `gereatelink` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(100) NOT NULL,
  `peer` text NOT NULL,
  `nonpeer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `igenigenorg`
--

CREATE TABLE IF NOT EXISTS `igenigenorg` (
  `Orgkod` varchar(10) DEFAULT NULL,
  `Orgnamn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `kthid`
--

CREATE TABLE IF NOT EXISTS `kthid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(64) NOT NULL,
  `parameters` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `nyast_org`
--

CREATE TABLE IF NOT EXISTS `nyast_org` (
  `Orgkod` varchar(10) DEFAULT NULL,
  `Orgnamn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `nya_org`
--

CREATE TABLE IF NOT EXISTS `nya_org` (
  `Orgkod` varchar(10) DEFAULT NULL,
  `Orgnamn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `nypersonal`
--

CREATE TABLE IF NOT EXISTS `nypersonal` (
  `KTH_id` char(8) NOT NULL,
  `Bef` char(2) NOT NULL,
  `Enamn` varchar(50) NOT NULL,
  `Fnamn` varchar(30) NOT NULL,
  `Anst_datum` varchar(10) DEFAULT NULL,
  `Anst_nuv_bef` char(10) DEFAULT NULL,
  `Bef_t_o_m` char(10) DEFAULT NULL,
  `Bef_ben` varchar(30) DEFAULT NULL,
  `Skol_kod` char(3) DEFAULT NULL,
  `Orgkod` varchar(10) DEFAULT NULL,
  `Ev_chef` varchar(4) DEFAULT NULL,
  `Fil_datum` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `ny_personal`
--

CREATE TABLE IF NOT EXISTS `ny_personal` (
  `KTH_id` char(8) DEFAULT NULL,
  `Bef` char(2) DEFAULT NULL,
  `Enamn` varchar(50) DEFAULT NULL,
  `Fnamn` varchar(30) DEFAULT NULL,
  `Anst_datum` varchar(10) DEFAULT NULL,
  `Anst_nuv_bef` char(10) DEFAULT NULL,
  `Bef_t_o_m` char(10) DEFAULT NULL,
  `Skol_kod` char(3) DEFAULT NULL,
  `Org_kod` varchar(10) DEFAULT NULL,
  `Ev_chef` varchar(4) DEFAULT NULL,
  `Fildatum` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `orcid_kthid`
--

CREATE TABLE IF NOT EXISTS `orcid_kthid` (
  `kth_id` varchar(8) DEFAULT NULL,
  `orcidid` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellstruktur `orcid_kthid_20231121`
--

CREATE TABLE IF NOT EXISTS `orcid_kthid_20231121` (
  `kth_id` char(8) DEFAULT NULL,
  `orcidid` char(19) NOT NULL,
  KEY `kth_id` (`kth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `orcid_updatering`
--

CREATE TABLE IF NOT EXISTS `orcid_updatering` (
  `updat_datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `organisation`
--

CREATE TABLE IF NOT EXISTS `organisation` (
  `Orgkod` varchar(10) DEFAULT NULL,
  `Orgnamn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `organisation_20230627`
--

CREATE TABLE IF NOT EXISTS `organisation_20230627` (
  `Orgkod` varchar(10) NOT NULL,
  `Orgnr` varchar(10) DEFAULT NULL,
  `Orgnamn` varchar(100) NOT NULL,
  `Gatuadress` varchar(100) DEFAULT NULL,
  `Postnummer` char(5) DEFAULT NULL,
  `Postadress` varchar(50) DEFAULT NULL,
  `InomUF` varchar(100) DEFAULT NULL,
  KEY `ix_Orgkod` (`Orgkod`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `orgsaknas`
--

CREATE TABLE IF NOT EXISTS `orgsaknas` (
  `Orgkod` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `paramcache`
--

CREATE TABLE IF NOT EXISTS `paramcache` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(64) NOT NULL,
  `parameters` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `KTH_id` char(8) NOT NULL,
  `Bef` char(2) NOT NULL,
  `Enamn` varchar(50) NOT NULL,
  `Fnamn` varchar(30) NOT NULL,
  `Anst_datum` varchar(10) DEFAULT NULL,
  `Anst_nuv_bef` varchar(10) DEFAULT NULL,
  `Bef_t_o_m` varchar(10) DEFAULT NULL,
  `Bef_ben` varchar(30) DEFAULT NULL,
  `Skol_kod` char(3) DEFAULT NULL,
  `Orgkod` varchar(10) DEFAULT NULL,
  `Ev_chef` varchar(4) DEFAULT NULL,
  `Orgnamn` varchar(100) DEFAULT NULL,
  `Fil_datum` varchar(10) DEFAULT NULL,
  KEY `KTH_id` (`KTH_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `personal_20230621`
--

CREATE TABLE IF NOT EXISTS `personal_20230621` (
  `Skol_kod` char(3) DEFAULT NULL,
  `Orgkod` varchar(10) NOT NULL,
  `Bef` char(2) NOT NULL,
  `Anst_nuv_bef` char(10) NOT NULL,
  `Bef_t_o_m` char(10) NOT NULL,
  `Enamn` varchar(50) NOT NULL,
  `Fnamn` varchar(30) NOT NULL,
  `Bef_ben` varchar(30) NOT NULL,
  `Anst_datum` varchar(10) NOT NULL,
  `KTH_id` char(8) NOT NULL,
  `Fil_datum` char(10) DEFAULT NULL,
  `Ev_chef` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `personal_in`
--

CREATE TABLE IF NOT EXISTS `personal_in` (
  `KTH_id` char(8) NOT NULL,
  `Bef` char(2) NOT NULL,
  `Enamn` varchar(50) NOT NULL,
  `Fnamn` varchar(30) NOT NULL,
  `Anst_datum` varchar(10) DEFAULT NULL,
  `Anst_nuv_bef` char(10) DEFAULT NULL,
  `Bef_t_o_m` char(10) DEFAULT NULL,
  `Bef_ben` varchar(30) DEFAULT NULL,
  `Skol_kod` char(3) DEFAULT NULL,
  `Orgkod` varchar(10) DEFAULT NULL,
  `Ev_chef` varchar(4) DEFAULT NULL,
  `Fil_datum` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `personal_ny`
--

CREATE TABLE IF NOT EXISTS `personal_ny` (
  `Skol_kod` char(3) DEFAULT NULL,
  `Orgkod` varchar(10) DEFAULT NULL,
  `Bef` char(2) DEFAULT NULL,
  `Anst_nuv_bef` varchar(10) DEFAULT NULL,
  `Bef_t_o_m` varchar(10) DEFAULT NULL,
  `Enamn` varchar(50) DEFAULT NULL,
  `Fnamn` varchar(30) DEFAULT NULL,
  `Bef_ben` varchar(30) DEFAULT NULL,
  `Orgnamn` varchar(100) DEFAULT NULL,
  `Anst_datum` varchar(10) DEFAULT NULL,
  `KTH_id` char(8) DEFAULT NULL,
  `Fil_datum` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `uppdatering`
--

CREATE TABLE IF NOT EXISTS `uppdatering` (
  `personal` date NOT NULL,
  `orcid_kthid` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `ut`
--

CREATE TABLE IF NOT EXISTS `ut` (
  `KTH_id` char(8) NOT NULL,
  `Bef` char(2) NOT NULL,
  `Enamn` varchar(50) NOT NULL,
  `Fnamn` varchar(30) NOT NULL,
  `Anst_nuv_bef` char(10) DEFAULT NULL,
  `Bef_t_o_m` char(10) DEFAULT NULL,
  `Bef_ben` varchar(30) DEFAULT NULL,
  `Skol_kod` char(3) DEFAULT NULL,
  `Orgkod` varchar(10) DEFAULT NULL,
  `Ev_chef` varchar(4) DEFAULT NULL,
  `Fil_datum` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `utigen`
--

CREATE TABLE IF NOT EXISTS `utigen` (
  `KTH_id` char(8) NOT NULL,
  `Bef` char(2) NOT NULL,
  `Enamn` varchar(50) NOT NULL,
  `Fnamn` varchar(30) NOT NULL,
  `Anst_nuv_bef` char(10) DEFAULT NULL,
  `Bef_t_o_m` char(10) DEFAULT NULL,
  `Bef_ben` varchar(30) DEFAULT NULL,
  `Skol_kod` char(3) DEFAULT NULL,
  `Orgkod` varchar(10) DEFAULT NULL,
  `Ev_chef` varchar(4) DEFAULT NULL,
  `Fil_datum` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;
