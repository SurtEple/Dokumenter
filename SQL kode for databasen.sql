-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Vert: localhost:3306
-- Generert den: 24. Feb, 2014 10:46 AM
-- Tjenerversjon: 5.5.35-0ubuntu0.12.04.2
-- PHP-Versjon: 5.4.9-4~oneiric+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `HLVDKN_DB1`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `Bruker`
--

CREATE TABLE IF NOT EXISTS `Bruker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Brukernavn` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Passord` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Salt` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Fornavn` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Mellomnavn` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Etternavn` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Epost` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IM` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Telefonnr` int(15) NOT NULL,
  `Adresse` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Postnummer` int(4) NOT NULL,
  `By` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Stilling_ID` int(11) NOT NULL,
  `Administrator` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- RELASJONER FOR TABELLEN `Bruker`:
--   `Stilling_ID`
--       `Stilling` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `Fase`
--

CREATE TABLE IF NOT EXISTS `Fase` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Navn` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Dato_startet` date NOT NULL,
  `Dato_sluttet` date NOT NULL,
  `Status` text COLLATE utf8_unicode_ci NOT NULL,
  `Beskrivelse` text COLLATE utf8_unicode_ci NOT NULL,
  `Prosjekt_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- RELASJONER FOR TABELLEN `Fase`:
--   `Prosjekt_ID`
--       `Prosjekt` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `iskrem`
--

CREATE TABLE IF NOT EXISTS `iskrem` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `farge` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `smak` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dataark for tabell `iskrem`
--

INSERT INTO `iskrem` (`id`, `farge`, `smak`) VALUES
(1, 'multicolor', 'tutti frutti'),
(2, '', ''),
(3, 'Brun', 'Sjokolade'),
(4, 'ROSA', 'nam');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `KoblingBrukerTeam`
--

CREATE TABLE IF NOT EXISTS `KoblingBrukerTeam` (
  `Bruker_ID` int(11) NOT NULL,
  `Team_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELASJONER FOR TABELLEN `KoblingBrukerTeam`:
--   `Bruker_ID`
--       `Bruker` -> `ID`
--   `Team_ID`
--       `Team` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `KoblingTeamProsjekt`
--

CREATE TABLE IF NOT EXISTS `KoblingTeamProsjekt` (
  `Team_ID` int(11) NOT NULL,
  `Prosjekt_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELASJONER FOR TABELLEN `KoblingTeamProsjekt`:
--   `Prosjekt_ID`
--       `Prosjekt` -> `ID`
--   `Team_ID`
--       `Team` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `Oppgave`
--

CREATE TABLE IF NOT EXISTS `Oppgave` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Prosjekt_ID` int(11) NOT NULL,
  `Foreldreoppgave_ID` int(11) NOT NULL,
  `EstimertTid` double NOT NULL,
  `Tittel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Beskrivelse` text COLLATE utf8_unicode_ci NOT NULL,
  `Ferdig` tinyint(1) NOT NULL,
  `Brukt_tid` double NOT NULL,
  `Dato_begynt` date NOT NULL,
  `Dato_ferdig` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- RELASJONER FOR TABELLEN `Oppgave`:
--   `Prosjekt_ID`
--       `Prosjekt` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `Prosjekt`
--

CREATE TABLE IF NOT EXISTS `Prosjekt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Navn` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Oppsummering` text COLLATE utf8_unicode_ci NOT NULL,
  `Neste_Fase` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `Stilling`
--

CREATE TABLE IF NOT EXISTS `Stilling` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Navn` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `Team`
--

CREATE TABLE IF NOT EXISTS `Team` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Teamleader` int(11) NOT NULL,
  `Beskrivelse` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `Time`
--

CREATE TABLE IF NOT EXISTS `Time` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fra` time NOT NULL,
  `Til` time NOT NULL,
  `Pause` time NOT NULL,
  `Dato` date NOT NULL,
  `Bruker_ID` int(11) NOT NULL,
  `Oppgave_ID` int(11) NOT NULL,
  `Kommentar` text COLLATE utf8_unicode_ci NOT NULL,
  `Sted` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Aktiv` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- RELASJONER FOR TABELLEN `Time`:
--   `Bruker_ID`
--       `Bruker` -> `ID`
--   `Oppgave_ID`
--       `Oppgave` -> `ID`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
