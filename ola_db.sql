-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2018 at 07:07 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ola_skeleton`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_admin`
--

CREATE TABLE `oc_t_admin` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(40) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_moderator` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_admin`
--

INSERT INTO `oc_t_admin` (`pk_i_id`, `s_name`, `s_username`, `s_password`, `s_email`, `s_secret`, `b_moderator`) VALUES
(1, 'Administrator', 'admin', '$2y$15$ga3a7gAr31ytLYnUkxmi1uSKlIx58noyvoFplofbf4iOEPw70ERiC', 'admin@olasyros.gr', NULL, 0),
(2, 'Moderator', 'mod', '$2y$15$l81W28abDSYfsWL6uXjcv.zj57Cq7esMtxJ3EhyYa4.df8LKm/O/m', 'support@olasyros.gr', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_alerts`
--

CREATE TABLE `oc_t_alerts` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `s_search` longtext,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `dt_date` datetime DEFAULT NULL,
  `dt_unsub_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_alerts_sent`
--

CREATE TABLE `oc_t_alerts_sent` (
  `d_date` date NOT NULL,
  `i_num_alerts_sent` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_ban_rule`
--

CREATE TABLE `oc_t_ban_rule` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(250) NOT NULL DEFAULT '',
  `s_ip` varchar(50) NOT NULL DEFAULT '',
  `s_email` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category`
--

CREATE TABLE `oc_t_category` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `i_expiration_days` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `i_position` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_price_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `s_icon` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_category`
--

INSERT INTO `oc_t_category` (`pk_i_id`, `fk_i_parent_id`, `i_expiration_days`, `i_position`, `b_enabled`, `b_price_enabled`, `s_icon`) VALUES
(1, NULL, 0, 2, 1, 1, NULL),
(2, NULL, 0, 9, 1, 1, NULL),
(3, NULL, 0, 10, 1, 1, NULL),
(4, NULL, 0, 3, 1, 1, NULL),
(5, NULL, 0, 5, 1, 1, NULL),
(6, NULL, 0, 14, 0, 1, NULL),
(7, NULL, 0, 15, 0, 1, NULL),
(8, NULL, 0, 0, 1, 1, NULL),
(26, 1, 0, 0, 1, 1, NULL),
(27, 1, 0, 1, 1, 1, NULL),
(28, 1, 0, 2, 1, 1, NULL),
(31, 2, 0, 0, 1, 1, NULL),
(32, 31, 0, 1, 1, 1, NULL),
(33, 2, 0, 1, 1, 1, NULL),
(34, 2, 0, 2, 1, 1, NULL),
(36, 31, 0, 2, 1, 1, NULL),
(37, 2, 0, 3, 1, 1, NULL),
(38, 3, 0, 0, 1, 1, NULL),
(39, 3, 0, 1, 1, 1, NULL),
(40, 3, 0, 2, 1, 1, NULL),
(41, 3, 0, 3, 1, 1, NULL),
(42, 3, 0, 4, 1, 1, NULL),
(44, 4, 0, 0, 1, 1, NULL),
(45, 4, 0, 1, 1, 1, NULL),
(49, 1, 0, 4, 1, 1, NULL),
(50, 4, 0, 2, 1, 1, NULL),
(52, 5, 0, 0, 1, 1, NULL),
(55, 5, 0, 1, 1, 1, NULL),
(56, NULL, 0, 6, 1, 1, NULL),
(58, 5, 0, 2, 1, 1, NULL),
(59, 5, 0, 3, 1, 1, NULL),
(60, 58, 0, 0, 1, 1, NULL),
(61, 5, 0, 4, 1, 1, NULL),
(62, 5, 0, 6, 1, 1, NULL),
(63, 6, 0, 0, 0, 1, NULL),
(64, 6, 0, 1, 0, 1, NULL),
(65, 6, 0, 2, 0, 1, NULL),
(66, 6, 0, 3, 0, 1, NULL),
(67, 6, 0, 4, 0, 1, NULL),
(68, 6, 0, 5, 0, 1, NULL),
(69, 7, 0, 0, 0, 1, NULL),
(70, 7, 0, 1, 0, 1, NULL),
(71, 7, 0, 2, 0, 1, NULL),
(72, 7, 0, 3, 0, 1, NULL),
(73, 7, 0, 4, 0, 1, NULL),
(74, 7, 0, 5, 0, 1, NULL),
(75, 8, 0, 0, 1, 1, NULL),
(76, 8, 0, 1, 1, 1, NULL),
(78, 8, 0, 3, 1, 1, NULL),
(82, 8, 0, 4, 1, 1, NULL),
(93, 8, 0, 2, 1, 1, NULL),
(102, NULL, 0, 11, 1, 0, NULL),
(103, 102, 0, 0, 1, 0, NULL),
(104, 102, 0, 1, 1, 0, NULL),
(105, 102, 0, 3, 1, 0, NULL),
(106, 102, 0, 4, 1, 0, NULL),
(107, 102, 0, 2, 1, 0, NULL),
(109, NULL, 0, 7, 1, 1, NULL),
(111, 109, 0, 0, 1, 1, NULL),
(113, NULL, 0, 4, 1, 1, NULL),
(114, 5, 0, 5, 1, 1, NULL),
(115, 113, 0, 2, 1, 1, NULL),
(116, 31, 0, 0, 1, 1, NULL),
(117, 114, 0, 1, 1, 1, NULL),
(118, 114, 0, 0, 1, 1, NULL),
(119, 113, 0, 3, 1, 1, NULL),
(120, NULL, 0, 12, 1, 1, NULL),
(121, 120, 0, 0, 1, 1, NULL),
(122, NULL, 0, 1, 1, 1, NULL),
(123, 122, 0, 0, 1, 1, NULL),
(124, 122, 0, 1, 1, 1, NULL),
(125, 122, 0, 2, 1, 1, NULL),
(126, 122, 0, 3, 1, 1, NULL),
(127, 122, 0, 4, 1, 1, NULL),
(128, 1, 0, 3, 1, 1, NULL),
(129, 4, 0, 3, 1, 1, NULL),
(130, 113, 0, 0, 1, 1, NULL),
(131, 113, 0, 1, 1, 1, NULL),
(132, 113, 0, 4, 1, 1, NULL),
(133, 56, 0, 0, 1, 1, NULL),
(134, 56, 0, 1, 1, 1, NULL),
(135, 56, 0, 2, 1, 1, NULL),
(136, 56, 0, 3, 1, 1, NULL),
(137, 56, 0, 4, 1, 1, NULL),
(138, NULL, 0, 8, 1, 1, NULL),
(139, NULL, 0, 13, 1, 1, NULL),
(140, 109, 0, 1, 1, 1, NULL),
(141, 109, 0, 2, 1, 1, NULL),
(142, 109, 0, 3, 1, 1, NULL),
(143, 109, 0, 4, 1, 1, NULL),
(144, 138, 0, 0, 1, 1, NULL),
(145, 138, 0, 1, 1, 1, NULL),
(146, 138, 0, 2, 1, 1, NULL),
(147, 139, 0, 0, 1, 1, NULL),
(148, 139, 0, 1, 1, 1, NULL),
(149, 139, 0, 2, 1, 1, NULL),
(150, 139, 0, 3, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category_description`
--

CREATE TABLE `oc_t_category_description` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_description` text,
  `s_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_category_description`
--

INSERT INTO `oc_t_category_description` (`fk_i_category_id`, `fk_c_locale_code`, `s_name`, `s_description`, `s_slug`) VALUES
(1, 'el_GR', 'Πωλήσεις', '', '%ce%ae'),
(1, 'en_US', 'For sale', '', 'for-sale'),
(2, 'el_GR', 'Οχήματα', '', '%ce%ae'),
(2, 'en_US', 'Vehicles', '', 'vehicles'),
(3, 'el_GR', 'Εκπαίδευση', '', '%ce%af'),
(3, 'en_US', 'Education', '', 'education'),
(4, 'el_GR', 'Ενοικιάσεις', '', '%ce%ac'),
(4, 'en_US', 'For Rent', '', 'for-rent'),
(5, 'el_GR', 'Υπηρεσίες', '', '%ce%af'),
(5, 'en_US', 'Services', NULL, 'services'),
(6, 'el_GR', 'Κοινότητα', '', '%cf%8c'),
(6, 'en_US', 'Community', NULL, 'community'),
(7, 'el_GR', 'Προσωπικά', '', '%ce%ac'),
(7, 'en_US', 'Personals', NULL, 'personals'),
(8, 'el_GR', 'Βρές Δουλειά', '', '%ce%ad-%ce%ac'),
(8, 'en_US', 'Find a Job', '', 'find-a-job'),
(26, 'el_GR', 'Αυτοκίνητα', '', '%ce%af'),
(26, 'en_US', 'Car\'s', '', 'car-s'),
(27, 'el_GR', 'Μοτοσυκλέτες', '', '%ce%ad'),
(27, 'en_US', 'Motorbikes', '', 'motorbikes'),
(28, 'el_GR', 'Σκάφη', '', '%ce%ac'),
(28, 'en_US', 'Boat\'s', '', 'boat-s'),
(31, 'el_GR', 'Αυτοκίνητα', '', '%ce%af'),
(31, 'en_US', 'Cars', NULL, 'cars'),
(32, 'el_GR', 'Ανταλλακτικά αυτοκινήτων', '', '%ce%ac-%ce%ae'),
(32, 'en_US', 'Car Parts', NULL, 'car-parts'),
(33, 'el_GR', 'Μοτοσυκλέτες', '', '%ce%ad'),
(33, 'en_US', 'Motorcycles', '', 'motorcycles'),
(34, 'el_GR', 'Σκάφη - Πλοία', '', '%ce%ac-%ce%af'),
(34, 'en_US', 'Boats - Ships', NULL, 'boats-ships'),
(36, 'el_GR', 'Φορτηγά - Επαγγελματικά αυτοκίνητα', '', '%ce%ac-%ce%ac-%ce%af'),
(36, 'en_US', 'Trucks - Commercial Vehicles', NULL, 'trucks-commercial-vehicles'),
(37, 'el_GR', 'Άλλα οχήματα', '', '%ce%86-%ce%ae'),
(37, 'en_US', 'Other Vehicles', NULL, 'other-vehicles'),
(38, 'el_GR', 'Κομπιούτερ - Μαθήματα πολυμέσων', '', '%cf%8d-%ce%ae-%ce%ad'),
(38, 'en_US', 'Computer - Multimedia Classes', NULL, 'computer-multimedia-classes'),
(39, 'el_GR', 'Μαθήματα ξένων γλωσσών', '', '%ce%ae-%ce%ad-%cf%8e'),
(39, 'en_US', 'Language Classes', NULL, 'language-classes'),
(40, 'el_GR', 'Μουσική - Θέατρο - Μαθήματα χορού', '', '%ce%ae-%ce%ad-%ce%ae-%cf%8d'),
(40, 'en_US', 'Music - Theatre - Dance Classes', NULL, 'music-theatre-dance-classes'),
(41, 'el_GR', 'Διδακτική - Ιδιαίτερα μαθήματα', '', '%ce%ae-%ce%af-%ce%ae'),
(41, 'en_US', 'Tutoring - Private Lessons', NULL, 'tutoring-private-lessons'),
(42, 'el_GR', 'Άλλα τμήματα', '', '%ce%86-%ce%ae'),
(42, 'en_US', 'Other Classes', NULL, 'other-classes'),
(44, 'el_GR', 'Σπίτια - Διαμερίσματα ', '', '%ce%af-%ce%af'),
(44, 'en_US', 'Houses - Apartments', '', 'houses-apartments'),
(45, 'el_GR', 'Δωμάτια ', '', '%ce%ac'),
(45, 'en_US', 'Rooms ', '', 'rooms'),
(49, 'el_GR', 'Γή', '', '%ce%ae'),
(49, 'en_US', 'Land', NULL, 'land'),
(50, 'el_GR', 'Γραφεία', '', '%ce%af'),
(50, 'en_US', 'Offices', '', 'offices'),
(52, 'el_GR', 'Babysitter - Νταντά', '', 'babysitter-%ce%ac'),
(52, 'en_US', 'Babysitter - Nanny', NULL, 'babysitter-nanny'),
(55, 'el_GR', 'Υπηρεσίες εκδηλώσεων', '', '%ce%af-%cf%8e'),
(55, 'en_US', 'Event Services', NULL, 'event-services'),
(56, 'el_GR', 'Ομορφιά', '', '%ce%ac'),
(56, 'en_US', 'Beauty', '', 'beauty'),
(58, 'el_GR', 'Νοικοκυριό - Οικιακή βοήθεια', '', '%cf%8c-%ce%ae-%ce%ae'),
(58, 'en_US', 'Household - Domestic Help', NULL, 'household-domestic-help'),
(59, 'el_GR', 'Μετακομίσεις - Αποθήκευση', '', '%ce%af-%ce%ae'),
(59, 'en_US', 'Moving - Storage', NULL, 'moving-storage'),
(60, 'el_GR', 'Επισκευή', '', '%ce%ae'),
(60, 'en_US', 'Repair', NULL, 'repair'),
(61, 'el_GR', 'Συγγραφή - Επιμέλεια - Μετάφραση', '', '%ce%ae-%ce%ad-%ce%ac'),
(61, 'en_US', 'Writing - Editing - Translating', NULL, 'writing-editing-translating'),
(62, 'el_GR', 'Άλλες Υπηρεσίες', '', '%ce%86-%ce%af'),
(62, 'en_US', 'Other Services', NULL, 'other-services'),
(63, 'el_GR', 'Carpool', '', 'carpool_1'),
(63, 'en_US', 'Carpool', NULL, 'carpool'),
(64, 'el_GR', 'Δραστηριότητες της Κοινότητας', '', '%cf%8c-%cf%8c'),
(64, 'en_US', 'Community Activities', NULL, 'community-activities'),
(65, 'el_GR', 'Εκδηλώσεις', '', '%cf%8e'),
(65, 'en_US', 'Events', NULL, 'events'),
(66, 'el_GR', 'Μουσικοί - Καλλιτέχνες - Συγκροτήματα', '', '%ce%af-%ce%ad-%ce%ae'),
(66, 'en_US', 'Musicians - Artists - Bands', NULL, 'musicians-artists-bands'),
(67, 'el_GR', 'Εθελοντές', '', '%ce%ad'),
(67, 'en_US', 'Volunteers', NULL, 'volunteers'),
(68, 'el_GR', 'Lost And Found', '', 'lost-and-found_1'),
(68, 'en_US', 'Lost And Found', NULL, 'lost-and-found'),
(69, 'el_GR', 'Γυναίκες ψάχνουν άντρες', '', '%ce%af-%ce%ac-%ce%ac'),
(69, 'en_US', 'Women looking for Men', NULL, 'women-looking-for-men'),
(70, 'el_GR', 'Άντρες ψάχνουν γυναίκες', '', '%ce%86-%ce%ac-%ce%af'),
(70, 'en_US', 'Men looking for Women', NULL, 'men-looking-for-women'),
(71, 'el_GR', 'Άντρες ψάχνουν άντρες', '', '%ce%86-%ce%ac-%ce%ac'),
(71, 'en_US', 'Men looking for Men', NULL, 'men-looking-for-men'),
(72, 'el_GR', 'Γυναίκες ψάχνουν γυναίκες', '', '%ce%af-%ce%ac-%ce%af'),
(72, 'en_US', 'Women looking for Women', NULL, 'women-looking-for-women'),
(73, 'el_GR', 'Φιλία - Σύντροφοι δραστηριοτήτων', '', '%ce%af-%cf%8d-%ce%ae'),
(73, 'en_US', 'Friendship - Activity Partners', NULL, 'friendship-activity-partners'),
(74, 'el_GR', 'Χαμένοι σύνδεσμοι', '', '%ce%ad-%cf%8d'),
(74, 'en_US', 'Missed Connections', NULL, 'missed-connections'),
(75, 'el_GR', 'Τουριστικά επαγγέλματα ', '', '%ce%ac-%ce%ad'),
(75, 'en_US', 'Tourism professions', '', 'tourism-professions'),
(76, 'el_GR', 'Υπάλληλοι γραφείου ', '', '%ce%ac-%ce%af'),
(76, 'en_US', 'Office employee', '', 'office-employee'),
(78, 'el_GR', 'Τεχνίτες ', '', '%ce%af'),
(78, 'en_US', 'Technicians', '', 'technicians'),
(82, 'el_GR', 'Φροντίδα Υγείας', '', '%ce%af-%ce%af'),
(82, 'en_US', 'Healthcare', NULL, 'healthcare'),
(93, 'el_GR', 'Πωλήσεις', '', '%ce%ae'),
(93, 'en_US', 'Sales', NULL, 'sales'),
(102, 'el_GR', 'Αθλητισμός', 'Αθλητισμός', '%cf%8c'),
(102, 'en_US', 'Sports', '', 'sports'),
(103, 'el_GR', 'Αθλητικοί σύλλογοι  ', 'Αθλητικοί σύλλογοι  ', '%ce%af-%cf%8d'),
(103, 'en_US', 'Sport Teams', '', 'sport-teams'),
(104, 'el_GR', 'Αθλητικά όργανα', 'Αθλητικά όργανα', '%ce%ac-%cf%8c'),
(104, 'en_US', 'Sport equipments ', '', 'sport-equipments'),
(105, 'el_GR', 'Θαλάσσια σπορ ', 'Θαλάσσια σπορ ', '%ce%ac'),
(105, 'en_US', 'Sea Sports', '', 'sea-sports'),
(106, 'el_GR', 'Γυμναστήρια', 'Γυμναστήρια', '%ce%ae'),
(106, 'en_US', 'Gym\'s', '', 'gym-s'),
(107, 'el_GR', 'Αθλητικά είδη', 'Αθλητικά είδη', '%ce%ac-%ce%af'),
(107, 'en_US', 'Sport apparels', '', 'sport-apparels'),
(109, 'el_GR', 'Φαγητό', '', '%cf%8c'),
(109, 'en_US', 'Food ', '', 'food'),
(111, 'el_GR', 'Εστιατόρια ', '', '%cf%8c'),
(111, 'en_US', 'Restaurant', '', 'restaurant'),
(113, 'el_GR', 'Εμπορικά Καταστήματα ', '', '%ce%ac-%ce%ae'),
(113, 'en_US', 'Commercial shops', '', 'commercial-shops'),
(114, 'el_GR', 'Υπηρεσίες Υγείας', '', '%ce%af-%ce%af'),
(114, 'en_US', 'Health services', '', 'health-services'),
(115, 'el_GR', 'Ρουχισμός ', '', '%cf%8c'),
(115, 'en_US', 'Clothing', '', 'clothing'),
(116, 'el_GR', 'Εμπόριο αυτοκινήτων ', '', '%cf%8c-%ce%ae'),
(116, 'en_US', 'Car delers', '', 'car-delers'),
(117, 'el_GR', 'Διαγνωστικά κέντρα', '', '%ce%ac-%ce%ad'),
(117, 'en_US', 'Diagnostic centers', '', 'diagnostic-centers'),
(118, 'el_GR', 'Γιατροί', '', '%ce%af'),
(118, 'en_US', 'Doctors', '', 'doctors'),
(119, 'el_GR', 'Είδη δώρων', '', '%ce%af-%cf%8e'),
(119, 'en_US', 'Gift shops', '', 'gift-shops'),
(120, 'el_GR', 'Οικοδομή & Σπίτι ', '', '%ce%ae-%ce%af'),
(120, 'en_US', 'Construction & House', '', 'construction-house'),
(121, 'el_GR', 'Υλικά οικοδομών', '', '%ce%ac-%cf%8e'),
(121, 'en_US', 'Building Materials', '', 'building-materials'),
(122, 'el_GR', 'Βρες Υπάλληλο ', '', '%ce%ac'),
(122, 'en_US', 'Find employee', '', 'find-employee'),
(123, 'el_GR', 'Τουριστικά επαγγέλματα ', '', '%ce%ac-%ce%ad'),
(124, 'el_GR', 'Υπάλληλοι γραφείου', '', '%ce%ac-%ce%af'),
(124, 'en_US', 'Office employee', '', 'office-employee_1'),
(125, 'el_GR', 'Πωλήσεις', '', '%ce%ae'),
(125, 'en_US', 'Sales', '', 'sales_1'),
(126, 'el_GR', 'Τεχνίτες', '', '%ce%af'),
(126, 'en_US', 'Technicians', '', 'technicians_1'),
(127, 'el_GR', 'Φροντίδα Υγείας', '', '%ce%af-%ce%af'),
(127, 'en_US', 'Health Care  employee', '', 'health-care-employee_1'),
(128, 'el_GR', 'Ακίνητα', '', '%ce%af'),
(128, 'en_US', 'Realty', '', 'realty'),
(129, 'el_GR', 'Καταστήματα', '', '%ce%ae'),
(129, 'en_US', 'Stores', '', 'stores'),
(130, 'el_GR', 'Ανθοπωλεία', '', '%ce%af'),
(130, 'en_US', 'Flower shops', '', 'flower-shops'),
(131, 'el_GR', 'Βιβλιοχαρτοπωλεία', '', '%ce%af'),
(131, 'en_US', 'Bookstores', '', 'bookstores'),
(132, 'el_GR', 'Δισκοπωλεία', '', '%ce%af'),
(132, 'en_US', 'Music stores', '', 'music-stores'),
(133, 'el_GR', 'Καλλυντικά', '', '%ce%ac'),
(133, 'en_US', 'Cosmetics', '', 'cosmetics'),
(134, 'el_GR', 'Κομμωτήρια', '', '%ce%ae'),
(134, 'en_US', 'Hair salon', '', 'hair-salon'),
(135, 'el_GR', 'Μανικιούρ - Πεντικιούρ', '', '%cf%8d-%cf%8d'),
(135, 'en_US', 'Manicure Pedicure', '', 'manicure-pedicure'),
(136, 'el_GR', 'Μασάζ', '', '%ce%ac'),
(136, 'en_US', 'Massage', '', 'massage'),
(137, 'el_GR', 'Κέντρα Αισθητικής', '', '%ce%ad-%ce%ae'),
(137, 'en_US', 'Beauty salons', '', 'beauty-salons'),
(138, 'el_GR', 'Διασκέδαση ', '', '%ce%ad'),
(138, 'en_US', 'Entertaiment', '', 'entertaiment'),
(139, 'el_GR', 'Τουριστικά καταλύματα', '', '%ce%ac-%cf%8d'),
(139, 'en_US', 'Accommodation', '', 'accommodation'),
(140, 'el_GR', 'Πιτσαρίες', '', '%ce%af'),
(140, 'en_US', 'Pizzerias', '', 'pizzerias'),
(141, 'el_GR', 'Κρεπερί', '', '%ce%af'),
(141, 'en_US', 'Creperie', '', 'creperie'),
(142, 'el_GR', 'Ψητοπωλεία', '', '%ce%af'),
(142, 'en_US', 'Grills', '', 'grills'),
(143, 'el_GR', 'Εργαστήρια Ζαχαροπλαστικής', '', '%ce%ae-%ce%ae'),
(143, 'en_US', 'Patisserie', '', 'patisserie'),
(144, 'el_GR', 'Καφενεία', '', '%ce%af'),
(144, 'en_US', 'Cafes', '', 'cafes'),
(145, 'el_GR', 'Κινηματογράφοι', '', '%ce%ac'),
(145, 'en_US', 'Cinemas', '', 'cinemas'),
(146, 'el_GR', 'Ιnternet Cafe', '', 'nternet-cafe'),
(146, 'en_US', 'Ιnternet Cafe', '', 'nternet-cafe'),
(147, 'el_GR', 'Βίλες', '', '%ce%af'),
(147, 'en_US', 'Villas', '', 'villas'),
(148, 'el_GR', 'Ξενοδοχεία', '', '%ce%af'),
(148, 'en_US', 'Hotels', '', 'hotels'),
(149, 'el_GR', 'Ενοικιαζόμενα Δωμάτια', '', '%cf%8c-%ce%ac'),
(149, 'en_US', 'Rooms & apartments', '', 'rooms-apartments'),
(150, 'el_GR', 'Camping', '', 'camping'),
(150, 'en_US', 'Camping', '', 'camping');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category_stats`
--

CREATE TABLE `oc_t_category_stats` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_category_stats`
--

INSERT INTO `oc_t_category_stats` (`fk_i_category_id`, `i_num_items`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(26, 0),
(27, 0),
(28, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(44, 0),
(45, 0),
(49, 0),
(50, 0),
(52, 0),
(55, 0),
(56, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(78, 0),
(82, 0),
(93, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(109, 0),
(111, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(136, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(150, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city`
--

CREATE TABLE `oc_t_city` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `fk_c_country_code` char(2) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_city`
--

INSERT INTO `oc_t_city` (`pk_i_id`, `fk_i_region_id`, `s_name`, `s_slug`, `fk_c_country_code`, `b_active`) VALUES
(509889, 782719, 'Αμοργός', '%ce%91%ce%bc%ce%bf%cf%81%ce%b3%cf%8c%cf%82', 'gr', 1),
(509890, 782719, 'Άνδρος - Κορθί', '%ce%86%ce%bd%ce%b4%cf%81%ce%bf%cf%82-%ce%9a%ce%bf%cf%81%ce%b', 'gr', 1),
(509891, 782719, 'Άνδρος - Χώρα', '%ce%86%ce%bd%ce%b4%cf%81%ce%bf%cf%82-%ce%a7%cf%8e%cf%81%ce%b', 'gr', 1),
(509892, 782719, 'Δονούσα', '%ce%94%ce%bf%ce%bd%ce%bf%cf%8d%cf%83%ce%b1', 'gr', 1),
(509893, 782719, 'Ίος', '%ce%8a%ce%bf%cf%82', 'gr', 1),
(509894, 782719, 'Κίμωλος', '%ce%9a%ce%af%ce%bc%cf%89%ce%bb%ce%bf%cf%82', 'gr', 1),
(509895, 782719, 'Κύθνος', '%ce%9a%cf%8d%ce%b8%ce%bd%ce%bf%cf%82', 'gr', 1),
(509896, 782719, 'Μύκονος', '%ce%9c%cf%8d%ce%ba%ce%bf%ce%bd%ce%bf%cf%82', 'gr', 1),
(509897, 782719, 'Νάξος - Δρυμάλια', '%ce%9d%ce%ac%ce%be%ce%bf%cf%82-%ce%94%cf%81%cf%85%ce%bc%ce%a', 'gr', 1),
(509898, 782719, 'Σαντορίνη', '%ce%a3%ce%b1%ce%bd%cf%84%ce%bf%cf%81%ce%af%ce%bd%ce%b7', 'gr', 1),
(509899, 782719, 'Σέριφος', '%ce%a3%ce%ad%cf%81%ce%b9%cf%86%ce%bf%cf%82', 'gr', 1),
(509900, 782719, 'Σίφνος', '%ce%a3%ce%af%cf%86%ce%bd%ce%bf%cf%82', 'gr', 1),
(509901, 782719, 'Σύρος - Ερμούπολη', '%ce%a3%cf%8d%cf%81%ce%bf%cf%82-%ce%95%cf%81%ce%bc%ce%bf%cf%8', 'gr', 1),
(509902, 782719, 'Σχοινούσα', '%ce%a3%cf%87%ce%bf%ce%b9%ce%bd%ce%bf%cf%8d%cf%83%ce%b1', 'gr', 1),
(509903, 782719, 'Φολέγανδρος', '%ce%a6%ce%bf%ce%bb%ce%ad%ce%b3%ce%b1%ce%bd%ce%b4%cf%81%ce%bf', 'gr', 1),
(509904, 782719, 'Ανάφη', '%ce%91%ce%bd%ce%ac%cf%86%ce%b7', 'gr', 1),
(509905, 782719, 'Άνδρος - Υδρούσα', '%ce%86%ce%bd%ce%b4%cf%81%ce%bf%cf%82-%ce%a5%ce%b4%cf%81%ce%b', 'gr', 1),
(509906, 782719, 'Αντίπαρος', '%ce%91%ce%bd%cf%84%ce%af%cf%80%ce%b1%cf%81%ce%bf%cf%82', 'gr', 1),
(509907, 782719, 'Ηράκλεια', '%ce%97%cf%81%ce%ac%ce%ba%ce%bb%ce%b5%ce%b9%ce%b1', 'gr', 1),
(509908, 782719, 'Κέα', '%ce%9a%ce%ad%ce%b1', 'gr', 1),
(509909, 782719, 'Κουφονήσια', '%ce%9a%ce%bf%cf%85%cf%86%ce%bf%ce%bd%ce%ae%cf%83%ce%b9%ce%b1', 'gr', 1),
(509910, 782719, 'Μήλος', '%ce%9c%ce%ae%ce%bb%ce%bf%cf%82', 'gr', 1),
(509911, 782719, 'Νάξος', '%ce%9d%ce%ac%ce%be%ce%bf%cf%82', 'gr', 1),
(509912, 782719, 'Πάρος', '%ce%a0%ce%ac%cf%81%ce%bf%cf%82', 'gr', 1),
(509913, 782719, 'Σαντορίνη - Οία', '%ce%a3%ce%b1%ce%bd%cf%84%ce%bf%cf%81%ce%af%ce%bd%ce%b7-%ce%9', 'gr', 1),
(509914, 782719, 'Σίκινος', '%ce%a3%ce%af%ce%ba%ce%b9%ce%bd%ce%bf%cf%82', 'gr', 1),
(509915, 782719, 'Σύρος - Άνω', '%ce%a3%cf%8d%cf%81%ce%bf%cf%82-%ce%86%ce%bd%cf%89', 'gr', 1),
(509916, 782719, 'Σύρος - Ποσειδωνία', '%ce%a3%cf%8d%cf%81%ce%bf%cf%82-%ce%a0%ce%bf%cf%83%ce%b5%ce%b', 'gr', 1),
(509917, 782719, 'Τήνος', '%ce%a4%ce%ae%ce%bd%ce%bf%cf%82', 'gr', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city_area`
--

CREATE TABLE `oc_t_city_area` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city_stats`
--

CREATE TABLE `oc_t_city_stats` (
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_city_stats`
--

INSERT INTO `oc_t_city_stats` (`fk_i_city_id`, `i_num_items`) VALUES
(509889, 0),
(509890, 0),
(509891, 0),
(509892, 0),
(509893, 0),
(509894, 0),
(509895, 0),
(509896, 0),
(509897, 0),
(509898, 0),
(509899, 0),
(509900, 0),
(509901, 0),
(509902, 0),
(509903, 0),
(509904, 0),
(509905, 0),
(509906, 0),
(509907, 0),
(509908, 0),
(509909, 0),
(509910, 0),
(509911, 0),
(509912, 0),
(509913, 0),
(509914, 0),
(509915, 0),
(509916, 0),
(509917, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_country`
--

CREATE TABLE `oc_t_country` (
  `pk_c_code` char(2) NOT NULL,
  `s_name` varchar(80) NOT NULL,
  `s_slug` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_country`
--

INSERT INTO `oc_t_country` (`pk_c_code`, `s_name`, `s_slug`) VALUES
('GR', 'Greece', 'greece');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_country_stats`
--

CREATE TABLE `oc_t_country_stats` (
  `fk_c_country_code` char(2) NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_country_stats`
--

INSERT INTO `oc_t_country_stats` (`fk_c_country_code`, `i_num_items`) VALUES
('GR', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_cron`
--

CREATE TABLE `oc_t_cron` (
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `d_last_exec` datetime NOT NULL,
  `d_next_exec` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_cron`
--

INSERT INTO `oc_t_cron` (`e_type`, `d_last_exec`, `d_next_exec`) VALUES
('HOURLY', '2018-05-11 09:42:13', '2018-05-11 10:42:00'),
('DAILY', '2018-05-10 12:24:36', '2018-05-11 12:24:00'),
('WEEKLY', '2018-05-08 13:09:22', '2018-05-15 13:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_currency`
--

CREATE TABLE `oc_t_currency` (
  `pk_c_code` char(3) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_description` varchar(80) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_currency`
--

INSERT INTO `oc_t_currency` (`pk_c_code`, `s_name`, `s_description`, `b_enabled`) VALUES
('EUR', 'European Union euro', 'Euro €', 1),
('GBP', 'United Kingdom pound', 'Pound £', 1),
('USD', 'United States dollar', 'Dollar US$', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item`
--

CREATE TABLE `oc_t_item` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `f_price` float DEFAULT NULL,
  `i_price` bigint(20) DEFAULT NULL,
  `fk_c_currency_code` char(3) DEFAULT NULL,
  `s_contact_name` varchar(100) DEFAULT NULL,
  `s_contact_email` varchar(140) NOT NULL,
  `s_ip` varchar(64) NOT NULL DEFAULT '',
  `b_premium` tinyint(1) NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `s_secret` varchar(40) DEFAULT NULL,
  `b_show_email` tinyint(1) DEFAULT NULL,
  `dt_expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_comment`
--

CREATE TABLE `oc_t_item_comment` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_email` varchar(100) NOT NULL,
  `s_body` text NOT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_description`
--

CREATE TABLE `oc_t_item_description` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(100) NOT NULL,
  `s_description` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_location`
--

CREATE TABLE `oc_t_item_location` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) UNSIGNED DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_meta`
--

CREATE TABLE `oc_t_item_meta` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL,
  `s_value` text,
  `s_multi` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_resource`
--

CREATE TABLE `oc_t_item_resource` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(60) DEFAULT NULL,
  `s_extension` varchar(10) DEFAULT NULL,
  `s_content_type` varchar(40) DEFAULT NULL,
  `s_path` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_stats`
--

CREATE TABLE `oc_t_item_stats` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `i_num_views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_spam` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_repeated` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_bad_classified` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_offensive` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_expired` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_premium_views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dt_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_keywords`
--

CREATE TABLE `oc_t_keywords` (
  `s_md5` varchar(32) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_original_text` varchar(255) NOT NULL,
  `s_anchor_text` varchar(255) NOT NULL,
  `s_normalized_text` varchar(255) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_latest_searches`
--

CREATE TABLE `oc_t_latest_searches` (
  `d_date` datetime NOT NULL,
  `s_search` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_locale`
--

CREATE TABLE `oc_t_locale` (
  `pk_c_code` char(5) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_short_name` varchar(40) NOT NULL,
  `s_description` varchar(100) NOT NULL,
  `s_version` varchar(20) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_url` varchar(100) NOT NULL,
  `s_currency_format` varchar(50) NOT NULL,
  `s_dec_point` varchar(2) DEFAULT '.',
  `s_thousands_sep` varchar(2) DEFAULT '',
  `i_num_dec` tinyint(4) DEFAULT '2',
  `s_date_format` varchar(20) NOT NULL,
  `s_stop_words` text,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_enabled_bo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_locale`
--

INSERT INTO `oc_t_locale` (`pk_c_code`, `s_name`, `s_short_name`, `s_description`, `s_version`, `s_author_name`, `s_author_url`, `s_currency_format`, `s_dec_point`, `s_thousands_sep`, `i_num_dec`, `s_date_format`, `s_stop_words`, `b_enabled`, `b_enabled_bo`) VALUES
('el_GR', 'Greek', 'Greek', 'Greek translation', 'Dev version', 'Osclass', 'http://osclass.org/', '{NUMBER} {CURRENCY}', ',', '.', 2, 'd/m/Y', '', 1, 1),
('en_US', 'English (US)', 'English', 'American english translation', '2.3', 'Osclass', 'http://osclass.org/', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', 'i,a,about,an,are,as,at,be,by,com,for,from,how,in,is,it,of,on,or,that,the,this,to,was,what,when,where,who,will,with,the', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_locations_tmp`
--

CREATE TABLE `oc_t_locations_tmp` (
  `id_location` varchar(10) NOT NULL,
  `e_type` enum('COUNTRY','REGION','CITY') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_log`
--

CREATE TABLE `oc_t_log` (
  `dt_date` datetime NOT NULL,
  `s_section` varchar(50) NOT NULL,
  `s_action` varchar(50) NOT NULL,
  `fk_i_id` int(10) UNSIGNED NOT NULL,
  `s_data` varchar(250) NOT NULL,
  `s_ip` varchar(50) NOT NULL,
  `s_who` varchar(50) NOT NULL,
  `fk_i_who_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_log`
--

INSERT INTO `oc_t_log` (`dt_date`, `s_section`, `s_action`, `fk_i_id`, `s_data`, `s_ip`, `s_who`, `fk_i_who_id`) VALUES
('2018-05-08 11:08:11', 'item', 'add', 1, 'Example Ad', '192.168.2.21', 'admin', 1),
('2018-05-08 13:10:34', 'item', 'add', 2, 'hsjahdjshj', '192.168.2.21', 'admin', 1),
('2018-05-08 13:10:39', 'item', 'delete', 2, 'hsjahdjshj', '192.168.2.21', 'admin', 1),
('2018-05-08 13:10:39', 'itemActions', 'deleteResourcesFromHD', 2, '2', '192.168.2.21', 'admin', 1),
('2018-05-08 13:10:39', 'itemActions', 'deleteResourcesFromHD', 2, '', '192.168.2.21', 'admin', 1),
('2018-05-08 13:11:57', 'item', 'add', 3, 'fjwhjefeg', '192.168.2.21', 'admin', 1),
('2018-05-08 13:12:01', 'item', 'delete', 3, 'fjwhjefeg', '192.168.2.21', 'admin', 1),
('2018-05-08 13:12:01', 'itemActions', 'deleteResourcesFromHD', 3, '3', '192.168.2.21', 'admin', 1),
('2018-05-08 13:12:01', 'itemActions', 'deleteResourcesFromHD', 3, '', '192.168.2.21', 'admin', 1),
('2018-05-08 13:32:52', 'item', 'add', 4, 'fdfds', '192.168.2.21', 'admin', 1),
('2018-05-08 13:32:57', 'item', 'delete', 4, 'fdfds', '192.168.2.21', 'admin', 1),
('2018-05-08 13:32:57', 'itemActions', 'deleteResourcesFromHD', 4, '4', '192.168.2.21', 'admin', 1),
('2018-05-08 13:32:58', 'itemActions', 'deleteResourcesFromHD', 4, '', '192.168.2.21', 'admin', 1),
('2018-05-08 13:46:25', 'item', 'add', 5, 'dewfewqfeq', '192.168.2.21', 'admin', 1),
('2018-05-08 13:46:29', 'item', 'delete', 5, 'dewfewqfeq', '192.168.2.21', 'admin', 1),
('2018-05-08 13:46:29', 'itemActions', 'deleteResourcesFromHD', 5, '5', '192.168.2.21', 'admin', 1),
('2018-05-08 13:46:29', 'itemActions', 'deleteResourcesFromHD', 5, '', '192.168.2.21', 'admin', 1),
('2018-05-08 13:49:10', 'item', 'add', 6, 'ffgwergrew', '192.168.2.21', 'admin', 1),
('2018-05-08 13:49:21', 'item', 'delete', 6, 'Ακίνητα in Πάρος', '192.168.2.21', 'admin', 1),
('2018-05-08 13:49:21', 'itemActions', 'deleteResourcesFromHD', 6, '6', '192.168.2.21', 'admin', 1),
('2018-05-08 13:49:21', 'itemActions', 'deleteResourcesFromHD', 6, '', '192.168.2.21', 'admin', 1),
('2018-05-08 16:28:06', 'item', 'add', 7, '', '192.168.2.21', 'admin', 1),
('2018-05-08 16:28:16', 'item', 'delete', 7, 'delme', '192.168.2.21', 'admin', 1),
('2018-05-08 16:28:16', 'itemActions', 'deleteResourcesFromHD', 7, '7', '192.168.2.21', 'admin', 1),
('2018-05-08 16:28:16', 'itemActions', 'deleteResourcesFromHD', 7, '', '192.168.2.21', 'admin', 1),
('2018-05-08 16:34:03', 'item', 'edit', 1, 'Example Ad', '192.168.2.21', 'admin', 1),
('2018-05-08 16:37:28', 'item', 'edit', 1, 'Example Ad', '192.168.2.21', 'admin', 1),
('2018-05-08 16:38:04', 'item', 'edit', 1, 'Example Ad', '192.168.2.21', 'admin', 1),
('2018-05-08 16:38:58', 'item', 'edit', 1, 'Example Ad', '192.168.2.21', 'admin', 1),
('2018-05-08 16:39:43', 'item', 'delete', 1, 'delme', '192.168.2.21', 'admin', 1),
('2018-05-08 16:39:43', 'itemActions', 'deleteResourcesFromHD', 1, '1', '192.168.2.21', 'admin', 1),
('2018-05-08 16:39:43', 'itemActions', 'deleteResourcesFromHD', 1, '', '192.168.2.21', 'admin', 1),
('2018-05-08 16:50:04', 'item', 'add', 8, '', '192.168.2.21', 'admin', 1),
('2018-05-08 16:51:22', 'item', 'edit', 8, '', '192.168.2.21', 'admin', 1),
('2018-05-08 16:51:46', 'item', 'delete', 8, 'delme', '192.168.2.21', 'admin', 1),
('2018-05-08 16:51:46', 'itemActions', 'deleteResourcesFromHD', 8, '8', '192.168.2.21', 'admin', 1),
('2018-05-08 16:51:46', 'item', 'delete resource', 1, '1', '192.168.2.21', 'admin', 1),
('2018-05-08 16:51:46', 'item', 'delete resource backtrace', 1, '#0 osc_deleteResource called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/ItemActions.php:820] / #1 deleteResourcesFromHD called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called@ [/usr/share/', '192.168.2.21', 'admin', 1),
('2018-05-08 16:51:46', 'itemActions', 'deleteResourcesFromHD', 8, '1,', '192.168.2.21', 'admin', 1),
('2018-05-08 16:52:45', 'item', 'add', 9, '', '192.168.2.21', 'admin', 1),
('2018-05-08 16:57:37', 'itemActions', 'deleteResourcesFromHD', 9, '9', '192.168.2.21', 'admin', 1),
('2018-05-08 16:57:37', 'item', 'delete resource', 2, '2', '192.168.2.21', 'admin', 1),
('2018-05-08 16:57:37', 'item', 'delete resource backtrace', 2, '#0 osc_deleteResource called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/ItemActions.php:820] / #1 deleteResourcesFromHD called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called@ [/usr/share/', '192.168.2.21', 'admin', 1),
('2018-05-08 16:57:37', 'itemActions', 'deleteResourcesFromHD', 9, '2,', '192.168.2.21', 'admin', 1),
('2018-05-08 17:29:41', 'item', 'add', 10, '', '192.168.2.21', 'admin', 1),
('2018-05-08 17:30:33', 'item', 'delete', 10, 'Rooms  in Αγγελόκαστρο', '192.168.2.21', 'admin', 1),
('2018-05-08 17:30:33', 'itemActions', 'deleteResourcesFromHD', 10, '10', '192.168.2.21', 'admin', 1),
('2018-05-08 17:30:33', 'item', 'delete resource', 3, '3', '192.168.2.21', 'admin', 1),
('2018-05-08 17:30:33', 'item', 'delete resource backtrace', 3, '#0 osc_deleteResource called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/ItemActions.php:820] / #1 deleteResourcesFromHD called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called@ [/usr/share/', '192.168.2.21', 'admin', 1),
('2018-05-08 17:30:33', 'itemActions', 'deleteResourcesFromHD', 10, '3,', '192.168.2.21', 'admin', 1),
('2018-05-08 17:31:16', 'item', 'add', 11, '', '192.168.2.21', 'admin', 1),
('2018-05-08 17:31:54', 'item', 'delete', 11, 'Boat\'s in Αγγελόκαστρο', '192.168.2.21', 'admin', 1),
('2018-05-08 17:31:54', 'itemActions', 'deleteResourcesFromHD', 11, '11', '192.168.2.21', 'admin', 1),
('2018-05-08 17:31:54', 'item', 'delete resource', 4, '4', '192.168.2.21', 'admin', 1),
('2018-05-08 17:31:54', 'item', 'delete resource backtrace', 4, '#0 osc_deleteResource called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/ItemActions.php:820] / #1 deleteResourcesFromHD called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called@ [/usr/share/', '192.168.2.21', 'admin', 1),
('2018-05-08 17:31:54', 'itemActions', 'deleteResourcesFromHD', 11, '4,', '192.168.2.21', 'admin', 1),
('2018-05-08 18:56:22', 'item', 'add', 12, '', '192.168.2.21', 'admin', 1),
('2018-05-08 19:04:35', 'item', 'add', 13, '', '192.168.2.21', 'admin', 1),
('2018-05-08 19:04:58', 'item', 'delete', 13, 'delme2', '192.168.2.21', 'admin', 1),
('2018-05-08 19:04:58', 'itemActions', 'deleteResourcesFromHD', 13, '13', '192.168.2.21', 'admin', 1),
('2018-05-08 19:04:58', 'itemActions', 'deleteResourcesFromHD', 13, '', '192.168.2.21', 'admin', 1),
('2018-05-08 19:05:03', 'item', 'delete', 12, 'delme', '192.168.2.21', 'admin', 1),
('2018-05-08 19:05:03', 'itemActions', 'deleteResourcesFromHD', 12, '12', '192.168.2.21', 'admin', 1),
('2018-05-08 19:05:03', 'item', 'delete resource', 5, '5', '192.168.2.21', 'admin', 1),
('2018-05-08 19:05:03', 'item', 'delete resource backtrace', 5, '#0 osc_deleteResource called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/ItemActions.php:820] / #1 deleteResourcesFromHD called@ [/usr/share/webapps/ola.1/ola/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called@ [/usr/share/', '192.168.2.21', 'admin', 1),
('2018-05-08 19:05:03', 'itemActions', 'deleteResourcesFromHD', 12, '5,', '192.168.2.21', 'admin', 1),
('2018-05-08 19:06:54', 'item', 'add', 14, '', '192.168.2.21', 'admin', 1),
('2018-05-08 23:45:57', 'item', 'delete', 14, 'delme2', '192.168.2.21', 'admin', 1),
('2018-05-08 23:45:57', 'itemActions', 'deleteResourcesFromHD', 14, '14', '192.168.2.21', 'admin', 1),
('2018-05-08 23:45:57', 'itemActions', 'deleteResourcesFromHD', 14, '', '192.168.2.21', 'admin', 1),
('2018-05-08 23:52:03', 'item', 'add', 15, '', '192.168.2.21', 'admin', 1),
('2018-05-08 23:52:47', 'item', 'delete', 15, 'δελμε', '192.168.2.21', 'admin', 1),
('2018-05-08 23:52:47', 'itemActions', 'deleteResourcesFromHD', 15, '15', '192.168.2.21', 'admin', 1),
('2018-05-08 23:52:47', 'itemActions', 'deleteResourcesFromHD', 15, '', '192.168.2.21', 'admin', 1),
('2018-05-09 23:02:49', 'item', 'add', 16, '', '5.54.243.126', 'admin', 1),
('2018-05-09 23:04:23', 'item', 'delete', 16, 'test', '5.54.243.126', 'admin', 1),
('2018-05-09 23:04:23', 'itemActions', 'deleteResourcesFromHD', 16, '16', '5.54.243.126', 'admin', 1),
('2018-05-09 23:04:23', 'itemActions', 'deleteResourcesFromHD', 16, '', '5.54.243.126', 'admin', 1),
('2018-05-09 23:11:26', 'item', 'add', 17, '', '5.54.243.126', 'admin', 2),
('2018-05-09 23:12:28', 'item', 'delete', 17, 'delme', '5.54.243.126', 'admin', 2),
('2018-05-09 23:12:28', 'itemActions', 'deleteResourcesFromHD', 17, '17', '5.54.243.126', 'admin', 2),
('2018-05-09 23:12:28', 'itemActions', 'deleteResourcesFromHD', 17, '', '5.54.243.126', 'admin', 2),
('2018-05-10 16:17:37', 'item', 'add', 18, '', '192.168.2.21', 'admin', 1),
('2018-05-10 16:18:19', 'item', 'edit', 18, '', '192.168.2.21', 'admin', 1),
('2018-05-10 16:18:56', 'item', 'edit', 18, '', '192.168.2.21', 'admin', 1),
('2018-05-10 16:20:55', 'item', 'edit', 18, '', '192.168.2.21', 'admin', 1),
('2018-05-10 16:27:57', 'item', 'edit', 18, '', '192.168.2.21', 'admin', 1),
('2018-05-10 16:38:34', 'item', 'delete', 18, 'test 1', '192.168.2.21', 'admin', 1),
('2018-05-10 16:38:35', 'itemActions', 'deleteResourcesFromHD', 18, '18', '192.168.2.21', 'admin', 1),
('2018-05-10 16:38:35', 'itemActions', 'deleteResourcesFromHD', 18, '', '192.168.2.21', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_categories`
--

CREATE TABLE `oc_t_meta_categories` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_meta_categories`
--

INSERT INTO `oc_t_meta_categories` (`fk_i_category_id`, `fk_i_field_id`) VALUES
(1, 5),
(1, 6),
(1, 7),
(1, 9),
(1, 11),
(1, 12),
(1, 13),
(2, 5),
(2, 6),
(2, 7),
(2, 9),
(2, 11),
(2, 12),
(2, 13),
(3, 5),
(3, 6),
(3, 7),
(3, 9),
(3, 11),
(3, 12),
(3, 13),
(4, 5),
(4, 6),
(4, 7),
(4, 9),
(4, 11),
(4, 12),
(4, 13),
(5, 5),
(5, 6),
(5, 7),
(5, 9),
(5, 11),
(5, 12),
(5, 13),
(6, 5),
(6, 6),
(6, 7),
(6, 9),
(6, 11),
(6, 12),
(6, 13),
(7, 5),
(7, 6),
(7, 7),
(7, 9),
(7, 11),
(7, 12),
(7, 13),
(8, 5),
(8, 6),
(8, 7),
(8, 9),
(8, 11),
(8, 12),
(8, 13),
(26, 5),
(26, 6),
(26, 7),
(26, 9),
(26, 11),
(26, 12),
(26, 13),
(27, 5),
(27, 6),
(27, 7),
(27, 9),
(27, 11),
(27, 12),
(27, 13),
(28, 5),
(28, 6),
(28, 7),
(28, 9),
(28, 11),
(28, 12),
(28, 13),
(31, 5),
(31, 6),
(31, 7),
(31, 9),
(31, 11),
(31, 12),
(31, 13),
(32, 5),
(32, 6),
(32, 7),
(32, 9),
(32, 11),
(32, 12),
(32, 13),
(33, 5),
(33, 6),
(33, 7),
(33, 9),
(33, 11),
(33, 12),
(33, 13),
(34, 5),
(34, 6),
(34, 7),
(34, 9),
(34, 11),
(34, 12),
(34, 13),
(36, 5),
(36, 6),
(36, 7),
(36, 9),
(36, 11),
(36, 12),
(36, 13),
(37, 5),
(37, 6),
(37, 7),
(37, 9),
(37, 11),
(37, 12),
(37, 13),
(38, 5),
(38, 6),
(38, 7),
(38, 9),
(38, 11),
(38, 12),
(38, 13),
(39, 5),
(39, 6),
(39, 7),
(39, 9),
(39, 11),
(39, 12),
(39, 13),
(40, 5),
(40, 6),
(40, 7),
(40, 9),
(40, 11),
(40, 12),
(40, 13),
(41, 5),
(41, 6),
(41, 7),
(41, 9),
(41, 11),
(41, 12),
(41, 13),
(42, 5),
(42, 6),
(42, 7),
(42, 9),
(42, 11),
(42, 12),
(42, 13),
(44, 5),
(44, 6),
(44, 7),
(44, 9),
(44, 11),
(44, 12),
(44, 13),
(45, 5),
(45, 6),
(45, 7),
(45, 9),
(45, 11),
(45, 12),
(45, 13),
(49, 5),
(49, 6),
(49, 7),
(49, 9),
(49, 11),
(49, 12),
(49, 13),
(50, 5),
(50, 6),
(50, 7),
(50, 9),
(50, 11),
(50, 12),
(50, 13),
(52, 5),
(52, 6),
(52, 7),
(52, 9),
(52, 11),
(52, 12),
(52, 13),
(55, 5),
(55, 6),
(55, 7),
(55, 9),
(55, 11),
(55, 12),
(55, 13),
(56, 5),
(56, 6),
(56, 7),
(56, 9),
(56, 11),
(56, 12),
(56, 13),
(58, 5),
(58, 6),
(58, 7),
(58, 9),
(58, 11),
(58, 12),
(58, 13),
(59, 5),
(59, 6),
(59, 7),
(59, 9),
(59, 11),
(59, 12),
(59, 13),
(60, 5),
(60, 6),
(60, 7),
(60, 9),
(60, 11),
(60, 12),
(60, 13),
(61, 5),
(61, 6),
(61, 7),
(61, 9),
(61, 11),
(61, 12),
(61, 13),
(62, 5),
(62, 6),
(62, 7),
(62, 9),
(62, 11),
(62, 12),
(62, 13),
(63, 5),
(63, 6),
(63, 7),
(63, 9),
(63, 11),
(63, 12),
(63, 13),
(64, 5),
(64, 6),
(64, 7),
(64, 9),
(64, 11),
(64, 12),
(64, 13),
(65, 5),
(65, 6),
(65, 7),
(65, 9),
(65, 11),
(65, 12),
(65, 13),
(66, 5),
(66, 6),
(66, 7),
(66, 9),
(66, 11),
(66, 12),
(66, 13),
(67, 5),
(67, 6),
(67, 7),
(67, 9),
(67, 11),
(67, 12),
(67, 13),
(68, 5),
(68, 6),
(68, 7),
(68, 9),
(68, 11),
(68, 12),
(68, 13),
(69, 5),
(69, 6),
(69, 7),
(69, 9),
(69, 11),
(69, 12),
(69, 13),
(70, 5),
(70, 6),
(70, 7),
(70, 9),
(70, 11),
(70, 12),
(70, 13),
(71, 5),
(71, 6),
(71, 7),
(71, 9),
(71, 11),
(71, 12),
(71, 13),
(72, 5),
(72, 6),
(72, 7),
(72, 9),
(72, 11),
(72, 12),
(72, 13),
(73, 5),
(73, 6),
(73, 7),
(73, 9),
(73, 11),
(73, 12),
(73, 13),
(74, 5),
(74, 6),
(74, 7),
(74, 9),
(74, 11),
(74, 12),
(74, 13),
(75, 5),
(75, 6),
(75, 7),
(75, 9),
(75, 11),
(75, 12),
(75, 13),
(76, 5),
(76, 6),
(76, 7),
(76, 9),
(76, 11),
(76, 12),
(76, 13),
(78, 5),
(78, 6),
(78, 7),
(78, 9),
(78, 11),
(78, 12),
(78, 13),
(82, 5),
(82, 6),
(82, 7),
(82, 9),
(82, 11),
(82, 12),
(82, 13),
(93, 5),
(93, 6),
(93, 7),
(93, 9),
(93, 11),
(93, 12),
(93, 13),
(102, 5),
(102, 6),
(102, 7),
(102, 9),
(102, 11),
(102, 12),
(102, 13),
(103, 5),
(103, 6),
(103, 7),
(103, 9),
(103, 11),
(103, 12),
(103, 13),
(104, 5),
(104, 6),
(104, 7),
(104, 9),
(104, 11),
(104, 12),
(104, 13),
(105, 5),
(105, 6),
(105, 7),
(105, 9),
(105, 11),
(105, 12),
(105, 13),
(106, 5),
(106, 6),
(106, 7),
(106, 9),
(106, 11),
(106, 12),
(106, 13),
(107, 5),
(107, 6),
(107, 7),
(107, 9),
(107, 11),
(107, 12),
(107, 13),
(109, 5),
(109, 6),
(109, 7),
(109, 9),
(109, 11),
(109, 12),
(109, 13),
(111, 5),
(111, 6),
(111, 7),
(111, 9),
(111, 11),
(111, 12),
(111, 13),
(113, 5),
(113, 6),
(113, 7),
(113, 9),
(113, 11),
(113, 12),
(113, 13),
(114, 5),
(114, 6),
(114, 7),
(114, 9),
(114, 11),
(114, 12),
(114, 13),
(115, 5),
(115, 6),
(115, 7),
(115, 9),
(115, 11),
(115, 12),
(115, 13),
(116, 5),
(116, 6),
(116, 7),
(116, 9),
(116, 11),
(116, 12),
(116, 13),
(117, 5),
(117, 6),
(117, 7),
(117, 9),
(117, 11),
(117, 12),
(117, 13),
(118, 5),
(118, 6),
(118, 7),
(118, 9),
(118, 11),
(118, 12),
(118, 13),
(119, 5),
(119, 6),
(119, 7),
(119, 9),
(119, 11),
(119, 12),
(119, 13),
(120, 5),
(120, 6),
(120, 7),
(120, 9),
(120, 11),
(120, 12),
(120, 13),
(121, 5),
(121, 6),
(121, 7),
(121, 9),
(121, 11),
(121, 12),
(121, 13),
(122, 5),
(122, 6),
(122, 7),
(122, 9),
(122, 11),
(122, 12),
(122, 13),
(123, 5),
(123, 6),
(123, 7),
(123, 9),
(123, 11),
(123, 12),
(123, 13),
(124, 5),
(124, 6),
(124, 7),
(124, 9),
(124, 11),
(124, 12),
(124, 13),
(125, 5),
(125, 6),
(125, 7),
(125, 9),
(125, 11),
(125, 12),
(125, 13),
(126, 5),
(126, 6),
(126, 7),
(126, 9),
(126, 11),
(126, 12),
(126, 13),
(127, 5),
(127, 6),
(127, 7),
(127, 9),
(127, 11),
(127, 12),
(127, 13),
(128, 5),
(128, 6),
(128, 7),
(128, 9),
(128, 11),
(128, 12),
(128, 13),
(129, 5),
(129, 6),
(129, 7),
(129, 9),
(129, 11),
(129, 12),
(129, 13),
(130, 5),
(130, 6),
(130, 7),
(130, 9),
(130, 11),
(130, 12),
(130, 13),
(131, 5),
(131, 6),
(131, 7),
(131, 9),
(131, 11),
(131, 12),
(131, 13),
(132, 5),
(132, 6),
(132, 7),
(132, 9),
(132, 11),
(132, 12),
(132, 13),
(133, 5),
(133, 6),
(133, 7),
(133, 9),
(133, 11),
(133, 12),
(133, 13),
(134, 5),
(134, 6),
(134, 7),
(134, 9),
(134, 11),
(134, 12),
(134, 13),
(135, 5),
(135, 6),
(135, 7),
(135, 9),
(135, 11),
(135, 12),
(135, 13),
(136, 5),
(136, 6),
(136, 7),
(136, 9),
(136, 11),
(136, 12),
(136, 13),
(137, 5),
(137, 6),
(137, 7),
(137, 9),
(137, 11),
(137, 12),
(137, 13),
(138, 5),
(138, 6),
(138, 7),
(138, 9),
(138, 11),
(138, 12),
(138, 13),
(139, 5),
(139, 6),
(139, 7),
(139, 9),
(139, 11),
(139, 12),
(139, 13),
(140, 5),
(140, 6),
(140, 7),
(140, 9),
(140, 11),
(140, 12),
(140, 13),
(141, 5),
(141, 6),
(141, 7),
(141, 9),
(141, 11),
(141, 12),
(141, 13),
(142, 5),
(142, 6),
(142, 7),
(142, 9),
(142, 11),
(142, 12),
(142, 13),
(143, 5),
(143, 6),
(143, 7),
(143, 9),
(143, 11),
(143, 12),
(143, 13),
(144, 5),
(144, 6),
(144, 7),
(144, 9),
(144, 11),
(144, 12),
(144, 13),
(145, 5),
(145, 6),
(145, 7),
(145, 9),
(145, 11),
(145, 12),
(145, 13),
(146, 5),
(146, 6),
(146, 7),
(146, 9),
(146, 11),
(146, 12),
(146, 13),
(147, 5),
(147, 6),
(147, 7),
(147, 9),
(147, 11),
(147, 12),
(147, 13),
(148, 5),
(148, 6),
(148, 7),
(148, 9),
(148, 11),
(148, 12),
(148, 13),
(149, 5),
(149, 6),
(149, 7),
(149, 9),
(149, 11),
(149, 12),
(149, 13),
(150, 5),
(150, 6),
(150, 7),
(150, 9),
(150, 11),
(150, 12),
(150, 13);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_fields`
--

CREATE TABLE `oc_t_meta_fields` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `s_slug` varchar(255) NOT NULL,
  `e_type` enum('TEXT','TEXTAREA','DROPDOWN','RADIO','CHECKBOX','URL','DATE','DATEINTERVAL') NOT NULL DEFAULT 'TEXT',
  `s_options` varchar(2048) DEFAULT NULL,
  `b_required` tinyint(1) NOT NULL DEFAULT '0',
  `b_searchable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_meta_fields`
--

INSERT INTO `oc_t_meta_fields` (`pk_i_id`, `s_name`, `s_slug`, `e_type`, `s_options`, `b_required`, `b_searchable`) VALUES
(5, 'Κινητό', 'ola_mobile', 'TEXT', '', 0, 0),
(6, 'Τηλ', 'ola_telephone', 'TEXT', '', 0, 0),
(7, 'e-mail', 'ola_email', 'TEXT', '', 0, 0),
(9, 'Facebook', 'ola_facebook', 'URL', '', 0, 0),
(11, 'Instagram', 'ola_instagram', 'URL', '', 0, 0),
(12, 'Site', 'ola_site', 'URL', '', 0, 0),
(13, 'TripAdvisor', 'ola_tripadvisor', 'URL', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_pages`
--

CREATE TABLE `oc_t_pages` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_internal_name` varchar(50) DEFAULT NULL,
  `b_indelible` tinyint(1) NOT NULL DEFAULT '0',
  `b_link` tinyint(1) NOT NULL DEFAULT '1',
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `i_order` int(3) NOT NULL DEFAULT '0',
  `s_meta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_pages`
--

INSERT INTO `oc_t_pages` (`pk_i_id`, `s_internal_name`, `b_indelible`, `b_link`, `dt_pub_date`, `dt_mod_date`, `i_order`, `s_meta`) VALUES
(1, 'email_item_inquiry', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(2, 'email_user_validation', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(3, 'email_user_registration', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(4, 'email_send_friend', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(5, 'alert_email_hourly', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(6, 'alert_email_daily', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(7, 'alert_email_weekly', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(8, 'alert_email_instant', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(9, 'email_new_comment_admin', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(10, 'email_new_item_non_register_user', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(11, 'email_item_validation', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(12, 'email_admin_new_item', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(13, 'email_user_forgot_password', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(14, 'email_new_email', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(15, 'email_alert_validation', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(16, 'email_comment_validated', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(17, 'email_item_validation_non_register_user', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(18, 'email_admin_new_user', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(19, 'email_contact_user', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(20, 'email_new_comment_user', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(21, 'email_new_admin', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(22, 'email_warn_expiration', 1, 1, '2018-05-08 14:08:09', NULL, 0, NULL),
(23, 'example_page', 0, 0, '2018-05-08 11:08:11', '2018-05-08 11:08:11', 1, '\"\"'),
(24, 'email_moreedit_notify_edit', 1, 1, '2018-05-08 13:48:08', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_pages_description`
--

CREATE TABLE `oc_t_pages_description` (
  `fk_i_pages_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(255) NOT NULL,
  `s_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_pages_description`
--

INSERT INTO `oc_t_pages_description` (`fk_i_pages_id`, `fk_c_locale_code`, `s_title`, `s_text`) VALUES
(1, 'en_US', '{WEB_TITLE} - Someone has a question about your listing', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message about your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(2, 'en_US', 'Please validate your {WEB_TITLE} account', '<p>Hi {USER_NAME},</p><p>Please validate your registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(3, 'en_US', '{WEB_TITLE} - Registration successful!', '<p>Hi {USER_NAME},</p><p>You\'ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(4, 'en_US', 'Look at what I discovered on {WEB_TITLE}', '<p>Hi {FRIEND_NAME},</p><p>Your friend {USER_NAME} wants to share this listing with you <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_TITLE}</p>'),
(5, 'en_US', '{WEB_TITLE} - New listings in the last hour', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last hour. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'en_US', '{WEB_TITLE} - New listings in the last day', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last day. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'en_US', '{WEB_TITLE} - New listings in the last week', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last week. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'en_US', '{WEB_TITLE} - New listings', '<p>Hi {USER_NAME},</p><p>A new listing has been published, check it out!</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(9, 'en_US', '{WEB_TITLE} - New comment', '<p>Someone commented on the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
(10, 'en_US', '{WEB_TITLE} - Edit options for the listing {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You\'re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(11, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(12, 'en_US', '{WEB_TITLE} - A new listing has been published', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a listing has been published at {WEB_LINK}.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(13, 'en_US', '{WEB_TITLE} - Recover your password', '<p>Hi {USER_NAME},</p><p>We\'ve sent you this e-mail because you\'ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn\'t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(14, 'en_US', '{WEB_TITLE} - You requested an email change', '<p>Hi {USER_NAME}</p><p>You\'re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(15, 'en_US', '{WEB_TITLE} - Please validate your alert', '<p>Hi {USER_NAME},</p><p>Please validate your alert registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(16, 'en_US', '{WEB_TITLE} - Your comment has been approved', '<p>Hi {COMMENT_AUTHOR},</p><p>Your comment on <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> has been approved.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(17, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you\'re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(18, 'en_US', '{WEB_TITLE} - A new user has registered', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(19, 'en_US', '{WEB_TITLE} - Someone has a question for you', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(20, 'en_US', '{WEB_TITLE} - Someone has commented on your listing', '<p>There\'s a new comment on the listing: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(21, 'en_US', '{WEB_TITLE} - Success creating admin account!', '<p>Hi {ADMIN_NAME},</p><p>The admin of {WEB_LINK} has created an account for you,</p><ul><li>Username: {USERNAME}</li><li>Password: {PASSWORD}</li></ul><p>You can access the admin panel here {WEB_ADMIN_LINK}.</p><p>Thank you!</p><p>Regards,</p>'),
(22, 'en_US', '{WEB_TITLE} - Your ad is about to expire', '<p>Hi {USER_NAME},</p><p>Your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> is about to expire at {WEB_LINK}.'),
(23, 'en_US', 'Example page title', 'This is an example page description. This is a good place to put your Terms of Service or any other help information.'),
(24, 'en_US', '{WEB_TITLE} - Notification of ad: {ITEM_TITLE}', '<p>Hi Admin!</p>\\r\\n<p> </p>\\r\\n<p>We just published an item ({ITEM_TITLE}) on {WEB_TITLE} from user {USER_NAME} ( {ITEM_URL} ).</p>\\r\\n<p>Edit it here : {EDIT_LINK}</p>\\r\\n<p> </p>\\r\\n<p>Thanks</p>');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_plugin_category`
--

CREATE TABLE `oc_t_plugin_category` (
  `s_plugin_name` varchar(40) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_plugin_category`
--

INSERT INTO `oc_t_plugin_category` (`s_plugin_name`, `fk_i_category_id`) VALUES
('voting', 1),
('voting', 26),
('voting', 27),
('voting', 28),
('voting', 128),
('voting', 49),
('voting', 4),
('voting', 44),
('voting', 45),
('voting', 50),
('voting', 129),
('voting', 113),
('voting', 130),
('voting', 131),
('voting', 115),
('voting', 119),
('voting', 132),
('voting', 5),
('voting', 52),
('voting', 55),
('voting', 58),
('voting', 60),
('voting', 59),
('voting', 61),
('voting', 114),
('voting', 118),
('voting', 117),
('voting', 62),
('voting', 56),
('voting', 133),
('voting', 134),
('voting', 135),
('voting', 136),
('voting', 137),
('voting', 109),
('voting', 111),
('voting', 140),
('voting', 141),
('voting', 142),
('voting', 143),
('voting', 138),
('voting', 144),
('voting', 145),
('voting', 146),
('voting', 2),
('voting', 31),
('voting', 116),
('voting', 32),
('voting', 36),
('voting', 33),
('voting', 34),
('voting', 37),
('voting', 3),
('voting', 38),
('voting', 39),
('voting', 40),
('voting', 41),
('voting', 42),
('voting', 102),
('voting', 103),
('voting', 104),
('voting', 107),
('voting', 105),
('voting', 106),
('voting', 120),
('voting', 121),
('voting', 139),
('voting', 147),
('voting', 148),
('voting', 149),
('voting', 150);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_preference`
--

CREATE TABLE `oc_t_preference` (
  `s_section` varchar(128) NOT NULL,
  `s_name` varchar(128) NOT NULL,
  `s_value` longtext NOT NULL,
  `e_type` enum('STRING','INTEGER','BOOLEAN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_preference`
--

INSERT INTO `oc_t_preference` (`s_section`, `s_name`, `s_value`, `e_type`) VALUES
('bender', 'defaultLocationShowAs', 'dropdown', 'STRING'),
('bender', 'defaultShowAs@all', 'list', 'STRING'),
('bender', 'donation', '0', 'STRING'),
('bender', 'footer_link', '1', 'STRING'),
('bender', 'keyword_placeholder', 'ie. PHP Programmer', 'STRING'),
('bender', 'rtl', '0', 'STRING'),
('bender', 'version', '320', 'STRING'),
('bootlist', '0', '', 'STRING'),
('bootlist', 'bootlist-account-style', 'not-checked', 'STRING'),
('bootlist', 'bootlist-banner-layout', 'not-checked', 'STRING'),
('bootlist', 'bootlist-follow-us-tt-el-GR', 'Follow us on', 'STRING'),
('bootlist', 'bootlist-fonts-type', 'line-fonts', 'STRING'),
('bootlist', 'bootlist-hd-caption-desc-el-GR', 'Ψάξτε από μια μεγάλη λίστα ή ανεβάστε την δική σας εντελώς δωρεάν', 'STRING'),
('bootlist', 'bootlist-hd-caption-desc-en-US', 'Search from largest classifieds & Post unlimited classifieds free!', 'STRING'),
('bootlist', 'bootlist-hd-caption-tt-el-GR', 'ΒΡΕΣ ΟΤΙ ΘΕΛΕΙΣ', 'STRING'),
('bootlist', 'bootlist-hd-caption-tt-en-US', 'Find Whatever Your Want?', 'STRING'),
('bootlist', 'bootlist-home-layout', 'not-checked', 'STRING'),
('bootlist', 'bootlist-home-style', 'not-checked', 'STRING'),
('bootlist', 'bootlist-info-panel-cnt-el-GR', '(000) 555-5556', 'STRING'),
('bootlist', 'bootlist-info-panel-desc-el-GR', 'If you have any questions, comments or concerns, please call the Classified Advertising department', 'STRING'),
('bootlist', 'bootlist-item-info-title-el-GR', 'Post a Free Classified Ad', 'STRING'),
('bootlist', 'bootlist-keyword-placeholder-el-GR', 'ie. PHP Programmer', 'STRING'),
('bootlist', 'bootlist-listing-style', 'not-checked', 'STRING'),
('bootlist', 'bootlist-location-info-title-el-GR', 'Ad Location', 'STRING'),
('bootlist', 'bootlist-location-show-as', 'dropdown', 'STRING'),
('bootlist', 'bootlist-logo-preferences', 'logo', 'STRING'),
('bootlist', 'bootlist-lt-lst-title-el-GR', 'Latest Ads', 'STRING'),
('bootlist', 'bootlist-pm-lst-num', '10', 'STRING'),
('bootlist', 'bootlist-pm-lst-title-el-GR', 'Sponsored Ads', 'STRING'),
('bootlist', 'bootlist-region-select', 'not-checked', 'STRING'),
('bootlist', 'bootlist-rld-lst-num', '10', 'STRING'),
('bootlist', 'bootlist-rld-lst-title-el-GR', 'Related Ads', 'STRING'),
('bootlist', 'bootlist-search-filter-h1-el-GR', 'Popular Keywords', 'STRING'),
('bootlist', 'bootlist-search-filter-h2-el-GR', 'Show only', 'STRING'),
('bootlist', 'bootlist-search-filter-h3-el-GR', 'Price Range', 'STRING'),
('bootlist', 'bootlist-search-layout', 'sd-left', 'STRING'),
('bootlist', 'bootlist-search-style', 'not-checked', 'STRING'),
('bootlist', 'bootlist-search-submit-el-GR', 'Ψάξε...', 'STRING'),
('bootlist', 'bootlist-search-wd-1-tt-el-GR', 'Filter Search', 'STRING'),
('bootlist', 'bootlist-search-wd-2-tt-el-GR', 'Refine Category', 'STRING'),
('bootlist', 'bootlist-search-wd-3-tt-el-GR', 'Refine Location', 'STRING'),
('bootlist', 'bootlist-search-wd-5-tt-el-GR', 'Subscribe to this search', 'STRING'),
('bootlist', 'bootlist-seller-info-title-el-GR', 'Seller information', 'STRING'),
('bootlist', 'bootlist-show-all-listings', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-as', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-hm-dt-el-GR', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-hm-dt-en-US', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-hm-steps-el-GR', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-hm-steps-en-US', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-notifications', 'checked', 'STRING'),
('bootlist', 'bootlist-show-offer-el-GR', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-offer-en-US', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-search-form-el-GR', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-search-form-en-US', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-search-title-el-GR', 'not-checked', 'STRING'),
('bootlist', 'bootlist-show-search-title-en-US', 'not-checked', 'STRING'),
('bootlist', 'header-bg', 'header-bg.jpg', 'STRING'),
('bootlist', 'logo', 'logo.jpg', 'STRING'),
('bootlist', 'theme_version', '100', 'INTEGER'),
('bootlist', 'version', '1.0.0', 'STRING'),
('custom_attributes', 'database_version', '3', 'INTEGER'),
('custom_attributes', 'order_type', 'custom', 'STRING'),
('easy-share', 'easy-share-color', '#6fa8dc', 'STRING'),
('easy-share', 'easy-share-default-color', '', 'STRING'),
('easy-share', 'easy-share-em-tag-lg', 'enable', 'STRING'),
('easy-share', 'easy-share-em-tag-sm', '', 'STRING'),
('easy-share', 'easy-share-email-message', '', 'STRING'),
('easy-share', 'easy-share-email-subject', '', 'STRING'),
('easy-share', 'easy-share-fb-tag-lg', 'enable', 'STRING'),
('easy-share', 'easy-share-fb-tag-sm', 'enable', 'STRING'),
('easy-share', 'easy-share-gl-tag-lg', '', 'STRING'),
('easy-share', 'easy-share-gl-tag-sm', '', 'STRING'),
('easy-share', 'easy-share-lk-tag-lg', '', 'STRING'),
('easy-share', 'easy-share-lk-tag-sm', '', 'STRING'),
('easy-share', 'easy-share-pt-tag-lg', '', 'STRING'),
('easy-share', 'easy-share-pt-tag-sm', '', 'STRING'),
('easy-share', 'easy-share-scroll-to-show', '1500', 'STRING'),
('easy-share', 'easy-share-sp-tag-lg', '', 'STRING'),
('easy-share', 'easy-share-sp-tag-sm', '', 'STRING'),
('easy-share', 'easy-share-tm-tag-lg', '', 'STRING'),
('easy-share', 'easy-share-tm-tag-sm', '', 'STRING'),
('easy-share', 'easy-share-tw-tag-lg', 'enable', 'STRING'),
('easy-share', 'easy-share-tw-tag-sm', 'enable', 'STRING'),
('easy-share', 'easy-share-wt-tag-lg', '', 'STRING'),
('easy-share', 'easy-share-wt-tag-sm', '', 'STRING'),
('easy-share', 'es_lg_layout_options', 'right', 'STRING'),
('easy-share', 'es_sm_layout_options', 'right', 'STRING'),
('frclassifieds', 'bg_header', 'bg_header.jpg', 'STRING'),
('frclassifieds', 'bg_header_prefence', '', 'STRING'),
('frclassifieds', 'bg_header_scroll', 'fixed', 'STRING'),
('frclassifieds', 'bg_search', 'bg_search.jpg', 'STRING'),
('frclassifieds', 'bg_search_scroll', 'fixed', 'STRING'),
('frclassifieds', 'cc-avenue-enable', '', 'STRING'),
('frclassifieds', 'checkout-enable', '', 'STRING'),
('frclassifieds', 'copyright-info', '2016 © All Rights Reserved', 'STRING'),
('frclassifieds', 'copyright-link', '', 'STRING'),
('frclassifieds', 'copyright-link-text', '', 'STRING'),
('frclassifieds', 'css-animations', '', 'STRING'),
('frclassifieds', 'custom-css-style', '', 'STRING'),
('frclassifieds', 'defaultLocationShowAs', 'dropdown', 'STRING'),
('frclassifieds', 'defaultShowAs@all', '', 'STRING'),
('frclassifieds', 'dribble-link', '', 'STRING'),
('frclassifieds', 'facebook-link', '', 'STRING'),
('frclassifieds', 'favicon', 'favicon.jpg', 'STRING'),
('frclassifieds', 'flickr-link', '', 'STRING'),
('frclassifieds', 'footer-notify-activate', '', 'STRING'),
('frclassifieds', 'footer-notify-bg', '', 'STRING'),
('frclassifieds', 'footer-notify-bg-custom', '', 'STRING'),
('frclassifieds', 'footer-notify-content', '', 'STRING'),
('frclassifieds', 'google-analytics', '', 'STRING'),
('frclassifieds', 'google-fonts', '', 'STRING'),
('frclassifieds', 'google-plus-link', '', 'STRING'),
('frclassifieds', 'header-notify-activate', '', 'STRING'),
('frclassifieds', 'header-notify-bg', 'theme', 'STRING'),
('frclassifieds', 'header-notify-bg-custom', '', 'STRING'),
('frclassifieds', 'header-notify-content', 'header notification', 'STRING'),
('frclassifieds', 'help-line', '+(22)2-2222-222', 'STRING'),
('frclassifieds', 'hide-contact-link', '', 'STRING'),
('frclassifieds', 'hide-copyright-info', '', 'STRING'),
('frclassifieds', 'hide-help-line', '', 'STRING'),
('frclassifieds', 'home-page-center', '', 'STRING'),
('frclassifieds', 'home-page-sidebar', '', 'STRING'),
('frclassifieds', 'icon-1', 'px px-paper-bag', 'STRING'),
('frclassifieds', 'icon-2', 'px px-car', 'STRING'),
('frclassifieds', 'icon-3', 'px px-book', 'STRING'),
('frclassifieds', 'icon-4', 'px px-house', 'STRING'),
('frclassifieds', 'icon-5', 'px px-tools', 'STRING'),
('frclassifieds', 'icon-6', 'px px-mic', 'STRING'),
('frclassifieds', 'icon-7', 'px px-heart', 'STRING'),
('frclassifieds', 'icon-8', 'px px-briefcase', 'STRING'),
('frclassifieds', 'keyword_placeholder', 'ie. PHP Programmer', 'STRING'),
('frclassifieds', 'linkedin-link', '', 'STRING'),
('frclassifieds', 'load-content-on-scroll-activate', '', 'STRING'),
('frclassifieds', 'logo', 'logo.jpg', 'STRING'),
('frclassifieds', 'logo-preferences', 'logo', 'STRING'),
('frclassifieds', 'max_price', '1000', 'INTEGER'),
('frclassifieds', 'min_price', '0', 'INTEGER'),
('frclassifieds', 'money-bookers-enable', '', 'STRING'),
('frclassifieds', 'num-popular-ads', '10', 'STRING'),
('frclassifieds', 'num-related-ads', '10', 'STRING'),
('frclassifieds', 'on-exit-notify-activate', '', 'STRING'),
('frclassifieds', 'on-exit-notify-bg', '', 'STRING'),
('frclassifieds', 'on-exit-notify-bg-custom', '', 'STRING'),
('frclassifieds', 'on-exit-notify-content', '', 'STRING'),
('frclassifieds', 'on-exit-notify-footer', '', 'STRING'),
('frclassifieds', 'on-exit-notify-title', '', 'STRING'),
('frclassifieds', 'on-load-notify-activate', '', 'STRING'),
('frclassifieds', 'on-load-notify-bg', 'theme', 'STRING'),
('frclassifieds', 'on-load-notify-bg-custom', '', 'STRING'),
('frclassifieds', 'on-load-notify-content', 'this is a pop up', 'STRING'),
('frclassifieds', 'on-load-notify-footer', 'pop up footer', 'STRING'),
('frclassifieds', 'on-load-notify-title', 'pop up', 'STRING'),
('frclassifieds', 'paypal-enable', '', 'STRING'),
('frclassifieds', 'payza-enable', '', 'STRING'),
('frclassifieds', 'pinterest-link', '', 'STRING'),
('frclassifieds', 'premium_number', '10', 'STRING'),
('frclassifieds', 'scroll-top-activate', '', 'STRING'),
('frclassifieds', 'scrollTop-On-Page-load-activate', '', 'STRING'),
('frclassifieds', 'search-page-bottom', '', 'STRING'),
('frclassifieds', 'search-page-top', '', 'STRING'),
('frclassifieds', 'share-on-email', 'share', 'STRING'),
('frclassifieds', 'share-on-facebook', 'share', 'STRING'),
('frclassifieds', 'share-on-google-plus', 'share', 'STRING'),
('frclassifieds', 'share-on-linkedin', '', 'STRING'),
('frclassifieds', 'share-on-pinterest', 'share', 'STRING'),
('frclassifieds', 'share-on-stumbleupon', '', 'STRING'),
('frclassifieds', 'share-on-tumblr', '', 'STRING'),
('frclassifieds', 'share-on-twitter', 'share', 'STRING'),
('frclassifieds', 'share-with-friend', '', 'STRING'),
('frclassifieds', 'show-dribble-link', '', 'STRING'),
('frclassifieds', 'show-facebook-link', 'show', 'STRING'),
('frclassifieds', 'show-flickr-link', '', 'STRING'),
('frclassifieds', 'show-google-plus-link', '', 'STRING'),
('frclassifieds', 'show-linkedin-link', '', 'STRING'),
('frclassifieds', 'show-locations', 'activated', 'STRING'),
('frclassifieds', 'show-pinterest-link', '', 'STRING'),
('frclassifieds', 'show-rss-link', '', 'STRING'),
('frclassifieds', 'show-stumbleupon-link', '', 'STRING'),
('frclassifieds', 'show-tumblr-link', '', 'STRING'),
('frclassifieds', 'show-twitter-link', 'show', 'STRING'),
('frclassifieds', 'show-youtube-link', 'show', 'STRING'),
('frclassifieds', 'single-page-sidebar', '', 'STRING'),
('frclassifieds', 'smooth-scroll-activate', '', 'STRING'),
('frclassifieds', 'step_range', '500', 'INTEGER'),
('frclassifieds', 'stumbleupon-link', '', 'STRING'),
('frclassifieds', 'terms-link', '', 'STRING'),
('frclassifieds', 'terms-link-activate', '', 'STRING'),
('frclassifieds', 'theme-color', 'custom', 'STRING'),
('frclassifieds', 'theme-color-custom', '', 'STRING'),
('frclassifieds', 'theme_version', '107', 'INTEGER'),
('frclassifieds', 'tumblr-link', '', 'STRING'),
('frclassifieds', 'twitter-link', '', 'STRING'),
('frclassifieds', 'useful-information', 'bourou bourou', 'STRING'),
('frclassifieds', 'useful-information-activate', '', 'STRING'),
('frclassifieds', 'version', '1.0.7', 'STRING'),
('frclassifieds', 'webpay-enable', '', 'STRING'),
('frclassifieds', 'world-pay-enable', '', 'STRING'),
('frclassifieds', 'youtube-link', '', 'STRING'),
('gmaps_plus', 'gmaps_plus_full_screen_control', '0', 'STRING'),
('gmaps_plus', 'gmaps_plus_map_type_control', '0', 'STRING'),
('gmaps_plus', 'gmaps_plus_scale_control', '1', 'STRING'),
('gmaps_plus', 'gmaps_plus_street_view_control', '0', 'STRING'),
('gmaps_plus', 'gmaps_plus_zoom_control', '1', 'STRING'),
('gmaps_plus', 'include_maps_js', '1', 'STRING'),
('gmaps_plus', 'maps_key', 'AIzaSyBew9t49vwJ9uRibyNmEpLrt0yz8t6VC8', 'STRING'),
('google_maps', 'include_maps_js', '1', 'STRING'),
('google_maps', 'maps_key', 'AIzaSyDFYt2cTGPCtT_gLpalFBeHPLu8e_8W_y4', 'STRING'),
('masonry', 'favicon', 'favicon.jpg', 'STRING'),
('masonry', 'header-bg', 'header-bg.jpg', 'STRING'),
('masonry', 'header-message', '', 'STRING'),
('masonry', 'header-message-description', '', 'STRING'),
('masonry', 'logo', 'logo.jpg', 'STRING'),
('masonry', 'masonry-copyright-info', 'Copyright © 2017. Masonry: All rights reserved ', 'STRING'),
('masonry', 'masonry-db-prf-url', '', 'STRING'),
('masonry', 'masonry-fb-prf-url', '', 'STRING'),
('masonry', 'masonry-footer-sal', 'Developed by pixadrop', 'STRING'),
('masonry', 'masonry-fr-prf-url', '', 'STRING'),
('masonry', 'masonry-gl-prf-url', '', 'STRING'),
('masonry', 'masonry-keyword-placeholder', 'ie. PHP Programmer', 'STRING'),
('masonry', 'masonry-lk-prf-url', '', 'STRING'),
('masonry', 'masonry-location-show-as', 'normal', 'STRING'),
('masonry', 'masonry-logo-preferences', 'logo', 'STRING'),
('masonry', 'masonry-pt-prf-url', '', 'STRING'),
('masonry', 'masonry-tw-prf-url', '', 'STRING'),
('masonry', 'theme_version', '100', 'INTEGER'),
('masonry', 'version', '1.0.0', 'STRING'),
('modern_admin_theme', 'compact_mode', '0', 'STRING'),
('moreedit', 'disable_edit', '', 'BOOLEAN'),
('moreedit', 'max_ads_month', '0', 'INTEGER'),
('moreedit', 'max_ads_week', '0', 'INTEGER'),
('moreedit', 'moderate_all', '1', 'BOOLEAN'),
('moreedit', 'moderate_edit', '', 'BOOLEAN'),
('moreedit', 'notify_edit', '', 'BOOLEAN'),
('osclass', 'active_plugins', 'a:10:{i:13;s:29:\"simple_social_share/index.php\";i:15;s:27:\"responsive_slides/index.php\";i:17;s:20:\"easy-share/index.php\";i:19;s:21:\"google_maps/index.php\";i:21;s:17:\"welcome/index.php\";i:22;s:24:\"facebook_login/index.php\";i:26;s:18:\"moreedit/index.php\";i:30;s:16:\"voting/index.php\";i:31;s:26:\"preResize_images/index.php\";i:32;s:16:\"qrcode/index.php\";}', 'STRING'),
('osclass', 'admin_language', 'en_US', 'STRING'),
('osclass', 'admin_theme', 'modern', 'STRING'),
('osclass', 'akismetKey', '', 'STRING'),
('osclass', 'allowedExt', 'png,gif,jpg,jpeg', 'STRING'),
('osclass', 'allow_report_osclass', '0', 'BOOLEAN'),
('osclass', 'auto_cron', '1', 'STRING'),
('osclass', 'auto_update', 'disabled', 'STRING'),
('osclass', 'comments_per_page', '10', 'STRING'),
('osclass', 'contactEmail', 'info@ola.gr', 'STRING'),
('osclass', 'contact_attachment', '0', 'STRING'),
('osclass', 'csrf_name', 'CSRF1572579679', 'STRING'),
('osclass', 'currency', 'EUR', 'STRING'),
('osclass', 'dateFormat', 'd/m/Y', 'STRING'),
('osclass', 'defaultOrderField@search', 'dt_pub_date', 'STRING'),
('osclass', 'defaultOrderType@search', '1', 'BOOLEAN'),
('osclass', 'defaultResultsPerPage@search', '12', 'STRING'),
('osclass', 'defaultShowAs@search', 'list', 'STRING'),
('osclass', 'description_character_length', '5000', 'STRING'),
('osclass', 'dimNormal', '640x480', 'STRING'),
('osclass', 'dimPreview', '480x340', 'STRING'),
('osclass', 'dimThumbnail', '240x200', 'STRING'),
('osclass', 'enabled_comments', '1', 'STRING'),
('osclass', 'enabled_recaptcha_items', '0', 'STRING'),
('osclass', 'enabled_users', '1', 'STRING'),
('osclass', 'enabled_user_registration', '1', 'STRING'),
('osclass', 'enabled_user_validation', '1', 'STRING'),
('osclass', 'enableField#f_price@items', '1', 'STRING'),
('osclass', 'enableField#images@items', '1', 'STRING'),
('osclass', 'force_aspect_image', '0', 'STRING'),
('osclass', 'force_jpeg', '0', 'STRING'),
('osclass', 'installed_plugins', 'a:12:{i:0;s:21:\"google_maps/index.php\";i:15;s:29:\"simple_social_share/index.php\";i:16;s:18:\"moreedit/index.php\";i:17;s:27:\"responsive_slides/index.php\";i:19;s:20:\"easy-share/index.php\";i:23;s:17:\"welcome/index.php\";i:24;s:24:\"facebook_login/index.php\";i:25;s:24:\"google_connect/index.php\";i:26;s:22:\"subscription/index.php\";i:30;s:16:\"voting/index.php\";i:31;s:26:\"preResize_images/index.php\";i:32;s:16:\"qrcode/index.php\";}', 'STRING'),
('osclass', 'items_wait_time', '0', 'STRING'),
('osclass', 'item_attachment', '0', 'STRING'),
('osclass', 'keep_original_image', '1', 'STRING'),
('osclass', 'language', 'el_GR', 'STRING'),
('osclass', 'languages_downloaded', '[\"el_GR\",\"en_US\"]', 'STRING'),
('osclass', 'languages_last_version_check', '1526021504', 'STRING'),
('osclass', 'languages_to_update', '[]', 'STRING'),
('osclass', 'languages_update_count', '0', 'STRING'),
('osclass', 'last_version_check', '1525944277', 'STRING'),
('osclass', 'location_todo', '31', 'STRING'),
('osclass', 'logged_user_item_validation', '0', 'STRING'),
('osclass', 'mailserver_auth', '0', 'STRING'),
('osclass', 'mailserver_host', 'localhost', 'STRING'),
('osclass', 'mailserver_mail_from', '', 'STRING'),
('osclass', 'mailserver_name_from', '', 'STRING'),
('osclass', 'mailserver_password', '', 'STRING'),
('osclass', 'mailserver_pop', '0', 'STRING'),
('osclass', 'mailserver_port', '', 'STRING'),
('osclass', 'mailserver_ssl', '', 'STRING'),
('osclass', 'mailserver_type', 'custom', 'STRING'),
('osclass', 'mailserver_username', '', 'STRING'),
('osclass', 'marketAllowExternalSources', '0', 'STRING'),
('osclass', 'marketAPIConnect', 'opUuXn25KdqZllVAzsBpLeVzYRC0ROdB', 'STRING'),
('osclass', 'marketCategories', '{\"0\":{\"value\":\"135\",\"label\":\"Apps\",\"categories\":[]},\"languages\":{\"value\":\"98\",\"label\":\"Languages\",\"categories\":[]},\"themes\":{\"value\":\"96\",\"label\":\"Themes\",\"categories\":[{\"value\":\"102\",\"label\":\"General\",\"categories\":[]},{\"value\":\"100\",\"label\":\"Jobs\",\"categories\":[]},{\"value\":\"101\",\"label\":\"Real estate\",\"categories\":[]},{\"value\":\"99\",\"label\":\"Automotive\",\"categories\":[]}]},\"plugins\":{\"value\":\"97\",\"label\":\"Plugins\",\"categories\":[{\"value\":\"103\",\"label\":\"Ad management\",\"categories\":[]},{\"value\":\"132\",\"label\":\"Appearance\",\"categories\":[]},{\"value\":\"105\",\"label\":\"Analytics\",\"categories\":[]},{\"value\":\"130\",\"label\":\"Attributes\",\"categories\":[]},{\"value\":\"106\",\"label\":\"Counters\",\"categories\":[]},{\"value\":\"107\",\"label\":\"Cloud tools\",\"categories\":[]},{\"value\":\"108\",\"label\":\"Calendars\",\"categories\":[]},{\"value\":\"109\",\"label\":\"Customer support\",\"categories\":[]},{\"value\":\"110\",\"label\":\"DB tools\",\"categories\":[]},{\"value\":\"111\",\"label\":\"Date \\/ Time\",\"categories\":[]},{\"value\":\"112\",\"label\":\"E-mail\",\"categories\":[]},{\"value\":\"114\",\"label\":\"Image galleries \\/ sliders\",\"categories\":[]},{\"value\":\"115\",\"label\":\"Maps\",\"categories\":[]},{\"value\":\"116\",\"label\":\"Mobile\",\"categories\":[]},{\"value\":\"117\",\"label\":\"Messaging\",\"categories\":[]},{\"value\":\"131\",\"label\":\"Monetize\",\"categories\":[]},{\"value\":\"119\",\"label\":\"Reviews &amp; Ratings\",\"categories\":[]},{\"value\":\"134\",\"label\":\"Search tools\",\"categories\":[]},{\"value\":\"120\",\"label\":\"Site recommendation\",\"categories\":[]},{\"value\":\"121\",\"label\":\"User Management\",\"categories\":[]},{\"value\":\"122\",\"label\":\"Payments\",\"categories\":[]},{\"value\":\"124\",\"label\":\"Text processing \\/ WYSIWYG Editors\",\"categories\":[]},{\"value\":\"125\",\"label\":\"Video \\/ Audio\",\"categories\":[]},{\"value\":\"126\",\"label\":\"Social Networks\",\"categories\":[]},{\"value\":\"127\",\"label\":\"SEO\",\"categories\":[]},{\"value\":\"133\",\"label\":\"Security\",\"categories\":[]},{\"value\":\"128\",\"label\":\"Miscellaneous\",\"categories\":[]}]}}', 'STRING'),
('osclass', 'marketDataUpdate', '1524132309', 'STRING'),
('osclass', 'marketURL', 'https://market.osclass.org/api/v3/', 'STRING'),
('osclass', 'maxLatestItems@home', '12', 'STRING'),
('osclass', 'maxResultsPerPage@search', '50', 'INTEGER'),
('osclass', 'maxSizeKb', '2048', 'STRING'),
('osclass', 'moderate_comments', '5', 'STRING'),
('osclass', 'moderate_items', '-1', 'STRING'),
('osclass', 'mod_rewrite_loaded', '0', 'STRING'),
('osclass', 'notify_contact_friends', '1', 'STRING'),
('osclass', 'notify_contact_item', '1', 'STRING'),
('osclass', 'notify_new_comment', '1', 'STRING'),
('osclass', 'notify_new_comment_user', '1', 'STRING'),
('osclass', 'notify_new_item', '1', 'STRING'),
('osclass', 'notify_new_user', '1', 'STRING'),
('osclass', 'numImages@items', '4', 'STRING'),
('osclass', 'num_rss_items', '50', 'STRING'),
('osclass', 'osclass_installed', '1', 'BOOLEAN'),
('osclass', 'pageDesc', 'Τα πάντα για τη ...', 'STRING'),
('osclass', 'pageTitle', 'Όλα...', 'STRING'),
('osclass', 'ping_search_engines', '0', 'BOOLEAN'),
('osclass', 'plugins_downloaded', '[\"http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_maps\\/update.php\",\"more-edit\",\"pre-resize-images\",\"qrcode\",\"responsive-slides\",\"simple-social-share\",\"voting\",\"youtube\",\"http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_analytics\\/update.php\",\"seo-wiz\",\"tawkto\"]', 'STRING'),
('osclass', 'plugins_last_version_check', '1526021502', 'STRING'),
('osclass', 'plugins_to_update', '[]', 'STRING'),
('osclass', 'plugins_update_count', '0', 'STRING'),
('osclass', 'purge_latest_searches', '1000', 'STRING'),
('osclass', 'recaptchaPrivKey', '', 'STRING'),
('osclass', 'recaptchaPubKey', '', 'STRING'),
('osclass', 'recaptcha_version', '2', 'STRING'),
('osclass', 'reg_user_can_contact', '0', 'STRING'),
('osclass', 'reg_user_post', '1', 'STRING'),
('osclass', 'reg_user_post_comments', '1', 'STRING'),
('osclass', 'rewriteEnabled', '0', 'STRING'),
('osclass', 'rewrite_cat_url', '{CATEGORIES}', 'STRING'),
('osclass', 'rewrite_contact', 'contact', 'STRING'),
('osclass', 'rewrite_feed', 'feed', 'STRING'),
('osclass', 'rewrite_item_activate', 'item/activate', 'STRING'),
('osclass', 'rewrite_item_contact', 'item/contact', 'STRING'),
('osclass', 'rewrite_item_delete', 'item/delete', 'STRING'),
('osclass', 'rewrite_item_edit', 'item/edit', 'STRING'),
('osclass', 'rewrite_item_mark', 'item/mark', 'STRING'),
('osclass', 'rewrite_item_new', 'item/new', 'STRING'),
('osclass', 'rewrite_item_resource_delete', 'resource/delete', 'STRING'),
('osclass', 'rewrite_item_send_friend', 'item/send-friend', 'STRING'),
('osclass', 'rewrite_item_url', '{CATEGORIES}/{ITEM_TITLE}_i{ITEM_ID}', 'STRING'),
('osclass', 'rewrite_language', 'language', 'STRING'),
('osclass', 'rewrite_page_url', '{PAGE_SLUG}-p{PAGE_ID}', 'STRING'),
('osclass', 'rewrite_rules', 'a:42:{s:11:\"^contact/?$\";s:22:\"index.php?page=contact\";s:8:\"^feed/?$\";s:31:\"index.php?page=search&sFeed=rss\";s:13:\"^feed/(.+)/?$\";s:30:\"index.php?page=search&sFeed=$1\";s:18:\"^language/(.*?)/?$\";s:33:\"index.php?page=language&locale=$1\";s:8:\"^search$\";s:21:\"index.php?page=search\";s:13:\"^search/(.*)$\";s:32:\"index.php?page=search&sParams=$1\";s:28:\"^item/mark/(.*?)/([0-9]+)/?$\";s:43:\"index.php?page=item&action=mark&as=$1&id=$2\";s:29:\"^item/send-friend/([0-9]+)/?$\";s:44:\"index.php?page=item&action=send_friend&id=$1\";s:25:\"^item/contact/([0-9]+)/?$\";s:40:\"index.php?page=item&action=contact&id=$1\";s:12:\"^item/new/?$\";s:35:\"index.php?page=item&action=item_add\";s:21:\"^item/new/([0-9]+)/?$\";s:44:\"index.php?page=item&action=item_add&catId=$1\";s:32:\"^item/activate/([0-9]+)/(.*?)/?$\";s:51:\"index.php?page=item&action=activate&id=$1&secret=$2\";s:28:\"^item/edit/([0-9]+)/(.*?)/?$\";s:52:\"index.php?page=item&action=item_edit&id=$1&secret=$2\";s:30:\"^item/delete/([0-9]+)/(.*?)/?$\";s:54:\"index.php?page=item&action=item_delete&id=$1&secret=$2\";s:59:\"^resource/delete/([0-9]+)/([0-9]+)/([0-9A-Za-z]+)/?(.*?)/?$\";s:73:\"index.php?page=item&action=deleteResource&id=$1&item=$2&code=$3&secret=$4\";s:65:\"^([a-z]{2})_([A-Z]{2})/.*/.*_i([0-9]+)\\?comments-page=([0-9al]*)$\";s:53:\"index.php?page=item&id=$3&lang=$1_$2&comments-page=$4\";s:43:\"^.*/.*_i([0-9]+)\\?comments-page=([0-9al]*)$\";s:42:\"index.php?page=item&id=$1&comments-page=$2\";s:39:\"^([a-z]{2})_([A-Z]{2})/.*/.*_i([0-9]+)$\";s:36:\"index.php?page=item&id=$3&lang=$1_$2\";s:17:\"^.*/.*_i([0-9]+)$\";s:25:\"index.php?page=item&id=$1\";s:14:\"^user/login/?$\";s:20:\"index.php?page=login\";s:18:\"^user/dashboard/?$\";s:36:\"index.php?page=user&action=dashboard\";s:15:\"^user/logout/?$\";s:33:\"index.php?page=main&action=logout\";s:17:\"^user/register/?$\";s:39:\"index.php?page=register&action=register\";s:32:\"^user/activate/([0-9]+)/(.*?)/?$\";s:53:\"index.php?page=register&action=validate&id=$1&code=$2\";s:44:\"^alert/confirm/([0-9]+)/([a-zA-Z0-9]+)/(.+)$\";s:66:\"index.php?page=user&action=activate_alert&id=$1&email=$3&secret=$2\";s:16:\"^user/profile/?$\";s:34:\"index.php?page=user&action=profile\";s:25:\"^user/profile/([0-9]+)/?$\";s:44:\"index.php?page=user&action=pub_profile&id=$1\";s:21:\"^user/profile/(.+)/?$\";s:50:\"index.php?page=user&action=pub_profile&username=$1\";s:14:\"^user/items/?$\";s:32:\"index.php?page=user&action=items\";s:15:\"^user/alerts/?$\";s:33:\"index.php?page=user&action=alerts\";s:16:\"^user/recover/?$\";s:35:\"index.php?page=login&action=recover\";s:29:\"^user/forgot/([0-9]+)/(.*)/?$\";s:52:\"index.php?page=login&action=forgot&userId=$1&code=$2\";s:19:\"^password/change/?$\";s:42:\"index.php?page=user&action=change_password\";s:16:\"^email/change/?$\";s:39:\"index.php?page=user&action=change_email\";s:19:\"^username/change/?$\";s:42:\"index.php?page=user&action=change_username\";s:32:\"^email/confirm/([0-9]+)/(.*?)/?$\";s:65:\"index.php?page=user&action=change_email_confirm&userId=$1&code=$2\";s:33:\"^([\\p{L}\\p{N}_\\-,]+)-p([0-9]+)/?$\";s:33:\"index.php?page=page&id=$2&slug=$1\";s:55:\"^([a-z]{2})_([A-Z]{2})/([\\p{L}\\p{N}_\\-,]+)-p([0-9]+)/?$\";s:44:\"index.php?page=page&lang=$1_$2&id=$4&slug=$3\";s:16:\"^(.+?)\\.php(.*)$\";s:8:\"$1.php$2\";s:15:\"^(.+)/([0-9]+)$\";s:30:\"index.php?page=search&iPage=$2\";s:8:\"^(.+)/?$\";s:34:\"index.php?page=search&sCategory=$1\";s:6:\"^(.+)$\";s:21:\"index.php?page=search\";}', 'STRING'),
('osclass', 'rewrite_search_category', 'category', 'STRING'),
('osclass', 'rewrite_search_city', 'city', 'STRING'),
('osclass', 'rewrite_search_city_area', 'cityarea', 'STRING'),
('osclass', 'rewrite_search_country', 'country', 'STRING'),
('osclass', 'rewrite_search_pattern', 'pattern', 'STRING'),
('osclass', 'rewrite_search_region', 'region', 'STRING'),
('osclass', 'rewrite_search_url', 'search', 'STRING'),
('osclass', 'rewrite_search_user', 'user', 'STRING'),
('osclass', 'rewrite_user_activate', 'user/activate', 'STRING'),
('osclass', 'rewrite_user_activate_alert', 'alert/confirm', 'STRING'),
('osclass', 'rewrite_user_alerts', 'user/alerts', 'STRING'),
('osclass', 'rewrite_user_change_email', 'email/change', 'STRING'),
('osclass', 'rewrite_user_change_email_confirm', 'email/confirm', 'STRING'),
('osclass', 'rewrite_user_change_password', 'password/change', 'STRING'),
('osclass', 'rewrite_user_change_username', 'username/change', 'STRING'),
('osclass', 'rewrite_user_dashboard', 'user/dashboard', 'STRING'),
('osclass', 'rewrite_user_forgot', 'user/forgot', 'STRING'),
('osclass', 'rewrite_user_items', 'user/items', 'STRING'),
('osclass', 'rewrite_user_login', 'user/login', 'STRING'),
('osclass', 'rewrite_user_logout', 'user/logout', 'STRING'),
('osclass', 'rewrite_user_profile', 'user/profile', 'STRING'),
('osclass', 'rewrite_user_recover', 'user/recover', 'STRING'),
('osclass', 'rewrite_user_register', 'user/register', 'STRING'),
('osclass', 'save_latest_searches', '0', 'STRING'),
('osclass', 'selectable_parent_categories', '', 'STRING'),
('osclass', 'seo_url_search_prefix', '', 'STRING'),
('osclass', 'subdomain_host', '', 'STRING'),
('osclass', 'subdomain_type', '', 'STRING'),
('osclass', 'theme', 'osclasswizards', 'STRING'),
('osclass', 'themes_downloaded', '[\"bender\",\"osclasswizards-free-responsive-theme\"]', 'STRING'),
('osclass', 'themes_last_version_check', '1526021496', 'STRING'),
('osclass', 'themes_to_update', '[]', 'STRING'),
('osclass', 'themes_update_count', '0', 'STRING'),
('osclass', 'timeFormat', 'H:i', 'STRING'),
('osclass', 'timezone', 'Europe/Athens', 'STRING'),
('osclass', 'title_character_length', '100', 'STRING'),
('osclass', 'update_core_json', '', 'STRING'),
('osclass', 'username_blacklist', 'admin,user,kyr,mrkyr,demo,moderator', 'STRING'),
('osclass', 'use_imagick', '1', 'STRING'),
('osclass', 'version', '374', 'INTEGER'),
('osclass', 'warn_expiration', '0', 'STRING'),
('osclass', 'watermark_image', '', 'STRING'),
('osclass', 'watermark_place', 'centre', 'STRING'),
('osclass', 'watermark_text', '', 'STRING'),
('osclass', 'watermark_text_color', '', 'STRING'),
('osclass', 'weekStart', '1', 'STRING'),
('osclasswizards_theme', 'category_multiple_selects', '1', 'STRING'),
('osclasswizards_theme', 'custom_css', '# {\r\n  text-transform: none;\r\n}', 'STRING'),
('osclasswizards_theme', 'defaultShowAs@all', 'list', 'STRING'),
('osclasswizards_theme', 'description_minimum_length', '5', 'STRING'),
('osclasswizards_theme', 'facebook-height', '400', 'STRING'),
('osclasswizards_theme', 'facebook-hidecover', '', 'STRING'),
('osclasswizards_theme', 'facebook-showface', '', 'STRING'),
('osclasswizards_theme', 'facebook-showitem', '1', 'STRING'),
('osclasswizards_theme', 'facebook-showpost', '', 'STRING'),
('osclasswizards_theme', 'facebook-showsearch', '1', 'STRING'),
('osclasswizards_theme', 'facebook-url', 'https://www.facebook.com/Olaparos-1306528146101193', 'STRING'),
('osclasswizards_theme', 'facebook-width', '340', 'STRING'),
('osclasswizards_theme', 'google_fonts', 'Open+Sans', 'STRING'),
('osclasswizards_theme', 'header-728x90', '', 'STRING'),
('osclasswizards_theme', 'homeimage', 'homeimage.jpg', 'STRING'),
('osclasswizards_theme', 'homepage-728x90', '', 'STRING'),
('osclasswizards_theme', 'items_shown_map', '20', 'STRING'),
('osclasswizards_theme', 'keyword_placeholder', 'ψάξε ότι θές...', 'STRING'),
('osclasswizards_theme', 'locations_input_as', 'select', 'STRING'),
('osclasswizards_theme', 'locations_required', '0', 'STRING'),
('osclasswizards_theme', 'logo', 'logo.png', 'STRING'),
('osclasswizards_theme', 'popular_cities_limit', '10', 'STRING'),
('osclasswizards_theme', 'popular_regions_limit', '10', 'STRING'),
('osclasswizards_theme', 'popular_searches_limit', '10', 'STRING'),
('osclasswizards_theme', 'premium_listings_shown', '10', 'STRING'),
('osclasswizards_theme', 'premium_listings_shown_home', '10', 'STRING'),
('osclasswizards_theme', 'rtl_view', '0', 'STRING'),
('osclasswizards_theme', 'search-results-middle-728x90', '', 'STRING'),
('osclasswizards_theme', 'search-results-top-728x90', '', 'STRING'),
('osclasswizards_theme', 'show_banner', '1', 'STRING'),
('osclasswizards_theme', 'show_popular', '', 'STRING'),
('osclasswizards_theme', 'show_popular_cities', '', 'STRING'),
('osclasswizards_theme', 'show_popular_regions', '', 'STRING'),
('osclasswizards_theme', 'show_popular_searches', '', 'STRING'),
('osclasswizards_theme', 'show_search_country', '0', 'STRING'),
('osclasswizards_theme', 'sidebar-300x250', '', 'STRING'),
('osclasswizards_theme', 'sub_cat_limit', '4', 'STRING'),
('osclasswizards_theme', 'theme_color', '#77c04b', 'STRING'),
('osclasswizards_theme', 'theme_color_mode', 'vivid-red', 'STRING'),
('osclasswizards_theme', 'title_minimum_length', '3', 'STRING'),
('osclasswizards_theme', 'version', '2.0.4', 'STRING'),
('osclasswizards_theme', 'welcome_message', 'Τα πάντα όλα για...', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-1', 'tags', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-102', 'soccer-ball-o', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-103', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-104', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-105', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-106', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-107', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-109', 'cutlery', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-111', 'cutlery', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-113', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-114', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-115', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-119', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-120', 'building', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-121', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-122', 'user', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-123', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-124', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-125', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-126', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-127', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-128', 'building', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-129', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-130', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-131', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-132', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-133', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-134', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-135', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-136', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-137', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-138', 'music', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-139', 'hotel', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-140', 'cutlery', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-141', 'cutlery', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-142', 'cutlery', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-143', 'birthday-cake', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-144', 'coffee', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-145', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-146', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-2', 'CAR', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-26', 'car', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-27', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-28', 'ship', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-3', 'BULLHORN', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-31', 'CAR', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-33', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-34', 'ship', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-37', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-38', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-39', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-4', 'HOME', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-40', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-41', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-42', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-44', 'home', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-45', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-49', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-5', 'WRENCH', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-50', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-52', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-55', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-56', 'female', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-58', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-59', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-6', 'USERS', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-61', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-62', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-63', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-64', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-65', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-66', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-67', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-68', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-69', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-7', 'HEART', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-70', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-71', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-72', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-73', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-74', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-75', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-76', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-78', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-8', 'user', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-82', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-93', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'first_load_cat_icons', 'loaded', 'STRING'),
('payment_mode', 'subcription_payment_mode', 'offline_payment', 'STRING'),
('plugin-facebook_login', 'app_id', '', 'STRING'),
('plugin-facebook_login', 'app_secret', '', 'STRING'),
('plugin-facebook_login', 'support', '0', 'INTEGER'),
('plugin-gc', 'gc_auto_prompt', '1', 'INTEGER'),
('plugin-gc', 'gc_button_type', '0', 'INTEGER'),
('plugin-gc', 'gc_client_id', '', 'STRING'),
('plugin-gc', 'gc_client_secret', '', 'STRING'),
('plugin-gc', 'gc_developer_key', '', 'STRING'),
('plugin-gc', 'gc_support', '1', 'INTEGER'),
('plugin-welcome', 'dev_mode', '0', 'INTEGER'),
('plugin-welcome', 'enabled', '0', 'INTEGER'),
('plugin-welcome', 'html1', '<img src=\"/oc-content/plugins/welcome/img/celebrate.png\"/>', 'STRING'),
('plugin-welcome', 'html2', 'Enjoy discounts now!', 'STRING'),
('plugin-welcome', 'html3', 'We have prepared better promotions for you. Highlight and republish your listings easily.', 'STRING'),
('plugin-welcome', 'html4', 'Recently our classifieds were redeveloped and as result we brought to you easy listing share, highlights, premiums, moving to top and credit packs as well. Enjoy these benefits and sell your items much faster than before.', 'STRING'),
('plugin-welcome', 'html5', '<a href=\"https://osclasspoint.com\">Discover OsclassPoint Market</a>', 'STRING'),
('plugin-welcome', 'support', '0', 'INTEGER'),
('plugin-welcome', 'user_type', '0', 'INTEGER'),
('plugin-welcome', 'version', '1', 'INTEGER'),
('preResize_images', 'maxPixels', '1280', 'INTEGER'),
('qrcode', 'code_size', '2', 'INTEGER'),
('qrcode', 'upload_path', '/srv/http/ola/oc-content/uploads/qrcode/', 'STRING'),
('qrcode', 'upload_url', 'http://designisdesign.eu/ola/oc-content/uploads/qrcode/', 'STRING'),
('responsive_slides', 'auto', '1', 'BOOLEAN'),
('responsive_slides', 'backgroundcolor', '#FFFFFF', 'STRING'),
('responsive_slides', 'bordercolor', '#FFFFFF', 'STRING'),
('responsive_slides', 'borderwidth', '0', 'STRING'),
('responsive_slides', 'caption', '0', 'BOOLEAN'),
('responsive_slides', 'description', '1', 'BOOLEAN'),
('responsive_slides', 'height', '180', 'STRING'),
('responsive_slides', 'link', '1', 'BOOLEAN'),
('responsive_slides', 'navigation', '0', 'BOOLEAN'),
('responsive_slides', 'openin', '1', 'BOOLEAN'),
('responsive_slides', 'pager', '0', 'BOOLEAN'),
('responsive_slides', 'shadowcolor', '#FFFFFF', 'STRING'),
('responsive_slides', 'speed', '500', 'STRING'),
('responsive_slides', 'width', '0', 'STRING'),
('symnel_theme', 'browseAllCategories_txt', '(Browse All Categories) Go to...', 'STRING'),
('symnel_theme', 'commentForm_bodyrequired', 'Ooops, please write a comment', 'STRING'),
('symnel_theme', 'commonForm_categoryrequired', 'Please choose category', 'STRING'),
('symnel_theme', 'commonForm_emailrequired', 'Email is required', 'STRING'),
('symnel_theme', 'commonForm_emailvalid', 'Please enter a valid email', 'STRING'),
('symnel_theme', 'commonForm_loginregisteredemail', 'Please enter your registered email', 'STRING'),
('symnel_theme', 'commonForm_loginvalidemail', 'Please enter your valid registered email', 'STRING'),
('symnel_theme', 'commonForm_msgminlength', 'Oh, that is too short!', 'STRING'),
('symnel_theme', 'commonForm_msgrequired', 'Ooops, what is your message?', 'STRING'),
('symnel_theme', 'commonForm_namelettersonly', 'No numbers or special symbols', 'STRING'),
('symnel_theme', 'commonForm_namerequired', 'Please enter your name', 'STRING'),
('symnel_theme', 'commonForm_passwordnew', 'Please enter your new password', 'STRING'),
('symnel_theme', 'commonForm_passwordnew2equalto', 'Please match with your new password', 'STRING'),
('symnel_theme', 'commonForm_passwordnew2required', 'Please confirm your new password', 'STRING'),
('symnel_theme', 'commonForm_passwordrequired', 'Please enter your password', 'STRING'),
('symnel_theme', 'commonForm_pricepriceonly', 'Only number is accepted', 'STRING'),
('symnel_theme', 'commonForm_pricerequired', 'Please specify item price', 'STRING'),
('symnel_theme', 'commonForm_setpassword', 'Please set your password', 'STRING'),
('symnel_theme', 'commonForm_setpassword2equalto', 'Please match with your password', 'STRING'),
('symnel_theme', 'commonForm_setpassword2required', 'Please confirm your password', 'STRING'),
('symnel_theme', 'keyword_placeholder', 'What are you looking for?', 'STRING'),
('symnel_theme', 'nextLink_txtgallery', 'Next &rsaquo;', 'STRING'),
('symnel_theme', 'nextPhoto_txtgallery', 'Next Photo &rsaquo;', 'STRING'),
('symnel_theme', 'pauseSlideShow_txtgallery', 'Pause Slideshow', 'STRING'),
('symnel_theme', 'playSlideShow_txtgallery', 'Play Slideshow', 'STRING'),
('symnel_theme', 'prevLink_txtgallery', '&lsaquo; Prev', 'STRING'),
('symnel_theme', 'prevPhoto_txtgallery', '&lsaquo; Prev Photo', 'STRING'),
('symnel_theme', 'reportForm_issue', 'Please select an issue type', 'STRING'),
('symnel_theme', 'searchRequiredKeyword_txt', 'Please type a keyword', 'STRING'),
('telephone', 'hide_digits', '0', 'STRING'),
('udhauli', 'category_multiple_selects', '0', 'STRING'),
('udhauli', 'contact_email', '', 'STRING'),
('udhauli', 'contact_numbr', '', 'STRING'),
('udhauli', 'defaultLocationShowAs', 'dropdown', 'STRING'),
('udhauli', 'defaultShowAs@all', 'gallery', 'STRING'),
('udhauli', 'defaultShowAs@home', 'banner', 'STRING'),
('udhauli', 'description_minimum_length', '3', 'STRING'),
('udhauli', 'donation', '0', 'STRING'),
('udhauli', 'footer_link', '1', 'STRING'),
('udhauli', 'footer_message', '', 'STRING'),
('udhauli', 'homeimage', 'homeimage.jpg', 'STRING'),
('udhauli', 'keyword_placeholder', 'ie. PHP Programmer', 'STRING'),
('udhauli', 'locations_input_as', 'text', 'STRING'),
('udhauli', 'locations_required', '0', 'STRING'),
('udhauli', 'logo', 'logo.jpg', 'STRING'),
('udhauli', 'popular_cities_limit', '10', 'STRING'),
('udhauli', 'popular_regions_limit', '10', 'STRING'),
('udhauli', 'popular_searches_limit', '10', 'STRING'),
('udhauli', 'premium_listings_shown', '6', 'STRING'),
('udhauli', 'premium_listings_shown_home', '10', 'STRING'),
('udhauli', 'rtl_view', '0', 'STRING'),
('udhauli', 'show_popular', '1', 'STRING'),
('udhauli', 'show_popular_cities', '', 'STRING'),
('udhauli', 'show_popular_regions', '', 'STRING'),
('udhauli', 'show_popular_searches', '1', 'STRING'),
('udhauli', 'show_search_country', '0', 'STRING'),
('udhauli', 'social', 'a:6:{s:8:\"facebook\";s:1:\"#\";s:7:\"twitter\";s:1:\"#\";s:9:\"instagram\";s:1:\"#\";s:8:\"linkedin\";s:1:\"#\";s:6:\"google\";s:1:\"#\";s:7:\"youtube\";s:1:\"#\";}', 'STRING'),
('udhauli', 'sub_cat_limit', '5', 'STRING'),
('udhauli', 'title_minimum_length', '1', 'STRING'),
('udhauli', 'to_the_top', '0', 'STRING'),
('udhauli', 'version', '100', 'STRING'),
('voting', 'item_voting', '1', 'BOOLEAN'),
('voting', 'open', '0', 'BOOLEAN'),
('voting', 'user', '1', 'BOOLEAN'),
('voting', 'user_voting', '0', 'BOOLEAN');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_region`
--

CREATE TABLE `oc_t_region` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_region`
--

INSERT INTO `oc_t_region` (`pk_i_id`, `fk_c_country_code`, `s_name`, `s_slug`, `b_active`) VALUES
(782719, 'gr', 'Νομός Κυκλάδων', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%cf%85%ce%ba%ce%bb%ce%a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_region_stats`
--

CREATE TABLE `oc_t_region_stats` (
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_region_stats`
--

INSERT INTO `oc_t_region_stats` (`fk_i_region_id`, `i_num_items`) VALUES
(782719, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_rslides`
--

CREATE TABLE `oc_t_rslides` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniqname` varchar(100) NOT NULL,
  `imagename` varchar(100) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `description` varchar(600) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_rslides`
--

INSERT INTO `oc_t_rslides` (`id`, `uniqname`, `imagename`, `caption`, `description`, `link`) VALUES
(3, '5af1c0e86ac11.jpg', '5ace55ba441bb.jpg', '', '', ''),
(4, '5af1c0f2b201a.jpg', '5ace55c367b59.jpg', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user`
--

CREATE TABLE `oc_t_user` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `dt_reg_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(100) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `s_email` varchar(100) NOT NULL,
  `s_website` varchar(100) DEFAULT NULL,
  `s_phone_land` varchar(45) DEFAULT NULL,
  `s_phone_mobile` varchar(45) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `s_pass_code` varchar(100) DEFAULT NULL,
  `s_pass_date` datetime DEFAULT NULL,
  `s_pass_ip` varchar(15) DEFAULT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) UNSIGNED DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  `b_company` tinyint(1) NOT NULL DEFAULT '0',
  `i_items` int(10) UNSIGNED DEFAULT '0',
  `i_comments` int(10) UNSIGNED DEFAULT '0',
  `dt_access_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `s_access_ip` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user_description`
--

CREATE TABLE `oc_t_user_description` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user_email_tmp`
--

CREATE TABLE `oc_t_user_email_tmp` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `s_new_email` varchar(100) NOT NULL,
  `dt_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_voting_item`
--

CREATE TABLE `oc_t_voting_item` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `i_vote` int(10) UNSIGNED NOT NULL,
  `s_hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_voting_user`
--

CREATE TABLE `oc_t_voting_user` (
  `i_user_voted` int(10) UNSIGNED NOT NULL,
  `i_user_voter` int(10) UNSIGNED NOT NULL,
  `i_vote` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_widget`
--

CREATE TABLE `oc_t_widget` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_description` varchar(40) NOT NULL,
  `s_location` varchar(40) NOT NULL,
  `e_kind` enum('TEXT','HTML') NOT NULL,
  `s_content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_username` (`s_username`),
  ADD UNIQUE KEY `s_email` (`s_email`);

--
-- Indexes for table `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_alerts_sent`
--
ALTER TABLE `oc_t_alerts_sent`
  ADD PRIMARY KEY (`d_date`);

--
-- Indexes for table `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_parent_id` (`fk_i_parent_id`),
  ADD KEY `i_position` (`i_position`);

--
-- Indexes for table `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_c_locale_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD PRIMARY KEY (`fk_i_category_id`);

--
-- Indexes for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`);

--
-- Indexes for table `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Indexes for table `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD PRIMARY KEY (`fk_i_city_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_country`
--
ALTER TABLE `oc_t_country`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Indexes for table `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD PRIMARY KEY (`fk_c_country_code`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_currency`
--
ALTER TABLE `oc_t_currency`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_name` (`s_name`);

--
-- Indexes for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`),
  ADD KEY `idx_b_premium` (`b_premium`),
  ADD KEY `idx_s_contact_email` (`s_contact_email`(10)),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_c_currency_code` (`fk_c_currency_code`),
  ADD KEY `idx_pub_date` (`dt_pub_date`),
  ADD KEY `idx_price` (`i_price`);

--
-- Indexes for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`);

--
-- Indexes for table `oc_t_item_description`
--
ALTER TABLE `oc_t_item_description`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_c_locale_code`);
ALTER TABLE `oc_t_item_description` ADD FULLTEXT KEY `s_description` (`s_description`,`s_title`);

--
-- Indexes for table `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD PRIMARY KEY (`fk_i_item_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Indexes for table `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_i_field_id`,`s_multi`),
  ADD KEY `s_value` (`s_value`(255)),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Indexes for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `idx_s_content_type` (`pk_i_id`,`s_content_type`(10));

--
-- Indexes for table `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  ADD KEY `dt_date_fk_i_item_id` (`dt_date`,`fk_i_item_id`);

--
-- Indexes for table `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD PRIMARY KEY (`s_md5`,`fk_c_locale_code`),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_locale`
--
ALTER TABLE `oc_t_locale`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_short_name` (`s_short_name`);

--
-- Indexes for table `oc_t_locations_tmp`
--
ALTER TABLE `oc_t_locations_tmp`
  ADD PRIMARY KEY (`id_location`,`e_type`);

--
-- Indexes for table `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_i_field_id`),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Indexes for table `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD PRIMARY KEY (`fk_i_pages_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD KEY `fk_i_category_id` (`fk_i_category_id`);

--
-- Indexes for table `oc_t_preference`
--
ALTER TABLE `oc_t_preference`
  ADD UNIQUE KEY `s_section` (`s_section`,`s_name`);

--
-- Indexes for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_slug` (`s_slug`);

--
-- Indexes for table `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD PRIMARY KEY (`fk_i_region_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_rslides`
--
ALTER TABLE `oc_t_rslides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_email` (`s_email`),
  ADD KEY `idx_s_name` (`s_name`(6)),
  ADD KEY `idx_s_username` (`s_username`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Indexes for table `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD PRIMARY KEY (`fk_i_user_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD PRIMARY KEY (`fk_i_user_id`);

--
-- Indexes for table `oc_t_voting_item`
--
ALTER TABLE `oc_t_voting_item`
  ADD KEY `fk_i_item_id` (`fk_i_item_id`);

--
-- Indexes for table `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=510636;

--
-- AUTO_INCREMENT for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=782761;

--
-- AUTO_INCREMENT for table `oc_t_rslides`
--
ALTER TABLE `oc_t_rslides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD CONSTRAINT `oc_t_category_ibfk_1` FOREIGN KEY (`fk_i_parent_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD CONSTRAINT `oc_t_category_description_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_category_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD CONSTRAINT `oc_t_category_stats_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD CONSTRAINT `oc_t_city_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_city_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD CONSTRAINT `oc_t_city_area_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Constraints for table `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD CONSTRAINT `oc_t_city_stats_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Constraints for table `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD CONSTRAINT `oc_t_country_stats_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD CONSTRAINT `oc_t_item_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_2` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_3` FOREIGN KEY (`fk_c_currency_code`) REFERENCES `oc_t_currency` (`pk_c_code`);

--
-- Constraints for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD CONSTRAINT `oc_t_item_comment_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_comment_ibfk_2` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD CONSTRAINT `oc_t_item_location_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_3` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_4` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_5` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD CONSTRAINT `oc_t_item_meta_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_meta_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD CONSTRAINT `oc_t_item_resource_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD CONSTRAINT `oc_t_item_stats_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD CONSTRAINT `oc_t_keywords_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_2` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_3` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Constraints for table `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD CONSTRAINT `oc_t_pages_description_ibfk_1` FOREIGN KEY (`fk_i_pages_id`) REFERENCES `oc_t_pages` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_pages_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD CONSTRAINT `oc_t_plugin_category_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD CONSTRAINT `oc_t_region_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD CONSTRAINT `oc_t_region_stats_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`);

--
-- Constraints for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD CONSTRAINT `oc_t_user_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_user_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_3` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_4` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Constraints for table `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD CONSTRAINT `oc_t_user_description_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD CONSTRAINT `oc_t_user_email_tmp_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

--
-- Constraints for table `oc_t_voting_item`
--
ALTER TABLE `oc_t_voting_item`
  ADD CONSTRAINT `oc_t_voting_item_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
