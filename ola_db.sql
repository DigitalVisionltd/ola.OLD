-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2018 at 09:46 PM
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
-- Database: `ola_3`
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
(1, 'Administrator', 'admin', '$2y$15$ga3a7gAr31ytLYnUkxmi1uSKlIx58noyvoFplofbf4iOEPw70ERiC', 'admin@ola.gr', NULL, 0),
(2, 'Moderator', 'mod', '$2y$15$l81W28abDSYfsWL6uXjcv.zj57Cq7esMtxJ3EhyYa4.df8LKm/O/m', 'support@ola.gr', NULL, 1);

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
(509531, 782699, 'Μαρούσι', '%ce%9c%ce%b1%cf%81%ce%bf%cf%8d%cf%83%ce%b9', 'gr', 1),
(509532, 782699, 'Κηφισιά', '%ce%9a%ce%b7%cf%86%ce%b9%cf%83%ce%b9%ce%ac', 'gr', 1),
(509533, 782699, 'Σταμάτα', '%ce%a3%cf%84%ce%b1%ce%bc%ce%ac%cf%84%ce%b1', 'gr', 1),
(509534, 782699, 'Άγιος Στέφανος', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%a3%cf%84%ce%ad%cf%86%ce%b', 'gr', 1),
(509535, 782699, 'Κρυονέρι', '%ce%9a%cf%81%cf%85%ce%bf%ce%bd%ce%ad%cf%81%ce%b9', 'gr', 1),
(509536, 782699, 'Ροδόπολη', '%ce%a1%ce%bf%ce%b4%cf%8c%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(509537, 782699, 'Άνοιξη', '%ce%86%ce%bd%ce%bf%ce%b9%ce%be%ce%b7', 'gr', 1),
(509538, 782699, 'Νέα Ερυθραία', '%ce%9d%ce%ad%ce%b1-%ce%95%cf%81%cf%85%ce%b8%cf%81%ce%b1%ce%a', 'gr', 1),
(509539, 782699, 'Λυκόβρυση', '%ce%9b%cf%85%ce%ba%cf%8c%ce%b2%cf%81%cf%85%cf%83%ce%b7', 'gr', 1),
(509540, 782699, 'Ηράκλειο', '%ce%97%cf%81%ce%ac%ce%ba%ce%bb%ce%b5%ce%b9%ce%bf', 'gr', 1),
(509541, 782699, 'Φιλοθέη', '%ce%a6%ce%b9%ce%bb%ce%bf%ce%b8%ce%ad%ce%b7', 'gr', 1),
(509542, 782699, 'Νέο Ψυχικό', '%ce%9d%ce%ad%ce%bf-%ce%a8%cf%85%cf%87%ce%b9%ce%ba%cf%8c', 'gr', 1),
(509543, 782699, 'Χαλάνδρι', '%ce%a7%ce%b1%ce%bb%ce%ac%ce%bd%ce%b4%cf%81%ce%b9', 'gr', 1),
(509544, 782699, 'Παλαιό Ψυχικό', '%ce%a0%ce%b1%ce%bb%ce%b1%ce%b9%cf%8c-%ce%a8%cf%85%cf%87%ce%b', 'gr', 1),
(509545, 782699, 'Παπάγου', '%ce%a0%ce%b1%cf%80%ce%ac%ce%b3%ce%bf%cf%85', 'gr', 1),
(509546, 782699, 'Χολαργός', '%ce%a7%ce%bf%ce%bb%ce%b1%cf%81%ce%b3%cf%8c%cf%82', 'gr', 1),
(509547, 782699, 'Αγία Παρασκευή', '%ce%91%ce%b3%ce%af%ce%b1-%ce%a0%ce%b1%cf%81%ce%b1%cf%83%ce%b', 'gr', 1),
(509548, 782699, 'Βριλλήσια', '%ce%92%cf%81%ce%b9%ce%bb%ce%bb%ce%ae%cf%83%ce%b9%ce%b1', 'gr', 1),
(509549, 782699, 'Πεντέλη', '%ce%a0%ce%b5%ce%bd%cf%84%ce%ad%ce%bb%ce%b7', 'gr', 1),
(509550, 782699, 'Νέα Πεντέλη', '%ce%9d%ce%ad%ce%b1-%ce%a0%ce%b5%ce%bd%cf%84%ce%ad%ce%bb%ce%b', 'gr', 1),
(509551, 782699, 'Διόνυσος', '%ce%94%ce%b9%cf%8c%ce%bd%cf%85%cf%83%ce%bf%cf%82', 'gr', 1),
(509552, 782699, 'Δροσιά', '%ce%94%cf%81%ce%bf%cf%83%ce%b9%ce%ac', 'gr', 1),
(509553, 782699, 'Μελίσσια', '%ce%9c%ce%b5%ce%bb%ce%af%cf%83%cf%83%ce%b9%ce%b1', 'gr', 1),
(509554, 782699, 'Εκάλη', '%ce%95%ce%ba%ce%ac%ce%bb%ce%b7', 'gr', 1),
(509555, 782699, 'Πεύκη', '%ce%a0%ce%b5%cf%8d%ce%ba%ce%b7', 'gr', 1),
(509556, 782699, 'Γέρακας', '%ce%93%ce%ad%cf%81%ce%b1%ce%ba%ce%b1%cf%82', 'gr', 1),
(509557, 782700, 'Κυψέλη', '%ce%9a%cf%85%cf%88%ce%ad%ce%bb%ce%b7', 'gr', 1),
(509558, 782700, 'Γουδή', '%ce%93%ce%bf%cf%85%ce%b4%ce%ae', 'gr', 1),
(509559, 782700, 'Ιλίσια', '%ce%99%ce%bb%ce%af%cf%83%ce%b9%ce%b1', 'gr', 1),
(509560, 782700, 'Λ.Πατησίων - Λ. Αχαρνών', '%ce%9b-%ce%a0%ce%b1%cf%84%ce%b7%cf%83%ce%af%cf%89%ce%bd-%ce%', 'gr', 1),
(509561, 782700, 'Νέος Κόσμος', '%ce%9d%ce%ad%ce%bf%cf%82-%ce%9a%cf%8c%cf%83%ce%bc%ce%bf%cf%8', 'gr', 1),
(509562, 782700, 'Πατήσια', '%ce%a0%ce%b1%cf%84%ce%ae%cf%83%ce%b9%ce%b1', 'gr', 1),
(509563, 782700, 'Πετράλωνα', '%ce%a0%ce%b5%cf%84%cf%81%ce%ac%ce%bb%cf%89%ce%bd%ce%b1', 'gr', 1),
(509564, 782700, 'Κέντρο', '%ce%9a%ce%ad%ce%bd%cf%84%cf%81%ce%bf', 'gr', 1),
(509565, 782700, 'Αγ. Ελευθέριος-Προμπονά-Ριζούπολη', '%ce%91%ce%b3-%ce%95%ce%bb%ce%b5%cf%85%ce%b8%ce%ad%cf%81%ce%b', 'gr', 1),
(509566, 782700, 'Αμπελόκηποι - Πεντάγωνο', '%ce%91%ce%bc%cf%80%ce%b5%ce%bb%cf%8c%ce%ba%ce%b7%cf%80%ce%bf', 'gr', 1),
(509567, 782700, 'Άνω Πατήσια', '%ce%86%ce%bd%cf%89-%ce%a0%ce%b1%cf%84%ce%ae%cf%83%ce%b9%ce%b', 'gr', 1),
(509568, 782700, 'Αττική', '%ce%91%cf%84%cf%84%ce%b9%ce%ba%ce%ae', 'gr', 1),
(509569, 782700, 'Γκάζι-Μεταξουργείο-Βοτανικός', '%ce%93%ce%ba%ce%ac%ce%b6%ce%b9-%ce%9c%ce%b5%cf%84%ce%b1%ce%b', 'gr', 1),
(509570, 782700, 'Γκύζη - Πεδίο Άρεως', '%ce%93%ce%ba%cf%8d%ce%b6%ce%b7-%ce%a0%ce%b5%ce%b4%ce%af%ce%b', 'gr', 1),
(509571, 782700, 'Εξάρχεια - Νεάπολη', '%ce%95%ce%be%ce%ac%cf%81%cf%87%ce%b5%ce%b9%ce%b1-%ce%9d%ce%b', 'gr', 1),
(509572, 782700, 'Ιστορικό Κέντρο', '%ce%99%cf%83%cf%84%ce%bf%cf%81%ce%b9%ce%ba%cf%8c-%ce%9a%ce%a', 'gr', 1),
(509573, 782700, 'Κολωνάκι - Λυκαβηττός', '%ce%9a%ce%bf%ce%bb%cf%89%ce%bd%ce%ac%ce%ba%ce%b9-%ce%9b%cf%8', 'gr', 1),
(509574, 782700, 'Κολωνός - Κολοκυνθούς', '%ce%9a%ce%bf%ce%bb%cf%89%ce%bd%cf%8c%cf%82-%ce%9a%ce%bf%ce%b', 'gr', 1),
(509575, 782700, 'Κουκάκι - Μακρυγιάννη', '%ce%9a%ce%bf%cf%85%ce%ba%ce%ac%ce%ba%ce%b9-%ce%9c%ce%b1%ce%b', 'gr', 1),
(509576, 782700, 'Παγκράτι', '%ce%a0%ce%b1%ce%b3%ce%ba%cf%81%ce%ac%cf%84%ce%b9', 'gr', 1),
(509577, 782700, 'Μέτς - Καλλιμάρμαρο', '%ce%9c%ce%ad%cf%84%cf%82-%ce%9a%ce%b1%ce%bb%ce%bb%ce%b9%ce%b', 'gr', 1),
(509578, 782700, 'Πολύγωνο - Τουρκοβούνια', '%ce%a0%ce%bf%ce%bb%cf%8d%ce%b3%cf%89%ce%bd%ce%bf-%ce%a4%ce%b', 'gr', 1),
(509579, 782700, 'Σεπόλια - Σκουζέ', '%ce%a3%ce%b5%cf%80%cf%8c%ce%bb%ce%b9%ce%b1-%ce%a3%ce%ba%ce%b', 'gr', 1),
(509580, 782701, 'Ναύπλιο', '%ce%9d%ce%b1%cf%8d%cf%80%ce%bb%ce%b9%ce%bf', 'gr', 1),
(509581, 782701, 'Μυκήνες', '%ce%9c%cf%85%ce%ba%ce%ae%ce%bd%ce%b5%cf%82', 'gr', 1),
(509582, 782701, 'Αλέα', '%ce%91%ce%bb%ce%ad%ce%b1', 'gr', 1),
(509583, 782701, 'Ασίνη', '%ce%91%cf%83%ce%af%ce%bd%ce%b7', 'gr', 1),
(509584, 782701, 'Αχλαδόκαμπος', '%ce%91%cf%87%ce%bb%ce%b1%ce%b4%cf%8c%ce%ba%ce%b1%ce%bc%cf%80', 'gr', 1),
(509585, 782701, 'Ερμιόνη', '%ce%95%cf%81%ce%bc%ce%b9%cf%8c%ce%bd%ce%b7', 'gr', 1),
(509586, 782701, 'Κρανίδι', '%ce%9a%cf%81%ce%b1%ce%bd%ce%af%ce%b4%ce%b9', 'gr', 1),
(509587, 782701, 'Λύρκεια', '%ce%9b%cf%8d%cf%81%ce%ba%ce%b5%ce%b9%ce%b1', 'gr', 1),
(509588, 782701, 'Νέα Κίος', '%ce%9d%ce%ad%ce%b1-%ce%9a%ce%af%ce%bf%cf%82', 'gr', 1),
(509589, 782701, 'Ασκληπιείο', '%ce%91%cf%83%ce%ba%ce%bb%ce%b7%cf%80%ce%b9%ce%b5%ce%af%ce%bf', 'gr', 1),
(509590, 782701, 'Επίδαυρος', '%ce%95%cf%80%ce%af%ce%b4%ce%b1%cf%85%cf%81%ce%bf%cf%82', 'gr', 1),
(509591, 782701, 'Κουτσοπόδι', '%ce%9a%ce%bf%cf%85%cf%84%cf%83%ce%bf%cf%80%cf%8c%ce%b4%ce%b9', 'gr', 1),
(509592, 782701, 'Λέρνα', '%ce%9b%ce%ad%cf%81%ce%bd%ce%b1', 'gr', 1),
(509593, 782701, 'Μιδέας', '%ce%9c%ce%b9%ce%b4%ce%ad%ce%b1%cf%82', 'gr', 1),
(509594, 782701, 'Νέα Τίρυνθα', '%ce%9d%ce%ad%ce%b1-%ce%a4%ce%af%cf%81%cf%85%ce%bd%ce%b8%ce%b', 'gr', 1),
(509595, 782702, 'Γέρακας', '%ce%93%ce%ad%cf%81%ce%b1%ce%ba%ce%b1%cf%82', 'gr', 1),
(509596, 782702, 'Ανθούσα', '%ce%91%ce%bd%ce%b8%ce%bf%cf%8d%cf%83%ce%b1', 'gr', 1),
(509597, 782702, 'Αρτέμιδα (Λούτσα)', '%ce%91%cf%81%cf%84%ce%ad%ce%bc%ce%b9%ce%b4%ce%b1-%ce%9b%ce%b', 'gr', 1),
(509598, 782702, 'Κορωπί', '%ce%9a%ce%bf%cf%81%cf%89%cf%80%ce%af', 'gr', 1),
(509599, 782702, 'Σπάτα', '%ce%a3%cf%80%ce%ac%cf%84%ce%b1', 'gr', 1),
(509600, 782702, 'Παιανία', '%ce%a0%ce%b1%ce%b9%ce%b1%ce%bd%ce%af%ce%b1', 'gr', 1),
(509601, 782702, 'Γλυκά Νερά', '%ce%93%ce%bb%cf%85%ce%ba%ce%ac-%ce%9d%ce%b5%cf%81%ce%ac', 'gr', 1),
(509602, 782702, 'Παλλήνη', '%ce%a0%ce%b1%ce%bb%ce%bb%ce%ae%ce%bd%ce%b7', 'gr', 1),
(509603, 782702, 'Νέα Μάκρη', '%ce%9d%ce%ad%ce%b1-%ce%9c%ce%ac%ce%ba%cf%81%ce%b7', 'gr', 1),
(509604, 782702, 'Μαραθώνας', '%ce%9c%ce%b1%cf%81%ce%b1%ce%b8%cf%8e%ce%bd%ce%b1%cf%82', 'gr', 1),
(509605, 782702, 'Μαρκόπουλο', '%ce%9c%ce%b1%cf%81%ce%ba%cf%8c%cf%80%ce%bf%cf%85%ce%bb%ce%bf', 'gr', 1),
(509606, 782702, 'Βαρνάβας', '%ce%92%ce%b1%cf%81%ce%bd%ce%ac%ce%b2%ce%b1%cf%82', 'gr', 1),
(509607, 782702, 'Γραμματικό', '%ce%93%cf%81%ce%b1%ce%bc%ce%bc%ce%b1%cf%84%ce%b9%ce%ba%cf%8c', 'gr', 1),
(509608, 782703, 'Αχαρνές', '%ce%91%cf%87%ce%b1%cf%81%ce%bd%ce%ad%cf%82', 'gr', 1),
(509609, 782703, 'Μεταμόρφωση', '%ce%9c%ce%b5%cf%84%ce%b1%ce%bc%cf%8c%cf%81%cf%86%cf%89%cf%83', 'gr', 1),
(509610, 782703, 'Καματερό', '%ce%9a%ce%b1%ce%bc%ce%b1%cf%84%ce%b5%cf%81%cf%8c', 'gr', 1),
(509611, 782703, 'Νέα Ιωνία', '%ce%9d%ce%ad%ce%b1-%ce%99%cf%89%ce%bd%ce%af%ce%b1', 'gr', 1),
(509612, 782703, 'Γαλάτσι', '%ce%93%ce%b1%ce%bb%ce%ac%cf%84%cf%83%ce%b9', 'gr', 1),
(509613, 782703, 'Νέα Φιλαδέλφεια', '%ce%9d%ce%ad%ce%b1-%ce%a6%ce%b9%ce%bb%ce%b1%ce%b4%ce%ad%ce%b', 'gr', 1),
(509614, 782703, 'Νέα Χαλκηδόνα', '%ce%9d%ce%ad%ce%b1-%ce%a7%ce%b1%ce%bb%ce%ba%ce%b7%ce%b4%cf%8', 'gr', 1),
(509615, 782703, 'Άγιοι Ανάργυροι', '%ce%86%ce%b3%ce%b9%ce%bf%ce%b9-%ce%91%ce%bd%ce%ac%cf%81%ce%b', 'gr', 1),
(509616, 782703, 'Ίλιον', '%ce%8a%ce%bb%ce%b9%ce%bf%ce%bd', 'gr', 1),
(509617, 782703, 'Περιστέρι', '%ce%a0%ce%b5%cf%81%ce%b9%cf%83%cf%84%ce%ad%cf%81%ce%b9', 'gr', 1),
(509618, 782703, 'Αιγάλεω', '%ce%91%ce%b9%ce%b3%ce%ac%ce%bb%ce%b5%cf%89', 'gr', 1),
(509619, 782703, 'Αγία Βαρβάρα', '%ce%91%ce%b3%ce%af%ce%b1-%ce%92%ce%b1%cf%81%ce%b2%ce%ac%cf%8', 'gr', 1),
(509620, 782703, 'Χαιδάρι', '%ce%a7%ce%b1%ce%b9%ce%b4%ce%ac%cf%81%ce%b9', 'gr', 1),
(509621, 782703, 'Πετρούπολη', '%ce%a0%ce%b5%cf%84%cf%81%ce%bf%cf%8d%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(509622, 782703, 'Θρακομακεδόνες', '%ce%98%cf%81%ce%b1%ce%ba%ce%bf%ce%bc%ce%b1%ce%ba%ce%b5%ce%b4', 'gr', 1),
(509623, 782703, 'Βαρυμπόμπη', '%ce%92%ce%b1%cf%81%cf%85%ce%bc%cf%80%cf%8c%ce%bc%cf%80%ce%b7', 'gr', 1),
(509624, 782703, 'Σκαραμαγκάς', '%ce%a3%ce%ba%ce%b1%cf%81%ce%b1%ce%bc%ce%b1%ce%b3%ce%ba%ce%ac', 'gr', 1),
(509625, 782704, 'Ζωγράφου', '%ce%96%cf%89%ce%b3%cf%81%ce%ac%cf%86%ce%bf%cf%85', 'gr', 1),
(509626, 782704, 'Καισαριανή', '%ce%9a%ce%b1%ce%b9%cf%83%ce%b1%cf%81%ce%b9%ce%b1%ce%bd%ce%ae', 'gr', 1),
(509627, 782704, 'Βύρωνας', '%ce%92%cf%8d%cf%81%cf%89%ce%bd%ce%b1%cf%82', 'gr', 1),
(509628, 782704, 'Αργυρούπολη', '%ce%91%cf%81%ce%b3%cf%85%cf%81%ce%bf%cf%8d%cf%80%ce%bf%ce%bb', 'gr', 1),
(509629, 782704, 'Γλυφάδα', '%ce%93%ce%bb%cf%85%cf%86%ce%ac%ce%b4%ce%b1', 'gr', 1),
(509630, 782704, 'Βούλα', '%ce%92%ce%bf%cf%8d%ce%bb%ce%b1', 'gr', 1),
(509631, 782704, 'Βάρη - Βάρκιζα', '%ce%92%ce%ac%cf%81%ce%b7-%ce%92%ce%ac%cf%81%ce%ba%ce%b9%ce%b', 'gr', 1),
(509632, 782704, 'Βουλιαγμένη', '%ce%92%ce%bf%cf%85%ce%bb%ce%b9%ce%b1%ce%b3%ce%bc%ce%ad%ce%bd', 'gr', 1),
(509633, 782704, 'Ελληνικό', '%ce%95%ce%bb%ce%bb%ce%b7%ce%bd%ce%b9%ce%ba%cf%8c', 'gr', 1),
(509634, 782704, 'Άλιμος', '%ce%86%ce%bb%ce%b9%ce%bc%ce%bf%cf%82', 'gr', 1),
(509635, 782704, 'Παλαιό Φάληρο', '%ce%a0%ce%b1%ce%bb%ce%b1%ce%b9%cf%8c-%ce%a6%ce%ac%ce%bb%ce%b', 'gr', 1),
(509636, 782704, 'Καλλιθέα', '%ce%9a%ce%b1%ce%bb%ce%bb%ce%b9%ce%b8%ce%ad%ce%b1', 'gr', 1),
(509637, 782704, 'Νέα Σμύρνη', '%ce%9d%ce%ad%ce%b1-%ce%a3%ce%bc%cf%8d%cf%81%ce%bd%ce%b7', 'gr', 1),
(509638, 782704, 'Δάφνη', '%ce%94%ce%ac%cf%86%ce%bd%ce%b7', 'gr', 1),
(509639, 782704, 'Υμηττός', '%ce%a5%ce%bc%ce%b7%cf%84%cf%84%cf%8c%cf%82', 'gr', 1),
(509640, 782704, 'Ηλιούπολη', '%ce%97%ce%bb%ce%b9%ce%bf%cf%8d%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(509641, 782704, 'Άγιος Δημήτριος', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%94%ce%b7%ce%bc%ce%ae%cf%8', 'gr', 1),
(509642, 782705, 'Άγιος Παύλος', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%a0%ce%b1%cf%8d%ce%bb%ce%b', 'gr', 1),
(509643, 782705, 'Ελευθεριό - Κορδελιό', '%ce%95%ce%bb%ce%b5%cf%85%ce%b8%ce%b5%cf%81%ce%b9%cf%8c-%ce%9', 'gr', 1),
(509644, 782705, 'Εύοσμος', '%ce%95%cf%8d%ce%bf%cf%83%ce%bc%ce%bf%cf%82', 'gr', 1),
(509645, 782705, 'Μενεμένης', '%ce%9c%ce%b5%ce%bd%ce%b5%ce%bc%ce%ad%ce%bd%ce%b7%cf%82', 'gr', 1),
(509646, 782705, 'Πανόραμα', '%ce%a0%ce%b1%ce%bd%cf%8c%cf%81%ce%b1%ce%bc%ce%b1', 'gr', 1),
(509647, 782705, 'Πολίχνη', '%ce%a0%ce%bf%ce%bb%ce%af%cf%87%ce%bd%ce%b7', 'gr', 1),
(509648, 782705, 'Σταυρούπολη', '%ce%a3%cf%84%ce%b1%cf%85%cf%81%ce%bf%cf%8d%cf%80%ce%bf%ce%bb', 'gr', 1),
(509649, 782705, 'Τριανδρία', '%ce%a4%cf%81%ce%b9%ce%b1%ce%bd%ce%b4%cf%81%ce%af%ce%b1', 'gr', 1),
(509650, 782705, 'Αμπελόκηποι', '%ce%91%ce%bc%cf%80%ce%b5%ce%bb%cf%8c%ce%ba%ce%b7%cf%80%ce%bf', 'gr', 1),
(509651, 782705, 'Ευκαρπία', '%ce%95%cf%85%ce%ba%ce%b1%cf%81%cf%80%ce%af%ce%b1', 'gr', 1),
(509652, 782705, 'Καλαμαριά', '%ce%9a%ce%b1%ce%bb%ce%b1%ce%bc%ce%b1%cf%81%ce%b9%ce%ac', 'gr', 1),
(509653, 782705, 'Νεάπολη', '%ce%9d%ce%b5%ce%ac%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(509654, 782705, 'Πεύκα (Ρετζίκι)', '%ce%a0%ce%b5%cf%8d%ce%ba%ce%b1-%ce%a1%ce%b5%cf%84%ce%b6%ce%a', 'gr', 1),
(509655, 782705, 'Πυλαία', '%ce%a0%cf%85%ce%bb%ce%b1%ce%af%ce%b1', 'gr', 1),
(509656, 782705, 'Συκιές', '%ce%a3%cf%85%ce%ba%ce%b9%ce%ad%cf%82', 'gr', 1),
(509657, 782705, 'Ωραιόκαστρο', '%ce%a9%cf%81%ce%b1%ce%b9%cf%8c%ce%ba%ce%b1%cf%83%cf%84%cf%81', 'gr', 1),
(509658, 782706, '26ης Οκτωβρίου', '26%ce%b7%cf%82-%ce%9f%ce%ba%cf%84%cf%89%ce%b2%cf%81%ce%af%ce', 'gr', 1),
(509659, 782706, '40 Εκκλησιές', '40-%ce%95%ce%ba%ce%ba%ce%bb%ce%b7%cf%83%ce%b9%ce%ad%cf%82', 'gr', 1),
(509660, 782706, 'Ανθέων', '%ce%91%ce%bd%ce%b8%ce%ad%cf%89%ce%bd', 'gr', 1),
(509661, 782706, 'Άνω Τούμπα', '%ce%86%ce%bd%cf%89-%ce%a4%ce%bf%cf%8d%ce%bc%cf%80%ce%b1', 'gr', 1),
(509662, 782706, 'Βούλγαρη', '%ce%92%ce%bf%cf%8d%ce%bb%ce%b3%ce%b1%cf%81%ce%b7', 'gr', 1),
(509663, 782706, 'Διαγώνιος', '%ce%94%ce%b9%ce%b1%ce%b3%cf%8e%ce%bd%ce%b9%ce%bf%cf%82', 'gr', 1),
(509664, 782706, 'Δόξα', '%ce%94%cf%8c%ce%be%ce%b1', 'gr', 1),
(509665, 782706, 'Ευζώνων', '%ce%95%cf%85%ce%b6%cf%8e%ce%bd%cf%89%ce%bd', 'gr', 1),
(509666, 782706, 'Ιπποκράτειο', '%ce%99%cf%80%cf%80%ce%bf%ce%ba%cf%81%ce%ac%cf%84%ce%b5%ce%b9', 'gr', 1),
(509667, 782706, 'Κάτω Τούμπα', '%ce%9a%ce%ac%cf%84%cf%89-%ce%a4%ce%bf%cf%8d%ce%bc%cf%80%ce%b', 'gr', 1),
(509668, 782706, 'Λαδάδικα', '%ce%9b%ce%b1%ce%b4%ce%ac%ce%b4%ce%b9%ce%ba%ce%b1', 'gr', 1),
(509669, 782706, 'Λεωφόρος Στρατού', '%ce%9b%ce%b5%cf%89%cf%86%cf%8c%cf%81%ce%bf%cf%82-%ce%a3%cf%8', 'gr', 1),
(509670, 782706, 'Μαρτίου', '%ce%9c%ce%b1%cf%81%cf%84%ce%af%ce%bf%cf%85', 'gr', 1),
(509671, 782706, 'Νέα Δυτική Είσοδος', '%ce%9d%ce%ad%ce%b1-%ce%94%cf%85%cf%84%ce%b9%ce%ba%ce%ae-%ce%', 'gr', 1),
(509672, 782706, 'Νέα Παραλία', '%ce%9d%ce%ad%ce%b1-%ce%a0%ce%b1%cf%81%ce%b1%ce%bb%ce%af%ce%b', 'gr', 1),
(509673, 782706, 'Ξηροκρήνη', '%ce%9e%ce%b7%cf%81%ce%bf%ce%ba%cf%81%ce%ae%ce%bd%ce%b7', 'gr', 1),
(509674, 782706, 'Παναγία Φανερωμένη', '%ce%a0%ce%b1%ce%bd%ce%b1%ce%b3%ce%af%ce%b1-%ce%a6%ce%b1%ce%b', 'gr', 1),
(509675, 782706, 'Παπάφη', '%ce%a0%ce%b1%cf%80%ce%ac%cf%86%ce%b7', 'gr', 1),
(509676, 782706, 'Σταθμός ΟΣΕ', '%ce%a3%cf%84%ce%b1%ce%b8%ce%bc%cf%8c%cf%82-%ce%9f%ce%a3%ce%9', 'gr', 1),
(509677, 782706, 'Τριανδρία', '%ce%a4%cf%81%ce%b9%ce%b1%ce%bd%ce%b4%cf%81%ce%af%ce%b1', 'gr', 1),
(509678, 782706, 'Φλέμιγκ', '%ce%a6%ce%bb%ce%ad%ce%bc%ce%b9%ce%b3%ce%ba', 'gr', 1),
(509679, 782706, 'Υπόλοιπο Δήμου Θεσ/νίκης', '%ce%a5%cf%80%cf%8c%ce%bb%ce%bf%ce%b9%cf%80%ce%bf-%ce%94%ce%a', 'gr', 1),
(509680, 782706, '28ης Οκτωβρίου', '28%ce%b7%cf%82-%ce%9f%ce%ba%cf%84%cf%89%ce%b2%cf%81%ce%af%ce', 'gr', 1),
(509681, 782706, 'Ανάληψη', '%ce%91%ce%bd%ce%ac%ce%bb%ce%b7%cf%88%ce%b7', 'gr', 1),
(509682, 782706, 'Άνω Πόλη', '%ce%86%ce%bd%cf%89-%ce%a0%cf%8c%ce%bb%ce%b7', 'gr', 1),
(509683, 782706, 'Βαρδάρης - Δικαστήρια', '%ce%92%ce%b1%cf%81%ce%b4%ce%ac%cf%81%ce%b7%cf%82-%ce%94%ce%b', 'gr', 1),
(509684, 782706, 'Γρηγορίου', '%ce%93%cf%81%ce%b7%ce%b3%ce%bf%cf%81%ce%af%ce%bf%cf%85', 'gr', 1),
(509685, 782706, 'Διοικητήριο', '%ce%94%ce%b9%ce%bf%ce%b9%ce%ba%ce%b7%cf%84%ce%ae%cf%81%ce%b9', 'gr', 1),
(509686, 782706, 'Ευαγγελίστρια', '%ce%95%cf%85%ce%b1%ce%b3%ce%b3%ce%b5%ce%bb%ce%af%cf%83%cf%84', 'gr', 1),
(509687, 782706, 'Θεαγένιο', '%ce%98%ce%b5%ce%b1%ce%b3%ce%ad%ce%bd%ce%b9%ce%bf', 'gr', 1),
(509688, 782706, 'Καμάρα', '%ce%9a%ce%b1%ce%bc%ce%ac%cf%81%ce%b1', 'gr', 1),
(509689, 782706, 'Λευκός Πύργος', '%ce%9b%ce%b5%cf%85%ce%ba%cf%8c%cf%82-%ce%a0%cf%8d%cf%81%ce%b', 'gr', 1),
(509690, 782706, 'Λιμάνι', '%ce%9b%ce%b9%ce%bc%ce%ac%ce%bd%ce%b9', 'gr', 1),
(509691, 782706, 'Μπότσαρη', '%ce%9c%cf%80%cf%8c%cf%84%cf%83%ce%b1%cf%81%ce%b7', 'gr', 1),
(509692, 782706, 'Νέα Ελβετία', '%ce%9d%ce%ad%ce%b1-%ce%95%ce%bb%ce%b2%ce%b5%cf%84%ce%af%ce%b', 'gr', 1),
(509693, 782706, 'Ντεπώ', '%ce%9d%cf%84%ce%b5%cf%80%cf%8e', 'gr', 1),
(509694, 782706, 'Παλιά Παραλία', '%ce%a0%ce%b1%ce%bb%ce%b9%ce%ac-%ce%a0%ce%b1%cf%81%ce%b1%ce%b', 'gr', 1),
(509695, 782706, 'Πανεπιστ/πολη', '%ce%a0%ce%b1%ce%bd%ce%b5%cf%80%ce%b9%cf%83%cf%84%cf%80%ce%bf', 'gr', 1),
(509696, 782706, 'Ροτόντα', '%ce%a1%ce%bf%cf%84%cf%8c%ce%bd%cf%84%ce%b1', 'gr', 1),
(509697, 782706, 'Σχολή Τυφλών', '%ce%a3%cf%87%ce%bf%ce%bb%ce%ae-%ce%a4%cf%85%cf%86%ce%bb%cf%8', 'gr', 1),
(509698, 782706, 'Φάληρο', '%ce%a6%ce%ac%ce%bb%ce%b7%cf%81%ce%bf', 'gr', 1),
(509699, 782706, 'Χαριλάου', '%ce%a7%ce%b1%cf%81%ce%b9%ce%bb%ce%ac%ce%bf%cf%85', 'gr', 1),
(509700, 782707, 'Άγιος Αθανάσιος', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%91%ce%b8%ce%b1%ce%bd%ce%a', 'gr', 1),
(509701, 782707, 'Αξιός', '%ce%91%ce%be%ce%b9%cf%8c%cf%82', 'gr', 1),
(509702, 782707, 'Αρεθούσα', '%ce%91%cf%81%ce%b5%ce%b8%ce%bf%cf%8d%cf%83%ce%b1', 'gr', 1),
(509703, 782707, 'Βασιλικά', '%ce%92%ce%b1%cf%83%ce%b9%ce%bb%ce%b9%ce%ba%ce%ac', 'gr', 1),
(509704, 782707, 'Εγνατία', '%ce%95%ce%b3%ce%bd%ce%b1%cf%84%ce%af%ce%b1', 'gr', 1),
(509705, 782707, 'Εχέδωρος', '%ce%95%cf%87%ce%ad%ce%b4%cf%89%cf%81%ce%bf%cf%82', 'gr', 1),
(509706, 782707, 'Θέρμη', '%ce%98%ce%ad%cf%81%ce%bc%ce%b7', 'gr', 1),
(509707, 782707, 'Καλλίνδοια', '%ce%9a%ce%b1%ce%bb%ce%bb%ce%af%ce%bd%ce%b4%ce%bf%ce%b9%ce%b1', 'gr', 1),
(509708, 782707, 'Κουφάλια', '%ce%9a%ce%bf%cf%85%cf%86%ce%ac%ce%bb%ce%b9%ce%b1', 'gr', 1),
(509709, 782707, 'Λαχανάς', '%ce%9b%ce%b1%cf%87%ce%b1%ce%bd%ce%ac%cf%82', 'gr', 1),
(509710, 782707, 'Μηχανιώνα', '%ce%9c%ce%b7%cf%87%ce%b1%ce%bd%ce%b9%cf%8e%ce%bd%ce%b1', 'gr', 1),
(509711, 782707, 'Μυγδόνια', '%ce%9c%cf%85%ce%b3%ce%b4%cf%8c%ce%bd%ce%b9%ce%b1', 'gr', 1),
(509712, 782707, 'Ρεντίνα', '%ce%a1%ce%b5%ce%bd%cf%84%ce%af%ce%bd%ce%b1', 'gr', 1),
(509713, 782707, 'Χαλάστρα', '%ce%a7%ce%b1%ce%bb%ce%ac%cf%83%cf%84%cf%81%ce%b1', 'gr', 1),
(509714, 782707, 'Χορτιάτης', '%ce%a7%ce%bf%cf%81%cf%84%ce%b9%ce%ac%cf%84%ce%b7%cf%82', 'gr', 1),
(509715, 782707, 'Άγιος Γεώργιος', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%93%ce%b5%cf%8e%cf%81%ce%b', 'gr', 1),
(509716, 782707, 'Απολλωνία', '%ce%91%cf%80%ce%bf%ce%bb%ce%bb%cf%89%ce%bd%ce%af%ce%b1', 'gr', 1),
(509717, 782707, 'Άσσηρος', '%ce%86%cf%83%cf%83%ce%b7%cf%81%ce%bf%cf%82', 'gr', 1),
(509718, 782707, 'Βερτίσκος', '%ce%92%ce%b5%cf%81%cf%84%ce%af%cf%83%ce%ba%ce%bf%cf%82', 'gr', 1),
(509719, 782707, 'Επανομή', '%ce%95%cf%80%ce%b1%ce%bd%ce%bf%ce%bc%ce%ae', 'gr', 1),
(509720, 782707, 'Θερμαικός', '%ce%98%ce%b5%cf%81%ce%bc%ce%b1%ce%b9%ce%ba%cf%8c%cf%82', 'gr', 1),
(509721, 782707, 'Καλλιθέα', '%ce%9a%ce%b1%ce%bb%ce%bb%ce%b9%ce%b8%ce%ad%ce%b1', 'gr', 1),
(509722, 782707, 'Κορώνεια', '%ce%9a%ce%bf%cf%81%cf%8e%ce%bd%ce%b5%ce%b9%ce%b1', 'gr', 1),
(509723, 782707, 'Λαγκαδάς', '%ce%9b%ce%b1%ce%b3%ce%ba%ce%b1%ce%b4%ce%ac%cf%82', 'gr', 1),
(509724, 782707, 'Μάδυτος', '%ce%9c%ce%ac%ce%b4%cf%85%cf%84%ce%bf%cf%82', 'gr', 1),
(509725, 782707, 'Μίκρα', '%ce%9c%ce%af%ce%ba%cf%81%ce%b1', 'gr', 1),
(509726, 782707, 'Σωχός', '%ce%a3%cf%89%cf%87%cf%8c%cf%82', 'gr', 1),
(509727, 782707, 'Χαλκηδόνα', '%ce%a7%ce%b1%ce%bb%ce%ba%ce%b7%ce%b4%cf%8c%ce%bd%ce%b1', 'gr', 1),
(509728, 782708, 'Άγιος Κωνσταντίνος', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%9a%cf%89%ce%bd%cf%83%cf%8', 'gr', 1),
(509729, 782708, 'Ανάβυσσος', '%ce%91%ce%bd%ce%ac%ce%b2%cf%85%cf%83%cf%83%ce%bf%cf%82', 'gr', 1),
(509730, 782708, 'Αυλώνα', '%ce%91%cf%85%ce%bb%cf%8e%ce%bd%ce%b1', 'gr', 1),
(509731, 782708, 'Αφίδνες', '%ce%91%cf%86%ce%af%ce%b4%ce%bd%ce%b5%cf%82', 'gr', 1),
(509732, 782708, 'Βαρνάβας', '%ce%92%ce%b1%cf%81%ce%bd%ce%ac%ce%b2%ce%b1%cf%82', 'gr', 1),
(509733, 782708, 'Γραμματικό', '%ce%93%cf%81%ce%b1%ce%bc%ce%bc%ce%b1%cf%84%ce%b9%ce%ba%cf%8c', 'gr', 1),
(509734, 782708, 'Κάλαμος', '%ce%9a%ce%ac%ce%bb%ce%b1%ce%bc%ce%bf%cf%82', 'gr', 1),
(509735, 782708, 'Καλύβια Θορικού', '%ce%9a%ce%b1%ce%bb%cf%8d%ce%b2%ce%b9%ce%b1-%ce%98%ce%bf%cf%8', 'gr', 1),
(509736, 782708, 'Καπανδρίτι', '%ce%9a%ce%b1%cf%80%ce%b1%ce%bd%ce%b4%cf%81%ce%af%cf%84%ce%b9', 'gr', 1),
(509737, 782708, 'Κερατέα', '%ce%9a%ce%b5%cf%81%ce%b1%cf%84%ce%ad%ce%b1', 'gr', 1),
(509738, 782708, 'Κουβαράς', '%ce%9a%ce%bf%cf%85%ce%b2%ce%b1%cf%81%ce%ac%cf%82', 'gr', 1),
(509739, 782708, 'Λαυρεωτική', '%ce%9b%ce%b1%cf%85%cf%81%ce%b5%cf%89%cf%84%ce%b9%ce%ba%ce%ae', 'gr', 1),
(509740, 782708, 'Μαλακάσα', '%ce%9c%ce%b1%ce%bb%ce%b1%ce%ba%ce%ac%cf%83%ce%b1', 'gr', 1),
(509741, 782708, 'Μαρκόπουλο Ωρωπού', '%ce%9c%ce%b1%cf%81%ce%ba%cf%8c%cf%80%ce%bf%cf%85%ce%bb%ce%bf', 'gr', 1),
(509742, 782708, 'Παλαιά Φώκαια', '%ce%a0%ce%b1%ce%bb%ce%b1%ce%b9%ce%ac-%ce%a6%cf%8e%ce%ba%ce%b', 'gr', 1),
(509743, 782708, 'Πολυδένδρι', '%ce%a0%ce%bf%ce%bb%cf%85%ce%b4%ce%ad%ce%bd%ce%b4%cf%81%ce%b9', 'gr', 1),
(509744, 782708, 'Σαρωνίδα', '%ce%a3%ce%b1%cf%81%cf%89%ce%bd%ce%af%ce%b4%ce%b1', 'gr', 1),
(509745, 782708, 'Συκάμινο', '%ce%a3%cf%85%ce%ba%ce%ac%ce%bc%ce%b9%ce%bd%ce%bf', 'gr', 1),
(509746, 782708, 'Ωρωπός', '%ce%a9%cf%81%cf%89%cf%80%cf%8c%cf%82', 'gr', 1),
(509747, 782709, 'Ασπρόπυργος', '%ce%91%cf%83%cf%80%cf%81%cf%8c%cf%80%cf%85%cf%81%ce%b3%ce%bf', 'gr', 1),
(509748, 782709, 'Βίλια', '%ce%92%ce%af%ce%bb%ce%b9%ce%b1', 'gr', 1),
(509749, 782709, 'Ελευσίνα', '%ce%95%ce%bb%ce%b5%cf%85%cf%83%ce%af%ce%bd%ce%b1', 'gr', 1),
(509750, 782709, 'Ερυθρές', '%ce%95%cf%81%cf%85%ce%b8%cf%81%ce%ad%cf%82', 'gr', 1),
(509751, 782709, 'Μαγούλα', '%ce%9c%ce%b1%ce%b3%ce%bf%cf%8d%ce%bb%ce%b1', 'gr', 1),
(509752, 782709, 'Μάνδρα', '%ce%9c%ce%ac%ce%bd%ce%b4%cf%81%ce%b1', 'gr', 1),
(509753, 782709, 'Μέγαρα', '%ce%9c%ce%ad%ce%b3%ce%b1%cf%81%ce%b1', 'gr', 1),
(509754, 782709, 'Νέα Πέραμος', '%ce%9d%ce%ad%ce%b1-%ce%a0%ce%ad%cf%81%ce%b1%ce%bc%ce%bf%cf%8', 'gr', 1),
(509755, 782709, 'Οινόη', '%ce%9f%ce%b9%ce%bd%cf%8c%ce%b7', 'gr', 1),
(509756, 782709, 'Φυλή', '%ce%a6%cf%85%ce%bb%ce%ae', 'gr', 1),
(509757, 782710, 'Αγγελόκαστρο', '%ce%91%ce%b3%ce%b3%ce%b5%ce%bb%cf%8c%ce%ba%ce%b1%cf%83%cf%84', 'gr', 1),
(509758, 782710, 'Αιτωλικό', '%ce%91%ce%b9%cf%84%cf%89%ce%bb%ce%b9%ce%ba%cf%8c', 'gr', 1),
(509759, 782710, 'Αμφιλοχία', '%ce%91%ce%bc%cf%86%ce%b9%ce%bb%ce%bf%cf%87%ce%af%ce%b1', 'gr', 1),
(509760, 782710, 'Αντίρριο', '%ce%91%ce%bd%cf%84%ce%af%cf%81%cf%81%ce%b9%ce%bf', 'gr', 1),
(509761, 782710, 'Αράκυνθος', '%ce%91%cf%81%ce%ac%ce%ba%cf%85%ce%bd%ce%b8%ce%bf%cf%82', 'gr', 1),
(509762, 782710, 'Θέρμο', '%ce%98%ce%ad%cf%81%ce%bc%ce%bf', 'gr', 1),
(509763, 782710, 'Ίναχος', '%ce%8a%ce%bd%ce%b1%cf%87%ce%bf%cf%82', 'gr', 1),
(509764, 782710, 'Μεδεώνος', '%ce%9c%ce%b5%ce%b4%ce%b5%cf%8e%ce%bd%ce%bf%cf%82', 'gr', 1),
(509765, 782710, 'Μεσολόγγι', '%ce%9c%ce%b5%cf%83%ce%bf%ce%bb%cf%8c%ce%b3%ce%b3%ce%b9', 'gr', 1),
(509766, 782710, 'Νεάπολη', '%ce%9d%ce%b5%ce%ac%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(509767, 782710, 'Πάλαιρος', '%ce%a0%ce%ac%ce%bb%ce%b1%ce%b9%cf%81%ce%bf%cf%82', 'gr', 1),
(509768, 782710, 'Παραβόλα', '%ce%a0%ce%b1%cf%81%ce%b1%ce%b2%cf%8c%ce%bb%ce%b1', 'gr', 1),
(509769, 782710, 'Πλάτανος', '%ce%a0%ce%bb%ce%ac%cf%84%ce%b1%ce%bd%ce%bf%cf%82', 'gr', 1),
(509770, 782710, 'Στράτος', '%ce%a3%cf%84%cf%81%ce%ac%cf%84%ce%bf%cf%82', 'gr', 1),
(509771, 782710, 'Χάλκεια', '%ce%a7%ce%ac%ce%bb%ce%ba%ce%b5%ce%b9%ce%b1', 'gr', 1),
(509772, 782710, 'Αγρίνιο', '%ce%91%ce%b3%cf%81%ce%af%ce%bd%ce%b9%ce%bf', 'gr', 1),
(509773, 782710, 'Αλυζία', '%ce%91%ce%bb%cf%85%ce%b6%ce%af%ce%b1', 'gr', 1),
(509774, 782710, 'Ανακτόριο', '%ce%91%ce%bd%ce%b1%ce%ba%cf%84%cf%8c%cf%81%ce%b9%ce%bf', 'gr', 1),
(509775, 782710, 'Αποδοτία', '%ce%91%cf%80%ce%bf%ce%b4%ce%bf%cf%84%ce%af%ce%b1', 'gr', 1),
(509776, 782710, 'Αστακός', '%ce%91%cf%83%cf%84%ce%b1%ce%ba%cf%8c%cf%82', 'gr', 1),
(509777, 782710, 'Θεσπιών', '%ce%98%ce%b5%cf%83%cf%80%ce%b9%cf%8e%ce%bd', 'gr', 1),
(509778, 782710, 'Μακρυνεία', '%ce%9c%ce%b1%ce%ba%cf%81%cf%85%ce%bd%ce%b5%ce%af%ce%b1', 'gr', 1),
(509779, 782710, 'Μενίδι', '%ce%9c%ce%b5%ce%bd%ce%af%ce%b4%ce%b9', 'gr', 1),
(509780, 782710, 'Ναύπακτος', '%ce%9d%ce%b1%cf%8d%cf%80%ce%b1%ce%ba%cf%84%ce%bf%cf%82', 'gr', 1),
(509781, 782710, 'Οινάδες', '%ce%9f%ce%b9%ce%bd%ce%ac%ce%b4%ce%b5%cf%82', 'gr', 1),
(509782, 782710, 'Παναιτωλικό', '%ce%a0%ce%b1%ce%bd%ce%b1%ce%b9%cf%84%cf%89%ce%bb%ce%b9%ce%ba', 'gr', 1),
(509783, 782710, 'Παρακαμπυλή', '%ce%a0%ce%b1%cf%81%ce%b1%ce%ba%ce%b1%ce%bc%cf%80%cf%85%ce%bb', 'gr', 1),
(509784, 782710, 'Πυλλήνη', '%ce%a0%cf%85%ce%bb%ce%bb%ce%ae%ce%bd%ce%b7', 'gr', 1),
(509785, 782710, 'Φυτείες', '%ce%a6%cf%85%cf%84%ce%b5%ce%af%ce%b5%cf%82', 'gr', 1),
(509786, 782711, 'Αγνάντα', '%ce%91%ce%b3%ce%bd%ce%ac%ce%bd%cf%84%ce%b1', 'gr', 1),
(509787, 782711, 'Αμβρακικός', '%ce%91%ce%bc%ce%b2%cf%81%ce%b1%ce%ba%ce%b9%ce%ba%cf%8c%cf%82', 'gr', 1),
(509788, 782711, 'Άρτα', '%ce%86%cf%81%cf%84%ce%b1', 'gr', 1),
(509789, 782711, 'Γεωργ. Καραισκάκης', '%ce%93%ce%b5%cf%89%cf%81%ce%b3-%ce%9a%ce%b1%cf%81%ce%b1%ce%b', 'gr', 1),
(509790, 782711, 'Θεοδώριανα', '%ce%98%ce%b5%ce%bf%ce%b4%cf%8e%cf%81%ce%b9%ce%b1%ce%bd%ce%b1', 'gr', 1),
(509791, 782711, 'Κομπότι', '%ce%9a%ce%bf%ce%bc%cf%80%cf%8c%cf%84%ce%b9', 'gr', 1),
(509792, 782711, 'Ξηροβούνι', '%ce%9e%ce%b7%cf%81%ce%bf%ce%b2%ce%bf%cf%8d%ce%bd%ce%b9', 'gr', 1),
(509793, 782711, 'Τετραμυλία', '%ce%a4%ce%b5%cf%84%cf%81%ce%b1%ce%bc%cf%85%ce%bb%ce%af%ce%b1', 'gr', 1),
(509794, 782711, 'Αθαμανία', '%ce%91%ce%b8%ce%b1%ce%bc%ce%b1%ce%bd%ce%af%ce%b1', 'gr', 1),
(509795, 782711, 'Άραθχος', '%ce%86%cf%81%ce%b1%ce%b8%cf%87%ce%bf%cf%82', 'gr', 1),
(509796, 782711, 'Βλαχέρνα', '%ce%92%ce%bb%ce%b1%cf%87%ce%ad%cf%81%ce%bd%ce%b1', 'gr', 1),
(509797, 782711, 'Ηρακλεία', '%ce%97%cf%81%ce%b1%ce%ba%ce%bb%ce%b5%ce%af%ce%b1', 'gr', 1),
(509798, 782711, 'Κομμένο', '%ce%9a%ce%bf%ce%bc%ce%bc%ce%ad%ce%bd%ce%bf', 'gr', 1),
(509799, 782711, 'Μελισσουργοί', '%ce%9c%ce%b5%ce%bb%ce%b9%cf%83%cf%83%ce%bf%cf%85%cf%81%ce%b3', 'gr', 1),
(509800, 782711, 'Πέτα', '%ce%a0%ce%ad%cf%84%ce%b1', 'gr', 1),
(509801, 782711, 'Φιλοθέη', '%ce%a6%ce%b9%ce%bb%ce%bf%ce%b8%ce%ad%ce%b7', 'gr', 1),
(509802, 782712, 'Αιγείρα', '%ce%91%ce%b9%ce%b3%ce%b5%ce%af%cf%81%ce%b1', 'gr', 1),
(509803, 782712, 'Ακράτα', '%ce%91%ce%ba%cf%81%ce%ac%cf%84%ce%b1', 'gr', 1),
(509804, 782712, 'Βραχναίικα', '%ce%92%cf%81%ce%b1%cf%87%ce%bd%ce%b1%ce%af%ce%b9%ce%ba%ce%b1', 'gr', 1),
(509805, 782712, 'Δύμη', '%ce%94%cf%8d%ce%bc%ce%b7', 'gr', 1),
(509806, 782712, 'Καλάβρυτα', '%ce%9a%ce%b1%ce%bb%ce%ac%ce%b2%cf%81%cf%85%cf%84%ce%b1', 'gr', 1),
(509807, 782712, 'Λαρισσός', '%ce%9b%ce%b1%cf%81%ce%b9%cf%83%cf%83%cf%8c%cf%82', 'gr', 1),
(509808, 782712, 'Λευκάσι', '%ce%9b%ce%b5%cf%85%ce%ba%ce%ac%cf%83%ce%b9', 'gr', 1),
(509809, 782712, 'Μόβρη', '%ce%9c%cf%8c%ce%b2%cf%81%ce%b7', 'gr', 1),
(509810, 782712, 'Παραλία', '%ce%a0%ce%b1%cf%81%ce%b1%ce%bb%ce%af%ce%b1', 'gr', 1),
(509811, 782712, 'Ρίο', '%ce%a1%ce%af%ce%bf', 'gr', 1),
(509812, 782712, 'Τριταία', '%ce%a4%cf%81%ce%b9%cf%84%ce%b1%ce%af%ce%b1', 'gr', 1),
(509813, 782712, 'Ωλενία', '%ce%a9%ce%bb%ce%b5%ce%bd%ce%af%ce%b1', 'gr', 1),
(509814, 782712, 'Αίγιο', '%ce%91%ce%af%ce%b3%ce%b9%ce%bf', 'gr', 1),
(509815, 782712, 'Αροάνεια', '%ce%91%cf%81%ce%bf%ce%ac%ce%bd%ce%b5%ce%b9%ce%b1', 'gr', 1),
(509816, 782712, 'Διακοπτό', '%ce%94%ce%b9%ce%b1%ce%ba%ce%bf%cf%80%cf%84%cf%8c', 'gr', 1),
(509817, 782712, 'Ερινέος', '%ce%95%cf%81%ce%b9%ce%bd%ce%ad%ce%bf%cf%82', 'gr', 1),
(509818, 782712, 'Καλέντζι', '%ce%9a%ce%b1%ce%bb%ce%ad%ce%bd%cf%84%ce%b6%ce%b9', 'gr', 1),
(509819, 782712, 'Λεόντιο', '%ce%9b%ce%b5%cf%8c%ce%bd%cf%84%ce%b9%ce%bf', 'gr', 1),
(509820, 782712, 'Μεσσάτιδα', '%ce%9c%ce%b5%cf%83%cf%83%ce%ac%cf%84%ce%b9%ce%b4%ce%b1', 'gr', 1),
(509821, 782712, 'Παΐων', '%ce%a0%ce%b1%ce%90%cf%89%ce%bd', 'gr', 1),
(509822, 782712, 'Πάτρα', '%ce%a0%ce%ac%cf%84%cf%81%ce%b1', 'gr', 1),
(509823, 782712, 'Συμπολιτεία', '%ce%a3%cf%85%ce%bc%cf%80%ce%bf%ce%bb%ce%b9%cf%84%ce%b5%ce%af', 'gr', 1),
(509824, 782712, 'Φαρρές', '%ce%a6%ce%b1%cf%81%cf%81%ce%ad%cf%82', 'gr', 1),
(509825, 782713, 'Οινούσες', '%ce%9f%ce%b9%ce%bd%ce%bf%cf%8d%cf%83%ce%b5%cf%82', 'gr', 1),
(509826, 782713, 'Χίος - Αμανή', '%ce%a7%ce%af%ce%bf%cf%82-%ce%91%ce%bc%ce%b1%ce%bd%ce%ae', 'gr', 1),
(509827, 782713, 'Χίος - Καμποχώρων', '%ce%a7%ce%af%ce%bf%cf%82-%ce%9a%ce%b1%ce%bc%cf%80%ce%bf%cf%8', 'gr', 1),
(509828, 782713, 'Χίος - Μαστιχοχώρια', '%ce%a7%ce%af%ce%bf%cf%82-%ce%9c%ce%b1%cf%83%cf%84%ce%b9%cf%8', 'gr', 1),
(509829, 782713, 'Χίος - Πόλη', '%ce%a7%ce%af%ce%bf%cf%82-%ce%a0%cf%8c%ce%bb%ce%b7', 'gr', 1),
(509830, 782713, 'Χίος - Άγ. Μηνάς', '%ce%a7%ce%af%ce%bf%cf%82-%ce%86%ce%b3-%ce%9c%ce%b7%ce%bd%ce%', 'gr', 1),
(509831, 782713, 'Χίος - Ιωνία', '%ce%a7%ce%af%ce%bf%cf%82-%ce%99%cf%89%ce%bd%ce%af%ce%b1', 'gr', 1),
(509832, 782713, 'Χίος - Καρδάμυλα', '%ce%a7%ce%af%ce%bf%cf%82-%ce%9a%ce%b1%cf%81%ce%b4%ce%ac%ce%b', 'gr', 1),
(509833, 782713, 'Χίος - Ομηρούπολη', '%ce%a7%ce%af%ce%bf%cf%82-%ce%9f%ce%bc%ce%b7%cf%81%ce%bf%cf%8', 'gr', 1),
(509834, 782713, 'Ψαρά', '%ce%a8%ce%b1%cf%81%ce%ac', 'gr', 1),
(509835, 782714, 'Πέραμα', '%ce%a0%ce%ad%cf%81%ce%b1%ce%bc%ce%b1', 'gr', 1),
(509836, 782714, 'Κερατσίνι', '%ce%9a%ce%b5%cf%81%ce%b1%cf%84%cf%83%ce%af%ce%bd%ce%b9', 'gr', 1),
(509837, 782714, 'Δραπετσώνα', '%ce%94%cf%81%ce%b1%cf%80%ce%b5%cf%84%cf%83%cf%8e%ce%bd%ce%b1', 'gr', 1),
(509838, 782714, 'Νίκαια', '%ce%9d%ce%af%ce%ba%ce%b1%ce%b9%ce%b1', 'gr', 1),
(509839, 782714, 'Κορυδαλλός', '%ce%9a%ce%bf%cf%81%cf%85%ce%b4%ce%b1%ce%bb%ce%bb%cf%8c%cf%82', 'gr', 1),
(509840, 782714, 'Άγιος Ιωάννης Ρέντης', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%99%cf%89%ce%ac%ce%bd%ce%b', 'gr', 1),
(509841, 782714, 'Μοσχάτο', '%ce%9c%ce%bf%cf%83%cf%87%ce%ac%cf%84%ce%bf', 'gr', 1),
(509842, 782714, 'Ταύρος', '%ce%a4%ce%b1%cf%8d%cf%81%ce%bf%cf%82', 'gr', 1),
(509843, 782715, 'Σαλαμίνα', '%ce%a3%ce%b1%ce%bb%ce%b1%ce%bc%ce%af%ce%bd%ce%b1', 'gr', 1),
(509844, 782715, 'Αμπελάκια', '%ce%91%ce%bc%cf%80%ce%b5%ce%bb%ce%ac%ce%ba%ce%b9%ce%b1', 'gr', 1),
(509845, 782715, 'Αίγινα', '%ce%91%ce%af%ce%b3%ce%b9%ce%bd%ce%b1', 'gr', 1),
(509846, 782715, 'Αγκρίστρι', '%ce%91%ce%b3%ce%ba%cf%81%ce%af%cf%83%cf%84%cf%81%ce%b9', 'gr', 1),
(509847, 782715, 'Μέθανα', '%ce%9c%ce%ad%ce%b8%ce%b1%ce%bd%ce%b1', 'gr', 1),
(509848, 782715, 'Τροιζήνα', '%ce%a4%cf%81%ce%bf%ce%b9%ce%b6%ce%ae%ce%bd%ce%b1', 'gr', 1),
(509849, 782715, 'Πόρος', '%ce%a0%cf%8c%cf%81%ce%bf%cf%82', 'gr', 1),
(509850, 782715, 'Ύδρα', '%ce%8e%ce%b4%cf%81%ce%b1', 'gr', 1),
(509851, 782715, 'Σπέτσες', '%ce%a3%cf%80%ce%ad%cf%84%cf%83%ce%b5%cf%82', 'gr', 1),
(509852, 782716, 'Ταμπούρια', '%ce%a4%ce%b1%ce%bc%cf%80%ce%bf%cf%8d%cf%81%ce%b9%ce%b1', 'gr', 1),
(509853, 782716, 'Αγία Σοφία', '%ce%91%ce%b3%ce%af%ce%b1-%ce%a3%ce%bf%cf%86%ce%af%ce%b1', 'gr', 1),
(509854, 782716, 'Παλαιά Κοκκινιά', '%ce%a0%ce%b1%ce%bb%ce%b1%ce%b9%ce%ac-%ce%9a%ce%bf%ce%ba%ce%b', 'gr', 1),
(509855, 782716, 'Λιμάνι', '%ce%9b%ce%b9%ce%bc%ce%ac%ce%bd%ce%b9', 'gr', 1),
(509856, 782716, 'Καμίνια', '%ce%9a%ce%b1%ce%bc%ce%af%ce%bd%ce%b9%ce%b1', 'gr', 1),
(509857, 782716, 'Νέο Φάληρο', '%ce%9d%ce%ad%ce%bf-%ce%a6%ce%ac%ce%bb%ce%b7%cf%81%ce%bf', 'gr', 1),
(509858, 782716, 'Κέντρο', '%ce%9a%ce%ad%ce%bd%cf%84%cf%81%ce%bf', 'gr', 1),
(509859, 782716, 'Καστέλα', '%ce%9a%ce%b1%cf%83%cf%84%ce%ad%ce%bb%ce%b1', 'gr', 1),
(509860, 782716, 'Μικρολίμανο', '%ce%9c%ce%b9%ce%ba%cf%81%ce%bf%ce%bb%ce%af%ce%bc%ce%b1%ce%bd', 'gr', 1),
(509861, 782716, 'Πασαλιμάνι', '%ce%a0%ce%b1%cf%83%ce%b1%ce%bb%ce%b9%ce%bc%ce%ac%ce%bd%ce%b9', 'gr', 1),
(509862, 782716, 'Τερψιθέα', '%ce%a4%ce%b5%cf%81%cf%88%ce%b9%ce%b8%ce%ad%ce%b1', 'gr', 1),
(509863, 782716, 'Φρεαττύδα', '%ce%a6%cf%81%ce%b5%ce%b1%cf%84%cf%84%cf%8d%ce%b4%ce%b1', 'gr', 1),
(509864, 782716, 'Άγιος Βασίλειος', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%92%ce%b1%cf%83%ce%af%ce%b', 'gr', 1),
(509865, 782716, 'Χατζηκυριάκειο', '%ce%a7%ce%b1%cf%84%ce%b6%ce%b7%ce%ba%cf%85%cf%81%ce%b9%ce%ac', 'gr', 1),
(509866, 782716, 'Πειραική', '%ce%a0%ce%b5%ce%b9%cf%81%ce%b1%ce%b9%ce%ba%ce%ae', 'gr', 1),
(509867, 782716, 'Καλλίπολη', '%ce%9a%ce%b1%ce%bb%ce%bb%ce%af%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(509868, 782717, 'Αριδαία', '%ce%91%cf%81%ce%b9%ce%b4%ce%b1%ce%af%ce%b1', 'gr', 1),
(509869, 782717, 'Γιαννιτσά', '%ce%93%ce%b9%ce%b1%ce%bd%ce%bd%ce%b9%cf%84%cf%83%ce%ac', 'gr', 1),
(509870, 782717, 'Εξαπλάτανος', '%ce%95%ce%be%ce%b1%cf%80%ce%bb%ce%ac%cf%84%ce%b1%ce%bd%ce%bf', 'gr', 1),
(509871, 782717, 'Κύρρου', '%ce%9a%cf%8d%cf%81%cf%81%ce%bf%cf%85', 'gr', 1),
(509872, 782717, 'Μενηίδος', '%ce%9c%ce%b5%ce%bd%ce%b7%ce%af%ce%b4%ce%bf%cf%82', 'gr', 1),
(509873, 782717, 'Σκύδρα', '%ce%a3%ce%ba%cf%8d%ce%b4%cf%81%ce%b1', 'gr', 1),
(509874, 782717, 'Βεγορίτιδα', '%ce%92%ce%b5%ce%b3%ce%bf%cf%81%ce%af%cf%84%ce%b9%ce%b4%ce%b1', 'gr', 1),
(509875, 782717, 'Έδεσσα', '%ce%88%ce%b4%ce%b5%cf%83%cf%83%ce%b1', 'gr', 1),
(509876, 782717, 'Κρύα Βρύση', '%ce%9a%cf%81%cf%8d%ce%b1-%ce%92%cf%81%cf%8d%cf%83%ce%b7', 'gr', 1),
(509877, 782717, 'Μέγας Αλέξανδρος', '%ce%9c%ce%ad%ce%b3%ce%b1%cf%82-%ce%91%ce%bb%ce%ad%ce%be%ce%b', 'gr', 1),
(509878, 782717, 'Πέλλα', '%ce%a0%ce%ad%ce%bb%ce%bb%ce%b1', 'gr', 1),
(509879, 782718, 'Άβδηρα', '%ce%86%ce%b2%ce%b4%ce%b7%cf%81%ce%b1', 'gr', 1),
(509880, 782718, 'Θέρμες', '%ce%98%ce%ad%cf%81%ce%bc%ce%b5%cf%82', 'gr', 1),
(509881, 782718, 'Μύκη', '%ce%9c%cf%8d%ce%ba%ce%b7', 'gr', 1),
(509882, 782718, 'Σάτρες', '%ce%a3%ce%ac%cf%84%cf%81%ce%b5%cf%82', 'gr', 1),
(509883, 782718, 'Σταυρούπολη', '%ce%a3%cf%84%ce%b1%cf%85%cf%81%ce%bf%cf%8d%cf%80%ce%bf%ce%bb', 'gr', 1),
(509884, 782718, 'Βιστωνίδα', '%ce%92%ce%b9%cf%83%cf%84%cf%89%ce%bd%ce%af%ce%b4%ce%b1', 'gr', 1),
(509885, 782718, 'Κοτύλη', '%ce%9a%ce%bf%cf%84%cf%8d%ce%bb%ce%b7', 'gr', 1),
(509886, 782718, 'Ξάνθη', '%ce%9e%ce%ac%ce%bd%ce%b8%ce%b7', 'gr', 1),
(509887, 782718, 'Σέλερο', '%ce%a3%ce%ad%ce%bb%ce%b5%cf%81%ce%bf', 'gr', 1),
(509888, 782718, 'Τόπειρος', '%ce%a4%cf%8c%cf%80%ce%b5%ce%b9%cf%81%ce%bf%cf%82', 'gr', 1),
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
(509917, 782719, 'Τήνος', '%ce%a4%ce%ae%ce%bd%ce%bf%cf%82', 'gr', 1),
(509918, 782720, 'Αλεξάνδρεια', '%ce%91%ce%bb%ce%b5%ce%be%ce%ac%ce%bd%ce%b4%cf%81%ce%b5%ce%b9', 'gr', 1),
(509919, 782720, 'Αντιγονίδες', '%ce%91%ce%bd%cf%84%ce%b9%ce%b3%ce%bf%ce%bd%ce%af%ce%b4%ce%b5', 'gr', 1),
(509920, 782720, 'Βεργίνα', '%ce%92%ce%b5%cf%81%ce%b3%ce%af%ce%bd%ce%b1', 'gr', 1),
(509921, 782720, 'Δορβάς', '%ce%94%ce%bf%cf%81%ce%b2%ce%ac%cf%82', 'gr', 1),
(509922, 782720, 'Μακεδονίδα', '%ce%9c%ce%b1%ce%ba%ce%b5%ce%b4%ce%bf%ce%bd%ce%af%ce%b4%ce%b1', 'gr', 1),
(509923, 782720, 'Νάουσα', '%ce%9d%ce%ac%ce%bf%cf%85%cf%83%ce%b1', 'gr', 1),
(509924, 782720, 'Ανθεμίων', '%ce%91%ce%bd%ce%b8%ce%b5%ce%bc%ce%af%cf%89%ce%bd', 'gr', 1),
(509925, 782720, 'Απόστολος Παύλος', '%ce%91%cf%80%cf%8c%cf%83%cf%84%ce%bf%ce%bb%ce%bf%cf%82-%ce%a', 'gr', 1),
(509926, 782720, 'Βέροια', '%ce%92%ce%ad%cf%81%ce%bf%ce%b9%ce%b1', 'gr', 1),
(509927, 782720, 'Ειρηνούπολη', '%ce%95%ce%b9%cf%81%ce%b7%ce%bd%ce%bf%cf%8d%cf%80%ce%bf%ce%bb', 'gr', 1),
(509928, 782720, 'Μελίκη', '%ce%9c%ce%b5%ce%bb%ce%af%ce%ba%ce%b7', 'gr', 1),
(509929, 782720, 'Πλατύ', '%ce%a0%ce%bb%ce%b1%cf%84%cf%8d', 'gr', 1),
(509930, 782721, 'Κάλαμος', '%ce%9a%ce%ac%ce%bb%ce%b1%ce%bc%ce%bf%cf%82', 'gr', 1),
(509931, 782721, 'Λευκάδα - Απολλωνίων', '%ce%9b%ce%b5%cf%85%ce%ba%ce%ac%ce%b4%ce%b1-%ce%91%cf%80%ce%b', 'gr', 1),
(509932, 782721, 'Λευκάδα - Καρυά', '%ce%9b%ce%b5%cf%85%ce%ba%ce%ac%ce%b4%ce%b1-%ce%9a%ce%b1%cf%8', 'gr', 1),
(509933, 782721, 'Λευκάδα - Σφακιώτες', '%ce%9b%ce%b5%cf%85%ce%ba%ce%ac%ce%b4%ce%b1-%ce%a3%cf%86%ce%b', 'gr', 1),
(509934, 782721, 'Λευκάδα - Ελλομένος', '%ce%9b%ce%b5%cf%85%ce%ba%ce%ac%ce%b4%ce%b1-%ce%95%ce%bb%ce%b', 'gr', 1),
(509935, 782721, 'Λευκάδα - Κέντρο', '%ce%9b%ce%b5%cf%85%ce%ba%ce%ac%ce%b4%ce%b1-%ce%9a%ce%ad%ce%b', 'gr', 1),
(509936, 782721, 'Μεγανήσι', '%ce%9c%ce%b5%ce%b3%ce%b1%ce%bd%ce%ae%cf%83%ce%b9', 'gr', 1),
(509937, 782721, 'Καστός', '%ce%9a%ce%b1%cf%83%cf%84%cf%8c%cf%82', 'gr', 1),
(509938, 782722, 'Αλεξανδρούπολη', '%ce%91%ce%bb%ce%b5%ce%be%ce%b1%ce%bd%ce%b4%cf%81%ce%bf%cf%8d', 'gr', 1),
(509939, 782722, 'Διδυμότειχο', '%ce%94%ce%b9%ce%b4%cf%85%ce%bc%cf%8c%cf%84%ce%b5%ce%b9%cf%87', 'gr', 1),
(509940, 782722, 'Μεταξάδες', '%ce%9c%ce%b5%cf%84%ce%b1%ce%be%ce%ac%ce%b4%ce%b5%cf%82', 'gr', 1),
(509941, 782722, 'Ορφέας', '%ce%9f%cf%81%cf%86%ce%ad%ce%b1%cf%82', 'gr', 1),
(509942, 782722, 'Σουφλί', '%ce%a3%ce%bf%cf%85%cf%86%ce%bb%ce%af', 'gr', 1),
(509943, 782722, 'Τρίγωνο', '%ce%a4%cf%81%ce%af%ce%b3%cf%89%ce%bd%ce%bf', 'gr', 1),
(509944, 782722, 'Φέρες', '%ce%a6%ce%ad%cf%81%ce%b5%cf%82', 'gr', 1),
(509945, 782722, 'Βύσσα', '%ce%92%cf%8d%cf%83%cf%83%ce%b1', 'gr', 1),
(509946, 782722, 'Κυπρίνος', '%ce%9a%cf%85%cf%80%cf%81%ce%af%ce%bd%ce%bf%cf%82', 'gr', 1),
(509947, 782722, 'Ορεστιάδα', '%ce%9f%cf%81%ce%b5%cf%83%cf%84%ce%b9%ce%ac%ce%b4%ce%b1', 'gr', 1),
(509948, 782722, 'Σαμοθράκη', '%ce%a3%ce%b1%ce%bc%ce%bf%ce%b8%cf%81%ce%ac%ce%ba%ce%b7', 'gr', 1),
(509949, 782722, 'Τραϊνούπολη', '%ce%a4%cf%81%ce%b1%cf%8a%ce%bd%ce%bf%cf%8d%cf%80%ce%bf%ce%bb', 'gr', 1),
(509950, 782722, 'Τυχερό', '%ce%a4%cf%85%cf%87%ce%b5%cf%81%cf%8c', 'gr', 1),
(509951, 782723, 'Ερεικούσα', '%ce%95%cf%81%ce%b5%ce%b9%ce%ba%ce%bf%cf%8d%cf%83%ce%b1', 'gr', 1),
(509952, 782723, 'Οθωνοί', '%ce%9f%ce%b8%cf%89%ce%bd%ce%bf%ce%af', 'gr', 1),
(509953, 782723, 'Μαθράκι', '%ce%9c%ce%b1%ce%b8%cf%81%ce%ac%ce%ba%ce%b9', 'gr', 1),
(509954, 782723, 'Παξοί', '%ce%a0%ce%b1%ce%be%ce%bf%ce%af', 'gr', 1),
(509955, 782723, 'Κέρκυρα - Άγ. Γεώργιος', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%86%ce%b3-%ce%', 'gr', 1),
(509956, 782723, 'Κέρκυρα - Αχίλλειο', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%91%cf%87%ce%a', 'gr', 1),
(509957, 782723, 'Κέρκυρα - Θινάλιο', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%98%ce%b9%ce%b', 'gr', 1),
(509958, 782723, 'Κέρκυρα - Κορισσιών', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%9a%ce%bf%cf%8', 'gr', 1),
(509959, 782723, 'Κέρκυρα - Μελιτειέων', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%9c%ce%b5%ce%b', 'gr', 1),
(509960, 782723, 'Κέρκυρα - Παρέλια', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%a0%ce%b1%cf%8', 'gr', 1),
(509961, 782723, 'Κέρκυρα - Φαίακες', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%a6%ce%b1%ce%a', 'gr', 1),
(509962, 782723, 'Κέρκυρα - Εσπερίων', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%95%cf%83%cf%8', 'gr', 1),
(509963, 782723, 'Κέρκυρα - Κασσωπαίων', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%9a%ce%b1%cf%8', 'gr', 1),
(509964, 782723, 'Κέρκυρα - Λευκίμμη', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%9b%ce%b5%cf%8', 'gr', 1),
(509965, 782723, 'Κέρκυρα - Παλαιοκαστρίτσα', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%a0%ce%b1%ce%b', 'gr', 1),
(509966, 782723, 'Κέρκυρα - Πόλη / Περίχωρα', '%ce%9a%ce%ad%cf%81%ce%ba%cf%85%cf%81%ce%b1-%ce%a0%cf%8c%ce%b', 'gr', 1),
(509967, 782724, 'Ακραίφνιο', '%ce%91%ce%ba%cf%81%ce%b1%ce%af%cf%86%ce%bd%ce%b9%ce%bf', 'gr', 1),
(509968, 782724, 'Αντίκυρα', '%ce%91%ce%bd%cf%84%ce%af%ce%ba%cf%85%cf%81%ce%b1', 'gr', 1),
(509969, 782724, 'Βάγια', '%ce%92%ce%ac%ce%b3%ce%b9%ce%b1', 'gr', 1),
(509970, 782724, 'Δερβενοχώρια', '%ce%94%ce%b5%cf%81%ce%b2%ce%b5%ce%bd%ce%bf%cf%87%cf%8e%cf%81', 'gr', 1),
(509971, 782724, 'Θεσπιές', '%ce%98%ce%b5%cf%83%cf%80%ce%b9%ce%ad%cf%82', 'gr', 1),
(509972, 782724, 'Θίσβη', '%ce%98%ce%af%cf%83%ce%b2%ce%b7', 'gr', 1),
(509973, 782724, 'Κυριάκι', '%ce%9a%cf%85%cf%81%ce%b9%ce%ac%ce%ba%ce%b9', 'gr', 1),
(509974, 782724, 'Οινόφυτα', '%ce%9f%ce%b9%ce%bd%cf%8c%cf%86%cf%85%cf%84%ce%b1', 'gr', 1),
(509975, 782724, 'Πλαταιές', '%ce%a0%ce%bb%ce%b1%cf%84%ce%b1%ce%b9%ce%ad%cf%82', 'gr', 1),
(509976, 782724, 'Τανάγρα', '%ce%a4%ce%b1%ce%bd%ce%ac%ce%b3%cf%81%ce%b1', 'gr', 1),
(509977, 782724, 'Αλίατρος', '%ce%91%ce%bb%ce%af%ce%b1%cf%84%cf%81%ce%bf%cf%82', 'gr', 1),
(509978, 782724, 'Αράχωβα', '%ce%91%cf%81%ce%ac%cf%87%cf%89%ce%b2%ce%b1', 'gr', 1),
(509979, 782724, 'Δαύλεια', '%ce%94%ce%b1%cf%8d%ce%bb%ce%b5%ce%b9%ce%b1', 'gr', 1),
(509980, 782724, 'Δίστομο', '%ce%94%ce%af%cf%83%cf%84%ce%bf%ce%bc%ce%bf', 'gr', 1),
(509981, 782724, 'Θήβα', '%ce%98%ce%ae%ce%b2%ce%b1', 'gr', 1),
(509982, 782724, 'Κορώνεια', '%ce%9a%ce%bf%cf%81%cf%8e%ce%bd%ce%b5%ce%b9%ce%b1', 'gr', 1),
(509983, 782724, 'Λιβαδειά', '%ce%9b%ce%b9%ce%b2%ce%b1%ce%b4%ce%b5%ce%b9%ce%ac', 'gr', 1),
(509984, 782724, 'Ορχομενός', '%ce%9f%cf%81%cf%87%ce%bf%ce%bc%ce%b5%ce%bd%cf%8c%cf%82', 'gr', 1),
(509985, 782724, 'Σχηματάρι', '%ce%a3%cf%87%ce%b7%ce%bc%ce%b1%cf%84%ce%ac%cf%81%ce%b9', 'gr', 1),
(509986, 782724, 'Χαιρωνεία', '%ce%a7%ce%b1%ce%b9%cf%81%cf%89%ce%bd%ce%b5%ce%af%ce%b1', 'gr', 1),
(509987, 782725, 'Ακρωτήρι', '%ce%91%ce%ba%cf%81%cf%89%cf%84%ce%ae%cf%81%ce%b9', 'gr', 1),
(509988, 782725, 'Αρμένοι', '%ce%91%cf%81%ce%bc%ce%ad%ce%bd%ce%bf%ce%b9', 'gr', 1),
(509989, 782725, 'Βάμος', '%ce%92%ce%ac%ce%bc%ce%bf%cf%82', 'gr', 1),
(509990, 782725, 'Γαύδος', '%ce%93%ce%b1%cf%8d%ce%b4%ce%bf%cf%82', 'gr', 1),
(509991, 782725, 'Ελευθ. Βενιζέλος', '%ce%95%ce%bb%ce%b5%cf%85%ce%b8-%ce%92%ce%b5%ce%bd%ce%b9%ce%b', 'gr', 1),
(509992, 782725, 'Ινναχώρι', '%ce%99%ce%bd%ce%bd%ce%b1%cf%87%cf%8e%cf%81%ce%b9', 'gr', 1),
(509993, 782725, 'Κεραμιών', '%ce%9a%ce%b5%cf%81%ce%b1%ce%bc%ce%b9%cf%8e%ce%bd', 'gr', 1),
(509994, 782725, 'Κολυμπάρι', '%ce%9a%ce%bf%ce%bb%cf%85%ce%bc%cf%80%ce%ac%cf%81%ce%b9', 'gr', 1),
(509995, 782725, 'Μούσουρα', '%ce%9c%ce%bf%cf%8d%cf%83%ce%bf%cf%85%cf%81%ce%b1', 'gr', 1),
(509996, 782725, 'Νέα Κυδωνία', '%ce%9d%ce%ad%ce%b1-%ce%9a%cf%85%ce%b4%cf%89%ce%bd%ce%af%ce%b', 'gr', 1),
(509997, 782725, 'Πλατανιάς', '%ce%a0%ce%bb%ce%b1%cf%84%ce%b1%ce%bd%ce%b9%ce%ac%cf%82', 'gr', 1),
(509998, 782725, 'Σφακιά', '%ce%a3%cf%86%ce%b1%ce%ba%ce%b9%ce%ac', 'gr', 1),
(509999, 782725, 'Χανιά', '%ce%a7%ce%b1%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510000, 782725, 'Ανατολ. Σέλινο', '%ce%91%ce%bd%ce%b1%cf%84%ce%bf%ce%bb-%ce%a3%ce%ad%ce%bb%ce%b', 'gr', 1),
(510001, 782725, 'Ασή Γωνιά', '%ce%91%cf%83%ce%ae-%ce%93%cf%89%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510002, 782725, 'Βουκολιές', '%ce%92%ce%bf%cf%85%ce%ba%ce%bf%ce%bb%ce%b9%ce%ad%cf%82', 'gr', 1),
(510003, 782725, 'Γεωργιούπολη', '%ce%93%ce%b5%cf%89%cf%81%ce%b3%ce%b9%ce%bf%cf%8d%cf%80%ce%bf', 'gr', 1),
(510004, 782725, 'Θέρισος', '%ce%98%ce%ad%cf%81%ce%b9%cf%83%ce%bf%cf%82', 'gr', 1),
(510005, 782725, 'Καντάνας', '%ce%9a%ce%b1%ce%bd%cf%84%ce%ac%ce%bd%ce%b1%cf%82', 'gr', 1),
(510006, 782725, 'Κίσσαμος', '%ce%9a%ce%af%cf%83%cf%83%ce%b1%ce%bc%ce%bf%cf%82', 'gr', 1),
(510007, 782725, 'Κρυονερίδα', '%ce%9a%cf%81%cf%85%ce%bf%ce%bd%ce%b5%cf%81%ce%af%ce%b4%ce%b1', 'gr', 1),
(510008, 782725, 'Μύθημνα', '%ce%9c%cf%8d%ce%b8%ce%b7%ce%bc%ce%bd%ce%b1', 'gr', 1),
(510009, 782725, 'Πελεκάνος', '%ce%a0%ce%b5%ce%bb%ce%b5%ce%ba%ce%ac%ce%bd%ce%bf%cf%82', 'gr', 1),
(510010, 782725, 'Σούδα', '%ce%a3%ce%bf%cf%8d%ce%b4%ce%b1', 'gr', 1),
(510011, 782725, 'Φρές', '%ce%a6%cf%81%ce%ad%cf%82', 'gr', 1),
(510012, 782726, 'Αγία Παρασκευή', '%ce%91%ce%b3%ce%af%ce%b1-%ce%a0%ce%b1%cf%81%ce%b1%cf%83%ce%b', 'gr', 1),
(510013, 782726, 'Άσκιο', '%ce%86%cf%83%ce%ba%ce%b9%ce%bf', 'gr', 1),
(510014, 782726, 'Βέρμιο', '%ce%92%ce%ad%cf%81%ce%bc%ce%b9%ce%bf', 'gr', 1),
(510015, 782726, 'Δημ. Υψηλάντης', '%ce%94%ce%b7%ce%bc-%ce%a5%cf%88%ce%b7%ce%bb%ce%ac%ce%bd%cf%8', 'gr', 1),
(510016, 782726, 'Ελλήσποντος', '%ce%95%ce%bb%ce%bb%ce%ae%cf%83%cf%80%ce%bf%ce%bd%cf%84%ce%bf', 'gr', 1),
(510017, 782726, 'Κοζάνη', '%ce%9a%ce%bf%ce%b6%ce%ac%ce%bd%ce%b7', 'gr', 1),
(510018, 782726, 'Μουρίκι', '%ce%9c%ce%bf%cf%85%cf%81%ce%af%ce%ba%ce%b9', 'gr', 1),
(510019, 782726, 'Πεντάλοφος', '%ce%a0%ce%b5%ce%bd%cf%84%ce%ac%ce%bb%ce%bf%cf%86%ce%bf%cf%82', 'gr', 1),
(510020, 782726, 'Σέρβια', '%ce%a3%ce%ad%cf%81%ce%b2%ce%b9%ce%b1', 'gr', 1),
(510021, 782726, 'Τσοτύλι', '%ce%a4%cf%83%ce%bf%cf%84%cf%8d%ce%bb%ce%b9', 'gr', 1),
(510022, 782726, 'Αιανή', '%ce%91%ce%b9%ce%b1%ce%bd%ce%ae', 'gr', 1),
(510023, 782726, 'Βελβεντό', '%ce%92%ce%b5%ce%bb%ce%b2%ce%b5%ce%bd%cf%84%cf%8c', 'gr', 1),
(510024, 782726, 'Βλάστη', '%ce%92%ce%bb%ce%ac%cf%83%cf%84%ce%b7', 'gr', 1),
(510025, 782726, 'Ελίμεια', '%ce%95%ce%bb%ce%af%ce%bc%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510026, 782726, 'Καμβούνια', '%ce%9a%ce%b1%ce%bc%ce%b2%ce%bf%cf%8d%ce%bd%ce%b9%ce%b1', 'gr', 1),
(510027, 782726, 'Λιβαδερό', '%ce%9b%ce%b9%ce%b2%ce%b1%ce%b4%ce%b5%cf%81%cf%8c', 'gr', 1),
(510028, 782726, 'Νεάπολη', '%ce%9d%ce%b5%ce%ac%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(510029, 782726, 'Πτολεμαϊδα', '%ce%a0%cf%84%ce%bf%ce%bb%ce%b5%ce%bc%ce%b1%cf%8a%ce%b4%ce%b1', 'gr', 1),
(510030, 782726, 'Σιάτιστα', '%ce%a3%ce%b9%ce%ac%cf%84%ce%b9%cf%83%cf%84%ce%b1', 'gr', 1),
(510031, 782727, 'Άγ. Νικόλαος', '%ce%86%ce%b3-%ce%9d%ce%b9%ce%ba%cf%8c%ce%bb%ce%b1%ce%bf%cf%8', 'gr', 1),
(510032, 782727, 'Ιεράπετρα', '%ce%99%ce%b5%cf%81%ce%ac%cf%80%ce%b5%cf%84%cf%81%ce%b1', 'gr', 1),
(510033, 782727, 'Λεύκη', '%ce%9b%ce%b5%cf%8d%ce%ba%ce%b7', 'gr', 1),
(510034, 782727, 'Νεάπολη', '%ce%9d%ce%b5%ce%ac%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(510035, 782727, 'Σητεία', '%ce%a3%ce%b7%cf%84%ce%b5%ce%af%ce%b1', 'gr', 1),
(510036, 782727, 'Βραχάσι', '%ce%92%cf%81%ce%b1%cf%87%ce%ac%cf%83%ce%b9', 'gr', 1),
(510037, 782727, 'Ίτανος', '%ce%8a%cf%84%ce%b1%ce%bd%ce%bf%cf%82', 'gr', 1),
(510038, 782727, 'Μακρύς Γιαλός', '%ce%9c%ce%b1%ce%ba%cf%81%cf%8d%cf%82-%ce%93%ce%b9%ce%b1%ce%b', 'gr', 1),
(510039, 782727, 'Οροπέδιο Λασιθίου', '%ce%9f%cf%81%ce%bf%cf%80%ce%ad%ce%b4%ce%b9%ce%bf-%ce%9b%ce%b', 'gr', 1),
(510040, 782728, 'Ιθάκη', '%ce%99%ce%b8%ce%ac%ce%ba%ce%b7', 'gr', 1),
(510041, 782728, 'Κεφαλλονιά-Ελειού-Πρόνων', '%ce%9a%ce%b5%cf%86%ce%b1%ce%bb%ce%bb%ce%bf%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510042, 782728, 'Κεφαλλονιά - Λειβαθού', '%ce%9a%ce%b5%cf%86%ce%b1%ce%bb%ce%bb%ce%bf%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510043, 782728, 'Κεφαλλονιά - Παλική', '%ce%9a%ce%b5%cf%86%ce%b1%ce%bb%ce%bb%ce%bf%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510044, 782728, 'Κεφαλλονιά - Σάμη', '%ce%9a%ce%b5%cf%86%ce%b1%ce%bb%ce%bb%ce%bf%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510045, 782728, 'Κεφαλλονιά - Αργοστόλι', '%ce%9a%ce%b5%cf%86%ce%b1%ce%bb%ce%bb%ce%bf%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510046, 782728, 'Κεφαλλονιά - Ερισού', '%ce%9a%ce%b5%cf%86%ce%b1%ce%bb%ce%bb%ce%bf%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510047, 782728, 'Κεφαλλονιά - Ομαλά', '%ce%9a%ce%b5%cf%86%ce%b1%ce%bb%ce%bb%ce%bf%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510048, 782728, 'Κεφαλλονιά - Πύλαρος', '%ce%9a%ce%b5%cf%86%ce%b1%ce%bb%ce%bb%ce%bf%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510049, 782729, 'Ζάκυνθος - Αλυκές', '%ce%96%ce%ac%ce%ba%cf%85%ce%bd%ce%b8%ce%bf%cf%82-%ce%91%ce%b', 'gr', 1),
(510050, 782729, 'Ζάκυνθος - Αρτεμισίων', '%ce%96%ce%ac%ce%ba%cf%85%ce%bd%ce%b8%ce%bf%cf%82-%ce%91%cf%8', 'gr', 1),
(510051, 782729, 'Ζάκυνθος - Λαγανάς', '%ce%96%ce%ac%ce%ba%cf%85%ce%bd%ce%b8%ce%bf%cf%82-%ce%9b%ce%b', 'gr', 1),
(510052, 782729, 'Ζάκυνθος - Αρκαδίων', '%ce%96%ce%ac%ce%ba%cf%85%ce%bd%ce%b8%ce%bf%cf%82-%ce%91%cf%8', 'gr', 1),
(510053, 782729, 'Ζάκυνθος - Ελατιών', '%ce%96%ce%ac%ce%ba%cf%85%ce%bd%ce%b8%ce%bf%cf%82-%ce%95%ce%b', 'gr', 1),
(510054, 782729, 'Ζάκυνθος - Πόλη', '%ce%96%ce%ac%ce%ba%cf%85%ce%bd%ce%b8%ce%bf%cf%82-%ce%a0%cf%8', 'gr', 1),
(510055, 782730, 'Αιγίνιο', '%ce%91%ce%b9%ce%b3%ce%af%ce%bd%ce%b9%ce%bf', 'gr', 1),
(510056, 782730, 'Δίον', '%ce%94%ce%af%ce%bf%ce%bd', 'gr', 1),
(510057, 782730, 'Κατερίνη', '%ce%9a%ce%b1%cf%84%ce%b5%cf%81%ce%af%ce%bd%ce%b7', 'gr', 1),
(510058, 782730, 'Κορινός', '%ce%9a%ce%bf%cf%81%ce%b9%ce%bd%cf%8c%cf%82', 'gr', 1),
(510059, 782730, 'Μεθώνη', '%ce%9c%ce%b5%ce%b8%cf%8e%ce%bd%ce%b7', 'gr', 1),
(510060, 782730, 'Πέτρα', '%ce%a0%ce%ad%cf%84%cf%81%ce%b1', 'gr', 1),
(510061, 782730, 'Πύδνα', '%ce%a0%cf%8d%ce%b4%ce%bd%ce%b1', 'gr', 1),
(510062, 782730, 'Ανατ. Όλυμπος', '%ce%91%ce%bd%ce%b1%cf%84-%ce%8c%ce%bb%cf%85%ce%bc%cf%80%ce%b', 'gr', 1),
(510063, 782730, 'Ελαφίνα', '%ce%95%ce%bb%ce%b1%cf%86%ce%af%ce%bd%ce%b1', 'gr', 1),
(510064, 782730, 'Κολινδρός', '%ce%9a%ce%bf%ce%bb%ce%b9%ce%bd%ce%b4%cf%81%cf%8c%cf%82', 'gr', 1),
(510065, 782730, 'Λιτόχωρο', '%ce%9b%ce%b9%cf%84%cf%8c%cf%87%cf%89%cf%81%ce%bf', 'gr', 1),
(510066, 782730, 'Παραλία', '%ce%a0%ce%b1%cf%81%ce%b1%ce%bb%ce%af%ce%b1', 'gr', 1),
(510067, 782731, 'Ελευθερούπολη', '%ce%95%ce%bb%ce%b5%cf%85%ce%b8%ce%b5%cf%81%ce%bf%cf%8d%cf%80', 'gr', 1),
(510068, 782731, 'Θάσος', '%ce%98%ce%ac%cf%83%ce%bf%cf%82', 'gr', 1),
(510069, 782731, 'Κεραμωτή', '%ce%9a%ce%b5%cf%81%ce%b1%ce%bc%cf%89%cf%84%ce%ae', 'gr', 1),
(510070, 782731, 'Ορφανό', '%ce%9f%cf%81%cf%86%ce%b1%ce%bd%cf%8c', 'gr', 1),
(510071, 782731, 'Πιερέων', '%ce%a0%ce%b9%ce%b5%cf%81%ce%ad%cf%89%ce%bd', 'gr', 1),
(510072, 782731, 'Χρυσούπολη', '%ce%a7%cf%81%cf%85%cf%83%ce%bf%cf%8d%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(510073, 782731, 'Ελευθερών', '%ce%95%ce%bb%ce%b5%cf%85%ce%b8%ce%b5%cf%81%cf%8e%ce%bd', 'gr', 1),
(510074, 782731, 'Καβάλα', '%ce%9a%ce%b1%ce%b2%ce%ac%ce%bb%ce%b1', 'gr', 1),
(510075, 782731, 'Ορεινό', '%ce%9f%cf%81%ce%b5%ce%b9%ce%bd%cf%8c', 'gr', 1),
(510076, 782731, 'Παγγαίο', '%ce%a0%ce%b1%ce%b3%ce%b3%ce%b1%ce%af%ce%bf', 'gr', 1),
(510077, 782731, 'Φίλιπποι', '%ce%a6%ce%af%ce%bb%ce%b9%cf%80%cf%80%ce%bf%ce%b9', 'gr', 1),
(510078, 782732, 'Αβδέλλα', '%ce%91%ce%b2%ce%b4%ce%ad%ce%bb%ce%bb%ce%b1', 'gr', 1),
(510079, 782732, 'Γόργιανη', '%ce%93%cf%8c%cf%81%ce%b3%ce%b9%ce%b1%ce%bd%ce%b7', 'gr', 1),
(510080, 782732, 'Δεσκάτη', '%ce%94%ce%b5%cf%83%ce%ba%ce%ac%cf%84%ce%b7', 'gr', 1),
(510081, 782732, 'Ηρακλειωτών', '%ce%97%cf%81%ce%b1%ce%ba%ce%bb%ce%b5%ce%b9%cf%89%cf%84%cf%8e', 'gr', 1),
(510082, 782732, 'Κοσμάς Αιτωλός', '%ce%9a%ce%bf%cf%83%ce%bc%ce%ac%cf%82-%ce%91%ce%b9%cf%84%cf%8', 'gr', 1);
INSERT INTO `oc_t_city` (`pk_i_id`, `fk_i_region_id`, `s_name`, `s_slug`, `fk_c_country_code`, `b_active`) VALUES
(510083, 782732, 'Περιβόλι', '%ce%a0%ce%b5%cf%81%ce%b9%ce%b2%cf%8c%ce%bb%ce%b9', 'gr', 1),
(510084, 782732, 'Σμίξη', '%ce%a3%ce%bc%ce%af%ce%be%ce%b7', 'gr', 1),
(510085, 782732, 'Χάσια', '%ce%a7%ce%ac%cf%83%ce%b9%ce%b1', 'gr', 1),
(510086, 782732, 'Βεντζίου', '%ce%92%ce%b5%ce%bd%cf%84%ce%b6%ce%af%ce%bf%cf%85', 'gr', 1),
(510087, 782732, 'Γρεβενά', '%ce%93%cf%81%ce%b5%ce%b2%ce%b5%ce%bd%ce%ac', 'gr', 1),
(510088, 782732, 'Δότσικο', '%ce%94%cf%8c%cf%84%cf%83%ce%b9%ce%ba%ce%bf', 'gr', 1),
(510089, 782732, 'Θεοδ. Ζιάκα', '%ce%98%ce%b5%ce%bf%ce%b4-%ce%96%ce%b9%ce%ac%ce%ba%ce%b1', 'gr', 1),
(510090, 782732, 'Μεσολούρι', '%ce%9c%ce%b5%cf%83%ce%bf%ce%bb%ce%bf%cf%8d%cf%81%ce%b9', 'gr', 1),
(510091, 782732, 'Σαμαρίνα', '%ce%a3%ce%b1%ce%bc%ce%b1%cf%81%ce%af%ce%bd%ce%b1', 'gr', 1),
(510092, 782732, 'Φιλιππαίοι', '%ce%a6%ce%b9%ce%bb%ce%b9%cf%80%cf%80%ce%b1%ce%af%ce%bf%ce%b9', 'gr', 1),
(510093, 782733, 'Αίγειρος', '%ce%91%ce%af%ce%b3%ce%b5%ce%b9%cf%81%ce%bf%cf%82', 'gr', 1),
(510094, 782733, 'Αρριανά', '%ce%91%cf%81%cf%81%ce%b9%ce%b1%ce%bd%ce%ac', 'gr', 1),
(510095, 782733, 'Κέχρος', '%ce%9a%ce%ad%cf%87%cf%81%ce%bf%cf%82', 'gr', 1),
(510096, 782733, 'Μαρώνια', '%ce%9c%ce%b1%cf%81%cf%8e%ce%bd%ce%b9%ce%b1', 'gr', 1),
(510097, 782733, 'Οργάνη', '%ce%9f%cf%81%ce%b3%ce%ac%ce%bd%ce%b7', 'gr', 1),
(510098, 782733, 'Σώστης', '%ce%a3%cf%8e%cf%83%cf%84%ce%b7%cf%82', 'gr', 1),
(510099, 782733, 'Αμαξάδες', '%ce%91%ce%bc%ce%b1%ce%be%ce%ac%ce%b4%ce%b5%cf%82', 'gr', 1),
(510100, 782733, 'Ίασμος', '%ce%8a%ce%b1%cf%83%ce%bc%ce%bf%cf%82', 'gr', 1),
(510101, 782733, 'Κομοτηνή', '%ce%9a%ce%bf%ce%bc%ce%bf%cf%84%ce%b7%ce%bd%ce%ae', 'gr', 1),
(510102, 782733, 'Νέο Σιδηροχώρι', '%ce%9d%ce%ad%ce%bf-%ce%a3%ce%b9%ce%b4%ce%b7%cf%81%ce%bf%cf%8', 'gr', 1),
(510103, 782733, 'Σάπες', '%ce%a3%ce%ac%cf%80%ce%b5%cf%82', 'gr', 1),
(510104, 782733, 'Φιλλύρα', '%ce%a6%ce%b9%ce%bb%ce%bb%cf%8d%cf%81%ce%b1', 'gr', 1),
(510105, 782734, 'Δοξάτο', '%ce%94%ce%bf%ce%be%ce%ac%cf%84%ce%bf', 'gr', 1),
(510106, 782734, 'Καλαμπάκι', '%ce%9a%ce%b1%ce%bb%ce%b1%ce%bc%cf%80%ce%ac%ce%ba%ce%b9', 'gr', 1),
(510107, 782734, 'Νικηφόρος', '%ce%9d%ce%b9%ce%ba%ce%b7%cf%86%cf%8c%cf%81%ce%bf%cf%82', 'gr', 1),
(510108, 782734, 'Προσοτσάνη', '%ce%a0%cf%81%ce%bf%cf%83%ce%bf%cf%84%cf%83%ce%ac%ce%bd%ce%b7', 'gr', 1),
(510109, 782734, 'Σιταγροί', '%ce%a3%ce%b9%cf%84%ce%b1%ce%b3%cf%81%ce%bf%ce%af', 'gr', 1),
(510110, 782734, 'Δράμα', '%ce%94%cf%81%ce%ac%ce%bc%ce%b1', 'gr', 1),
(510111, 782734, 'Κάτω Νευροκόπι', '%ce%9a%ce%ac%cf%84%cf%89-%ce%9d%ce%b5%cf%85%cf%81%ce%bf%ce%b', 'gr', 1),
(510112, 782734, 'Παρανέστι', '%ce%a0%ce%b1%cf%81%ce%b1%ce%bd%ce%ad%cf%83%cf%84%ce%b9', 'gr', 1),
(510113, 782734, 'Σιδηρόνερο', '%ce%a3%ce%b9%ce%b4%ce%b7%cf%81%cf%8c%ce%bd%ce%b5%cf%81%ce%bf', 'gr', 1),
(510114, 782735, 'Αξιούπολη', '%ce%91%ce%be%ce%b9%ce%bf%cf%8d%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(510115, 782735, 'Γουμένισσα', '%ce%93%ce%bf%cf%85%ce%bc%ce%ad%ce%bd%ce%b9%cf%83%cf%83%ce%b1', 'gr', 1),
(510116, 782735, 'Ευρωπός', '%ce%95%cf%85%cf%81%cf%89%cf%80%cf%8c%cf%82', 'gr', 1),
(510117, 782735, 'Κρουσσών', '%ce%9a%cf%81%ce%bf%cf%85%cf%83%cf%83%cf%8e%ce%bd', 'gr', 1),
(510118, 782735, 'Μουριές', '%ce%9c%ce%bf%cf%85%cf%81%ce%b9%ce%ad%cf%82', 'gr', 1),
(510119, 782735, 'Πολύκαστρο', '%ce%a0%ce%bf%ce%bb%cf%8d%ce%ba%ce%b1%cf%83%cf%84%cf%81%ce%bf', 'gr', 1),
(510120, 782735, 'Γαλλικός', '%ce%93%ce%b1%ce%bb%ce%bb%ce%b9%ce%ba%cf%8c%cf%82', 'gr', 1),
(510121, 782735, 'Δοϊράνη', '%ce%94%ce%bf%cf%8a%cf%81%ce%ac%ce%bd%ce%b7', 'gr', 1),
(510122, 782735, 'Κιλκίς', '%ce%9a%ce%b9%ce%bb%ce%ba%ce%af%cf%82', 'gr', 1),
(510123, 782735, 'Λιβάδια', '%ce%9b%ce%b9%ce%b2%ce%ac%ce%b4%ce%b9%ce%b1', 'gr', 1),
(510124, 782735, 'Πικρολίμνη', '%ce%a0%ce%b9%ce%ba%cf%81%ce%bf%ce%bb%ce%af%ce%bc%ce%bd%ce%b7', 'gr', 1),
(510125, 782735, 'Χέρσο', '%ce%a7%ce%ad%cf%81%cf%83%ce%bf', 'gr', 1),
(510126, 782736, 'Ικαρία - Άγ. Κήρυκος', '%ce%99%ce%ba%ce%b1%cf%81%ce%af%ce%b1-%ce%86%ce%b3-%ce%9a%ce%', 'gr', 1),
(510127, 782736, 'Ικαρία - Ράχες', '%ce%99%ce%ba%ce%b1%cf%81%ce%af%ce%b1-%ce%a1%ce%ac%cf%87%ce%b', 'gr', 1),
(510128, 782736, 'Ικαρία - Εύδηλος', '%ce%99%ce%ba%ce%b1%cf%81%ce%af%ce%b1-%ce%95%cf%8d%ce%b4%ce%b', 'gr', 1),
(510129, 782736, 'Φούρνοι Κορσεών', '%ce%a6%ce%bf%cf%8d%cf%81%ce%bd%ce%bf%ce%b9-%ce%9a%ce%bf%cf%8', 'gr', 1),
(510130, 782736, 'Σάμος - Καρλόβασι', '%ce%a3%ce%ac%ce%bc%ce%bf%cf%82-%ce%9a%ce%b1%cf%81%ce%bb%cf%8', 'gr', 1),
(510131, 782736, 'Σάμος - Πυθαγόρειο', '%ce%a3%ce%ac%ce%bc%ce%bf%cf%82-%ce%a0%cf%85%ce%b8%ce%b1%ce%b', 'gr', 1),
(510132, 782736, 'Σάμος - Μαραθόκαμπος', '%ce%a3%ce%ac%ce%bc%ce%bf%cf%82-%ce%9c%ce%b1%cf%81%ce%b1%ce%b', 'gr', 1),
(510133, 782736, 'Σάμος - Βαθύ', '%ce%a3%ce%ac%ce%bc%ce%bf%cf%82-%ce%92%ce%b1%ce%b8%cf%8d', 'gr', 1),
(510134, 782737, 'Ανώγεια', '%ce%91%ce%bd%cf%8e%ce%b3%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510135, 782737, 'Γεροπόταμος', '%ce%93%ce%b5%cf%81%ce%bf%cf%80%cf%8c%cf%84%ce%b1%ce%bc%ce%bf', 'gr', 1),
(510136, 782737, 'Κουλούκωνας', '%ce%9a%ce%bf%cf%85%ce%bb%ce%bf%cf%8d%ce%ba%cf%89%ce%bd%ce%b1', 'gr', 1),
(510137, 782737, 'Λάμπη', '%ce%9b%ce%ac%ce%bc%cf%80%ce%b7', 'gr', 1),
(510138, 782737, 'Νικ. Φωκάς', '%ce%9d%ce%b9%ce%ba-%ce%a6%cf%89%ce%ba%ce%ac%cf%82', 'gr', 1),
(510139, 782737, 'Σύβριτος', '%ce%a3%cf%8d%ce%b2%cf%81%ce%b9%cf%84%ce%bf%cf%82', 'gr', 1),
(510140, 782737, 'Αρκάδι', '%ce%91%cf%81%ce%ba%ce%ac%ce%b4%ce%b9', 'gr', 1),
(510141, 782737, 'Ζωνιανά', '%ce%96%cf%89%ce%bd%ce%b9%ce%b1%ce%bd%ce%ac', 'gr', 1),
(510142, 782737, 'Κουρήτες', '%ce%9a%ce%bf%cf%85%cf%81%ce%ae%cf%84%ce%b5%cf%82', 'gr', 1),
(510143, 782737, 'Λαππαίων', '%ce%9b%ce%b1%cf%80%cf%80%ce%b1%ce%af%cf%89%ce%bd', 'gr', 1),
(510144, 782737, 'Ρέθυμνο', '%ce%a1%ce%ad%ce%b8%cf%85%ce%bc%ce%bd%ce%bf', 'gr', 1),
(510145, 782737, 'Φοίνικας', '%ce%a6%ce%bf%ce%af%ce%bd%ce%b9%ce%ba%ce%b1%cf%82', 'gr', 1),
(510146, 782738, 'Αιδηψός', '%ce%91%ce%b9%ce%b4%ce%b7%cf%88%cf%8c%cf%82', 'gr', 1),
(510147, 782738, 'Ανθηδώνα', '%ce%91%ce%bd%ce%b8%ce%b7%ce%b4%cf%8e%ce%bd%ce%b1', 'gr', 1),
(510148, 782738, 'Αυλίδα', '%ce%91%cf%85%ce%bb%ce%af%ce%b4%ce%b1', 'gr', 1),
(510149, 782738, 'Δίρφυς', '%ce%94%ce%af%cf%81%cf%86%cf%85%cf%82', 'gr', 1),
(510150, 782738, 'Ελύμνιο', '%ce%95%ce%bb%cf%8d%ce%bc%ce%bd%ce%b9%ce%bf', 'gr', 1),
(510151, 782738, 'Ιστιαία', '%ce%99%cf%83%cf%84%ce%b9%ce%b1%ce%af%ce%b1', 'gr', 1),
(510152, 782738, 'Καφηρέας', '%ce%9a%ce%b1%cf%86%ce%b7%cf%81%ce%ad%ce%b1%cf%82', 'gr', 1),
(510153, 782738, 'Κόνιστρες', '%ce%9a%cf%8c%ce%bd%ce%b9%cf%83%cf%84%cf%81%ce%b5%cf%82', 'gr', 1),
(510154, 782738, 'Ληλάντια', '%ce%9b%ce%b7%ce%bb%ce%ac%ce%bd%cf%84%ce%b9%ce%b1', 'gr', 1),
(510155, 782738, 'Μαρμάρι', '%ce%9c%ce%b1%cf%81%ce%bc%ce%ac%cf%81%ce%b9', 'gr', 1),
(510156, 782738, 'Νέα Αρτάκη', '%ce%9d%ce%ad%ce%b1-%ce%91%cf%81%cf%84%ce%ac%ce%ba%ce%b7', 'gr', 1),
(510157, 782738, 'Σκύρος', '%ce%a3%ce%ba%cf%8d%cf%81%ce%bf%cf%82', 'gr', 1),
(510158, 782738, 'Ταμιναίοι', '%ce%a4%ce%b1%ce%bc%ce%b9%ce%bd%ce%b1%ce%af%ce%bf%ce%b9', 'gr', 1),
(510159, 782738, 'Ωραεοί', '%ce%a9%cf%81%ce%b1%ce%b5%ce%bf%ce%af', 'gr', 1),
(510160, 782738, 'Αμάρυνθος', '%ce%91%ce%bc%ce%ac%cf%81%cf%85%ce%bd%ce%b8%ce%bf%cf%82', 'gr', 1),
(510161, 782738, 'Αρτεμίσιο', '%ce%91%cf%81%cf%84%ce%b5%ce%bc%ce%af%cf%83%ce%b9%ce%bf', 'gr', 1),
(510162, 782738, 'Αυλώνα', '%ce%91%cf%85%ce%bb%cf%8e%ce%bd%ce%b1', 'gr', 1),
(510163, 782738, 'Δύστος', '%ce%94%cf%8d%cf%83%cf%84%ce%bf%cf%82', 'gr', 1),
(510164, 782738, 'Ερέτρια', '%ce%95%cf%81%ce%ad%cf%84%cf%81%ce%b9%ce%b1', 'gr', 1),
(510165, 782738, 'Κάρυστος', '%ce%9a%ce%ac%cf%81%cf%85%cf%83%cf%84%ce%bf%cf%82', 'gr', 1),
(510166, 782738, 'Κηρεάς', '%ce%9a%ce%b7%cf%81%ce%b5%ce%ac%cf%82', 'gr', 1),
(510167, 782738, 'Κύμη', '%ce%9a%cf%8d%ce%bc%ce%b7', 'gr', 1),
(510168, 782738, 'Λιχάδα', '%ce%9b%ce%b9%cf%87%ce%ac%ce%b4%ce%b1', 'gr', 1),
(510169, 782738, 'Μεσσαπία', '%ce%9c%ce%b5%cf%83%cf%83%ce%b1%cf%80%ce%af%ce%b1', 'gr', 1),
(510170, 782738, 'Μηλεάς', '%ce%9c%ce%b7%ce%bb%ce%b5%ce%ac%cf%82', 'gr', 1),
(510171, 782738, 'Στύρα', '%ce%a3%cf%84%cf%8d%cf%81%ce%b1', 'gr', 1),
(510172, 782738, 'Χαλκίδα', '%ce%a7%ce%b1%ce%bb%ce%ba%ce%af%ce%b4%ce%b1', 'gr', 1),
(510173, 782739, 'Ανώγειο', '%ce%91%ce%bd%cf%8e%ce%b3%ce%b5%ce%b9%ce%bf', 'gr', 1),
(510174, 782739, 'Θεσπρωτικό', '%ce%98%ce%b5%cf%83%cf%80%cf%81%cf%89%cf%84%ce%b9%ce%ba%cf%8c', 'gr', 1),
(510175, 782739, 'Λούρος', '%ce%9b%ce%bf%cf%8d%cf%81%ce%bf%cf%82', 'gr', 1),
(510176, 782739, 'Πρέβεζα', '%ce%a0%cf%81%ce%ad%ce%b2%ce%b5%ce%b6%ce%b1', 'gr', 1),
(510177, 782739, 'Φιλιππιάδα', '%ce%a6%ce%b9%ce%bb%ce%b9%cf%80%cf%80%ce%b9%ce%ac%ce%b4%ce%b1', 'gr', 1),
(510178, 782739, 'Ζάλογγο', '%ce%96%ce%ac%ce%bb%ce%bf%ce%b3%ce%b3%ce%bf', 'gr', 1),
(510179, 782739, 'Κρανέα', '%ce%9a%cf%81%ce%b1%ce%bd%ce%ad%ce%b1', 'gr', 1),
(510180, 782739, 'Πάργα', '%ce%a0%ce%ac%cf%81%ce%b3%ce%b1', 'gr', 1),
(510181, 782739, 'Φανάρι', '%ce%a6%ce%b1%ce%bd%ce%ac%cf%81%ce%b9', 'gr', 1),
(510182, 782740, 'Άγιος Ευστράτιος', '%ce%86%ce%b3%ce%b9%ce%bf%cf%82-%ce%95%cf%85%cf%83%cf%84%cf%8', 'gr', 1),
(510183, 782740, 'Λέσβος - Αγιάσος', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%91%ce%b3%ce%b9%ce%a', 'gr', 1),
(510184, 782740, 'Λέσβος - Ερεσός - Αντίσσα', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%95%cf%81%ce%b5%cf%8', 'gr', 1),
(510185, 782740, 'Λέσβος - Καλλονή', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%9a%ce%b1%ce%bb%ce%b', 'gr', 1),
(510186, 782740, 'Λέσβος - Μανταμάδος', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%9c%ce%b1%ce%bd%cf%8', 'gr', 1),
(510187, 782740, 'Λέσβος - Μυτιλήνη', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%9c%cf%85%cf%84%ce%b', 'gr', 1),
(510188, 782740, 'Λέσβος - Πλωμάρι', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%a0%ce%bb%cf%89%ce%b', 'gr', 1),
(510189, 782740, 'Λέσβος - Ατσική', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%91%cf%84%cf%83%ce%b', 'gr', 1),
(510190, 782740, 'Λέσβος - Μύρινα', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%9c%cf%8d%cf%81%ce%b', 'gr', 1),
(510191, 782740, 'Λέσβος - Άγ. Παρασκευή', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%86%ce%b3-%ce%a0%ce%', 'gr', 1),
(510192, 782740, 'Λέσβος - Γέρα', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%93%ce%ad%cf%81%ce%b', 'gr', 1),
(510193, 782740, 'Λέσβος - Ευεργέτουλας', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%95%cf%85%ce%b5%cf%8', 'gr', 1),
(510194, 782740, 'Λέσβος - Λουτρ. Θερμής', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%9b%ce%bf%cf%85%cf%8', 'gr', 1),
(510195, 782740, 'Λέσβος - Μήθυμνα (Μόλυβος)', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%9c%ce%ae%ce%b8%cf%8', 'gr', 1),
(510196, 782740, 'Λέσβος - Πέτρα', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%a0%ce%ad%cf%84%cf%8', 'gr', 1),
(510197, 782740, 'Λέσβος - Πολιχνίτος', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%a0%ce%bf%ce%bb%ce%b', 'gr', 1),
(510198, 782740, 'Λέσβος - Μούδρος', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%9c%ce%bf%cf%8d%ce%b', 'gr', 1),
(510199, 782740, 'Λέσβος - Νέα Κούταλη', '%ce%9b%ce%ad%cf%83%ce%b2%ce%bf%cf%82-%ce%9d%ce%ad%ce%b1-%ce%', 'gr', 1),
(510200, 782741, 'Άμφισσα', '%ce%86%ce%bc%cf%86%ce%b9%cf%83%cf%83%ce%b1', 'gr', 1),
(510201, 782741, 'Βαρδούσια', '%ce%92%ce%b1%cf%81%ce%b4%ce%bf%cf%8d%cf%83%ce%b9%ce%b1', 'gr', 1),
(510202, 782741, 'Γαλαξίδι', '%ce%93%ce%b1%ce%bb%ce%b1%ce%be%ce%af%ce%b4%ce%b9', 'gr', 1),
(510203, 782741, 'Γραβιά', '%ce%93%cf%81%ce%b1%ce%b2%ce%b9%ce%ac', 'gr', 1),
(510204, 782741, 'Δελφοί', '%ce%94%ce%b5%ce%bb%cf%86%ce%bf%ce%af', 'gr', 1),
(510205, 782741, 'Δεσφίνα', '%ce%94%ce%b5%cf%83%cf%86%ce%af%ce%bd%ce%b1', 'gr', 1),
(510206, 782741, 'Ευπάλιο', '%ce%95%cf%85%cf%80%ce%ac%ce%bb%ce%b9%ce%bf', 'gr', 1),
(510207, 782741, 'Ιτέα', '%ce%99%cf%84%ce%ad%ce%b1', 'gr', 1),
(510208, 782741, 'Καλλιέων', '%ce%9a%ce%b1%ce%bb%ce%bb%ce%b9%ce%ad%cf%89%ce%bd', 'gr', 1),
(510209, 782741, 'Λιδορίκι', '%ce%9b%ce%b9%ce%b4%ce%bf%cf%81%ce%af%ce%ba%ce%b9', 'gr', 1),
(510210, 782741, 'Παρνασσός', '%ce%a0%ce%b1%cf%81%ce%bd%ce%b1%cf%83%cf%83%cf%8c%cf%82', 'gr', 1),
(510211, 782741, 'Τολοφώντας', '%ce%a4%ce%bf%ce%bb%ce%bf%cf%86%cf%8e%ce%bd%cf%84%ce%b1%cf%82', 'gr', 1),
(510212, 782742, 'Αετός', '%ce%91%ce%b5%cf%84%cf%8c%cf%82', 'gr', 1),
(510213, 782742, 'Βαρικό', '%ce%92%ce%b1%cf%81%ce%b9%ce%ba%cf%8c', 'gr', 1),
(510214, 782742, 'Κρυσταλλοπηγή', '%ce%9a%cf%81%cf%85%cf%83%cf%84%ce%b1%ce%bb%ce%bb%ce%bf%cf%80', 'gr', 1),
(510215, 782742, 'Μελίτη', '%ce%9c%ce%b5%ce%bb%ce%af%cf%84%ce%b7', 'gr', 1),
(510216, 782742, 'Πέρασμα', '%ce%a0%ce%ad%cf%81%ce%b1%cf%83%ce%bc%ce%b1', 'gr', 1),
(510217, 782742, 'Φιλώτας', '%ce%a6%ce%b9%ce%bb%cf%8e%cf%84%ce%b1%cf%82', 'gr', 1),
(510218, 782742, 'Αμύνταιο', '%ce%91%ce%bc%cf%8d%ce%bd%cf%84%ce%b1%ce%b9%ce%bf', 'gr', 1),
(510219, 782742, 'Κάτω Κλείνες', '%ce%9a%ce%ac%cf%84%cf%89-%ce%9a%ce%bb%ce%b5%ce%af%ce%bd%ce%b', 'gr', 1),
(510220, 782742, 'Λέχοβο', '%ce%9b%ce%ad%cf%87%ce%bf%ce%b2%ce%bf', 'gr', 1),
(510221, 782742, 'Νυμφαίο', '%ce%9d%cf%85%ce%bc%cf%86%ce%b1%ce%af%ce%bf', 'gr', 1),
(510222, 782742, 'Πρέσπες', '%ce%a0%cf%81%ce%ad%cf%83%cf%80%ce%b5%cf%82', 'gr', 1),
(510223, 782742, 'Φλώρινα', '%ce%a6%ce%bb%cf%8e%cf%81%ce%b9%ce%bd%ce%b1', 'gr', 1),
(510224, 782743, 'Αχέροντας', '%ce%91%cf%87%ce%ad%cf%81%ce%bf%ce%bd%cf%84%ce%b1%cf%82', 'gr', 1),
(510225, 782743, 'Ηγουμενίτσα', '%ce%97%ce%b3%ce%bf%cf%85%ce%bc%ce%b5%ce%bd%ce%af%cf%84%cf%83', 'gr', 1),
(510226, 782743, 'Μαργαρίτι', '%ce%9c%ce%b1%cf%81%ce%b3%ce%b1%cf%81%ce%af%cf%84%ce%b9', 'gr', 1),
(510227, 782743, 'Παραμυθιά', '%ce%a0%ce%b1%cf%81%ce%b1%ce%bc%cf%85%ce%b8%ce%b9%ce%ac', 'gr', 1),
(510228, 782743, 'Παραπόταμος', '%ce%a0%ce%b1%cf%81%ce%b1%cf%80%cf%8c%cf%84%ce%b1%ce%bc%ce%bf', 'gr', 1),
(510229, 782743, 'Πέρδικα', '%ce%a0%ce%ad%cf%81%ce%b4%ce%b9%ce%ba%ce%b1', 'gr', 1),
(510230, 782743, 'Σαγιάδα', '%ce%a3%ce%b1%ce%b3%ce%b9%ce%ac%ce%b4%ce%b1', 'gr', 1),
(510231, 782743, 'Σούλι', '%ce%a3%ce%bf%cf%8d%ce%bb%ce%b9', 'gr', 1),
(510232, 782743, 'Σύβοττα', '%ce%a3%cf%8d%ce%b2%ce%bf%cf%84%cf%84%ce%b1', 'gr', 1),
(510233, 782743, 'Φιλιατές', '%ce%a6%ce%b9%ce%bb%ce%b9%ce%b1%cf%84%ce%ad%cf%82', 'gr', 1),
(510234, 782744, 'Άγραφα', '%ce%86%ce%b3%cf%81%ce%b1%cf%86%ce%b1', 'gr', 1),
(510235, 782744, 'Ασπροπόταμος', '%ce%91%cf%83%cf%80%cf%81%ce%bf%cf%80%cf%8c%cf%84%ce%b1%ce%bc', 'gr', 1),
(510236, 782744, 'Δομνίτσα', '%ce%94%ce%bf%ce%bc%ce%bd%ce%af%cf%84%cf%83%ce%b1', 'gr', 1),
(510237, 782744, 'Κτημενίων', '%ce%9a%cf%84%ce%b7%ce%bc%ce%b5%ce%bd%ce%af%cf%89%ce%bd', 'gr', 1),
(510238, 782744, 'Προυσός', '%ce%a0%cf%81%ce%bf%cf%85%cf%83%cf%8c%cf%82', 'gr', 1),
(510239, 782744, 'Φραγκίστα', '%ce%a6%cf%81%ce%b1%ce%b3%ce%ba%ce%af%cf%83%cf%84%ce%b1', 'gr', 1),
(510240, 782744, 'Απεραντίων', '%ce%91%cf%80%ce%b5%cf%81%ce%b1%ce%bd%cf%84%ce%af%cf%89%ce%bd', 'gr', 1),
(510241, 782744, 'Βίνιανη', '%ce%92%ce%af%ce%bd%ce%b9%ce%b1%ce%bd%ce%b7', 'gr', 1),
(510242, 782744, 'Καρπενήσι', '%ce%9a%ce%b1%cf%81%cf%80%ce%b5%ce%bd%ce%ae%cf%83%ce%b9', 'gr', 1),
(510243, 782744, 'Ποταμιά', '%ce%a0%ce%bf%cf%84%ce%b1%ce%bc%ce%b9%ce%ac', 'gr', 1),
(510244, 782744, 'Φουρνά', '%ce%a6%ce%bf%cf%85%cf%81%ce%bd%ce%ac', 'gr', 1),
(510245, 782745, 'Άγ. Γεώργιος Τυμφρηστού', '%ce%86%ce%b3-%ce%93%ce%b5%cf%8e%cf%81%ce%b3%ce%b9%ce%bf%cf%8', 'gr', 1),
(510246, 782745, 'Άγ. Κωνσταντίνος', '%ce%86%ce%b3-%ce%9a%cf%89%ce%bd%cf%83%cf%84%ce%b1%ce%bd%cf%8', 'gr', 1),
(510247, 782745, 'Αμφίκλεια', '%ce%91%ce%bc%cf%86%ce%af%ce%ba%ce%bb%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510248, 782745, 'Αταλάντη', '%ce%91%cf%84%ce%b1%ce%bb%ce%ac%ce%bd%cf%84%ce%b7', 'gr', 1),
(510249, 782745, 'Γοργοπόταμος', '%ce%93%ce%bf%cf%81%ce%b3%ce%bf%cf%80%cf%8c%cf%84%ce%b1%ce%bc', 'gr', 1),
(510250, 782745, 'Δαφνουσίων', '%ce%94%ce%b1%cf%86%ce%bd%ce%bf%cf%85%cf%83%ce%af%cf%89%ce%bd', 'gr', 1),
(510251, 782745, 'Δομοκός', '%ce%94%ce%bf%ce%bc%ce%bf%ce%ba%cf%8c%cf%82', 'gr', 1),
(510252, 782745, 'Ελάτεια', '%ce%95%ce%bb%ce%ac%cf%84%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510253, 782745, 'Εχιναίων', '%ce%95%cf%87%ce%b9%ce%bd%ce%b1%ce%af%cf%89%ce%bd', 'gr', 1),
(510254, 782745, 'Θεσσαλιώτιδα', '%ce%98%ce%b5%cf%83%cf%83%ce%b1%ce%bb%ce%b9%cf%8e%cf%84%ce%b9', 'gr', 1),
(510255, 782745, 'Καμμένα Βούρλα', '%ce%9a%ce%b1%ce%bc%ce%bc%ce%ad%ce%bd%ce%b1-%ce%92%ce%bf%cf%8', 'gr', 1),
(510256, 782745, 'Λαμία', '%ce%9b%ce%b1%ce%bc%ce%af%ce%b1', 'gr', 1),
(510257, 782745, 'Λειανοκλάδι', '%ce%9b%ce%b5%ce%b9%ce%b1%ce%bd%ce%bf%ce%ba%ce%bb%ce%ac%ce%b4', 'gr', 1),
(510258, 782745, 'Μακρακώμη', '%ce%9c%ce%b1%ce%ba%cf%81%ce%b1%ce%ba%cf%8e%ce%bc%ce%b7', 'gr', 1),
(510259, 782745, 'Μαλεσίνα', '%ce%9c%ce%b1%ce%bb%ce%b5%cf%83%ce%af%ce%bd%ce%b1', 'gr', 1),
(510260, 782745, 'Μώλος', '%ce%9c%cf%8e%ce%bb%ce%bf%cf%82', 'gr', 1),
(510261, 782745, 'Ξυνιάδα', '%ce%9e%cf%85%ce%bd%ce%b9%ce%ac%ce%b4%ce%b1', 'gr', 1),
(510262, 782745, 'Οπουντίων', '%ce%9f%cf%80%ce%bf%cf%85%ce%bd%cf%84%ce%af%cf%89%ce%bd', 'gr', 1),
(510263, 782745, 'Παύλιανη', '%ce%a0%ce%b1%cf%8d%ce%bb%ce%b9%ce%b1%ce%bd%ce%b7', 'gr', 1),
(510264, 782745, 'Πελασγία', '%ce%a0%ce%b5%ce%bb%ce%b1%cf%83%ce%b3%ce%af%ce%b1', 'gr', 1),
(510265, 782745, 'Σπερχειάδα', '%ce%a3%cf%80%ce%b5%cf%81%cf%87%ce%b5%ce%b9%ce%ac%ce%b4%ce%b1', 'gr', 1),
(510266, 782745, 'Στυλίδα', '%ce%a3%cf%84%cf%85%ce%bb%ce%af%ce%b4%ce%b1', 'gr', 1),
(510267, 782745, 'Τιθορέα', '%ce%a4%ce%b9%ce%b8%ce%bf%cf%81%ce%ad%ce%b1', 'gr', 1),
(510268, 782745, 'Τυμφρηστός', '%ce%a4%cf%85%ce%bc%cf%86%cf%81%ce%b7%cf%83%cf%84%cf%8c%cf%82', 'gr', 1),
(510269, 782745, 'Υπάτη', '%ce%a5%cf%80%ce%ac%cf%84%ce%b7', 'gr', 1),
(510270, 782746, 'Απόλλωνος', '%ce%91%cf%80%cf%8c%ce%bb%ce%bb%cf%89%ce%bd%ce%bf%cf%82', 'gr', 1),
(510271, 782746, 'Βόρεια Κυνουρία', '%ce%92%cf%8c%cf%81%ce%b5%ce%b9%ce%b1-%ce%9a%cf%85%ce%bd%ce%b', 'gr', 1),
(510272, 782746, 'Γόρτυνα', '%ce%93%cf%8c%cf%81%cf%84%cf%85%ce%bd%ce%b1', 'gr', 1),
(510273, 782746, 'Ηραία', '%ce%97%cf%81%ce%b1%ce%af%ce%b1', 'gr', 1),
(510274, 782746, 'Κοντοβάζαινα', '%ce%9a%ce%bf%ce%bd%cf%84%ce%bf%ce%b2%ce%ac%ce%b6%ce%b1%ce%b9', 'gr', 1),
(510275, 782746, 'Κοσμά', '%ce%9a%ce%bf%cf%83%ce%bc%ce%ac', 'gr', 1),
(510276, 782746, 'Λεβίδι', '%ce%9b%ce%b5%ce%b2%ce%af%ce%b4%ce%b9', 'gr', 1),
(510277, 782746, 'Μαντινεία', '%ce%9c%ce%b1%ce%bd%cf%84%ce%b9%ce%bd%ce%b5%ce%af%ce%b1', 'gr', 1),
(510278, 782746, 'Σκυρίτιδα', '%ce%a3%ce%ba%cf%85%cf%81%ce%af%cf%84%ce%b9%ce%b4%ce%b1', 'gr', 1),
(510279, 782746, 'Τρικόλωνοι', '%ce%a4%cf%81%ce%b9%ce%ba%cf%8c%ce%bb%cf%89%ce%bd%ce%bf%ce%b9', 'gr', 1),
(510280, 782746, 'Τροπαία', '%ce%a4%cf%81%ce%bf%cf%80%ce%b1%ce%af%ce%b1', 'gr', 1),
(510281, 782746, 'Φαλάνθος', '%ce%a6%ce%b1%ce%bb%ce%ac%ce%bd%ce%b8%ce%bf%cf%82', 'gr', 1),
(510282, 782746, 'Βαλτέτσι', '%ce%92%ce%b1%ce%bb%cf%84%ce%ad%cf%84%cf%83%ce%b9', 'gr', 1),
(510283, 782746, 'Δημητσάνα', '%ce%94%ce%b7%ce%bc%ce%b7%cf%84%cf%83%ce%ac%ce%bd%ce%b1', 'gr', 1),
(510284, 782746, 'Βυτίνα', '%ce%92%cf%85%cf%84%ce%af%ce%bd%ce%b1', 'gr', 1),
(510285, 782746, 'Κλειτορία', '%ce%9a%ce%bb%ce%b5%ce%b9%cf%84%ce%bf%cf%81%ce%af%ce%b1', 'gr', 1),
(510286, 782746, 'Κορύθιο', '%ce%9a%ce%bf%cf%81%cf%8d%ce%b8%ce%b9%ce%bf', 'gr', 1),
(510287, 782746, 'Λαγκάδια', '%ce%9b%ce%b1%ce%b3%ce%ba%ce%ac%ce%b4%ce%b9%ce%b1', 'gr', 1),
(510288, 782746, 'Λεωνίδιο', '%ce%9b%ce%b5%cf%89%ce%bd%ce%af%ce%b4%ce%b9%ce%bf', 'gr', 1),
(510289, 782746, 'Μεγαλόπολη', '%ce%9c%ce%b5%ce%b3%ce%b1%ce%bb%cf%8c%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(510290, 782746, 'Τεγέα', '%ce%a4%ce%b5%ce%b3%ce%ad%ce%b1', 'gr', 1),
(510291, 782746, 'Τρίπολη', '%ce%a4%cf%81%ce%af%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(510292, 782746, 'Φαλαισία', '%ce%a6%ce%b1%ce%bb%ce%b1%ce%b9%cf%83%ce%af%ce%b1', 'gr', 1),
(510293, 782747, 'Αγία Τριάδα', '%ce%91%ce%b3%ce%af%ce%b1-%ce%a4%cf%81%ce%b9%ce%ac%ce%b4%ce%b', 'gr', 1),
(510294, 782747, 'Άγιοι Ανάργυροι', '%ce%86%ce%b3%ce%b9%ce%bf%ce%b9-%ce%91%ce%bd%ce%ac%cf%81%ce%b', 'gr', 1),
(510295, 782747, 'Ακριτών', '%ce%91%ce%ba%cf%81%ce%b9%cf%84%cf%8e%ce%bd', 'gr', 1),
(510296, 782747, 'Άργος Ορεστικού', '%ce%86%cf%81%ce%b3%ce%bf%cf%82-%ce%9f%cf%81%ce%b5%cf%83%cf%8', 'gr', 1),
(510297, 782747, 'Αρρένων', '%ce%91%cf%81%cf%81%ce%ad%ce%bd%cf%89%ce%bd', 'gr', 1),
(510298, 782747, 'Βίτσι', '%ce%92%ce%af%cf%84%cf%83%ce%b9', 'gr', 1),
(510299, 782747, 'Γράμμος', '%ce%93%cf%81%ce%ac%ce%bc%ce%bc%ce%bf%cf%82', 'gr', 1),
(510300, 782747, 'Ίωνος Δραγούμη', '%ce%8a%cf%89%ce%bd%ce%bf%cf%82-%ce%94%cf%81%ce%b1%ce%b3%ce%b', 'gr', 1),
(510301, 782747, 'Καστοριά', '%ce%9a%ce%b1%cf%83%cf%84%ce%bf%cf%81%ce%b9%ce%ac', 'gr', 1),
(510302, 782747, 'Καστράκι', '%ce%9a%ce%b1%cf%83%cf%84%cf%81%ce%ac%ce%ba%ce%b9', 'gr', 1),
(510303, 782747, 'Κλεισούρα', '%ce%9a%ce%bb%ce%b5%ce%b9%cf%83%ce%bf%cf%8d%cf%81%ce%b1', 'gr', 1),
(510304, 782747, 'Κορέστεια', '%ce%9a%ce%bf%cf%81%ce%ad%cf%83%cf%84%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510305, 782747, 'Μακέδνων', '%ce%9c%ce%b1%ce%ba%ce%ad%ce%b4%ce%bd%cf%89%ce%bd', 'gr', 1),
(510306, 782747, 'Μεσοποταμία', '%ce%9c%ce%b5%cf%83%ce%bf%cf%80%ce%bf%cf%84%ce%b1%ce%bc%ce%af', 'gr', 1),
(510307, 782747, 'Νεστόριο', '%ce%9d%ce%b5%cf%83%cf%84%cf%8c%cf%81%ce%b9%ce%bf', 'gr', 1),
(510308, 782748, 'Ανθεμούντος', '%ce%91%ce%bd%ce%b8%ce%b5%ce%bc%ce%bf%cf%8d%ce%bd%cf%84%ce%bf', 'gr', 1),
(510309, 782748, 'Ζερβοχώρια', '%ce%96%ce%b5%cf%81%ce%b2%ce%bf%cf%87%cf%8e%cf%81%ce%b9%ce%b1', 'gr', 1),
(510310, 782748, 'Κασσάνδρα', '%ce%9a%ce%b1%cf%83%cf%83%ce%ac%ce%bd%ce%b4%cf%81%ce%b1', 'gr', 1),
(510311, 782748, 'Ορμυλία', '%ce%9f%cf%81%ce%bc%cf%85%ce%bb%ce%af%ce%b1', 'gr', 1),
(510312, 782748, 'Παναγία', '%ce%a0%ce%b1%ce%bd%ce%b1%ce%b3%ce%af%ce%b1', 'gr', 1),
(510313, 782748, 'Σιθωνία', '%ce%a3%ce%b9%ce%b8%cf%89%ce%bd%ce%af%ce%b1', 'gr', 1),
(510314, 782748, 'Τορώνη', '%ce%a4%ce%bf%cf%81%cf%8e%ce%bd%ce%b7', 'gr', 1),
(510315, 782748, 'Αρναία', '%ce%91%cf%81%ce%bd%ce%b1%ce%af%ce%b1', 'gr', 1),
(510316, 782748, 'Καλλικράτεια', '%ce%9a%ce%b1%ce%bb%ce%bb%ce%b9%ce%ba%cf%81%ce%ac%cf%84%ce%b5', 'gr', 1),
(510317, 782748, 'Μουδανιά', '%ce%9c%ce%bf%cf%85%ce%b4%ce%b1%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510318, 782748, 'Παλλήνη', '%ce%a0%ce%b1%ce%bb%ce%bb%ce%ae%ce%bd%ce%b7', 'gr', 1),
(510319, 782748, 'Πολύγυρος', '%ce%a0%ce%bf%ce%bb%cf%8d%ce%b3%cf%85%cf%81%ce%bf%cf%82', 'gr', 1),
(510320, 782748, 'Στάγειρα - Άκανθος', '%ce%a3%cf%84%ce%ac%ce%b3%ce%b5%ce%b9%cf%81%ce%b1-%ce%86%ce%b', 'gr', 1),
(510321, 782748, 'Τρίγλια', '%ce%a4%cf%81%ce%af%ce%b3%ce%bb%ce%b9%ce%b1', 'gr', 1),
(510322, 782749, 'Αβία', '%ce%91%ce%b2%ce%af%ce%b1', 'gr', 1),
(510323, 782749, 'Αίπεια', '%ce%91%ce%af%cf%80%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510324, 782749, 'Ανδρούσα', '%ce%91%ce%bd%ce%b4%cf%81%ce%bf%cf%8d%cf%83%ce%b1', 'gr', 1),
(510325, 782749, 'Αριστομένης', '%ce%91%cf%81%ce%b9%cf%83%cf%84%ce%bf%ce%bc%ce%ad%ce%bd%ce%b7', 'gr', 1),
(510326, 782749, 'Αυλώνα', '%ce%91%cf%85%ce%bb%cf%8e%ce%bd%ce%b1', 'gr', 1),
(510327, 782749, 'Γαργαλιάνοι', '%ce%93%ce%b1%cf%81%ce%b3%ce%b1%ce%bb%ce%b9%ce%ac%ce%bd%ce%bf', 'gr', 1),
(510328, 782749, 'Είρα', '%ce%95%ce%af%cf%81%ce%b1', 'gr', 1),
(510329, 782749, 'Ιθώμη', '%ce%99%ce%b8%cf%8e%ce%bc%ce%b7', 'gr', 1),
(510330, 782749, 'Κορώνη', '%ce%9a%ce%bf%cf%81%cf%8e%ce%bd%ce%b7', 'gr', 1),
(510331, 782749, 'Λεύκτρο', '%ce%9b%ce%b5%cf%8d%ce%ba%cf%84%cf%81%ce%bf', 'gr', 1),
(510332, 782749, 'Μελιγαλά', '%ce%9c%ce%b5%ce%bb%ce%b9%ce%b3%ce%b1%ce%bb%ce%ac', 'gr', 1),
(510333, 782749, 'Νέστορας', '%ce%9d%ce%ad%cf%83%cf%84%ce%bf%cf%81%ce%b1%cf%82', 'gr', 1),
(510334, 782749, 'Παπαφλέσσας', '%ce%a0%ce%b1%cf%80%ce%b1%cf%86%ce%bb%ce%ad%cf%83%cf%83%ce%b1', 'gr', 1),
(510335, 782749, 'Πύλος', '%ce%a0%cf%8d%ce%bb%ce%bf%cf%82', 'gr', 1),
(510336, 782749, 'Τριπύλα', '%ce%a4%cf%81%ce%b9%cf%80%cf%8d%ce%bb%ce%b1', 'gr', 1),
(510337, 782749, 'Χιλιοχώρια', '%ce%a7%ce%b9%ce%bb%ce%b9%ce%bf%cf%87%cf%8e%cf%81%ce%b9%ce%b1', 'gr', 1),
(510338, 782749, 'Αετός', '%ce%91%ce%b5%cf%84%cf%8c%cf%82', 'gr', 1),
(510339, 782749, 'Ανδονία', '%ce%91%ce%bd%ce%b4%ce%bf%ce%bd%ce%af%ce%b1', 'gr', 1),
(510340, 782749, 'Άριος', '%ce%86%cf%81%ce%b9%ce%bf%cf%82', 'gr', 1),
(510341, 782749, 'Αρφαρά', '%ce%91%cf%81%cf%86%ce%b1%cf%81%ce%ac', 'gr', 1),
(510342, 782749, 'Βουφράδες', '%ce%92%ce%bf%cf%85%cf%86%cf%81%ce%ac%ce%b4%ce%b5%cf%82', 'gr', 1),
(510343, 782749, 'Δώριο', '%ce%94%cf%8e%cf%81%ce%b9%ce%bf', 'gr', 1),
(510344, 782749, 'Θουρία', '%ce%98%ce%bf%cf%85%cf%81%ce%af%ce%b1', 'gr', 1),
(510345, 782749, 'Καλαμάτα', '%ce%9a%ce%b1%ce%bb%ce%b1%ce%bc%ce%ac%cf%84%ce%b1', 'gr', 1),
(510346, 782749, 'Κυπαρισσία', '%ce%9a%cf%85%cf%80%ce%b1%cf%81%ce%b9%cf%83%cf%83%ce%af%ce%b1', 'gr', 1),
(510347, 782749, 'Μεθώνη', '%ce%9c%ce%b5%ce%b8%cf%8e%ce%bd%ce%b7', 'gr', 1),
(510348, 782749, 'Μεσσήνη', '%ce%9c%ce%b5%cf%83%cf%83%ce%ae%ce%bd%ce%b7', 'gr', 1),
(510349, 782749, 'Οιχαλία', '%ce%9f%ce%b9%cf%87%ce%b1%ce%bb%ce%af%ce%b1', 'gr', 1),
(510350, 782749, 'Πεταλίδι', '%ce%a0%ce%b5%cf%84%ce%b1%ce%bb%ce%af%ce%b4%ce%b9', 'gr', 1),
(510351, 782749, 'Τρίκορφο', '%ce%a4%cf%81%ce%af%ce%ba%ce%bf%cf%81%cf%86%ce%bf', 'gr', 1),
(510352, 782749, 'Φιλιατρά', '%ce%a6%ce%b9%ce%bb%ce%b9%ce%b1%cf%84%cf%81%ce%ac', 'gr', 1),
(510353, 782750, 'Άγκριστρο', '%ce%86%ce%b3%ce%ba%cf%81%ce%b9%cf%83%cf%84%cf%81%ce%bf', 'gr', 1),
(510354, 782750, 'Αμφίπολη', '%ce%91%ce%bc%cf%86%ce%af%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(510355, 782750, 'Αχινός', '%ce%91%cf%87%ce%b9%ce%bd%cf%8c%cf%82', 'gr', 1),
(510356, 782750, 'Βισαλτία', '%ce%92%ce%b9%cf%83%ce%b1%ce%bb%cf%84%ce%af%ce%b1', 'gr', 1),
(510357, 782750, 'Ηράκλεια', '%ce%97%cf%81%ce%ac%ce%ba%ce%bb%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510358, 782750, 'Κορμίστα', '%ce%9a%ce%bf%cf%81%ce%bc%ce%af%cf%83%cf%84%ce%b1', 'gr', 1),
(510359, 782750, 'Μητρούσι', '%ce%9c%ce%b7%cf%84%cf%81%ce%bf%cf%8d%cf%83%ce%b9', 'gr', 1),
(510360, 782750, 'Νιγρίτα', '%ce%9d%ce%b9%ce%b3%cf%81%ce%af%cf%84%ce%b1', 'gr', 1),
(510361, 782750, 'Πετρίτσι', '%ce%a0%ce%b5%cf%84%cf%81%ce%af%cf%84%cf%83%ce%b9', 'gr', 1),
(510362, 782750, 'Πρώτη', '%ce%a0%cf%81%cf%8e%cf%84%ce%b7', 'gr', 1),
(510363, 782750, 'Σέρρες', '%ce%a3%ce%ad%cf%81%cf%81%ce%b5%cf%82', 'gr', 1),
(510364, 782750, 'Σκοτούσσα', '%ce%a3%ce%ba%ce%bf%cf%84%ce%bf%cf%8d%cf%83%cf%83%ce%b1', 'gr', 1),
(510365, 782750, 'Στρυμώνας', '%ce%a3%cf%84%cf%81%cf%85%ce%bc%cf%8e%ce%bd%ce%b1%cf%82', 'gr', 1),
(510366, 782750, 'Τράγιλος', '%ce%a4%cf%81%ce%ac%ce%b3%ce%b9%ce%bb%ce%bf%cf%82', 'gr', 1),
(510367, 782750, 'Αλιστράτη', '%ce%91%ce%bb%ce%b9%cf%83%cf%84%cf%81%ce%ac%cf%84%ce%b7', 'gr', 1),
(510368, 782750, 'Άνω Βροντού', '%ce%86%ce%bd%cf%89-%ce%92%cf%81%ce%bf%ce%bd%cf%84%ce%bf%cf%8', 'gr', 1),
(510369, 782750, 'Αχλαδοχώρι', '%ce%91%cf%87%ce%bb%ce%b1%ce%b4%ce%bf%cf%87%cf%8e%cf%81%ce%b9', 'gr', 1),
(510370, 782750, 'Εμμ. Παππάς', '%ce%95%ce%bc%ce%bc-%ce%a0%ce%b1%cf%80%cf%80%ce%ac%cf%82', 'gr', 1),
(510371, 782750, 'Κερκίνη', '%ce%9a%ce%b5%cf%81%ce%ba%ce%af%ce%bd%ce%b7', 'gr', 1),
(510372, 782750, 'Νέα Ζίχνη', '%ce%9d%ce%ad%ce%b1-%ce%96%ce%af%cf%87%ce%bd%ce%b7', 'gr', 1),
(510373, 782750, 'Λευκώνας', '%ce%9b%ce%b5%cf%85%ce%ba%cf%8e%ce%bd%ce%b1%cf%82', 'gr', 1),
(510374, 782750, 'Ορεινή', '%ce%9f%cf%81%ce%b5%ce%b9%ce%bd%ce%ae', 'gr', 1),
(510375, 782750, 'Προμαχώνας', '%ce%a0%cf%81%ce%bf%ce%bc%ce%b1%cf%87%cf%8e%ce%bd%ce%b1%cf%82', 'gr', 1),
(510376, 782750, 'Ροδόλιβος', '%ce%a1%ce%bf%ce%b4%cf%8c%ce%bb%ce%b9%ce%b2%ce%bf%cf%82', 'gr', 1),
(510377, 782750, 'Σιδηρόκαστρο', '%ce%a3%ce%b9%ce%b4%ce%b7%cf%81%cf%8c%ce%ba%ce%b1%cf%83%cf%84', 'gr', 1),
(510378, 782750, 'Σκουτάρι', '%ce%a3%ce%ba%ce%bf%cf%85%cf%84%ce%ac%cf%81%ce%b9', 'gr', 1),
(510379, 782750, 'Στρυμωνικό', '%ce%a3%cf%84%cf%81%cf%85%ce%bc%cf%89%ce%bd%ce%b9%ce%ba%cf%8c', 'gr', 1),
(510380, 782751, 'Ανατ. Αργιθέα', '%ce%91%ce%bd%ce%b1%cf%84-%ce%91%cf%81%ce%b3%ce%b9%ce%b8%ce%a', 'gr', 1),
(510381, 782751, 'Άρνη', '%ce%86%cf%81%ce%bd%ce%b7', 'gr', 1),
(510382, 782751, 'Ιθώμη', '%ce%99%ce%b8%cf%8e%ce%bc%ce%b7', 'gr', 1),
(510383, 782751, 'Καλλιφώνι', '%ce%9a%ce%b1%ce%bb%ce%bb%ce%b9%cf%86%cf%8e%ce%bd%ce%b9', 'gr', 1),
(510384, 782751, 'Καρδίτσα', '%ce%9a%ce%b1%cf%81%ce%b4%ce%af%cf%84%cf%83%ce%b1', 'gr', 1),
(510385, 782751, 'Μητρόπολη', '%ce%9c%ce%b7%cf%84%cf%81%cf%8c%cf%80%ce%bf%ce%bb%ce%b7', 'gr', 1),
(510386, 782751, 'Νεβρόπολη Αγράφων', '%ce%9d%ce%b5%ce%b2%cf%81%cf%8c%cf%80%ce%bf%ce%bb%ce%b7-%ce%9', 'gr', 1),
(510387, 782751, 'Πάμισος', '%ce%a0%ce%ac%ce%bc%ce%b9%cf%83%ce%bf%cf%82', 'gr', 1),
(510388, 782751, 'Ρεντίνα', '%ce%a1%ce%b5%ce%bd%cf%84%ce%af%ce%bd%ce%b1', 'gr', 1),
(510389, 782751, 'Σοφάδες', '%ce%a3%ce%bf%cf%86%ce%ac%ce%b4%ce%b5%cf%82', 'gr', 1),
(510390, 782751, 'Φύλλο', '%ce%a6%cf%8d%ce%bb%ce%bb%ce%bf', 'gr', 1),
(510391, 782751, 'Αργιθέα', '%ce%91%cf%81%ce%b3%ce%b9%ce%b8%ce%ad%ce%b1', 'gr', 1),
(510392, 782751, 'Αχελώος', '%ce%91%cf%87%ce%b5%ce%bb%cf%8e%ce%bf%cf%82', 'gr', 1),
(510393, 782751, 'Ίταμος', '%ce%8a%cf%84%ce%b1%ce%bc%ce%bf%cf%82', 'gr', 1),
(510394, 782751, 'Κάμπος', '%ce%9a%ce%ac%ce%bc%cf%80%ce%bf%cf%82', 'gr', 1),
(510395, 782751, 'Μενελαϊδα', '%ce%9c%ce%b5%ce%bd%ce%b5%ce%bb%ce%b1%cf%8a%ce%b4%ce%b1', 'gr', 1),
(510396, 782751, 'Μουζάκι', '%ce%9c%ce%bf%cf%85%ce%b6%ce%ac%ce%ba%ce%b9', 'gr', 1),
(510397, 782751, 'Παλαμάς', '%ce%a0%ce%b1%ce%bb%ce%b1%ce%bc%ce%ac%cf%82', 'gr', 1),
(510398, 782751, 'Πλαστήρα', '%ce%a0%ce%bb%ce%b1%cf%83%cf%84%ce%ae%cf%81%ce%b1', 'gr', 1),
(510399, 782751, 'Σελλάνων', '%ce%a3%ce%b5%ce%bb%ce%bb%ce%ac%ce%bd%cf%89%ce%bd', 'gr', 1),
(510400, 782751, 'Τομάσι', '%ce%a4%ce%bf%ce%bc%ce%ac%cf%83%ce%b9', 'gr', 1),
(510401, 782752, 'Αγία Βαρβάρα', '%ce%91%ce%b3%ce%af%ce%b1-%ce%92%ce%b1%cf%81%ce%b2%ce%ac%cf%8', 'gr', 1),
(510402, 782752, 'Αρχάνες', '%ce%91%cf%81%cf%87%ce%ac%ce%bd%ce%b5%cf%82', 'gr', 1),
(510403, 782752, 'Βιάννος', '%ce%92%ce%b9%ce%ac%ce%bd%ce%bd%ce%bf%cf%82', 'gr', 1),
(510404, 782752, 'Γοργολαϊνη', '%ce%93%ce%bf%cf%81%ce%b3%ce%bf%ce%bb%ce%b1%cf%8a%ce%bd%ce%b7', 'gr', 1),
(510405, 782752, 'Γούβες', '%ce%93%ce%bf%cf%8d%ce%b2%ce%b5%cf%82', 'gr', 1),
(510406, 782752, 'Ζαρός', '%ce%96%ce%b1%cf%81%cf%8c%cf%82', 'gr', 1),
(510407, 782752, 'Θραψανός', '%ce%98%cf%81%ce%b1%cf%88%ce%b1%ce%bd%cf%8c%cf%82', 'gr', 1),
(510408, 782752, 'Κόφινας', '%ce%9a%cf%8c%cf%86%ce%b9%ce%bd%ce%b1%cf%82', 'gr', 1),
(510409, 782752, 'Μάλλια', '%ce%9c%ce%ac%ce%bb%ce%bb%ce%b9%ce%b1', 'gr', 1),
(510410, 782752, 'Νέα Αλικαρνασσός', '%ce%9d%ce%ad%ce%b1-%ce%91%ce%bb%ce%b9%ce%ba%ce%b1%cf%81%ce%b', 'gr', 1),
(510411, 782752, 'Παλιανή', '%ce%a0%ce%b1%ce%bb%ce%b9%ce%b1%ce%bd%ce%ae', 'gr', 1),
(510412, 782752, 'Τέμενος', '%ce%a4%ce%ad%ce%bc%ce%b5%ce%bd%ce%bf%cf%82', 'gr', 1),
(510413, 782752, 'Τυμπάκι', '%ce%a4%cf%85%ce%bc%cf%80%ce%ac%ce%ba%ce%b9', 'gr', 1),
(510414, 782752, 'Αρκαλοχώρι', '%ce%91%cf%81%ce%ba%ce%b1%ce%bb%ce%bf%cf%87%cf%8e%cf%81%ce%b9', 'gr', 1),
(510415, 782752, 'Αστερούσια', '%ce%91%cf%83%cf%84%ce%b5%cf%81%ce%bf%cf%8d%cf%83%ce%b9%ce%b1', 'gr', 1),
(510416, 782752, 'Γάζι', '%ce%93%ce%ac%ce%b6%ce%b9', 'gr', 1),
(510417, 782752, 'Γόρτυνα', '%ce%93%cf%8c%cf%81%cf%84%cf%85%ce%bd%ce%b1', 'gr', 1),
(510418, 782752, 'Επισκοπή', '%ce%95%cf%80%ce%b9%cf%83%ce%ba%ce%bf%cf%80%ce%ae', 'gr', 1),
(510419, 782752, 'Ηράκλειο', '%ce%97%cf%81%ce%ac%ce%ba%ce%bb%ce%b5%ce%b9%ce%bf', 'gr', 1),
(510420, 782752, 'Καστέλλι', '%ce%9a%ce%b1%cf%83%cf%84%ce%ad%ce%bb%ce%bb%ce%b9', 'gr', 1),
(510421, 782752, 'Κρουσώνας', '%ce%9a%cf%81%ce%bf%cf%85%cf%83%cf%8e%ce%bd%ce%b1%cf%82', 'gr', 1),
(510422, 782752, 'Μοίρες', '%ce%9c%ce%bf%ce%af%cf%81%ce%b5%cf%82', 'gr', 1),
(510423, 782752, 'Νίκου Καζαντζάκη', '%ce%9d%ce%af%ce%ba%ce%bf%cf%85-%ce%9a%ce%b1%ce%b6%ce%b1%ce%b', 'gr', 1),
(510424, 782752, 'Ρούβας', '%ce%a1%ce%bf%cf%8d%ce%b2%ce%b1%cf%82', 'gr', 1),
(510425, 782752, 'Τύλισος', '%ce%a4%cf%8d%ce%bb%ce%b9%cf%83%ce%bf%cf%82', 'gr', 1),
(510426, 782752, 'Χερσόνησος', '%ce%a7%ce%b5%cf%81%cf%83%cf%8c%ce%bd%ce%b7%cf%83%ce%bf%cf%82', 'gr', 1),
(510427, 782753, 'Αγαθονήσι', '%ce%91%ce%b3%ce%b1%ce%b8%ce%bf%ce%bd%ce%ae%cf%83%ce%b9', 'gr', 1),
(510428, 782753, 'Κάλυμνος', '%ce%9a%ce%ac%ce%bb%cf%85%ce%bc%ce%bd%ce%bf%cf%82', 'gr', 1),
(510429, 782753, 'Κάρπαθος - Όλυμπος', '%ce%9a%ce%ac%cf%81%cf%80%ce%b1%ce%b8%ce%bf%cf%82-%ce%8c%ce%b', 'gr', 1),
(510430, 782753, 'Καστελόριζο (Μεγίστη)', '%ce%9a%ce%b1%cf%83%cf%84%ce%b5%ce%bb%cf%8c%cf%81%ce%b9%ce%b6', 'gr', 1),
(510431, 782753, 'Κως - Δίκαιο', '%ce%9a%cf%89%cf%82-%ce%94%ce%af%ce%ba%ce%b1%ce%b9%ce%bf', 'gr', 1),
(510432, 782753, 'Λειψοί', '%ce%9b%ce%b5%ce%b9%cf%88%ce%bf%ce%af', 'gr', 1),
(510433, 782753, 'Νίσυρος', '%ce%9d%ce%af%cf%83%cf%85%cf%81%ce%bf%cf%82', 'gr', 1),
(510434, 782753, 'Ρόδος - Αρχάγγελος', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%91%cf%81%cf%87%ce%ac%ce%b', 'gr', 1),
(510435, 782753, 'Ρόδος - Αφάντου', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%91%cf%86%ce%ac%ce%bd%cf%8', 'gr', 1),
(510436, 782753, 'Ρόδος - Λίνδος', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%9b%ce%af%ce%bd%ce%b4%ce%b', 'gr', 1),
(510437, 782753, 'Ρόδος - Πεταλούδες', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%a0%ce%b5%cf%84%ce%b1%ce%b', 'gr', 1),
(510438, 782753, 'Σύμη', '%ce%a3%cf%8d%ce%bc%ce%b7', 'gr', 1),
(510439, 782753, 'Χάλκη', '%ce%a7%ce%ac%ce%bb%ce%ba%ce%b7', 'gr', 1),
(510440, 782753, 'Αστυπάλαια', '%ce%91%cf%83%cf%84%cf%85%cf%80%ce%ac%ce%bb%ce%b1%ce%b9%ce%b1', 'gr', 1),
(510441, 782753, 'Κάρπαθος', '%ce%9a%ce%ac%cf%81%cf%80%ce%b1%ce%b8%ce%bf%cf%82', 'gr', 1),
(510442, 782753, 'Κάσος', '%ce%9a%ce%ac%cf%83%ce%bf%cf%82', 'gr', 1),
(510443, 782753, 'Κως', '%ce%9a%cf%89%cf%82', 'gr', 1),
(510444, 782753, 'Κως - Ηρακλειδών', '%ce%9a%cf%89%cf%82-%ce%97%cf%81%ce%b1%ce%ba%ce%bb%ce%b5%ce%b', 'gr', 1),
(510445, 782753, 'Λέρος', '%ce%9b%ce%ad%cf%81%ce%bf%cf%82', 'gr', 1),
(510446, 782753, 'Πάτμος', '%ce%a0%ce%ac%cf%84%ce%bc%ce%bf%cf%82', 'gr', 1),
(510447, 782753, 'Ρόδος - Αττάβυρος', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%91%cf%84%cf%84%ce%ac%ce%b', 'gr', 1),
(510448, 782753, 'Ρόδος - Ιαλυσός', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%99%ce%b1%ce%bb%cf%85%cf%8', 'gr', 1),
(510449, 782753, 'Ρόδος - Καμείρος', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%9a%ce%b1%ce%bc%ce%b5%ce%a', 'gr', 1),
(510450, 782753, 'Ρόδος - Νότια', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%9d%cf%8c%cf%84%ce%b9%ce%b', 'gr', 1),
(510451, 782753, 'Ρόδος - Πόλη', '%ce%a1%cf%8c%ce%b4%ce%bf%cf%82-%ce%a0%cf%8c%ce%bb%ce%b7', 'gr', 1),
(510452, 782753, 'Τήλος', '%ce%a4%ce%ae%ce%bb%ce%bf%cf%82', 'gr', 1),
(510453, 782754, 'Άγ. Θεόδωροι', '%ce%86%ce%b3-%ce%98%ce%b5%cf%8c%ce%b4%cf%89%cf%81%ce%bf%ce%b', 'gr', 1),
(510454, 782754, 'Βέλο', '%ce%92%ce%ad%ce%bb%ce%bf', 'gr', 1),
(510455, 782754, 'Ευρωστίνη', '%ce%95%cf%85%cf%81%cf%89%cf%83%cf%84%ce%af%ce%bd%ce%b7', 'gr', 1),
(510456, 782754, 'Λουτράκι', '%ce%9b%ce%bf%cf%85%cf%84%cf%81%ce%ac%ce%ba%ce%b9', 'gr', 1),
(510457, 782754, 'Ξυλόκαστρο', '%ce%9e%cf%85%ce%bb%cf%8c%ce%ba%ce%b1%cf%83%cf%84%cf%81%ce%bf', 'gr', 1),
(510458, 782754, 'Σικυωνίων', '%ce%a3%ce%b9%ce%ba%cf%85%cf%89%ce%bd%ce%af%cf%89%ce%bd', 'gr', 1),
(510459, 782754, 'Στυμφαλία', '%ce%a3%cf%84%cf%85%ce%bc%cf%86%ce%b1%ce%bb%ce%af%ce%b1', 'gr', 1),
(510460, 782754, 'Φενεού', '%ce%a6%ce%b5%ce%bd%ce%b5%ce%bf%cf%8d', 'gr', 1),
(510461, 782754, 'Άσσου - Λεχαίου', '%ce%86%cf%83%cf%83%ce%bf%cf%85-%ce%9b%ce%b5%cf%87%ce%b1%ce%a', 'gr', 1),
(510462, 782754, 'Βόχα', '%ce%92%cf%8c%cf%87%ce%b1', 'gr', 1),
(510463, 782754, 'Κόρινθος', '%ce%9a%cf%8c%cf%81%ce%b9%ce%bd%ce%b8%ce%bf%cf%82', 'gr', 1),
(510464, 782754, 'Νεμέα', '%ce%9d%ce%b5%ce%bc%ce%ad%ce%b1', 'gr', 1),
(510465, 782754, 'Σαρωνικού', '%ce%a3%ce%b1%cf%81%cf%89%ce%bd%ce%b9%ce%ba%ce%bf%cf%8d', 'gr', 1),
(510466, 782754, 'Σολυγεία', '%ce%a3%ce%bf%ce%bb%cf%85%ce%b3%ce%b5%ce%af%ce%b1', 'gr', 1),
(510467, 782754, 'Τενέα', '%ce%a4%ce%b5%ce%bd%ce%ad%ce%b1', 'gr', 1),
(510468, 782755, 'Ανατ. Μάνη', '%ce%91%ce%bd%ce%b1%cf%84-%ce%9c%ce%ac%ce%bd%ce%b7', 'gr', 1),
(510469, 782755, 'Βοιών', '%ce%92%ce%bf%ce%b9%cf%8e%ce%bd', 'gr', 1),
(510470, 782755, 'Γύθειο', '%ce%93%cf%8d%ce%b8%ce%b5%ce%b9%ce%bf', 'gr', 1),
(510471, 782755, 'Έλος', '%ce%88%ce%bb%ce%bf%cf%82', 'gr', 1),
(510472, 782755, 'Θεραπνών', '%ce%98%ce%b5%cf%81%ce%b1%cf%80%ce%bd%cf%8e%ce%bd', 'gr', 1),
(510473, 782755, 'Κροκέων', '%ce%9a%cf%81%ce%bf%ce%ba%ce%ad%cf%89%ce%bd', 'gr', 1),
(510474, 782755, 'Μονεμβασιά', '%ce%9c%ce%bf%ce%bd%ce%b5%ce%bc%ce%b2%ce%b1%cf%83%ce%b9%ce%ac', 'gr', 1),
(510475, 782755, 'Νιάτα', '%ce%9d%ce%b9%ce%ac%cf%84%ce%b1', 'gr', 1),
(510476, 782755, 'Οίτυλο', '%ce%9f%ce%af%cf%84%cf%85%ce%bb%ce%bf', 'gr', 1),
(510477, 782755, 'Σκάλα', '%ce%a3%ce%ba%ce%ac%ce%bb%ce%b1', 'gr', 1),
(510478, 782755, 'Σπάρτη', '%ce%a3%cf%80%ce%ac%cf%81%cf%84%ce%b7', 'gr', 1),
(510479, 782755, 'Ασωπός', '%ce%91%cf%83%cf%89%cf%80%cf%8c%cf%82', 'gr', 1),
(510480, 782755, 'Γερονθρών', '%ce%93%ce%b5%cf%81%ce%bf%ce%bd%ce%b8%cf%81%cf%8e%ce%bd', 'gr', 1),
(510481, 782755, 'Ελαφόνησος', '%ce%95%ce%bb%ce%b1%cf%86%cf%8c%ce%bd%ce%b7%cf%83%ce%bf%cf%82', 'gr', 1),
(510482, 782755, 'Ζάρακας', '%ce%96%ce%ac%cf%81%ce%b1%ce%ba%ce%b1%cf%82', 'gr', 1),
(510483, 782755, 'Καρυές', '%ce%9a%ce%b1%cf%81%cf%85%ce%ad%cf%82', 'gr', 1),
(510484, 782755, 'Μολάοι', '%ce%9c%ce%bf%ce%bb%ce%ac%ce%bf%ce%b9', 'gr', 1),
(510485, 782755, 'Μυστράς', '%ce%9c%cf%85%cf%83%cf%84%cf%81%ce%ac%cf%82', 'gr', 1),
(510486, 782755, 'Οινούντας', '%ce%9f%ce%b9%ce%bd%ce%bf%cf%8d%ce%bd%cf%84%ce%b1%cf%82', 'gr', 1),
(510487, 782755, 'Πελλάνα', '%ce%a0%ce%b5%ce%bb%ce%bb%ce%ac%ce%bd%ce%b1', 'gr', 1),
(510488, 782755, 'Σμύνος', '%ce%a3%ce%bc%cf%8d%ce%bd%ce%bf%cf%82', 'gr', 1),
(510489, 782755, 'Φαρίδος', '%ce%a6%ce%b1%cf%81%ce%af%ce%b4%ce%bf%cf%82', 'gr', 1),
(510490, 782756, 'Αλιφείρα', '%ce%91%ce%bb%ce%b9%cf%86%ce%b5%ce%af%cf%81%ce%b1', 'gr', 1),
(510491, 782756, 'Ανδραβίδα', '%ce%91%ce%bd%ce%b4%cf%81%ce%b1%ce%b2%ce%af%ce%b4%ce%b1', 'gr', 1),
(510492, 782756, 'Αρχ. Ολυμπία', '%ce%91%cf%81%cf%87-%ce%9f%ce%bb%cf%85%ce%bc%cf%80%ce%af%ce%b', 'gr', 1),
(510493, 782756, 'Βουπρασία', '%ce%92%ce%bf%cf%85%cf%80%cf%81%ce%b1%cf%83%ce%af%ce%b1', 'gr', 1),
(510494, 782756, 'Γαστούνη', '%ce%93%ce%b1%cf%83%cf%84%ce%bf%cf%8d%ce%bd%ce%b7', 'gr', 1),
(510495, 782756, 'Ιαρδάνος', '%ce%99%ce%b1%cf%81%ce%b4%ce%ac%ce%bd%ce%bf%cf%82', 'gr', 1),
(510496, 782756, 'Λάμπεια', '%ce%9b%ce%ac%ce%bc%cf%80%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510497, 782756, 'Λεχαινά', '%ce%9b%ce%b5%cf%87%ce%b1%ce%b9%ce%bd%ce%ac', 'gr', 1),
(510498, 782756, 'Πύργος', '%ce%a0%cf%8d%cf%81%ce%b3%ce%bf%cf%82', 'gr', 1),
(510499, 782756, 'Τραγανό', '%ce%a4%cf%81%ce%b1%ce%b3%ce%b1%ce%bd%cf%8c', 'gr', 1),
(510500, 782756, 'Φολόη', '%ce%a6%ce%bf%ce%bb%cf%8c%ce%b7', 'gr', 1),
(510501, 782756, 'Αμαλιάδα', '%ce%91%ce%bc%ce%b1%ce%bb%ce%b9%ce%ac%ce%b4%ce%b1', 'gr', 1),
(510502, 782756, 'Ανδρίτσαινα', '%ce%91%ce%bd%ce%b4%cf%81%ce%af%cf%84%cf%83%ce%b1%ce%b9%ce%bd', 'gr', 1),
(510503, 782756, 'Βαρθολομιό', '%ce%92%ce%b1%cf%81%ce%b8%ce%bf%ce%bb%ce%bf%ce%bc%ce%b9%cf%8c', 'gr', 1),
(510504, 782756, 'Βώλακας', '%ce%92%cf%8e%ce%bb%ce%b1%ce%ba%ce%b1%cf%82', 'gr', 1),
(510505, 782756, 'Ζαχάρω', '%ce%96%ce%b1%cf%87%ce%ac%cf%81%cf%89', 'gr', 1),
(510506, 782756, 'Κάστρο - Κυλλήνη', '%ce%9a%ce%ac%cf%83%cf%84%cf%81%ce%bf-%ce%9a%cf%85%ce%bb%ce%b', 'gr', 1),
(510507, 782756, 'Λασιώνα', '%ce%9b%ce%b1%cf%83%ce%b9%cf%8e%ce%bd%ce%b1', 'gr', 1),
(510508, 782756, 'Πηνεία', '%ce%a0%ce%b7%ce%bd%ce%b5%ce%af%ce%b1', 'gr', 1),
(510509, 782756, 'Σκιλλουντία', '%ce%a3%ce%ba%ce%b9%ce%bb%ce%bb%ce%bf%cf%85%ce%bd%cf%84%ce%af', 'gr', 1),
(510510, 782756, 'Φιγαλεία', '%ce%a6%ce%b9%ce%b3%ce%b1%ce%bb%ce%b5%ce%af%ce%b1', 'gr', 1),
(510511, 782756, 'Ωλένη', '%ce%a9%ce%bb%ce%ad%ce%bd%ce%b7', 'gr', 1),
(510512, 782757, 'Άγ. Δημήτριος', '%ce%86%ce%b3-%ce%94%ce%b7%ce%bc%ce%ae%cf%84%cf%81%ce%b9%ce%b', 'gr', 1),
(510513, 782757, 'Ανατολή', '%ce%91%ce%bd%ce%b1%cf%84%ce%bf%ce%bb%ce%ae', 'gr', 1),
(510514, 782757, 'Άνω Καλαμάς', '%ce%86%ce%bd%cf%89-%ce%9a%ce%b1%ce%bb%ce%b1%ce%bc%ce%ac%cf%8', 'gr', 1),
(510515, 782757, 'Βαθύπεδο', '%ce%92%ce%b1%ce%b8%cf%8d%cf%80%ce%b5%ce%b4%ce%bf', 'gr', 1),
(510516, 782757, 'Δελβινάκι', '%ce%94%ce%b5%ce%bb%ce%b2%ce%b9%ce%bd%ce%ac%ce%ba%ce%b9', 'gr', 1),
(510517, 782757, 'Δίστρατο', '%ce%94%ce%af%cf%83%cf%84%cf%81%ce%b1%cf%84%ce%bf', 'gr', 1),
(510518, 782757, 'Εγνατίας', '%ce%95%ce%b3%ce%bd%ce%b1%cf%84%ce%af%ce%b1%cf%82', 'gr', 1),
(510519, 782757, 'Ευρυμενών', '%ce%95%cf%85%cf%81%cf%85%ce%bc%ce%b5%ce%bd%cf%8e%ce%bd', 'gr', 1),
(510520, 782757, 'Ιωάννινα', '%ce%99%cf%89%ce%ac%ce%bd%ce%bd%ce%b9%ce%bd%ce%b1', 'gr', 1),
(510521, 782757, 'Καλπάκι', '%ce%9a%ce%b1%ce%bb%cf%80%ce%ac%ce%ba%ce%b9', 'gr', 1),
(510522, 782757, 'Κεντρικό Ζαγόρι', '%ce%9a%ce%b5%ce%bd%cf%84%cf%81%ce%b9%ce%ba%cf%8c-%ce%96%ce%b', 'gr', 1),
(510523, 782757, 'Λάβδανη', '%ce%9b%ce%ac%ce%b2%ce%b4%ce%b1%ce%bd%ce%b7', 'gr', 1),
(510524, 782757, 'Ματσούκι', '%ce%9c%ce%b1%cf%84%cf%83%ce%bf%cf%8d%ce%ba%ce%b9', 'gr', 1),
(510525, 782757, 'Μηλέα', '%ce%9c%ce%b7%ce%bb%ce%ad%ce%b1', 'gr', 1),
(510526, 782757, 'Μπιζάνι', '%ce%9c%cf%80%ce%b9%ce%b6%ce%ac%ce%bd%ce%b9', 'gr', 1),
(510527, 782757, 'Παμβώτιδα', '%ce%a0%ce%b1%ce%bc%ce%b2%cf%8e%cf%84%ce%b9%ce%b4%ce%b1', 'gr', 1),
(510528, 782757, 'Αετομηλίτσα', '%ce%91%ce%b5%cf%84%ce%bf%ce%bc%ce%b7%ce%bb%ce%af%cf%84%cf%83', 'gr', 1),
(510529, 782757, 'Ανατ. Ζαγόρι', '%ce%91%ce%bd%ce%b1%cf%84-%ce%96%ce%b1%ce%b3%cf%8c%cf%81%ce%b', 'gr', 1),
(510530, 782757, 'Άνω Πωγώνι', '%ce%86%ce%bd%cf%89-%ce%a0%cf%89%ce%b3%cf%8e%ce%bd%ce%b9', 'gr', 1),
(510531, 782757, 'Βοβούσα', '%ce%92%ce%bf%ce%b2%ce%bf%cf%8d%cf%83%ce%b1', 'gr', 1),
(510532, 782757, 'Δερβιζιάνα', '%ce%94%ce%b5%cf%81%ce%b2%ce%b9%ce%b6%ce%b9%ce%ac%ce%bd%ce%b1', 'gr', 1),
(510533, 782757, 'Δωδώνη', '%ce%94%cf%89%ce%b4%cf%8e%ce%bd%ce%b7', 'gr', 1),
(510534, 782757, 'Εκάλη', '%ce%95%ce%ba%ce%ac%ce%bb%ce%b7', 'gr', 1),
(510535, 782757, 'Ζίτσα', '%ce%96%ce%af%cf%84%cf%83%ce%b1', 'gr', 1),
(510536, 782757, 'Καλαρίτες', '%ce%9a%ce%b1%ce%bb%ce%b1%cf%81%ce%af%cf%84%ce%b5%cf%82', 'gr', 1),
(510537, 782757, 'Κατσανοχώρια', '%ce%9a%ce%b1%cf%84%cf%83%ce%b1%ce%bd%ce%bf%cf%87%cf%8e%cf%81', 'gr', 1),
(510538, 782757, 'Κόνιτσα', '%ce%9a%cf%8c%ce%bd%ce%b9%cf%84%cf%83%ce%b1', 'gr', 1),
(510539, 782757, 'Μαστοροχώρια', '%ce%9c%ce%b1%cf%83%cf%84%ce%bf%cf%81%ce%bf%cf%87%cf%8e%cf%81', 'gr', 1),
(510540, 782757, 'Μέτσοβο', '%ce%9c%ce%ad%cf%84%cf%83%ce%bf%ce%b2%ce%bf', 'gr', 1),
(510541, 782757, 'Μολοσσοί', '%ce%9c%ce%bf%ce%bb%ce%bf%cf%83%cf%83%ce%bf%ce%af', 'gr', 1),
(510542, 782757, 'Νήσος Ιωαννίνων', '%ce%9d%ce%ae%cf%83%ce%bf%cf%82-%ce%99%cf%89%ce%b1%ce%bd%ce%b', 'gr', 1),
(510543, 782757, 'Πάπιγκο', '%ce%a0%ce%ac%cf%80%ce%b9%ce%b3%ce%ba%ce%bf', 'gr', 1),
(510544, 782757, 'Πασσαρώνα', '%ce%a0%ce%b1%cf%83%cf%83%ce%b1%cf%81%cf%8e%ce%bd%ce%b1', 'gr', 1),
(510545, 782757, 'Πέραμα', '%ce%a0%ce%ad%cf%81%ce%b1%ce%bc%ce%b1', 'gr', 1),
(510546, 782757, 'Πράμαντα', '%ce%a0%cf%81%ce%ac%ce%bc%ce%b1%ce%bd%cf%84%ce%b1', 'gr', 1),
(510547, 782757, 'Πωγωγιανή', '%ce%a0%cf%89%ce%b3%cf%89%ce%b3%ce%b9%ce%b1%ce%bd%ce%ae', 'gr', 1),
(510548, 782757, 'Σελλά', '%ce%a3%ce%b5%ce%bb%ce%bb%ce%ac', 'gr', 1),
(510549, 782757, 'Συρράκο', '%ce%a3%cf%85%cf%81%cf%81%ce%ac%ce%ba%ce%bf', 'gr', 1),
(510550, 782757, 'Τζουμέρκα', '%ce%a4%ce%b6%ce%bf%cf%85%ce%bc%ce%ad%cf%81%ce%ba%ce%b1', 'gr', 1),
(510551, 782757, 'Τύμφη', '%ce%a4%cf%8d%ce%bc%cf%86%ce%b7', 'gr', 1),
(510552, 782757, 'Φούρκα', '%ce%a6%ce%bf%cf%8d%cf%81%ce%ba%ce%b1', 'gr', 1),
(510553, 782758, 'Αιθηκών', '%ce%91%ce%b9%ce%b8%ce%b7%ce%ba%cf%8e%ce%bd', 'gr', 1),
(510554, 782758, 'Βασιλική', '%ce%92%ce%b1%cf%83%ce%b9%ce%bb%ce%b9%ce%ba%ce%ae', 'gr', 1),
(510555, 782758, 'Εστιαϊώτιδα', '%ce%95%cf%83%cf%84%ce%b9%ce%b1%cf%8a%cf%8e%cf%84%ce%b9%ce%b4', 'gr', 1),
(510556, 782758, 'Καλλίδενδρο', '%ce%9a%ce%b1%ce%bb%ce%bb%ce%af%ce%b4%ce%b5%ce%bd%ce%b4%cf%81', 'gr', 1),
(510557, 782758, 'Κλεινοβό', '%ce%9a%ce%bb%ce%b5%ce%b9%ce%bd%ce%bf%ce%b2%cf%8c', 'gr', 1),
(510558, 782758, 'Μαλακάσι', '%ce%9c%ce%b1%ce%bb%ce%b1%ce%ba%ce%ac%cf%83%ce%b9', 'gr', 1),
(510559, 782758, 'Μυρόφυλλο', '%ce%9c%cf%85%cf%81%cf%8c%cf%86%cf%85%ce%bb%ce%bb%ce%bf', 'gr', 1),
(510560, 782758, 'Οιχαλία', '%ce%9f%ce%b9%cf%87%ce%b1%ce%bb%ce%af%ce%b1', 'gr', 1),
(510561, 782758, 'Παραληθαίοι', '%ce%a0%ce%b1%cf%81%ce%b1%ce%bb%ce%b7%ce%b8%ce%b1%ce%af%ce%bf', 'gr', 1),
(510562, 782758, 'Πιάλεια', '%ce%a0%ce%b9%ce%ac%ce%bb%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510563, 782758, 'Πύλη', '%ce%a0%cf%8d%ce%bb%ce%b7', 'gr', 1),
(510564, 782758, 'Τυμφαίοι', '%ce%a4%cf%85%ce%bc%cf%86%ce%b1%ce%af%ce%bf%ce%b9', 'gr', 1),
(510565, 782758, 'Φαρκαδόνα', '%ce%a6%ce%b1%cf%81%ce%ba%ce%b1%ce%b4%cf%8c%ce%bd%ce%b1', 'gr', 1),
(510566, 782758, 'Ασπροπόταμος', '%ce%91%cf%83%cf%80%cf%81%ce%bf%cf%80%cf%8c%cf%84%ce%b1%ce%bc', 'gr', 1),
(510567, 782758, 'Γόμφοι', '%ce%93%cf%8c%ce%bc%cf%86%ce%bf%ce%b9', 'gr', 1),
(510568, 782758, 'Καλαμπάκα', '%ce%9a%ce%b1%ce%bb%ce%b1%ce%bc%cf%80%ce%ac%ce%ba%ce%b1', 'gr', 1),
(510569, 782758, 'Καστανιά', '%ce%9a%ce%b1%cf%83%cf%84%ce%b1%ce%bd%ce%b9%ce%ac', 'gr', 1),
(510570, 782758, 'Κόζιακας', '%ce%9a%cf%8c%ce%b6%ce%b9%ce%b1%ce%ba%ce%b1%cf%82', 'gr', 1),
(510571, 782758, 'Μεγ. Καλύβια', '%ce%9c%ce%b5%ce%b3-%ce%9a%ce%b1%ce%bb%cf%8d%ce%b2%ce%b9%ce%b', 'gr', 1),
(510572, 782758, 'Νεράϊαδα', '%ce%9d%ce%b5%cf%81%ce%ac%cf%8a%ce%b1%ce%b4%ce%b1', 'gr', 1),
(510573, 782758, 'Παλαιόκαστρο', '%ce%a0%ce%b1%ce%bb%ce%b1%ce%b9%cf%8c%ce%ba%ce%b1%cf%83%cf%84', 'gr', 1),
(510574, 782758, 'Πελλιναίοι', '%ce%a0%ce%b5%ce%bb%ce%bb%ce%b9%ce%bd%ce%b1%ce%af%ce%bf%ce%b9', 'gr', 1),
(510575, 782758, 'Τρίκαλα', '%ce%a4%cf%81%ce%af%ce%ba%ce%b1%ce%bb%ce%b1', 'gr', 1),
(510576, 782758, 'Φαλώρεια', '%ce%a6%ce%b1%ce%bb%cf%8e%cf%81%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510577, 782758, 'Χάσια', '%ce%a7%ce%ac%cf%83%ce%b9%ce%b1', 'gr', 1),
(510578, 782759, 'Αγιά', '%ce%91%ce%b3%ce%b9%ce%ac', 'gr', 1),
(510579, 782759, 'Αμπελώνας', '%ce%91%ce%bc%cf%80%ce%b5%ce%bb%cf%8e%ce%bd%ce%b1%cf%82', 'gr', 1),
(510580, 782759, 'Αρμένιο', '%ce%91%cf%81%ce%bc%ce%ad%ce%bd%ce%b9%ce%bf', 'gr', 1),
(510581, 782759, 'Γιάννουλη', '%ce%93%ce%b9%ce%ac%ce%bd%ce%bd%ce%bf%cf%85%ce%bb%ce%b7', 'gr', 1),
(510582, 782759, 'Ελασσόνα', '%ce%95%ce%bb%ce%b1%cf%83%cf%83%cf%8c%ce%bd%ce%b1', 'gr', 1),
(510583, 782759, 'Ευρυμενών', '%ce%95%cf%85%cf%81%cf%85%ce%bc%ce%b5%ce%bd%cf%8e%ce%bd', 'gr', 1),
(510584, 782759, 'Κάτω Όλυμπος', '%ce%9a%ce%ac%cf%84%cf%89-%ce%8c%ce%bb%cf%85%ce%bc%cf%80%ce%b', 'gr', 1),
(510585, 782759, 'Κοιλάδα', '%ce%9a%ce%bf%ce%b9%ce%bb%ce%ac%ce%b4%ce%b1', 'gr', 1),
(510586, 782759, 'Λακέρεια', '%ce%9b%ce%b1%ce%ba%ce%ad%cf%81%ce%b5%ce%b9%ce%b1', 'gr', 1),
(510587, 782759, 'Λιβάδι', '%ce%9b%ce%b9%ce%b2%ce%ac%ce%b4%ce%b9', 'gr', 1),
(510588, 782759, 'Μελιβοία', '%ce%9c%ce%b5%ce%bb%ce%b9%ce%b2%ce%bf%ce%af%ce%b1', 'gr', 1),
(510589, 782759, 'Νέσσωνας', '%ce%9d%ce%ad%cf%83%cf%83%cf%89%ce%bd%ce%b1%cf%82', 'gr', 1),
(510590, 782759, 'Όλυμπος', '%ce%8c%ce%bb%cf%85%ce%bc%cf%80%ce%bf%cf%82', 'gr', 1),
(510591, 782759, 'Πολυδάμαντος', '%ce%a0%ce%bf%ce%bb%cf%85%ce%b4%ce%ac%ce%bc%ce%b1%ce%bd%cf%84', 'gr', 1),
(510592, 782759, 'Σαραντάπορο', '%ce%a3%ce%b1%cf%81%ce%b1%ce%bd%cf%84%ce%ac%cf%80%ce%bf%cf%81', 'gr', 1),
(510593, 782759, 'Τύρναβος', '%ce%a4%cf%8d%cf%81%ce%bd%ce%b1%ce%b2%ce%bf%cf%82', 'gr', 1),
(510594, 782759, 'Αμπελάκια', '%ce%91%ce%bc%cf%80%ce%b5%ce%bb%ce%ac%ce%ba%ce%b9%ce%b1', 'gr', 1),
(510595, 782759, 'Αντιχάσια', '%ce%91%ce%bd%cf%84%ce%b9%cf%87%ce%ac%cf%83%ce%b9%ce%b1', 'gr', 1),
(510596, 782759, 'Βερικούσσα', '%ce%92%ce%b5%cf%81%ce%b9%ce%ba%ce%bf%cf%8d%cf%83%cf%83%ce%b1', 'gr', 1),
(510597, 782759, 'Γόννοι', '%ce%93%cf%8c%ce%bd%ce%bd%ce%bf%ce%b9', 'gr', 1),
(510598, 782759, 'Ενιππέα', '%ce%95%ce%bd%ce%b9%cf%80%cf%80%ce%ad%ce%b1', 'gr', 1),
(510599, 782759, 'Καρυά', '%ce%9a%ce%b1%cf%81%cf%85%ce%ac', 'gr', 1),
(510600, 782759, 'Κιλελέρ', '%ce%9a%ce%b9%ce%bb%ce%b5%ce%bb%ce%ad%cf%81', 'gr', 1),
(510601, 782759, 'Κράννωνας', '%ce%9a%cf%81%ce%ac%ce%bd%ce%bd%cf%89%ce%bd%ce%b1%cf%82', 'gr', 1),
(510602, 782759, 'Λάρισα', '%ce%9b%ce%ac%cf%81%ce%b9%cf%83%ce%b1', 'gr', 1),
(510603, 782759, 'Μακρυχώρι', '%ce%9c%ce%b1%ce%ba%cf%81%cf%85%cf%87%cf%8e%cf%81%ce%b9', 'gr', 1),
(510604, 782759, 'Ναρθάκι', '%ce%9d%ce%b1%cf%81%ce%b8%ce%ac%ce%ba%ce%b9', 'gr', 1),
(510605, 782759, 'Νίκαια', '%ce%9d%ce%af%ce%ba%ce%b1%ce%b9%ce%b1', 'gr', 1),
(510606, 782759, 'Πλατύκαμπος', '%ce%a0%ce%bb%ce%b1%cf%84%cf%8d%ce%ba%ce%b1%ce%bc%cf%80%ce%bf', 'gr', 1),
(510607, 782759, 'Ποταμιά', '%ce%a0%ce%bf%cf%84%ce%b1%ce%bc%ce%b9%ce%ac', 'gr', 1),
(510608, 782759, 'Τσαριτσάνη', '%ce%a4%cf%83%ce%b1%cf%81%ce%b9%cf%84%cf%83%ce%ac%ce%bd%ce%b7', 'gr', 1),
(510609, 782759, 'Φάρσαλα', '%ce%a6%ce%ac%cf%81%cf%83%ce%b1%ce%bb%ce%b1', 'gr', 1),
(510610, 782760, 'Αγριά', '%ce%91%ce%b3%cf%81%ce%b9%ce%ac', 'gr', 1),
(510611, 782760, 'Αλμυρός', '%ce%91%ce%bb%ce%bc%cf%85%cf%81%cf%8c%cf%82', 'gr', 1),
(510612, 782760, 'Ανάβρα', '%ce%91%ce%bd%ce%ac%ce%b2%cf%81%ce%b1', 'gr', 1),
(510613, 782760, 'Αρτέμιδα', '%ce%91%cf%81%cf%84%ce%ad%ce%bc%ce%b9%ce%b4%ce%b1', 'gr', 1),
(510614, 782760, 'Βόλος', '%ce%92%cf%8c%ce%bb%ce%bf%cf%82', 'gr', 1),
(510615, 782760, 'Ιωλκός', '%ce%99%cf%89%ce%bb%ce%ba%cf%8c%cf%82', 'gr', 1),
(510616, 782760, 'Κεραμίδι', '%ce%9a%ce%b5%cf%81%ce%b1%ce%bc%ce%af%ce%b4%ce%b9', 'gr', 1),
(510617, 782760, 'Μηλιές', '%ce%9c%ce%b7%ce%bb%ce%b9%ce%ad%cf%82', 'gr', 1),
(510618, 782760, 'Νέα Αγχίαλος', '%ce%9d%ce%ad%ce%b1-%ce%91%ce%b3%cf%87%ce%af%ce%b1%ce%bb%ce%b', 'gr', 1),
(510619, 782760, 'Πορταριά', '%ce%a0%ce%bf%cf%81%cf%84%ce%b1%cf%81%ce%b9%ce%ac', 'gr', 1),
(510620, 782760, 'Σηπιάδα', '%ce%a3%ce%b7%cf%80%ce%b9%ce%ac%ce%b4%ce%b1', 'gr', 1),
(510621, 782760, 'Σκοπέλος', '%ce%a3%ce%ba%ce%bf%cf%80%ce%ad%ce%bb%ce%bf%cf%82', 'gr', 1),
(510622, 782760, 'Τρικέρι', '%ce%a4%cf%81%ce%b9%ce%ba%ce%ad%cf%81%ce%b9', 'gr', 1),
(510623, 782760, 'Αισωνία', '%ce%91%ce%b9%cf%83%cf%89%ce%bd%ce%af%ce%b1', 'gr', 1),
(510624, 782760, 'Αλόννησος', '%ce%91%ce%bb%cf%8c%ce%bd%ce%bd%ce%b7%cf%83%ce%bf%cf%82', 'gr', 1),
(510625, 782760, 'Αργαλαστή', '%ce%91%cf%81%ce%b3%ce%b1%ce%bb%ce%b1%cf%83%cf%84%ce%ae', 'gr', 1),
(510626, 782760, 'Αφετές', '%ce%91%cf%86%ce%b5%cf%84%ce%ad%cf%82', 'gr', 1),
(510627, 782760, 'Ζαγορά', '%ce%96%ce%b1%ce%b3%ce%bf%cf%81%ce%ac', 'gr', 1),
(510628, 782760, 'Κάρλα', '%ce%9a%ce%ac%cf%81%ce%bb%ce%b1', 'gr', 1),
(510629, 782760, 'Μακρινίτσα', '%ce%9c%ce%b1%ce%ba%cf%81%ce%b9%ce%bd%ce%af%cf%84%cf%83%ce%b1', 'gr', 1),
(510630, 782760, 'Μούρεσι', '%ce%9c%ce%bf%cf%8d%cf%81%ce%b5%cf%83%ce%b9', 'gr', 1),
(510631, 782760, 'Νέα Ιωνία', '%ce%9d%ce%ad%ce%b1-%ce%99%cf%89%ce%bd%ce%af%ce%b1', 'gr', 1),
(510632, 782760, 'Πτελεός', '%ce%a0%cf%84%ce%b5%ce%bb%ce%b5%cf%8c%cf%82', 'gr', 1),
(510633, 782760, 'Σκιάθος', '%ce%a3%ce%ba%ce%b9%ce%ac%ce%b8%ce%bf%cf%82', 'gr', 1),
(510634, 782760, 'Σούρπη', '%ce%a3%ce%bf%cf%8d%cf%81%cf%80%ce%b7', 'gr', 1),
(510635, 782760, 'Φερές', '%ce%a6%ce%b5%cf%81%ce%ad%cf%82', 'gr', 1);

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
(509531, 0),
(509532, 0),
(509533, 0),
(509534, 0),
(509535, 0),
(509536, 0),
(509537, 0),
(509538, 0),
(509539, 0),
(509540, 0),
(509541, 0),
(509542, 0),
(509543, 0),
(509544, 0),
(509545, 0),
(509546, 0),
(509547, 0),
(509548, 0),
(509549, 0),
(509550, 0),
(509551, 0),
(509552, 0),
(509553, 0),
(509554, 0),
(509555, 0),
(509556, 0),
(509557, 0),
(509558, 0),
(509559, 0),
(509560, 0),
(509561, 0),
(509562, 0),
(509563, 0),
(509564, 0),
(509565, 0),
(509566, 0),
(509567, 0),
(509568, 0),
(509569, 0),
(509570, 0),
(509571, 0),
(509572, 0),
(509573, 0),
(509574, 0),
(509575, 0),
(509576, 0),
(509577, 0),
(509578, 0),
(509579, 0),
(509580, 0),
(509581, 0),
(509582, 0),
(509583, 0),
(509584, 0),
(509585, 0),
(509586, 0),
(509587, 0),
(509588, 0),
(509589, 0),
(509590, 0),
(509591, 0),
(509592, 0),
(509593, 0),
(509594, 0),
(509595, 0),
(509596, 0),
(509597, 0),
(509598, 0),
(509599, 0),
(509600, 0),
(509601, 0),
(509602, 0),
(509603, 0),
(509604, 0),
(509605, 0),
(509606, 0),
(509607, 0),
(509608, 0),
(509609, 0),
(509610, 0),
(509611, 0),
(509612, 0),
(509613, 0),
(509614, 0),
(509615, 0),
(509616, 0),
(509617, 0),
(509618, 0),
(509619, 0),
(509620, 0),
(509621, 0),
(509622, 0),
(509623, 0),
(509624, 0),
(509625, 0),
(509626, 0),
(509627, 0),
(509628, 0),
(509629, 0),
(509630, 0),
(509631, 0),
(509632, 0),
(509633, 0),
(509634, 0),
(509635, 0),
(509636, 0),
(509637, 0),
(509638, 0),
(509639, 0),
(509640, 0),
(509641, 0),
(509642, 0),
(509643, 0),
(509644, 0),
(509645, 0),
(509646, 0),
(509647, 0),
(509648, 0),
(509649, 0),
(509650, 0),
(509651, 0),
(509652, 0),
(509653, 0),
(509654, 0),
(509655, 0),
(509656, 0),
(509657, 0),
(509658, 0),
(509659, 0),
(509660, 0),
(509661, 0),
(509662, 0),
(509663, 0),
(509664, 0),
(509665, 0),
(509666, 0),
(509667, 0),
(509668, 0),
(509669, 0),
(509670, 0),
(509671, 0),
(509672, 0),
(509673, 0),
(509674, 0),
(509675, 0),
(509676, 0),
(509677, 0),
(509678, 0),
(509679, 0),
(509680, 0),
(509681, 0),
(509682, 0),
(509683, 0),
(509684, 0),
(509685, 0),
(509686, 0),
(509687, 0),
(509688, 0),
(509689, 0),
(509690, 0),
(509691, 0),
(509692, 0),
(509693, 0),
(509694, 0),
(509695, 0),
(509696, 0),
(509697, 0),
(509698, 0),
(509699, 0),
(509700, 0),
(509701, 0),
(509702, 0),
(509703, 0),
(509704, 0),
(509705, 0),
(509706, 0),
(509707, 0),
(509708, 0),
(509709, 0),
(509710, 0),
(509711, 0),
(509712, 0),
(509713, 0),
(509714, 0),
(509715, 0),
(509716, 0),
(509717, 0),
(509718, 0),
(509719, 0),
(509720, 0),
(509721, 0),
(509722, 0),
(509723, 0),
(509724, 0),
(509725, 0),
(509726, 0),
(509727, 0),
(509728, 0),
(509729, 0),
(509730, 0),
(509731, 0),
(509732, 0),
(509733, 0),
(509734, 0),
(509735, 0),
(509736, 0),
(509737, 0),
(509738, 0),
(509739, 0),
(509740, 0),
(509741, 0),
(509742, 0),
(509743, 0),
(509744, 0),
(509745, 0),
(509746, 0),
(509747, 0),
(509748, 0),
(509749, 0),
(509750, 0),
(509751, 0),
(509752, 0),
(509753, 0),
(509754, 0),
(509755, 0),
(509756, 0),
(509757, 0),
(509758, 0),
(509759, 0),
(509760, 0),
(509761, 0),
(509762, 0),
(509763, 0),
(509764, 0),
(509765, 0),
(509766, 0),
(509767, 0),
(509768, 0),
(509769, 0),
(509770, 0),
(509771, 0),
(509772, 0),
(509773, 0),
(509774, 0),
(509775, 0),
(509776, 0),
(509777, 0),
(509778, 0),
(509779, 0),
(509780, 0),
(509781, 0),
(509782, 0),
(509783, 0),
(509784, 0),
(509785, 0),
(509786, 0),
(509787, 0),
(509788, 0),
(509789, 0),
(509790, 0),
(509791, 0),
(509792, 0),
(509793, 0),
(509794, 0),
(509795, 0),
(509796, 0),
(509797, 0),
(509798, 0),
(509799, 0),
(509800, 0),
(509801, 0),
(509802, 0),
(509803, 0),
(509804, 0),
(509805, 0),
(509806, 0),
(509807, 0),
(509808, 0),
(509809, 0),
(509810, 0),
(509811, 0),
(509812, 0),
(509813, 0),
(509814, 0),
(509815, 0),
(509816, 0),
(509817, 0),
(509818, 0),
(509819, 0),
(509820, 0),
(509821, 0),
(509822, 0),
(509823, 0),
(509824, 0),
(509825, 0),
(509826, 0),
(509827, 0),
(509828, 0),
(509829, 0),
(509830, 0),
(509831, 0),
(509832, 0),
(509833, 0),
(509834, 0),
(509835, 0),
(509836, 0),
(509837, 0),
(509838, 0),
(509839, 0),
(509840, 0),
(509841, 0),
(509842, 0),
(509843, 0),
(509844, 0),
(509845, 0),
(509846, 0),
(509847, 0),
(509848, 0),
(509849, 0),
(509850, 0),
(509851, 0),
(509852, 0),
(509853, 0),
(509854, 0),
(509855, 0),
(509856, 0),
(509857, 0),
(509858, 0),
(509859, 0),
(509860, 0),
(509861, 0),
(509862, 0),
(509863, 0),
(509864, 0),
(509865, 0),
(509866, 0),
(509867, 0),
(509868, 0),
(509869, 0),
(509870, 0),
(509871, 0),
(509872, 0),
(509873, 0),
(509874, 0),
(509875, 0),
(509876, 0),
(509877, 0),
(509878, 0),
(509879, 0),
(509880, 0),
(509881, 0),
(509882, 0),
(509883, 0),
(509884, 0),
(509885, 0),
(509886, 0),
(509887, 0),
(509888, 0),
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
(509917, 0),
(509918, 0),
(509919, 0),
(509920, 0),
(509921, 0),
(509922, 0),
(509923, 0),
(509924, 0),
(509925, 0),
(509926, 0),
(509927, 0),
(509928, 0),
(509929, 0),
(509930, 0),
(509931, 0),
(509932, 0),
(509933, 0),
(509934, 0),
(509935, 0),
(509936, 0),
(509937, 0),
(509938, 0),
(509939, 0),
(509940, 0),
(509941, 0),
(509942, 0),
(509943, 0),
(509944, 0),
(509945, 0),
(509946, 0),
(509947, 0),
(509948, 0),
(509949, 0),
(509950, 0),
(509951, 0),
(509952, 0),
(509953, 0),
(509954, 0),
(509955, 0),
(509956, 0),
(509957, 0),
(509958, 0),
(509959, 0),
(509960, 0),
(509961, 0),
(509962, 0),
(509963, 0),
(509964, 0),
(509965, 0),
(509966, 0),
(509967, 0),
(509968, 0),
(509969, 0),
(509970, 0),
(509971, 0),
(509972, 0),
(509973, 0),
(509974, 0),
(509975, 0),
(509976, 0),
(509977, 0),
(509978, 0),
(509979, 0),
(509980, 0),
(509981, 0),
(509982, 0),
(509983, 0),
(509984, 0),
(509985, 0),
(509986, 0),
(509987, 0),
(509988, 0),
(509989, 0),
(509990, 0),
(509991, 0),
(509992, 0),
(509993, 0),
(509994, 0),
(509995, 0),
(509996, 0),
(509997, 0),
(509998, 0),
(509999, 0),
(510000, 0),
(510001, 0),
(510002, 0),
(510003, 0),
(510004, 0),
(510005, 0),
(510006, 0),
(510007, 0),
(510008, 0),
(510009, 0),
(510010, 0),
(510011, 0),
(510012, 0),
(510013, 0),
(510014, 0),
(510015, 0),
(510016, 0),
(510017, 0),
(510018, 0),
(510019, 0),
(510020, 0),
(510021, 0),
(510022, 0),
(510023, 0),
(510024, 0),
(510025, 0),
(510026, 0),
(510027, 0),
(510028, 0),
(510029, 0),
(510030, 0),
(510031, 0),
(510032, 0),
(510033, 0),
(510034, 0),
(510035, 0),
(510036, 0),
(510037, 0),
(510038, 0),
(510039, 0),
(510040, 0),
(510041, 0),
(510042, 0),
(510043, 0),
(510044, 0),
(510045, 0),
(510046, 0),
(510047, 0),
(510048, 0),
(510049, 0),
(510050, 0),
(510051, 0),
(510052, 0),
(510053, 0),
(510054, 0),
(510055, 0),
(510056, 0),
(510057, 0),
(510058, 0),
(510059, 0),
(510060, 0),
(510061, 0),
(510062, 0),
(510063, 0),
(510064, 0),
(510065, 0),
(510066, 0),
(510067, 0),
(510068, 0),
(510069, 0),
(510070, 0),
(510071, 0),
(510072, 0),
(510073, 0),
(510074, 0),
(510075, 0),
(510076, 0),
(510077, 0),
(510078, 0),
(510079, 0),
(510080, 0),
(510081, 0),
(510082, 0),
(510083, 0),
(510084, 0),
(510085, 0),
(510086, 0),
(510087, 0),
(510088, 0),
(510089, 0),
(510090, 0),
(510091, 0),
(510092, 0),
(510093, 0),
(510094, 0),
(510095, 0),
(510096, 0),
(510097, 0),
(510098, 0),
(510099, 0),
(510100, 0),
(510101, 0),
(510102, 0),
(510103, 0),
(510104, 0),
(510105, 0),
(510106, 0),
(510107, 0),
(510108, 0),
(510109, 0),
(510110, 0),
(510111, 0),
(510112, 0),
(510113, 0),
(510114, 0),
(510115, 0),
(510116, 0),
(510117, 0),
(510118, 0),
(510119, 0),
(510120, 0),
(510121, 0),
(510122, 0),
(510123, 0),
(510124, 0),
(510125, 0),
(510126, 0),
(510127, 0),
(510128, 0),
(510129, 0),
(510130, 0),
(510131, 0),
(510132, 0),
(510133, 0),
(510134, 0),
(510135, 0),
(510136, 0),
(510137, 0),
(510138, 0),
(510139, 0),
(510140, 0),
(510141, 0),
(510142, 0),
(510143, 0),
(510144, 0),
(510145, 0),
(510146, 0),
(510147, 0),
(510148, 0),
(510149, 0),
(510150, 0),
(510151, 0),
(510152, 0),
(510153, 0),
(510154, 0),
(510155, 0),
(510156, 0),
(510157, 0),
(510158, 0),
(510159, 0),
(510160, 0),
(510161, 0),
(510162, 0),
(510163, 0),
(510164, 0),
(510165, 0),
(510166, 0),
(510167, 0),
(510168, 0),
(510169, 0),
(510170, 0),
(510171, 0),
(510172, 0),
(510173, 0),
(510174, 0),
(510175, 0),
(510176, 0),
(510177, 0),
(510178, 0),
(510179, 0),
(510180, 0),
(510181, 0),
(510182, 0),
(510183, 0),
(510184, 0),
(510185, 0),
(510186, 0),
(510187, 0),
(510188, 0),
(510189, 0),
(510190, 0),
(510191, 0),
(510192, 0),
(510193, 0),
(510194, 0),
(510195, 0),
(510196, 0),
(510197, 0),
(510198, 0),
(510199, 0),
(510200, 0),
(510201, 0),
(510202, 0),
(510203, 0),
(510204, 0),
(510205, 0),
(510206, 0),
(510207, 0),
(510208, 0),
(510209, 0),
(510210, 0),
(510211, 0),
(510212, 0),
(510213, 0),
(510214, 0),
(510215, 0),
(510216, 0),
(510217, 0),
(510218, 0),
(510219, 0),
(510220, 0),
(510221, 0),
(510222, 0),
(510223, 0),
(510224, 0),
(510225, 0),
(510226, 0),
(510227, 0),
(510228, 0),
(510229, 0),
(510230, 0),
(510231, 0),
(510232, 0),
(510233, 0),
(510234, 0),
(510235, 0),
(510236, 0),
(510237, 0),
(510238, 0),
(510239, 0),
(510240, 0),
(510241, 0),
(510242, 0),
(510243, 0),
(510244, 0),
(510245, 0),
(510246, 0),
(510247, 0),
(510248, 0),
(510249, 0),
(510250, 0),
(510251, 0),
(510252, 0),
(510253, 0),
(510254, 0),
(510255, 0),
(510256, 0),
(510257, 0),
(510258, 0),
(510259, 0),
(510260, 0),
(510261, 0),
(510262, 0),
(510263, 0),
(510264, 0),
(510265, 0),
(510266, 0),
(510267, 0),
(510268, 0),
(510269, 0),
(510270, 0),
(510271, 0),
(510272, 0),
(510273, 0),
(510274, 0),
(510275, 0),
(510276, 0),
(510277, 0),
(510278, 0),
(510279, 0),
(510280, 0),
(510281, 0),
(510282, 0),
(510283, 0),
(510284, 0),
(510285, 0),
(510286, 0),
(510287, 0),
(510288, 0),
(510289, 0),
(510290, 0),
(510291, 0),
(510292, 0),
(510293, 0),
(510294, 0),
(510295, 0),
(510296, 0),
(510297, 0),
(510298, 0),
(510299, 0),
(510300, 0),
(510301, 0),
(510302, 0),
(510303, 0),
(510304, 0),
(510305, 0),
(510306, 0),
(510307, 0),
(510308, 0),
(510309, 0),
(510310, 0),
(510311, 0),
(510312, 0),
(510313, 0),
(510314, 0),
(510315, 0),
(510316, 0),
(510317, 0),
(510318, 0),
(510319, 0),
(510320, 0),
(510321, 0),
(510322, 0),
(510323, 0),
(510324, 0),
(510325, 0),
(510326, 0),
(510327, 0),
(510328, 0),
(510329, 0),
(510330, 0),
(510331, 0),
(510332, 0),
(510333, 0),
(510334, 0),
(510335, 0),
(510336, 0),
(510337, 0),
(510338, 0),
(510339, 0),
(510340, 0),
(510341, 0),
(510342, 0),
(510343, 0),
(510344, 0),
(510345, 0),
(510346, 0),
(510347, 0),
(510348, 0),
(510349, 0),
(510350, 0),
(510351, 0),
(510352, 0),
(510353, 0),
(510354, 0),
(510355, 0),
(510356, 0),
(510357, 0),
(510358, 0),
(510359, 0),
(510360, 0),
(510361, 0),
(510362, 0),
(510363, 0),
(510364, 0),
(510365, 0),
(510366, 0),
(510367, 0),
(510368, 0),
(510369, 0),
(510370, 0),
(510371, 0),
(510372, 0),
(510373, 0),
(510374, 0),
(510375, 0),
(510376, 0),
(510377, 0),
(510378, 0),
(510379, 0),
(510380, 0),
(510381, 0),
(510382, 0),
(510383, 0),
(510384, 0),
(510385, 0),
(510386, 0),
(510387, 0),
(510388, 0),
(510389, 0),
(510390, 0),
(510391, 0),
(510392, 0),
(510393, 0),
(510394, 0),
(510395, 0),
(510396, 0),
(510397, 0),
(510398, 0),
(510399, 0),
(510400, 0),
(510401, 0),
(510402, 0),
(510403, 0),
(510404, 0),
(510405, 0),
(510406, 0),
(510407, 0),
(510408, 0),
(510409, 0),
(510410, 0),
(510411, 0),
(510412, 0),
(510413, 0),
(510414, 0),
(510415, 0),
(510416, 0),
(510417, 0),
(510418, 0),
(510419, 0),
(510420, 0),
(510421, 0),
(510422, 0),
(510423, 0),
(510424, 0),
(510425, 0),
(510426, 0),
(510427, 0),
(510428, 0),
(510429, 0),
(510430, 0),
(510431, 0),
(510432, 0),
(510433, 0),
(510434, 0),
(510435, 0),
(510436, 0),
(510437, 0),
(510438, 0),
(510439, 0),
(510440, 0),
(510441, 0),
(510442, 0),
(510443, 0),
(510444, 0),
(510445, 0),
(510446, 0),
(510447, 0),
(510448, 0),
(510449, 0),
(510450, 0),
(510451, 0),
(510452, 0),
(510453, 0),
(510454, 0),
(510455, 0),
(510456, 0),
(510457, 0),
(510458, 0),
(510459, 0),
(510460, 0),
(510461, 0),
(510462, 0),
(510463, 0),
(510464, 0),
(510465, 0),
(510466, 0),
(510467, 0),
(510468, 0),
(510469, 0),
(510470, 0),
(510471, 0),
(510472, 0),
(510473, 0),
(510474, 0),
(510475, 0),
(510476, 0),
(510477, 0),
(510478, 0),
(510479, 0),
(510480, 0),
(510481, 0),
(510482, 0),
(510483, 0),
(510484, 0),
(510485, 0),
(510486, 0),
(510487, 0),
(510488, 0),
(510489, 0),
(510490, 0),
(510491, 0),
(510492, 0),
(510493, 0),
(510494, 0),
(510495, 0),
(510496, 0),
(510497, 0),
(510498, 0),
(510499, 0),
(510500, 0),
(510501, 0),
(510502, 0),
(510503, 0),
(510504, 0),
(510505, 0),
(510506, 0),
(510507, 0),
(510508, 0),
(510509, 0),
(510510, 0),
(510511, 0),
(510512, 0),
(510513, 0),
(510514, 0),
(510515, 0),
(510516, 0),
(510517, 0),
(510518, 0),
(510519, 0),
(510520, 0),
(510521, 0),
(510522, 0),
(510523, 0),
(510524, 0),
(510525, 0),
(510526, 0),
(510527, 0),
(510528, 0),
(510529, 0),
(510530, 0),
(510531, 0),
(510532, 0),
(510533, 0),
(510534, 0),
(510535, 0),
(510536, 0),
(510537, 0),
(510538, 0),
(510539, 0),
(510540, 0),
(510541, 0),
(510542, 0),
(510543, 0),
(510544, 0),
(510545, 0),
(510546, 0),
(510547, 0),
(510548, 0),
(510549, 0),
(510550, 0),
(510551, 0),
(510552, 0),
(510553, 0),
(510554, 0),
(510555, 0),
(510556, 0),
(510557, 0),
(510558, 0),
(510559, 0),
(510560, 0),
(510561, 0),
(510562, 0),
(510563, 0),
(510564, 0),
(510565, 0),
(510566, 0),
(510567, 0),
(510568, 0),
(510569, 0),
(510570, 0),
(510571, 0),
(510572, 0),
(510573, 0),
(510574, 0),
(510575, 0),
(510576, 0),
(510577, 0),
(510578, 0),
(510579, 0),
(510580, 0),
(510581, 0),
(510582, 0),
(510583, 0),
(510584, 0),
(510585, 0),
(510586, 0),
(510587, 0),
(510588, 0),
(510589, 0),
(510590, 0),
(510591, 0),
(510592, 0),
(510593, 0),
(510594, 0),
(510595, 0),
(510596, 0),
(510597, 0),
(510598, 0),
(510599, 0),
(510600, 0),
(510601, 0),
(510602, 0),
(510603, 0),
(510604, 0),
(510605, 0),
(510606, 0),
(510607, 0),
(510608, 0),
(510609, 0),
(510610, 0),
(510611, 0),
(510612, 0),
(510613, 0),
(510614, 0),
(510615, 0),
(510616, 0),
(510617, 0),
(510618, 0),
(510619, 0),
(510620, 0),
(510621, 0),
(510622, 0),
(510623, 0),
(510624, 0),
(510625, 0),
(510626, 0),
(510627, 0),
(510628, 0),
(510629, 0),
(510630, 0),
(510631, 0),
(510632, 0),
(510633, 0),
(510634, 0),
(510635, 0);

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
('GR', 1);

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
('HOURLY', '2018-05-08 23:45:08', '2018-05-09 00:45:00'),
('DAILY', '2018-05-08 13:09:22', '2018-05-09 13:09:00'),
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

--
-- Dumping data for table `oc_t_locations_tmp`
--

INSERT INTO `oc_t_locations_tmp` (`id_location`, `e_type`) VALUES
('510531', 'CITY'),
('510532', 'CITY'),
('510533', 'CITY'),
('510534', 'CITY'),
('510535', 'CITY'),
('510536', 'CITY'),
('510537', 'CITY'),
('510538', 'CITY'),
('510539', 'CITY'),
('510540', 'CITY'),
('510541', 'CITY'),
('510542', 'CITY'),
('510543', 'CITY'),
('510544', 'CITY'),
('510545', 'CITY'),
('510546', 'CITY'),
('510547', 'CITY'),
('510548', 'CITY'),
('510549', 'CITY'),
('510550', 'CITY'),
('510551', 'CITY'),
('510552', 'CITY'),
('510553', 'CITY'),
('510554', 'CITY'),
('510555', 'CITY'),
('510556', 'CITY'),
('510557', 'CITY'),
('510558', 'CITY'),
('510559', 'CITY'),
('510560', 'CITY'),
('510561', 'CITY'),
('510562', 'CITY'),
('510563', 'CITY'),
('510564', 'CITY'),
('510565', 'CITY'),
('510566', 'CITY'),
('510567', 'CITY'),
('510568', 'CITY'),
('510569', 'CITY'),
('510570', 'CITY'),
('510571', 'CITY'),
('510572', 'CITY'),
('510573', 'CITY'),
('510574', 'CITY'),
('510575', 'CITY'),
('510576', 'CITY'),
('510577', 'CITY'),
('510578', 'CITY'),
('510579', 'CITY'),
('510580', 'CITY'),
('510581', 'CITY'),
('510582', 'CITY'),
('510583', 'CITY'),
('510584', 'CITY'),
('510585', 'CITY'),
('510586', 'CITY'),
('510587', 'CITY'),
('510588', 'CITY'),
('510589', 'CITY'),
('510590', 'CITY'),
('510591', 'CITY'),
('510592', 'CITY'),
('510593', 'CITY'),
('510594', 'CITY'),
('510595', 'CITY'),
('510596', 'CITY'),
('510597', 'CITY'),
('510598', 'CITY'),
('510599', 'CITY'),
('510600', 'CITY'),
('510601', 'CITY'),
('510602', 'CITY'),
('510603', 'CITY'),
('510604', 'CITY'),
('510605', 'CITY'),
('510606', 'CITY'),
('510607', 'CITY'),
('510608', 'CITY'),
('510609', 'CITY'),
('510610', 'CITY'),
('510611', 'CITY'),
('510612', 'CITY'),
('510613', 'CITY'),
('510614', 'CITY'),
('510615', 'CITY'),
('510616', 'CITY'),
('510617', 'CITY'),
('510618', 'CITY'),
('510619', 'CITY'),
('510620', 'CITY'),
('510621', 'CITY'),
('510622', 'CITY'),
('510623', 'CITY'),
('510624', 'CITY'),
('510625', 'CITY'),
('510626', 'CITY'),
('510627', 'CITY'),
('510628', 'CITY'),
('510629', 'CITY'),
('510630', 'CITY'),
('510631', 'CITY'),
('510632', 'CITY'),
('510633', 'CITY'),
('510634', 'CITY'),
('510635', 'CITY'),
('782699', 'REGION'),
('782700', 'REGION'),
('782701', 'REGION'),
('782702', 'REGION'),
('782703', 'REGION'),
('782704', 'REGION'),
('782705', 'REGION'),
('782706', 'REGION'),
('782707', 'REGION'),
('782708', 'REGION'),
('782709', 'REGION'),
('782710', 'REGION'),
('782711', 'REGION'),
('782712', 'REGION'),
('782713', 'REGION'),
('782714', 'REGION'),
('782715', 'REGION'),
('782716', 'REGION'),
('782717', 'REGION'),
('782718', 'REGION'),
('782719', 'REGION'),
('782720', 'REGION'),
('782721', 'REGION'),
('782722', 'REGION'),
('782723', 'REGION'),
('782724', 'REGION'),
('782725', 'REGION'),
('782726', 'REGION'),
('782727', 'REGION'),
('782728', 'REGION'),
('782729', 'REGION'),
('782730', 'REGION'),
('782731', 'REGION'),
('782732', 'REGION'),
('782733', 'REGION'),
('782734', 'REGION'),
('782735', 'REGION'),
('782736', 'REGION'),
('782737', 'REGION'),
('782738', 'REGION'),
('782739', 'REGION'),
('782740', 'REGION'),
('782741', 'REGION'),
('782742', 'REGION'),
('782743', 'REGION'),
('782744', 'REGION'),
('782745', 'REGION'),
('782746', 'REGION'),
('782747', 'REGION'),
('782748', 'REGION'),
('782749', 'REGION'),
('782750', 'REGION'),
('782751', 'REGION'),
('782752', 'REGION'),
('782753', 'REGION'),
('782754', 'REGION'),
('782755', 'REGION'),
('782756', 'REGION'),
('782757', 'REGION'),
('782758', 'REGION'),
('782759', 'REGION'),
('782760', 'REGION'),
('GR', 'COUNTRY');

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
('2018-05-08 23:52:47', 'itemActions', 'deleteResourcesFromHD', 15, '', '192.168.2.21', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_categories`
--

CREATE TABLE `oc_t_meta_categories` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'Κινητό', 'ola_mobile', 'TEXT', '', 0, 0),
(3, 'Τηλ', 'ola_telephone', 'TEXT', '', 0, 0),
(4, 'e-mail', 'ola_email', 'TEXT', '', 0, 0);

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
('osclass', 'active_plugins', 'a:10:{i:13;s:29:\"simple_social_share/index.php\";i:15;s:27:\"responsive_slides/index.php\";i:16;s:16:\"qrcode/index.php\";i:17;s:20:\"easy-share/index.php\";i:19;s:21:\"google_maps/index.php\";i:21;s:17:\"welcome/index.php\";i:22;s:24:\"facebook_login/index.php\";i:26;s:18:\"moreedit/index.php\";i:30;s:16:\"voting/index.php\";i:31;s:26:\"preResize_images/index.php\";}', 'STRING'),
('osclass', 'admin_language', 'en_US', 'STRING'),
('osclass', 'admin_theme', 'modern', 'STRING'),
('osclass', 'akismetKey', '', 'STRING'),
('osclass', 'allowedExt', 'png,gif,jpg,jpeg', 'STRING'),
('osclass', 'allow_report_osclass', '0', 'BOOLEAN'),
('osclass', 'auto_cron', '1', 'STRING'),
('osclass', 'auto_update', 'disabled', 'STRING'),
('osclass', 'comments_per_page', '10', 'STRING'),
('osclass', 'contactEmail', 'ola@designisdesign.eu', 'STRING'),
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
('osclass', 'installed_plugins', 'a:12:{i:0;s:21:\"google_maps/index.php\";i:15;s:29:\"simple_social_share/index.php\";i:16;s:18:\"moreedit/index.php\";i:17;s:27:\"responsive_slides/index.php\";i:18;s:16:\"qrcode/index.php\";i:19;s:20:\"easy-share/index.php\";i:23;s:17:\"welcome/index.php\";i:24;s:24:\"facebook_login/index.php\";i:25;s:24:\"google_connect/index.php\";i:26;s:22:\"subscription/index.php\";i:30;s:16:\"voting/index.php\";i:31;s:26:\"preResize_images/index.php\";}', 'STRING'),
('osclass', 'items_wait_time', '0', 'STRING'),
('osclass', 'item_attachment', '0', 'STRING'),
('osclass', 'keep_original_image', '1', 'STRING'),
('osclass', 'language', 'el_GR', 'STRING'),
('osclass', 'languages_downloaded', '[\"el_GR\",\"en_US\"]', 'STRING'),
('osclass', 'languages_last_version_check', '1525774543', 'STRING'),
('osclass', 'languages_to_update', '[]', 'STRING'),
('osclass', 'languages_update_count', '0', 'STRING'),
('osclass', 'last_version_check', '1525773670', 'STRING'),
('osclass', 'location_todo', '1168', 'STRING'),
('osclass', 'logged_user_item_validation', '0', 'STRING'),
('osclass', 'mailserver_auth', '', 'BOOLEAN'),
('osclass', 'mailserver_host', 'localhost', 'STRING'),
('osclass', 'mailserver_mail_from', '', 'STRING'),
('osclass', 'mailserver_name_from', '', 'STRING'),
('osclass', 'mailserver_password', '', 'STRING'),
('osclass', 'mailserver_pop', '', 'BOOLEAN'),
('osclass', 'mailserver_port', '', 'INTEGER'),
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
('osclass', 'pageDesc', 'Τα πάντα για...', 'STRING'),
('osclass', 'pageTitle', 'Όλα...', 'STRING'),
('osclass', 'ping_search_engines', '0', 'BOOLEAN'),
('osclass', 'plugins_downloaded', '[\"http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_maps\\/update.php\",\"more-edit\",\"pre-resize-images\",\"qrcode\",\"responsive-slides\",\"simple-social-share\",\"voting\",\"youtube\",\"http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_analytics\\/update.php\",\"seo-wiz\",\"tawkto\"]', 'STRING'),
('osclass', 'plugins_last_version_check', '1525774551', 'STRING'),
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
('osclass', 'themes_last_version_check', '1525774545', 'STRING'),
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
('osclasswizards_theme', 'show_banner', '0', 'STRING'),
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
('qrcode', 'code_size', '3', 'INTEGER'),
('qrcode', 'upload_path', '/srv/http/ola/oc-content/uploads/qrcode/', 'STRING'),
('qrcode', 'upload_url', 'http://designisdesign.eu/ola/oc-content/uploads/qrcode/', 'STRING'),
('responsive_slides', 'auto', '1', 'BOOLEAN'),
('responsive_slides', 'backgroundcolor', '#FFFFFF', 'STRING'),
('responsive_slides', 'bordercolor', '#FFFFFF', 'STRING'),
('responsive_slides', 'borderwidth', '0', 'STRING'),
('responsive_slides', 'caption', '1', 'BOOLEAN'),
('responsive_slides', 'description', '1', 'BOOLEAN'),
('responsive_slides', 'height', '250', 'STRING'),
('responsive_slides', 'link', '0', 'BOOLEAN'),
('responsive_slides', 'navigation', '1', 'BOOLEAN'),
('responsive_slides', 'openin', '0', 'BOOLEAN'),
('responsive_slides', 'pager', '0', 'BOOLEAN'),
('responsive_slides', 'shadowcolor', '#333333', 'STRING'),
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
(782699, 'gr', 'Αθήνα - Βόρεια Προάστια', '%ce%91%ce%b8%ce%ae%ce%bd%ce%b1-%ce%92%cf%8c%cf%81%ce%b5%ce%b', 1),
(782700, 'gr', 'Αθήνα - Κέντρο', '%ce%91%ce%b8%ce%ae%ce%bd%ce%b1-%ce%9a%ce%ad%ce%bd%cf%84%cf%8', 1),
(782701, 'gr', 'Νομός Αργολίδας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%91%cf%81%ce%b3%ce%bf%ce%b', 1),
(782702, 'gr', 'Αθήνα - Ανατολικά Προάστια', '%ce%91%ce%b8%ce%ae%ce%bd%ce%b1-%ce%91%ce%bd%ce%b1%cf%84%ce%b', 1),
(782703, 'gr', 'Αθήνα - Δυτικά Προάστια', '%ce%91%ce%b8%ce%ae%ce%bd%ce%b1-%ce%94%cf%85%cf%84%ce%b9%ce%b', 1),
(782704, 'gr', 'Αθήνα - Νότια Προάστια', '%ce%91%ce%b8%ce%ae%ce%bd%ce%b1-%ce%9d%cf%8c%cf%84%ce%b9%ce%b', 1),
(782705, 'gr', 'Θεσσαλονίκη - Περιφ. Δήμοι', '%ce%98%ce%b5%cf%83%cf%83%ce%b1%ce%bb%ce%bf%ce%bd%ce%af%ce%ba', 1),
(782706, 'gr', 'Θεσσαλονίκη - Κέντρο', '%ce%98%ce%b5%cf%83%cf%83%ce%b1%ce%bb%ce%bf%ce%bd%ce%af%ce%ba', 1),
(782707, 'gr', 'Θεσσαλονίκη - Υπόλ. Νομού', '%ce%98%ce%b5%cf%83%cf%83%ce%b1%ce%bb%ce%bf%ce%bd%ce%af%ce%ba', 1),
(782708, 'gr', 'Αττική Ανατολική - Υπόλοιπο', '%ce%91%cf%84%cf%84%ce%b9%ce%ba%ce%ae-%ce%91%ce%bd%ce%b1%cf%8', 1),
(782709, 'gr', 'Αττική Δυτική  - Υπόλοιπο', '%ce%91%cf%84%cf%84%ce%b9%ce%ba%ce%ae-%ce%94%cf%85%cf%84%ce%b', 1),
(782710, 'gr', 'Νομός Αιτωλοακαρνανίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%91%ce%b9%cf%84%cf%89%ce%b', 1),
(782711, 'gr', 'Νομός Άρτας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%86%cf%81%cf%84%ce%b1%cf%8', 1),
(782712, 'gr', 'Νομός Αχαΐας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%91%cf%87%ce%b1%ce%90%ce%b', 1),
(782713, 'gr', 'Νομός Χίου', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a7%ce%af%ce%bf%cf%85', 1),
(782714, 'gr', 'Πειραιάς - Προάστεια', '%ce%a0%ce%b5%ce%b9%cf%81%ce%b1%ce%b9%ce%ac%cf%82-%ce%a0%cf%8', 1),
(782715, 'gr', 'Πειραιάς - Αργοσαρωνικός', '%ce%a0%ce%b5%ce%b9%cf%81%ce%b1%ce%b9%ce%ac%cf%82-%ce%91%cf%8', 1),
(782716, 'gr', 'Πειραιάς', '%ce%a0%ce%b5%ce%b9%cf%81%ce%b1%ce%b9%ce%ac%cf%82', 1),
(782717, 'gr', 'Νομός Πέλλας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a0%ce%ad%ce%bb%ce%bb%ce%b', 1),
(782718, 'gr', 'Νομός Ξάνθης', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9e%ce%ac%ce%bd%ce%b8%ce%b', 1),
(782719, 'gr', 'Νομός Κυκλάδων', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%cf%85%ce%ba%ce%bb%ce%a', 1),
(782720, 'gr', 'Νομός Ημαθίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%97%ce%bc%ce%b1%ce%b8%ce%a', 1),
(782721, 'gr', 'Νομός Λευκάδας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9b%ce%b5%cf%85%ce%ba%ce%a', 1),
(782722, 'gr', 'Νομός Έβρου', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%88%ce%b2%cf%81%ce%bf%cf%8', 1),
(782723, 'gr', 'Νομός Κέρκυρας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%ce%ad%cf%81%ce%ba%cf%8', 1),
(782724, 'gr', 'Νομός Βοιωτίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%92%ce%bf%ce%b9%cf%89%cf%8', 1),
(782725, 'gr', 'Νομός Χανίων', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a7%ce%b1%ce%bd%ce%af%cf%8', 1),
(782726, 'gr', 'Νομός Κοζάνης', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%ce%bf%ce%b6%ce%ac%ce%b', 1),
(782727, 'gr', 'Νομός Λασιθίου', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9b%ce%b1%cf%83%ce%b9%ce%b', 1),
(782728, 'gr', 'Νομός Κεφαλληνίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%ce%b5%cf%86%ce%b1%ce%b', 1),
(782729, 'gr', 'Νομός Ζακύνθου', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%96%ce%b1%ce%ba%cf%8d%ce%b', 1),
(782730, 'gr', 'Νομός Πιερίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a0%ce%b9%ce%b5%cf%81%ce%a', 1),
(782731, 'gr', 'Νομός Καβάλας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%ce%b1%ce%b2%ce%ac%ce%b', 1),
(782732, 'gr', 'Νομός Γρεβενών', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%93%cf%81%ce%b5%ce%b2%ce%b', 1),
(782733, 'gr', 'Νομός Ροδόπης', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a1%ce%bf%ce%b4%cf%8c%cf%8', 1),
(782734, 'gr', 'Νομός Δράμας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%94%cf%81%ce%ac%ce%bc%ce%b', 1),
(782735, 'gr', 'Νομός Κιλκίς', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%ce%b9%ce%bb%ce%ba%ce%a', 1),
(782736, 'gr', 'Νομός Σάμου', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a3%ce%ac%ce%bc%ce%bf%cf%8', 1),
(782737, 'gr', 'Νομός Ρεθύμνης', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a1%ce%b5%ce%b8%cf%8d%ce%b', 1),
(782738, 'gr', 'Νομός Εύβοιας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%95%cf%8d%ce%b2%ce%bf%ce%b', 1),
(782739, 'gr', 'Νομός Πρέβεζας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a0%cf%81%ce%ad%ce%b2%ce%b', 1),
(782740, 'gr', 'Νομός Λέσβου', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9b%ce%ad%cf%83%ce%b2%ce%b', 1),
(782741, 'gr', 'Νομός Φωκίδας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a6%cf%89%ce%ba%ce%af%ce%b', 1),
(782742, 'gr', 'Νομός Φλώρινας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a6%ce%bb%cf%8e%cf%81%ce%b', 1),
(782743, 'gr', 'Νομός Θεσπρωτίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%98%ce%b5%cf%83%cf%80%cf%8', 1),
(782744, 'gr', 'Νομός Ευρυτανίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%95%cf%85%cf%81%cf%85%cf%8', 1),
(782745, 'gr', 'Νομός Φθιώτιδας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a6%ce%b8%ce%b9%cf%8e%cf%8', 1),
(782746, 'gr', 'Νομός Αρκαδίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%91%cf%81%ce%ba%ce%b1%ce%b', 1),
(782747, 'gr', 'Νομός Καστοριάς', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%ce%b1%cf%83%cf%84%ce%b', 1),
(782748, 'gr', 'Νομός Χαλκιδικής', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a7%ce%b1%ce%bb%ce%ba%ce%b', 1),
(782749, 'gr', 'Νομός Μεσσηνίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9c%ce%b5%cf%83%cf%83%ce%b', 1),
(782750, 'gr', 'Νομός Σερρών', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a3%ce%b5%cf%81%cf%81%cf%8', 1),
(782751, 'gr', 'Νομός Καρδίτσας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%ce%b1%cf%81%ce%b4%ce%a', 1),
(782752, 'gr', 'Νομός Ηρακλείου', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%97%cf%81%ce%b1%ce%ba%ce%b', 1),
(782753, 'gr', 'Νομός Δωδεκανήσου', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%94%cf%89%ce%b4%ce%b5%ce%b', 1),
(782754, 'gr', 'Νομός Κορινθίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9a%ce%bf%cf%81%ce%b9%ce%b', 1),
(782755, 'gr', 'Νομός Λακωνίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9b%ce%b1%ce%ba%cf%89%ce%b', 1),
(782756, 'gr', 'Νομός Ηλείας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%97%ce%bb%ce%b5%ce%af%ce%b', 1),
(782757, 'gr', 'Νομός Ιωαννίνων', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%99%cf%89%ce%b1%ce%bd%ce%b', 1),
(782758, 'gr', 'Νομός Τρικάλων', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%a4%cf%81%ce%b9%ce%ba%ce%a', 1),
(782759, 'gr', 'Νομός Λάρισας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9b%ce%ac%cf%81%ce%b9%cf%8', 1),
(782760, 'gr', 'Νομός Μαγνησίας', '%ce%9d%ce%bf%ce%bc%cf%8c%cf%82-%ce%9c%ce%b1%ce%b3%ce%bd%ce%b', 1);

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
(782699, 0),
(782700, 0),
(782701, 0),
(782702, 0),
(782703, 0),
(782704, 0),
(782705, 0),
(782706, 0),
(782707, 0),
(782708, 0),
(782709, 0),
(782710, 0),
(782711, 0),
(782713, 0),
(782714, 0),
(782715, 0),
(782716, 0),
(782717, 0),
(782718, 0),
(782719, 0),
(782720, 0),
(782721, 0),
(782722, 0),
(782723, 0),
(782724, 0),
(782725, 0),
(782726, 0),
(782727, 0),
(782728, 0),
(782729, 0),
(782730, 0),
(782731, 0),
(782732, 0),
(782733, 0),
(782734, 0),
(782735, 0),
(782736, 0),
(782737, 0),
(782738, 0),
(782739, 0),
(782740, 0),
(782741, 0),
(782742, 0),
(782743, 0),
(782744, 0),
(782745, 0),
(782746, 0),
(782747, 0),
(782748, 0),
(782749, 0),
(782750, 0),
(782751, 0),
(782752, 0),
(782753, 0),
(782754, 0),
(782755, 0),
(782756, 0),
(782757, 0),
(782758, 0),
(782759, 0),
(782760, 0),
(782712, 1);

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
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
