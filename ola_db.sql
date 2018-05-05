-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: db35.grserver.gr:3306
-- Χρόνος δημιουργίας: 06 Μάη 2018 στις 00:09:08
-- Έκδοση διακομιστή: 10.0.35-MariaDB
-- Έκδοση PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `user8712913104_ola_paros_db2`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_admin`
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
-- Άδειασμα δεδομένων του πίνακα `oc_t_admin`
--

INSERT INTO `oc_t_admin` (`pk_i_id`, `s_name`, `s_username`, `s_password`, `s_email`, `s_secret`, `b_moderator`) VALUES
(1, 'admin', 'admin', '$2y$15$h1UW3Yq86Eh44fxg01USLOZMmZ7ArgFOUd3bjvTrtchu/MK1Hb7Yu', 'ola@designisdesign.eu', 'wlztwURp', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_alerts`
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
-- Δομή πίνακα για τον πίνακα `oc_t_alerts_sent`
--

CREATE TABLE `oc_t_alerts_sent` (
  `d_date` date NOT NULL,
  `i_num_alerts_sent` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_ban_rule`
--

CREATE TABLE `oc_t_ban_rule` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(250) NOT NULL DEFAULT '',
  `s_ip` varchar(50) NOT NULL DEFAULT '',
  `s_email` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_category`
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
-- Άδειασμα δεδομένων του πίνακα `oc_t_category`
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
-- Δομή πίνακα για τον πίνακα `oc_t_category_description`
--

CREATE TABLE `oc_t_category_description` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_description` text,
  `s_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_category_description`
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
-- Δομή πίνακα για τον πίνακα `oc_t_category_stats`
--

CREATE TABLE `oc_t_category_stats` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_category_stats`
--

INSERT INTO `oc_t_category_stats` (`fk_i_category_id`, `i_num_items`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 1),
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
(44, 1),
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
(115, 1),
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
-- Δομή πίνακα για τον πίνακα `oc_t_city`
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
-- Άδειασμα δεδομένων του πίνακα `oc_t_city`
--

INSERT INTO `oc_t_city` (`pk_i_id`, `fk_i_region_id`, `s_name`, `s_slug`, `fk_c_country_code`, `b_active`) VALUES
(510636, 782761, 'Αγία Άννα', '%cf%8d-2', 'GR', 1),
(510637, 782761, 'Αγιά', '%cf%8d-3', 'GR', 1),
(510638, 782761, 'Αγιασσός', '%cf%8d-4', 'GR', 1),
(510639, 782761, 'Άγιοι Πάντες', '%cf%8d-5', 'GR', 1),
(510640, 782761, 'Άγιος Αρσένιος', '%cf%8d-6', 'GR', 1),
(510641, 782761, 'Άγιος Θαλάλαιος', '%cf%8d-7', 'GR', 1),
(510642, 782761, 'Άγιος Προκόπιος', '%cf%8d-8', 'GR', 1),
(510643, 782761, 'Στελίδα', '%cf%8d-9', 'GR', 1),
(510644, 782761, 'Αγκίδια', '%cf%8d-10', 'GR', 1),
(510645, 782761, 'Αζαλάς', '%cf%8d-11', 'GR', 1),
(510646, 782761, 'Ακάδημοι', '%cf%8d-12', 'GR', 1),
(510647, 782761, 'Ακρωτήρι', '%cf%8d-13', 'GR', 1),
(510648, 782761, 'Άνω Ποταμιά', '%cf%8d-14', 'GR', 1),
(510649, 782761, 'Μέση Ποταμιά', '%cf%8d-15', 'GR', 1),
(510650, 782761, 'Απόλλωνας', '%cf%8d-16', 'GR', 1),
(510651, 782761, 'Απείρανθος', '%cf%8d-17', 'GR', 1),
(510652, 782761, 'Αργοκοίλι', '%cf%8d-18', 'GR', 1),
(510653, 782761, 'Αργοκοιλιώτισσα', '%cf%8d-19', 'GR', 1),
(510654, 782761, 'Ατσιπάπη', '%cf%8d-20', 'GR', 1),
(510655, 782761, 'Βουρβουριά', '%cf%8d-21', 'GR', 1),
(510656, 782761, 'Γαλανάδο', '%cf%8d-22', 'GR', 1),
(510657, 782761, 'Γαλήνη', '%cf%8d-23', 'GR', 1),
(510658, 782761, 'Γλυνάδο', '%cf%8d-24', 'GR', 1),
(510659, 782761, 'Δαμαλάς', '%cf%8d-25', 'GR', 1),
(510660, 782761, 'Δαμαριώνας', '%cf%8d-26', 'GR', 1),
(510661, 782761, 'Δανακός', '%cf%8d-27', 'GR', 1),
(510662, 782761, 'Εγγαρές', '%cf%8d-28', 'GR', 1),
(510663, 782761, 'Ζωοδόχος Πηγή', '%cf%8d-29', 'GR', 1),
(510664, 782761, 'Κάμπος', '%cf%8d-30', 'GR', 1),
(510665, 782761, 'Καλόξυλος', '%cf%8d-31', 'GR', 1),
(510666, 782761, 'Καλαντός', '%cf%8d-32', 'GR', 1),
(510667, 782761, 'Κανάκι', '%cf%8d-33', 'GR', 1),
(510668, 782761, 'Κανακάρι', '%cf%8d-34', 'GR', 1),
(510669, 782761, 'Καστράκι', '%cf%8d-35', 'GR', 1),
(510670, 782761, 'Κεραμί', '%cf%8d-36', 'GR', 1),
(510671, 782761, 'Κεραμωτή', '%cf%8d-37', 'GR', 1),
(510672, 782761, 'Κεραμωτή', '%cf%8d-38', 'GR', 1),
(510673, 782761, 'Κινίδαρος', '%cf%8d-39', 'GR', 1),
(510674, 782761, 'Κλειδός', '%cf%8d-40', 'GR', 1),
(510675, 782761, 'Κλειδώ', '%cf%8d-41', 'GR', 1),
(510676, 782761, 'Κόρωνος', '%cf%8d-42', 'GR', 1),
(510677, 782761, 'Κουρουνοχώρι', '%cf%8d-43', 'GR', 1),
(510678, 782761, 'Κωμιακή', '%cf%8d-44', 'GR', 1),
(510679, 782761, 'Λιώνας', '%cf%8d-45', 'GR', 1),
(510680, 782761, 'Λυγαρίδια', '%cf%8d-46', 'GR', 1),
(510681, 782761, 'Μάραγκας', '%cf%8d-47', 'GR', 1),
(510682, 782761, 'Μέλανες', '%cf%8d-48', 'GR', 1),
(510683, 782761, 'Μέση', '%cf%8d-49', 'GR', 1),
(510684, 782761, 'Μαστοράκης', '%cf%8d-50', 'GR', 1),
(510685, 782761, 'Μετόχι', '%cf%8d-51', 'GR', 1),
(510686, 782761, 'Μικρή Βίγλα', '%cf%8d-52', 'GR', 1),
(510687, 782761, 'Μονή', '%cf%8d-53', 'GR', 1),
(510688, 782761, 'Μουτσούνα', '%cf%8d-54', 'GR', 1),
(510689, 782761, 'Μύλοι', '%cf%8d-55', 'GR', 1),
(510690, 782761, 'Μυρίσης', '%cf%8d-56', 'GR', 1),
(510691, 782761, 'Πάνερμος', '%cf%8d-57', 'GR', 1),
(510692, 782761, 'Πατρική', '%cf%8d-58', 'GR', 1),
(510693, 782761, 'Πλάκα', '%cf%8d-59', 'GR', 1),
(510694, 782761, 'Κάτω Ποταμιά', '%cf%8d-60', 'GR', 1),
(510695, 782761, 'Πυργάκι', '%cf%8d-61', 'GR', 1),
(510696, 782761, 'Ράχη', '%cf%8d-62', 'GR', 1),
(510697, 782761, 'Άνω Σαγκρί', '%cf%8d-63', 'GR', 1),
(510698, 782761, 'Κάτω Σαγκρί', '%cf%8d-64', 'GR', 1),
(510699, 782761, 'Σαγκρί', '%cf%8d-65', 'GR', 1),
(510700, 782761, 'Σίφωνες', '%cf%8d-66', 'GR', 1),
(510701, 782761, 'Σκαδό', '%cf%8d-67', 'GR', 1),
(510702, 782761, 'Σκεπόνι', '%cf%8d-68', 'GR', 1),
(510703, 782761, 'Ταξιάρχης', '%cf%8d-69', 'GR', 1),
(510704, 782761, 'Τρίποδες', '%cf%8d-70', 'GR', 1),
(510705, 782761, 'Τσικαλαριό', '%cf%8d-71', 'GR', 1),
(510706, 782761, 'Φαρακλό', '%cf%8d-72', 'GR', 1),
(510707, 782761, 'Φιλώτι', '%cf%8d-73', 'GR', 1),
(510708, 782761, 'Χίλια Βρύση', '%cf%8d-74', 'GR', 1),
(510709, 782761, 'Χαλκί', '%cf%8d-75', 'GR', 1),
(510710, 782761, 'Χείμαρρος', '%cf%8d-76', 'GR', 1),
(510711, 782762, 'Πάρος', 'paros-1', 'GR', 1),
(510712, 782762, 'Άγιος Σπυρίδων', 'paros-2', 'GR', 1),
(510713, 782762, 'Άγιος Χαράλαμπος', 'paros-3', 'GR', 1),
(510715, 782762, 'Βουτάκος', 'paros-5', 'GR', 1),
(510716, 782762, 'Γλυσίδια', 'paros-6', 'GR', 1),
(510717, 782762, 'Έλητας', 'paros-7', 'GR', 1),
(510718, 782762, 'Κακάπετρα', 'paros-8', 'GR', 1),
(510719, 782762, 'Καλάμιον', 'paros-9', 'GR', 1),
(510721, 782762, 'Κάμπος', 'paros-11', 'GR', 1),
(510722, 782762, 'Κουκουμαυλές', 'paros-12', 'GR', 1),
(510723, 782762, 'Κρωτήρι', 'paros-13', 'GR', 1),
(510724, 782762, 'Μονή Χριστού Δάσους', 'paros-14', 'GR', 1),
(510725, 782762, 'Παράσπορος', 'paros-15', 'GR', 1),
(510726, 782762, 'Πούντα', 'paros-16', 'GR', 1),
(510727, 782762, 'Σαρακίνικο', 'paros-17', 'GR', 1),
(510728, 782762, 'Σωτήρες', 'paros-18', 'GR', 1),
(510729, 782762, 'Χωριουδάκι', 'paros-19', 'GR', 1),
(510730, 782762, 'Αγκαιριά', 'paros-20', 'GR', 1),
(510731, 782762, 'Άγιος Ιωάννης Τρυπητής', 'paros-21', 'GR', 1),
(510732, 782762, 'Αλυκή', 'paros-22', 'GR', 1),
(510733, 782762, 'Ανερατζά', 'paros-23', 'GR', 1),
(510734, 782762, 'Βουτάκος', 'paros-24', 'GR', 1),
(510736, 782762, 'Καμάριον', 'paros-26', 'GR', 1),
(510737, 782762, 'Μακριά Μύτη', 'paros-27', 'GR', 1),
(510738, 782762, 'Μονή Αγίων Θεοδώρων', 'paros-28', 'GR', 1),
(510739, 782762, 'Παντερονήσι', 'paros-29', 'GR', 1),
(510740, 782762, 'Αρχιλόχου', 'paros-30', 'GR', 1),
(510741, 782762, 'Μάρμαρα', 'paros-31', 'GR', 1),
(510742, 782762, 'Άγιος Νικόλαος', 'paros-32', 'GR', 1),
(510743, 782762, 'Γλυφάδες', 'paros-33', 'GR', 1),
(510744, 782762, 'Μώλος', 'paros-34', 'GR', 1),
(510745, 782762, 'Πρόδρομος', 'paros-35', 'GR', 1),
(510746, 782762, 'Τσουκαλιά', 'paros-36', 'GR', 1),
(510747, 782762, 'Κώστος', 'paros-37', 'GR', 1),
(510748, 782762, 'Ιστέρνι', 'paros-38', 'GR', 1),
(510749, 782762, 'Μαράθι', 'paros-39', 'GR', 1),
(510750, 782762, 'Λεύκες', 'paros-40', 'GR', 1),
(510751, 782762, 'Άσπρο Χωριό', 'paros-41', 'GR', 1),
(510752, 782762, 'Βουνιά', 'paros-42', 'GR', 1),
(510753, 782762, 'Γλυφά', 'paros-43', 'GR', 1),
(510754, 782762, 'Λαγκάδα', 'paros-44', 'GR', 1),
(510755, 782762, 'Μάρπησσα', 'paros-45', 'GR', 1),
(510756, 782762, 'Δρυονήσι', 'paros-46', 'GR', 1),
(510757, 782762, 'Δρυός', 'paros-47', 'GR', 1),
(510758, 782762, 'Μακρονήσι', 'paros-48', 'GR', 1),
(510759, 782762, 'Πίσω Λιβάδι', 'paros-49', 'GR', 1),
(510760, 782762, 'Πυργάκι', 'paros-50', 'GR', 1),
(510761, 782762, 'Τζάνες', 'paros-51', 'GR', 1),
(510762, 782762, 'Τούρλος', 'paros-52', 'GR', 1),
(510763, 782762, 'Τσουκαλάς', 'paros-53', 'GR', 1),
(510764, 782762, 'Χρυσή Ακτή', 'paros-54', 'GR', 1),
(510765, 782762, 'Νάουσα', 'paros-55', 'GR', 1),
(510766, 782762, 'Αγία Καλή', 'paros-56', 'GR', 1),
(510767, 782762, 'Άγιος Ανδρέας', 'paros-57', 'GR', 1),
(510768, 782762, 'Άγιος Αρτέμιος', 'paros-58', 'GR', 1),
(510769, 782762, 'Αμπελάς', 'paros-59', 'GR', 1),
(510770, 782762, 'Γαϊδουρονήσι', 'paros-60', 'GR', 1),
(510771, 782762, 'Γαλιάτσος', 'paros-61', 'GR', 1),
(510772, 782762, 'Γλαροπούντα', 'paros-62', 'GR', 1),
(510773, 782762, 'Εβριόκαστρο', 'paros-63', 'GR', 1),
(510774, 782762, 'Καμάρες', 'paros-64', 'GR', 1),
(510775, 782762, 'Κολυμπήθρες', 'paros-65', 'GR', 1),
(510776, 782762, 'Λάγκερη', 'paros-66', 'GR', 1),
(510777, 782762, 'Λιβάδια', 'paros-67', 'GR', 1),
(510778, 782762, 'Μαυρονήσι', 'paros-68', 'GR', 1),
(510779, 782762, 'Μικρονήσι', 'paros-69', 'GR', 1),
(510780, 782762, 'Μονή Αγίου Αντωνίου', 'paros-70', 'GR', 1),
(510781, 782762, 'Μονή Λογγοβάρδας', 'paros-71', 'GR', 1),
(510782, 782762, 'Ξιφάρα', 'paros-72', 'GR', 1),
(510783, 782762, 'Παντερονήσιο', 'paros-73', 'GR', 1),
(510784, 782762, 'Πρωτόργια', 'paros-74', 'GR', 1),
(510785, 782762, 'Τεταρτονήσι', 'paros-75', 'GR', 1),
(510786, 782762, 'Τηγάνι', 'paros-76', 'GR', 1),
(510788, 782762, 'Φιλίδι', 'paros-78', 'GR', 1),
(510789, 782762, 'Φοίνισσες', 'paros-79', 'GR', 1),
(510790, 782763, 'Άγιος Γεώργιος ', 'santorini-1', 'GR', 1),
(510791, 782763, 'Ακρωτήρι ', 'santorini-2', 'GR', 1),
(510792, 782763, 'Βόθωνας ', 'santorini-3', 'GR', 1),
(510793, 782763, 'Βουρβούλος ', 'santorini-4', 'GR', 1),
(510794, 782763, 'Εμπορείο ', 'santorini-5', 'GR', 1),
(510795, 782763, 'Έξω Γωνιά ', 'santorini-6', 'GR', 1),
(510796, 782763, 'Εξωμύτης ', 'santorini-7', 'GR', 1),
(510797, 782763, 'Επισκοπή Γωνιάς ', 'santorini-8', 'GR', 1),
(510798, 782763, 'Ημεροβίγλι ', 'santorini-9', 'GR', 1),
(510799, 782763, 'Καμάρι ', 'santorini-10', 'GR', 1),
(510800, 782763, 'Καρτεράδος ', 'santorini-11', 'GR', 1),
(510801, 782763, 'Κοντοχώρι ', 'santorini-12', 'GR', 1),
(510802, 782763, 'Μεγαλοχώρι ', 'santorini-13', 'GR', 1),
(510803, 782763, 'Μεσαριά ', 'santorini-14', 'GR', 1),
(510804, 782763, 'Μονόλιθος ', 'santorini-15', 'GR', 1),
(510805, 782763, 'Οία ', 'santorini-16', 'GR', 1),
(510806, 782763, 'Πύργος Καλλίστης', 'santorini-17', 'GR', 1),
(510807, 782763, 'Παναγία Καλού ', 'santorini-18', 'GR', 1),
(510808, 782763, 'Περίσσα ', 'santorini-19', 'GR', 1),
(510809, 782763, 'Φηρά ', 'santorini-20', 'GR', 1),
(510810, 782763, 'Φηροστεφάνι', 'santorini-21', 'GR', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_city_area`
--

CREATE TABLE `oc_t_city_area` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_city_stats`
--

CREATE TABLE `oc_t_city_stats` (
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_city_stats`
--

INSERT INTO `oc_t_city_stats` (`fk_i_city_id`, `i_num_items`) VALUES
(510636, 1),
(510731, 1),
(510765, 1),
(510796, 1),
(510646, 2);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_country`
--

CREATE TABLE `oc_t_country` (
  `pk_c_code` char(2) NOT NULL,
  `s_name` varchar(80) NOT NULL,
  `s_slug` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_country`
--

INSERT INTO `oc_t_country` (`pk_c_code`, `s_name`, `s_slug`) VALUES
('GR', 'Greece', 'greece');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_country_stats`
--

CREATE TABLE `oc_t_country_stats` (
  `fk_c_country_code` char(2) NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_country_stats`
--

INSERT INTO `oc_t_country_stats` (`fk_c_country_code`, `i_num_items`) VALUES
('GR', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_cron`
--

CREATE TABLE `oc_t_cron` (
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `d_last_exec` datetime NOT NULL,
  `d_next_exec` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_cron`
--

INSERT INTO `oc_t_cron` (`e_type`, `d_last_exec`, `d_next_exec`) VALUES
('HOURLY', '2018-05-05 05:15:22', '2018-05-05 06:15:00'),
('DAILY', '2018-05-05 05:15:24', '2018-05-06 05:15:00'),
('WEEKLY', '2018-05-05 05:15:22', '2018-05-12 05:15:00');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_currency`
--

CREATE TABLE `oc_t_currency` (
  `pk_c_code` char(3) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_description` varchar(80) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_currency`
--

INSERT INTO `oc_t_currency` (`pk_c_code`, `s_name`, `s_description`, `b_enabled`) VALUES
('EUR', 'European Union euro', 'Euro €', 1),
('GBP', 'United Kingdom pound', 'Pound £', 1),
('USD', 'United States dollar', 'Dollar US$', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_item`
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
-- Δομή πίνακα για τον πίνακα `oc_t_item_comment`
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
-- Δομή πίνακα για τον πίνακα `oc_t_item_description`
--

CREATE TABLE `oc_t_item_description` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(100) NOT NULL,
  `s_description` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_item_location`
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
-- Δομή πίνακα για τον πίνακα `oc_t_item_meta`
--

CREATE TABLE `oc_t_item_meta` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL,
  `s_value` text,
  `s_multi` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_item_resource`
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
-- Δομή πίνακα για τον πίνακα `oc_t_item_stats`
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
-- Δομή πίνακα για τον πίνακα `oc_t_keywords`
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
-- Δομή πίνακα για τον πίνακα `oc_t_latest_searches`
--

CREATE TABLE `oc_t_latest_searches` (
  `d_date` datetime NOT NULL,
  `s_search` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_locale`
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
-- Άδειασμα δεδομένων του πίνακα `oc_t_locale`
--

INSERT INTO `oc_t_locale` (`pk_c_code`, `s_name`, `s_short_name`, `s_description`, `s_version`, `s_author_name`, `s_author_url`, `s_currency_format`, `s_dec_point`, `s_thousands_sep`, `i_num_dec`, `s_date_format`, `s_stop_words`, `b_enabled`, `b_enabled_bo`) VALUES
('el_GR', 'Greek', 'Greek', 'Greek translation', 'Dev version', 'Osclass', 'http://osclass.org/', '{NUMBER} {CURRENCY}', ',', '.', 2, 'd/m/Y', '', 1, 1),
('en_US', 'English (US)', 'English', 'American english translation', '2.3', 'Osclass', 'http://osclass.org/', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', 'i,a,about,an,are,as,at,be,by,com,for,from,how,in,is,it,of,on,or,that,the,this,to,was,what,when,where,who,will,with,the', 1, 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_log`
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
-- Άδειασμα δεδομένων του πίνακα `oc_t_log`
--

INSERT INTO `oc_t_log` (`dt_date`, `s_section`, `s_action`, `fk_i_id`, `s_data`, `s_ip`, `s_who`, `fk_i_who_id`) VALUES
('2018-04-23 13:14:36', 'item', 'add', 5, '1243', '192.168.2.21', 'user', 1),
('2018-04-23 13:17:06', 'item', 'delete', 5, '1243', '192.168.2.21', 'admin', 1),
('2018-04-23 13:17:06', 'itemActions', 'deleteResourcesFromHD', 5, '5', '192.168.2.21', 'admin', 1),
('2018-04-23 13:17:06', 'itemActions', 'deleteResourcesFromHD', 5, '', '192.168.2.21', 'admin', 1),
('2018-04-23 16:41:39', 'user', 'delete', 1, 'test@designisdesign.eu', '192.168.2.21', 'admin', 1),
('2018-04-23 18:14:53', 'item', 'add', 6, 'Paros (test)', '192.168.2.21', 'admin', 2),
('2018-04-23 18:18:46', 'item', 'edit', 6, 'Paros (test)', '192.168.2.21', 'admin', 2),
('2018-04-23 18:22:06', 'user', 'add', 2, 'moderator1@designisdesign.eu', '192.168.2.21', 'admin', 1),
('2018-04-23 18:22:52', 'user', 'add', 3, 'moderator2@designisdesign.eu', '192.168.2.21', 'admin', 1),
('2018-04-23 18:24:26', 'item', 'edit', 6, 'Paros (test)', '192.168.2.21', 'admin', 1),
('2018-05-05 21:37:45', 'item', 'add', 7, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:37:56', 'item', 'delete', 7, '123', '37.6.0.71', 'admin', 1),
('2018-05-05 21:37:56', 'itemActions', 'deleteResourcesFromHD', 7, '7', '37.6.0.71', 'admin', 1),
('2018-05-05 21:37:56', 'itemActions', 'deleteResourcesFromHD', 7, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:38:36', 'item', 'add', 8, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:38:45', 'item', 'delete', 8, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 21:38:45', 'itemActions', 'deleteResourcesFromHD', 8, '8', '37.6.0.71', 'admin', 1),
('2018-05-05 21:38:45', 'itemActions', 'deleteResourcesFromHD', 8, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:49:58', 'item', 'add', 9, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:50:06', 'item', 'delete', 9, '123', '37.6.0.71', 'admin', 1),
('2018-05-05 21:50:06', 'itemActions', 'deleteResourcesFromHD', 9, '9', '37.6.0.71', 'admin', 1),
('2018-05-05 21:50:06', 'itemActions', 'deleteResourcesFromHD', 9, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:50:37', 'item', 'add', 10, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:50:58', 'item', 'add', 11, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:22', 'item', 'add', 12, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:27', 'item', 'delete', 11, 'qwerty', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:27', 'itemActions', 'deleteResourcesFromHD', 11, '11', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:27', 'itemActions', 'deleteResourcesFromHD', 11, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:33', 'item', 'delete', 6, 'Πάρος (τεστ)', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:33', 'itemActions', 'deleteResourcesFromHD', 6, '6', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:33', 'item', 'delete resource', 1, '1', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:33', 'item', 'delete resource backtrace', 1, '#0 osc_deleteResource called@ [/var/www/vhosts/digitalvision.gr/httpdocs/olaparos/oc-includes/osclass/ItemActions.php:820] / #1 deleteResourcesFromHD called@ [/var/www/vhosts/digitalvision.gr/httpdocs/olaparos/oc-includes/osclass/model/Item.php:967] ', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:33', 'itemActions', 'deleteResourcesFromHD', 6, '1,', '37.6.0.71', 'admin', 1),
('2018-05-05 21:51:55', 'item', 'add', 13, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:00', 'item', 'delete', 10, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:06', 'item', 'delete', 12, 'cvbnm', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:06', 'itemActions', 'deleteResourcesFromHD', 12, '12', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:06', 'itemActions', 'deleteResourcesFromHD', 12, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:13', 'item', 'delete', 13, '432543543', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:13', 'itemActions', 'deleteResourcesFromHD', 13, '13', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:13', 'itemActions', 'deleteResourcesFromHD', 13, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:16', 'item', 'delete', 10, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 21:52:41', 'item', 'delete', 10, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 21:53:01', 'item', 'add', 14, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:53:05', 'item', 'delete', 14, 'dsafsdafds', '37.6.0.71', 'admin', 1),
('2018-05-05 21:53:05', 'itemActions', 'deleteResourcesFromHD', 14, '14', '37.6.0.71', 'admin', 1),
('2018-05-05 21:53:05', 'itemActions', 'deleteResourcesFromHD', 14, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:53:26', 'item', 'add', 15, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:53:32', 'item', 'delete', 10, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 21:54:06', 'item', 'delete', 10, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 21:54:06', 'itemActions', 'deleteResourcesFromHD', 10, '10', '37.6.0.71', 'admin', 1),
('2018-05-05 21:54:06', 'itemActions', 'deleteResourcesFromHD', 10, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:54:12', 'item', 'delete', 15, 'sqdwqdwq', '37.6.0.71', 'admin', 1),
('2018-05-05 21:54:12', 'itemActions', 'deleteResourcesFromHD', 15, '15', '37.6.0.71', 'admin', 1),
('2018-05-05 21:54:12', 'itemActions', 'deleteResourcesFromHD', 15, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:56:13', 'item', 'add', 16, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:56:20', 'item', 'delete', 16, 'qwerty', '37.6.0.71', 'admin', 1),
('2018-05-05 21:56:20', 'itemActions', 'deleteResourcesFromHD', 16, '16', '37.6.0.71', 'admin', 1),
('2018-05-05 21:56:20', 'itemActions', 'deleteResourcesFromHD', 16, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:56:58', 'item', 'add', 17, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:57:15', 'item', 'add', 18, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:57:30', 'item', 'delete', 18, 'dsajdlsaJKLDSa', '37.6.0.71', 'admin', 1),
('2018-05-05 21:57:30', 'itemActions', 'deleteResourcesFromHD', 18, '18', '37.6.0.71', 'admin', 1),
('2018-05-05 21:57:30', 'itemActions', 'deleteResourcesFromHD', 18, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:57:30', 'item', 'delete', 17, '123', '37.6.0.71', 'admin', 1),
('2018-05-05 21:57:30', 'itemActions', 'deleteResourcesFromHD', 17, '17', '37.6.0.71', 'admin', 1),
('2018-05-05 21:57:30', 'itemActions', 'deleteResourcesFromHD', 17, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:57:58', 'item', 'add', 19, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:58:14', 'item', 'add', 20, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:58:29', 'item', 'add', 21, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:58:52', 'item', 'add', 22, '', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'item', 'delete', 22, '898989898989', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'itemActions', 'deleteResourcesFromHD', 22, '22', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'itemActions', 'deleteResourcesFromHD', 22, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'item', 'delete', 21, 'hjahfjkhdskj', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'itemActions', 'deleteResourcesFromHD', 21, '21', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'itemActions', 'deleteResourcesFromHD', 21, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'item', 'delete', 20, '222222', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'itemActions', 'deleteResourcesFromHD', 20, '20', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'itemActions', 'deleteResourcesFromHD', 20, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'item', 'delete', 19, '333333', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'itemActions', 'deleteResourcesFromHD', 19, '19', '37.6.0.71', 'admin', 1),
('2018-05-05 21:59:42', 'itemActions', 'deleteResourcesFromHD', 19, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 22:00:35', 'item', 'add', 23, '', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:02', 'item', 'add', 24, 'yrueyiuhi', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:20', 'item', 'add', 25, '', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:42', 'item', 'delete', 24, 'fdgfdsagda', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:42', 'itemActions', 'deleteResourcesFromHD', 24, '24', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:42', 'itemActions', 'deleteResourcesFromHD', 24, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:50', 'item', 'delete', 23, '2143214321', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:50', 'itemActions', 'deleteResourcesFromHD', 23, '23', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:50', 'itemActions', 'deleteResourcesFromHD', 23, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:58', 'item', 'delete', 25, '90909090', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:58', 'itemActions', 'deleteResourcesFromHD', 25, '25', '37.6.0.71', 'admin', 1),
('2018-05-05 22:01:58', 'itemActions', 'deleteResourcesFromHD', 25, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 22:02:38', 'item', 'add', 26, '', '37.6.0.71', 'admin', 1),
('2018-05-05 22:03:05', 'item', 'add', 27, '', '37.6.0.71', 'admin', 1),
('2018-05-05 22:03:33', 'item', 'add', 28, '', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:09', 'item', 'delete', 28, '8594389854209', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:09', 'itemActions', 'deleteResourcesFromHD', 28, '28', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:09', 'itemActions', 'deleteResourcesFromHD', 28, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:17', 'item', 'delete', 27, 'sajkhaskjhkj', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:17', 'itemActions', 'deleteResourcesFromHD', 27, '27', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:17', 'itemActions', 'deleteResourcesFromHD', 27, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:21', 'item', 'delete', 26, '1213214', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:21', 'itemActions', 'deleteResourcesFromHD', 26, '26', '37.6.0.71', 'admin', 1),
('2018-05-05 22:05:21', 'itemActions', 'deleteResourcesFromHD', 26, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 22:07:56', 'item', 'add', 29, '', '37.6.0.71', 'admin', 1),
('2018-05-05 22:09:36', 'item', 'add', 30, '000000', '37.6.0.71', 'user', 2),
('2018-05-05 22:10:04', 'item', 'delete', 30, '000000', '37.6.0.71', 'admin', 1),
('2018-05-05 22:10:18', 'item', 'delete', 30, '000000', '37.6.0.71', 'admin', 1),
('2018-05-05 22:10:55', 'user', 'deactivate', 2, 'moderator1@designisdesign.eu', '37.6.0.71', 'admin', 1),
('2018-05-05 22:11:35', 'user', 'delete', 3, 'moderator2@designisdesign.eu', '37.6.0.71', 'admin', 1),
('2018-05-05 22:11:35', 'user', 'delete', 2, 'moderator1@designisdesign.eu', '37.6.0.71', 'admin', 1),
('2018-05-05 22:11:35', 'itemActions', 'deleteResourcesFromHD', 30, '30', '37.6.0.71', 'admin', 1),
('2018-05-05 22:11:35', 'itemActions', 'deleteResourcesFromHD', 30, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 22:11:44', 'item', 'delete', 29, '1221321432', '37.6.0.71', 'admin', 1),
('2018-05-05 22:11:44', 'itemActions', 'deleteResourcesFromHD', 29, '29', '37.6.0.71', 'admin', 1),
('2018-05-05 22:11:44', 'itemActions', 'deleteResourcesFromHD', 29, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 23:52:56', 'user', 'register', 4, 'user@user.gr', '37.6.0.71', 'user', 4),
('2018-05-05 23:53:29', 'user', 'activate', 4, 'user@user.gr', '37.6.0.71', 'admin', 1),
('2018-05-05 23:54:09', 'item', 'add', 31, '1234', '37.6.0.71', 'user', 4),
('2018-05-05 23:54:19', 'item', 'delete', 31, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 23:54:44', 'item', 'add', 32, 'qwerty', '37.6.0.71', 'user', 4),
('2018-05-05 23:55:01', 'item', 'delete', 31, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:07', 'item', 'delete', 32, 'qwerty', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:07', 'itemActions', 'deleteResourcesFromHD', 32, '32', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:07', 'itemActions', 'deleteResourcesFromHD', 32, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:13', 'item', 'delete', 31, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:24', 'item', 'delete', 31, '1234', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:24', 'itemActions', 'deleteResourcesFromHD', 31, '31', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:24', 'itemActions', 'deleteResourcesFromHD', 31, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:42', 'item', 'add', 33, '12345', '37.6.0.71', 'user', 4),
('2018-05-05 23:55:50', 'item', 'delete', 33, '12345', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:50', 'itemActions', 'deleteResourcesFromHD', 33, '33', '37.6.0.71', 'admin', 1),
('2018-05-05 23:55:50', 'itemActions', 'deleteResourcesFromHD', 33, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 23:56:13', 'item', 'add', 34, '', '37.6.0.71', 'admin', 1),
('2018-05-05 23:56:20', 'item', 'delete', 34, '12345', '37.6.0.71', 'admin', 1),
('2018-05-05 23:56:20', 'itemActions', 'deleteResourcesFromHD', 34, '34', '37.6.0.71', 'admin', 1),
('2018-05-05 23:56:20', 'itemActions', 'deleteResourcesFromHD', 34, '0', '37.6.0.71', 'admin', 1),
('2018-05-05 23:56:34', 'user', 'delete', 4, 'user@user.gr', '37.6.0.71', 'admin', 1),
('2018-05-05 23:58:26', 'user', 'add', 5, 'user@user.gr', '37.6.0.71', 'admin', 1),
('2018-05-05 23:59:16', 'item', 'add', 35, '12345', '37.6.0.71', 'user', 5),
('2018-05-05 23:59:31', 'item', 'delete', 35, '12345', '37.6.0.71', 'admin', 1),
('2018-05-06 00:00:51', 'user', 'deactivate', 5, 'user@user.gr', '37.6.0.71', 'admin', 1),
('2018-05-06 00:00:59', 'user', 'activate', 5, 'user@user.gr', '37.6.0.71', 'admin', 1),
('2018-05-06 00:01:04', 'user', 'deactivate', 5, 'user@user.gr', '37.6.0.71', 'admin', 1),
('2018-05-06 00:01:38', 'user', 'add', 6, 'adsa@ldklsas.lo', '37.6.0.71', 'admin', 1),
('2018-05-06 00:01:43', 'user', 'delete', 5, 'user@user.gr', '37.6.0.71', 'admin', 1),
('2018-05-06 00:01:43', 'itemActions', 'deleteResourcesFromHD', 35, '35', '37.6.0.71', 'admin', 1),
('2018-05-06 00:01:43', 'itemActions', 'deleteResourcesFromHD', 35, '0', '37.6.0.71', 'admin', 1),
('2018-05-06 00:01:47', 'user', 'delete', 6, 'adsa@ldklsas.lo', '37.6.0.71', 'admin', 1),
('2018-05-06 00:02:05', 'user', 'add', 7, 'dkjsk@dskjkas.lo', '37.6.0.71', 'admin', 1),
('2018-05-06 00:02:09', 'user', 'delete', 7, 'dkjsk@dskjkas.lo', '37.6.0.71', 'admin', 1),
('2018-05-06 00:02:33', 'user', 'register', 8, 'hdjshdjsh@jdksafs.lo', '37.6.0.71', 'user', 8),
('2018-05-06 00:02:46', 'user', 'activate', 8, 'hdjshdjsh@jdksafs.lo', '37.6.0.71', 'admin', 1),
('2018-05-06 00:03:12', 'item', 'add', 36, 'fsfdd', '37.6.0.71', 'user', 8),
('2018-05-06 00:03:23', 'item', 'delete', 36, 'fsfdd', '37.6.0.71', 'admin', 1),
('2018-05-06 00:03:23', 'itemActions', 'deleteResourcesFromHD', 36, '36', '37.6.0.71', 'admin', 1),
('2018-05-06 00:03:23', 'itemActions', 'deleteResourcesFromHD', 36, '0', '37.6.0.71', 'admin', 1),
('2018-05-06 00:03:31', 'user', 'delete', 8, 'hdjshdjsh@jdksafs.lo', '37.6.0.71', 'admin', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_meta_categories`
--

CREATE TABLE `oc_t_meta_categories` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_meta_categories`
--

INSERT INTO `oc_t_meta_categories` (`fk_i_category_id`, `fk_i_field_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(2, 4),
(3, 1),
(3, 3),
(3, 4),
(4, 1),
(4, 3),
(4, 4),
(5, 1),
(5, 3),
(5, 4),
(6, 1),
(6, 3),
(6, 4),
(7, 1),
(7, 3),
(7, 4),
(8, 1),
(8, 3),
(8, 4),
(8, 6),
(26, 1),
(26, 3),
(26, 4),
(27, 1),
(27, 3),
(27, 4),
(28, 1),
(28, 3),
(28, 4),
(31, 1),
(31, 3),
(31, 4),
(32, 1),
(32, 3),
(32, 4),
(33, 1),
(33, 3),
(33, 4),
(34, 1),
(34, 3),
(34, 4),
(36, 1),
(36, 3),
(36, 4),
(37, 1),
(37, 3),
(37, 4),
(38, 1),
(38, 3),
(38, 4),
(39, 1),
(39, 3),
(39, 4),
(40, 1),
(40, 3),
(40, 4),
(41, 1),
(41, 3),
(41, 4),
(42, 1),
(42, 3),
(42, 4),
(44, 1),
(44, 3),
(44, 4),
(45, 1),
(45, 3),
(45, 4),
(49, 1),
(49, 3),
(49, 4),
(50, 1),
(50, 3),
(50, 4),
(52, 1),
(52, 3),
(52, 4),
(55, 1),
(55, 3),
(55, 4),
(56, 1),
(56, 3),
(56, 4),
(58, 1),
(58, 3),
(58, 4),
(59, 1),
(59, 3),
(59, 4),
(60, 1),
(60, 3),
(60, 4),
(61, 1),
(61, 3),
(61, 4),
(62, 1),
(62, 3),
(62, 4),
(63, 1),
(63, 3),
(63, 4),
(64, 1),
(64, 3),
(64, 4),
(65, 1),
(65, 3),
(65, 4),
(66, 1),
(66, 3),
(66, 4),
(67, 1),
(67, 3),
(67, 4),
(68, 1),
(68, 3),
(68, 4),
(69, 1),
(69, 3),
(69, 4),
(70, 1),
(70, 3),
(70, 4),
(71, 1),
(71, 3),
(71, 4),
(72, 1),
(72, 3),
(72, 4),
(73, 1),
(73, 3),
(73, 4),
(74, 1),
(74, 3),
(74, 4),
(75, 1),
(75, 3),
(75, 4),
(75, 6),
(76, 1),
(76, 3),
(76, 4),
(76, 6),
(78, 1),
(78, 3),
(78, 4),
(78, 6),
(82, 1),
(82, 3),
(82, 4),
(82, 6),
(93, 1),
(93, 3),
(93, 4),
(93, 6),
(102, 1),
(102, 3),
(102, 4),
(103, 1),
(103, 3),
(103, 4),
(104, 1),
(104, 3),
(104, 4),
(105, 1),
(105, 3),
(105, 4),
(106, 1),
(106, 3),
(106, 4),
(107, 1),
(107, 3),
(107, 4),
(109, 1),
(109, 3),
(109, 4),
(111, 1),
(111, 3),
(111, 4),
(113, 1),
(113, 3),
(113, 4),
(114, 1),
(114, 3),
(114, 4),
(115, 1),
(115, 3),
(115, 4),
(116, 1),
(116, 3),
(116, 4),
(117, 1),
(117, 3),
(117, 4),
(118, 1),
(118, 3),
(118, 4),
(119, 1),
(119, 3),
(119, 4),
(120, 1),
(120, 3),
(120, 4),
(121, 1),
(121, 3),
(121, 4),
(122, 1),
(122, 3),
(122, 4),
(123, 1),
(123, 3),
(123, 4),
(124, 1),
(124, 3),
(124, 4),
(125, 1),
(125, 3),
(125, 4),
(126, 1),
(126, 3),
(126, 4),
(127, 1),
(127, 3),
(127, 4),
(128, 1),
(128, 3),
(128, 4),
(129, 1),
(129, 3),
(129, 4),
(130, 1),
(130, 3),
(130, 4),
(131, 1),
(131, 3),
(131, 4),
(132, 1),
(132, 3),
(132, 4),
(133, 1),
(133, 3),
(133, 4),
(134, 1),
(134, 3),
(134, 4),
(135, 1),
(135, 3),
(135, 4),
(136, 1),
(136, 3),
(136, 4),
(137, 1),
(137, 3),
(137, 4),
(138, 1),
(138, 3),
(138, 4),
(139, 1),
(139, 3),
(139, 4),
(140, 1),
(140, 3),
(140, 4),
(141, 1),
(141, 3),
(141, 4),
(142, 1),
(142, 3),
(142, 4),
(143, 1),
(143, 3),
(143, 4),
(144, 1),
(144, 3),
(144, 4),
(145, 1),
(145, 3),
(145, 4),
(146, 1),
(146, 3),
(146, 4);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_meta_fields`
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
-- Άδειασμα δεδομένων του πίνακα `oc_t_meta_fields`
--

INSERT INTO `oc_t_meta_fields` (`pk_i_id`, `s_name`, `s_slug`, `e_type`, `s_options`, `b_required`, `b_searchable`) VALUES
(1, 'Κινητό', 'ola_mobile', 'TEXT', '', 0, 0),
(3, 'Τηλ', 'ola_telephone', 'TEXT', '', 0, 0),
(4, 'e-mail', 'ola_email', 'TEXT', '', 0, 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_pages`
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
-- Άδειασμα δεδομένων του πίνακα `oc_t_pages`
--

INSERT INTO `oc_t_pages` (`pk_i_id`, `s_internal_name`, `b_indelible`, `b_link`, `dt_pub_date`, `dt_mod_date`, `i_order`, `s_meta`) VALUES
(1, 'email_item_inquiry', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(2, 'email_user_validation', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(3, 'email_user_registration', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(4, 'email_send_friend', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(5, 'alert_email_hourly', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(6, 'alert_email_daily', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(7, 'alert_email_weekly', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(8, 'alert_email_instant', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(9, 'email_new_comment_admin', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(10, 'email_new_item_non_register_user', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(11, 'email_item_validation', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(12, 'email_admin_new_item', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(13, 'email_user_forgot_password', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(14, 'email_new_email', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(15, 'email_alert_validation', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(16, 'email_comment_validated', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(17, 'email_item_validation_non_register_user', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(18, 'email_admin_new_user', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(19, 'email_contact_user', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(20, 'email_new_comment_user', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(21, 'email_new_admin', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(22, 'email_warn_expiration', 1, 1, '2018-04-02 14:28:49', NULL, 0, NULL),
(23, 'example_page', 0, 0, '2018-04-02 11:28:51', '2018-04-02 11:28:51', 0, '\"\"'),
(26, 'about_us', 0, 0, '2018-04-04 18:42:50', '2018-04-23 17:02:06', 1, '\"\"'),
(27, 'email_moreedit_notify_edit', 1, 1, '2018-04-11 21:15:25', NULL, 0, NULL),
(28, 'bootlist-faqs', 0, 0, '2018-04-14 13:02:09', '2018-04-14 13:02:09', 2, '\"\"'),
(29, 'bootlist-about-us', 0, 0, '2018-04-14 13:02:09', '2018-04-14 13:02:09', 3, '\"\"'),
(30, 'subscription_email', 1, 1, '2018-04-16 13:08:38', NULL, 0, NULL),
(33, 'signup_promo_codes', 1, 0, '2018-04-16 17:16:22', '2018-04-16 17:16:22', 6, NULL),
(34, 'send_promo_codes', 1, 0, '2018-04-16 17:16:22', '2018-04-16 17:16:22', 7, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_pages_description`
--

CREATE TABLE `oc_t_pages_description` (
  `fk_i_pages_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(255) NOT NULL,
  `s_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_pages_description`
--

INSERT INTO `oc_t_pages_description` (`fk_i_pages_id`, `fk_c_locale_code`, `s_title`, `s_text`) VALUES
(1, 'el_GR', '{WEB_TITLE} - Κάποιος χρήστης έχει μία ερώτηση, σχετικά με τη καταχώρηση σας', '<p>Γειά σου {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) άφησε ένα μήνυμα σχετικά με τη καταχώρηση σας <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Φιλικοί χαιρετισμοί,</p><p>{WEB_LINK}</p>'),
(1, 'en_US', '{WEB_TITLE} - Someone has a question about your listing', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message about your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(2, 'el_GR', 'Παρακαλώ επικυρώστε τον  {WEB_TITLE} λογαριασμό', '<p>Γειά σου {USER_NAME},</p><p>Παρακαλώ επικυρώστε την εγγραφή σας, πατώντας στον ακόλουθο ηλεκτρονικό σύνδεσμο: {VALIDATION_LINK}</p><p>Ευχαριστούμε πολύ!</p><p>Φιλικοί χαιρετισμοί,</p><p>{WEB_LINK}</p>'),
(2, 'en_US', 'Please validate your {WEB_TITLE} account', '<p>Hi {USER_NAME},</p><p>Please validate your registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(3, 'el_GR', '{WEB_TITLE} - Επιτυχής εγγραφή!', '<p>Hi {USER_NAME},</p><p>You\'ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(3, 'en_US', '{WEB_TITLE} - Registration successful!', '<p>Hi {USER_NAME},</p><p>You\'ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(4, 'el_GR', 'Κοίτα τι ανακάλυψα στο {WEB_TITLE}', '<p>Γειά σου {FRIEND_NAME},</p><p>Ο φίλος σας {USER_NAME} θέλει να μοιραστεί αυτή τη καταχώρηση με εσάς <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Μήνυμα:</p><p>{COMMENT}</p><p>Φιλικοί χαιρετισμοί,</p><p>{WEB_TITLE}</p>'),
(4, 'en_US', 'Look at what I discovered on {WEB_TITLE}', '<p>Hi {FRIEND_NAME},</p><p>Your friend {USER_NAME} wants to share this listing with you <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_TITLE}</p>'),
(5, 'el_GR', '{WEB_TITLE} - Νέες καταχωρήσεις in the last hour', '<p>Γειά σου {USER_NAME},</p><p>Νέες καταχωρήσεις έχουν δημοσιευτεί την προηγούμενη ώρα. Μπορείτε να τις δείτε εδώ:</p><p>{ADS}</p><p>-------------</p><p>Για να διαγραφείτε απο αυτή την ειδοποίηση, πατήστε εδώ: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(5, 'en_US', '{WEB_TITLE} - New listings in the last hour', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last hour. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'el_GR', '{WEB_TITLE} - Νέες καταχωρήσεις in the last day', '<p>Γειά σου {USER_NAME},</p><p>Νέες καταχωρήσεις έχουν δημοσιευτεί την προηγούμενη ημέρα. Μπορείτε να τις δείτε εδώ:</p><p>{ADS}</p><p>-------------</p><p>Για να διαγραφείτε απο αυτή την ειδοποίηση, πατήστε εδώ: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'en_US', '{WEB_TITLE} - New listings in the last day', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last day. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'el_GR', '{WEB_TITLE} - Νέες καταχωρήσεις in the last week', '<p>Γειά σου {USER_NAME},</p><p>Νέες καταχωρήσεις έχουν δημοσιευτεί την προηγούμενη εβδομάδα. Μπορείτε να τις δείτε εδώ:</p><p>{ADS}</p><p>-------------</p><p>Για να διαγραφείτε απο αυτή την ειδοποίηση, πατήστε εδώ: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'en_US', '{WEB_TITLE} - New listings in the last week', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last week. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'el_GR', '{WEB_TITLE} - Νέες καταχωρήσεις', '<p>Γειά σου{USER_NAME},</p><p>Μία νέα καταχώρηση δημοσιεύτηκε, ελέγξτε το!</p><p>{ADS}</p><p>-------------</p><p>Για να διαγραφείτε απο αυτή την ειδοποίηση, πατήστε εδώ: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'en_US', '{WEB_TITLE} - New listings', '<p>Hi {USER_NAME},</p><p>A new listing has been published, check it out!</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(9, 'el_GR', '{WEB_TITLE} - Νέο σχόλιο', '<p>Someone commented on the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
(9, 'en_US', '{WEB_TITLE} - New comment', '<p>Someone commented on the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
(10, 'el_GR', '{WEB_TITLE} - Διαχείριση επιλογών για τη καταχώρηση {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You\'re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(10, 'en_US', '{WEB_TITLE} - Edit options for the listing {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You\'re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(11, 'el_GR', '{WEB_TITLE} - Επικυρώστε την ειδοποίηση', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(11, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(12, 'el_GR', '{WEB_TITLE} - Μία νέα καταχώσηση δημοσιεύτηκε', '<p>Αγαπητέ {WEB_TITLE} {USER_NAME},<span lang=\"el\"><br /><br />Η διαφήμισή σας πρέπει να εγκριθεί από τον διαχειριστή, μπορεί να αργήσει λίγο μέχρι να εμφανιστεί στον ιστότοπο </span>{WEB_LINK}.</p>\r\n<p>Λεπτομέρειες:</p>\r\n<p>Χρήστης: {USER_NAME}<br />email: {USER_EMAIL}</p>\r\n<p>{ITEM_DESCRIPTION}</p>\r\n<p>Url: {ITEM_URL}</p>\r\n<p>Μπορείτε να επεξεργαστείτε την καταχώρησή σας εδώ: {EDIT_LINK}</p>\r\n<p>Με εκτίμηση,</p>\r\n<p>{WEB_LINK}</p>'),
(12, 'en_US', '{WEB_TITLE} - A new listing has been published', '<p>Dear {WEB_TITLE} admin,</p>\r\n<p>You\'re receiving this email because a listing has been published at {WEB_LINK}.</p>\r\n<p>Listing details:</p>\r\n<p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p>\r\n<p>{ITEM_DESCRIPTION}</p>\r\n<p>Url: {ITEM_URL}</p>\r\n<p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p>\r\n<p>Regards,</p>\r\n<p>{WEB_LINK}</p>'),
(13, 'el_GR', '{WEB_TITLE} - Ανακτήστε τον κωδικό πρόσβασης σας. ', '<p>Hi {USER_NAME},</p><p>We\'ve sent you this e-mail because you\'ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn\'t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(13, 'en_US', '{WEB_TITLE} - Recover your password', '<p>Hi {USER_NAME},</p><p>We\'ve sent you this e-mail because you\'ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn\'t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(14, 'el_GR', '{WEB_TITLE} - Ζητήσατε αλλαγή e-mail.', '<p>Hi {USER_NAME}</p><p>You\'re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(14, 'en_US', '{WEB_TITLE} - You requested an email change', '<p>Hi {USER_NAME}</p><p>You\'re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(15, 'el_GR', '{WEB_TITLE} - Παρακαλώ καταχωρήστε την ειδοποίηση σας. ', '<p>Γειά σου {USER_NAME},</p><p>Παρακαλώ καταχωρείστε την ειδοποίηση σας, πατώντας στο παρακάτω σύνδεσμο: {VALIDATION_LINK}</p><p>Ευχαριστούμε πολύ!</p><p>Φιλικοί χαιρετισμοί,</p><p>{WEB_LINK}</p>'),
(15, 'en_US', '{WEB_TITLE} - Please validate your alert', '<p>Hi {USER_NAME},</p><p>Please validate your alert registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(16, 'el_GR', '{WEB_TITLE} - Το σχόλιο σας, εγκρίθηκε', '<p>Γειά σου {COMMENT_AUTHOR},</p><p>Το σχόλιό σας στο <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> έχει εγκριθεί.</p><p>Με εκτίμηση,</p><p>{WEB_LINK}</p>'),
(16, 'en_US', '{WEB_TITLE} - Your comment has been approved', '<p>Hi {COMMENT_AUTHOR},</p><p>Your comment on <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> has been approved.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(17, 'el_GR', '{WEB_TITLE} - Επικυρώστε την ειδοποίηση', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you\'re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(17, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you\'re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(18, 'el_GR', '{WEB_TITLE} - Ένας νέος χρήστης εγγράφηκε', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(18, 'en_US', '{WEB_TITLE} - A new user has registered', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(19, 'el_GR', '{WEB_TITLE} - Κάποιος χρήστης έχει μία ερώτηση για εσάς', '<p>Γειά σου{CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) άφησε ένα μήνυμα:</p><p>{COMMENT}</p><p>Φιλικοί χαιρετισμοί,</p><p>{WEB_LINK}</p>'),
(19, 'en_US', '{WEB_TITLE} - Someone has a question for you', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(20, 'el_GR', '{WEB_TITLE} - Κάποιος χρήστης σχολίασε τη καταχώρηση σας', '<p>There\'s a new comment on the listing: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(20, 'en_US', '{WEB_TITLE} - Someone has commented on your listing', '<p>There\'s a new comment on the listing: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(21, 'el_GR', '{WEB_TITLE} - Επιτυχής δημιουργία λογαριασμού διαχειριστή!', '<p>Γειά σου {ADMIN_NAME},</p><p>Ο διαχειριστής του {WEB_LINK} έχει δημιουργήσει ένα λογαριασμό για εσένα με ,</p><ul><li>Όνομα χρήστη: {USERNAME}</li><li>Κωδικός: {PASSWORD}</li></ul><p>Μπορείς να εισέλθεις στο κέντρο διαχείρισης εδώ {WEB_ADMIN_LINK}.</p><p>Ευχαριστούμε πολύ!</p><p>Φιλικοί χαιρετισμοί,</p>'),
(21, 'en_US', '{WEB_TITLE} - Success creating admin account!', '<p>Hi {ADMIN_NAME},</p><p>The admin of {WEB_LINK} has created an account for you,</p><ul><li>Username: {USERNAME}</li><li>Password: {PASSWORD}</li></ul><p>You can access the admin panel here {WEB_ADMIN_LINK}.</p><p>Thank you!</p><p>Regards,</p>'),
(22, 'el_GR', '{WEB_TITLE} - Η διαφήμιση σας, είναι έτοιμη να λήξει.', '<p>Γειά σου {USER_NAME},</p><p>Η καταχώρηση σας <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> θα λήξει στις {WEB_LINK}.'),
(22, 'en_US', '{WEB_TITLE} - Your ad is about to expire', '<p>Hi {USER_NAME},</p><p>Your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> is about to expire at {WEB_LINK}.'),
(23, 'en_US', 'Example page title', 'This is an example page description. This is a good place to put your Terms of Service or any other help information.'),
(26, 'el_GR', 'Σχετικά με μας', ''),
(26, 'en_US', 'About us', ''),
(27, 'el_GR', '{WEB_TITLE} - Notification of ad: {ITEM_TITLE}', '<p>Hi Admin!</p>\\r\\n<p> </p>\\r\\n<p>We just published an item ({ITEM_TITLE}) on {WEB_TITLE} from user {USER_NAME} ( {ITEM_URL} ).</p>\\r\\n<p>Edit it here : {EDIT_LINK}</p>\\r\\n<p> </p>\\r\\n<p>Thanks</p>'),
(28, 'en_US', 'FAQs', '[{Question One}{Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum }]\n[{Question Two}{Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum }]\n[{Question Three}{Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum }]\n[{Question Four}{Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum }]'),
(29, 'en_US', 'About US', ''),
(30, 'el_GR', '{WEB_TITLE} -Subscribed Package: {PKG_TITLE}', '<p>Hi {CONTACT_NAME}!</p>\r\n<p> </p>\r\n<p>Thanks for your subscription ({PKG_TITLE}) on {WEB_TITLE}.</p>\r\n<p>Your Subscription Details Is Given Below</p>\r\n<p> </p>\r\n<p>Package Name : {PKG_TITLE}</p>\r\n<p>Package Cost : {PKG_COST}</p>\r\n<p>Post Allow : {POST_ALLOW}</p>\r\n<p>Trasaction Id : {TXC_ID}</p>\r\n<p>Expiry Date : {EXPIRY_DATE}</p>\r\n<p> </p>\r\n<p>Thanks</p> '),
(33, 'el_GR', '{WEB_TITLE} - You received a Bonus Credit!', '<p>Hi {CONTACT_NAME}!</p>\\r\\n<p> </p>\\r\\n<p>Thanks for your registration on {WEB_TITLE}.</p>\\r\\n<p>We have given you a bonus credit of {AMOUNT} {CURRENCY}.</p>\\r\\n<p>You can use it to buy Premium Ads!</p>\\r\\n<p> </p>\\r\\n<p>This is an automatic email, if you already did that, please ignore this email.</p>\\r\\n<p> </p>\\r\\n<p>Thanks</p>'),
(33, 'en_US', '{WEB_TITLE} - You received a Bonus Credit!', '<p>Hi {CONTACT_NAME}!</p>\\r\\n<p> </p>\\r\\n<p>Thanks for your registration on {WEB_TITLE}.</p>\\r\\n<p>We have given you a bonus credit of {AMOUNT} {CURRENCY}.</p>\\r\\n<p>You can use it to buy Premium Ads!</p>\\r\\n<p> </p>\\r\\n<p>This is an automatic email, if you already did that, please ignore this email.</p>\\r\\n<p> </p>\\r\\n<p>Thanks</p>'),
(34, 'el_GR', '{WEB_TITLE} - You received a Bonus Credit!', '<p>Hi {CONTACT_NAME}!</p> <p> </p> <p>This is your code to get a free bonus credit of {AMOUNT} {CURRENCY}:</p> <p> </p> <p>{PCODE}</p> <p> </p> <p>Log in to {WEB_URL} and go to \\\"Enter Promotion Codes\\\" menu in your dashboard!</p> <p> </p> <p>You can use this bonus credit to buy Premium Ads!</p> <p> </p> <p>This is an automatic email, if you already did that, please ignore this email.</p> <p> </p> <p>Thanks</p>'),
(34, 'en_US', '{WEB_TITLE} - You received a Bonus Credit!', '<p>Hi {CONTACT_NAME}!</p> <p> </p> <p>This is your code to get a free bonus credit of {AMOUNT} {CURRENCY}:</p> <p> </p> <p>{PCODE}</p> <p> </p> <p>Log in to {WEB_URL} and go to \\\"Enter Promotion Codes\\\" menu in your dashboard!</p> <p> </p> <p>You can use this bonus credit to buy Premium Ads!</p> <p> </p> <p>This is an automatic email, if you already did that, please ignore this email.</p> <p> </p> <p>Thanks</p>');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_plugin_category`
--

CREATE TABLE `oc_t_plugin_category` (
  `s_plugin_name` varchar(40) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_plugin_category`
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
('voting', 139);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_preference`
--

CREATE TABLE `oc_t_preference` (
  `s_section` varchar(128) NOT NULL,
  `s_name` varchar(128) NOT NULL,
  `s_value` longtext NOT NULL,
  `e_type` enum('STRING','INTEGER','BOOLEAN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_preference`
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
('moreedit', 'moderate_all', '', 'BOOLEAN'),
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
('osclass', 'languages_last_version_check', '1525545425', 'STRING'),
('osclass', 'languages_to_update', '[]', 'STRING'),
('osclass', 'languages_update_count', '0', 'STRING'),
('osclass', 'last_version_check', '1525486525', 'STRING'),
('osclass', 'location_todo', '0', 'STRING'),
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
('osclass', 'plugins_downloaded', '[\"youtube\",\"http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_maps\\/update.php\",\"more-edit\",\"pre-resize-images\",\"qrcode\",\"responsive-slides\",\"simple-social-share\",\"voting\",\"http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_analytics\\/update.php\",\"seo-wiz\",\"tawkto\"]', 'STRING'),
('osclass', 'plugins_last_version_check', '1525545424', 'STRING'),
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
('osclass', 'themes_downloaded', '[\"osclasswizards-free-responsive-theme\",\"bender\"]', 'STRING'),
('osclass', 'themes_last_version_check', '1525545421', 'STRING'),
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
-- Δομή πίνακα για τον πίνακα `oc_t_region`
--

CREATE TABLE `oc_t_region` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `oc_t_region`
--

INSERT INTO `oc_t_region` (`pk_i_id`, `fk_c_country_code`, `s_name`, `s_slug`, `b_active`) VALUES
(782761, 'GR', 'Νάξος', 'naxos', 1),
(782762, 'GR', 'Πάρος', 'paros', 1),
(782763, 'GR', 'Σαντορίνη', 'santorini', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_rslides`
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
-- Άδειασμα δεδομένων του πίνακα `oc_t_rslides`
--

INSERT INTO `oc_t_rslides` (`id`, `uniqname`, `imagename`, `caption`, `description`, `link`) VALUES
(3, '5ad521cf3cdd7.jpg', '5ace55ba441bb.jpg', '', '', ''),
(4, '5ad521dc3d730.jpg', '5ace55c367b59.jpg', '', '', '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_user`
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
-- Δομή πίνακα για τον πίνακα `oc_t_user_description`
--

CREATE TABLE `oc_t_user_description` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_voting_item`
--

CREATE TABLE `oc_t_voting_item` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `i_vote` int(10) UNSIGNED NOT NULL,
  `s_hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_voting_user`
--

CREATE TABLE `oc_t_voting_user` (
  `i_user_voted` int(10) UNSIGNED NOT NULL,
  `i_user_voter` int(10) UNSIGNED NOT NULL,
  `i_vote` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oc_t_widget`
--

CREATE TABLE `oc_t_widget` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_description` varchar(40) NOT NULL,
  `s_location` varchar(40) NOT NULL,
  `e_kind` enum('TEXT','HTML') NOT NULL,
  `s_content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_username` (`s_username`),
  ADD UNIQUE KEY `s_email` (`s_email`);

--
-- Ευρετήρια για πίνακα `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Ευρετήρια για πίνακα `oc_t_alerts_sent`
--
ALTER TABLE `oc_t_alerts_sent`
  ADD PRIMARY KEY (`d_date`);

--
-- Ευρετήρια για πίνακα `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Ευρετήρια για πίνακα `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_parent_id` (`fk_i_parent_id`),
  ADD KEY `i_position` (`i_position`);

--
-- Ευρετήρια για πίνακα `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_c_locale_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Ευρετήρια για πίνακα `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD PRIMARY KEY (`fk_i_category_id`);

--
-- Ευρετήρια για πίνακα `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`);

--
-- Ευρετήρια για πίνακα `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Ευρετήρια για πίνακα `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD PRIMARY KEY (`fk_i_city_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Ευρετήρια για πίνακα `oc_t_country`
--
ALTER TABLE `oc_t_country`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Ευρετήρια για πίνακα `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD PRIMARY KEY (`fk_c_country_code`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Ευρετήρια για πίνακα `oc_t_currency`
--
ALTER TABLE `oc_t_currency`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_name` (`s_name`);

--
-- Ευρετήρια για πίνακα `oc_t_item`
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
-- Ευρετήρια για πίνακα `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`);

--
-- Ευρετήρια για πίνακα `oc_t_item_description`
--
ALTER TABLE `oc_t_item_description`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_c_locale_code`);
ALTER TABLE `oc_t_item_description` ADD FULLTEXT KEY `s_description` (`s_description`,`s_title`);

--
-- Ευρετήρια για πίνακα `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD PRIMARY KEY (`fk_i_item_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Ευρετήρια για πίνακα `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_i_field_id`,`s_multi`),
  ADD KEY `s_value` (`s_value`(255)),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Ευρετήρια για πίνακα `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `idx_s_content_type` (`pk_i_id`,`s_content_type`(10));

--
-- Ευρετήρια για πίνακα `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  ADD KEY `dt_date_fk_i_item_id` (`dt_date`,`fk_i_item_id`);

--
-- Ευρετήρια για πίνακα `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD PRIMARY KEY (`s_md5`,`fk_c_locale_code`),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Ευρετήρια για πίνακα `oc_t_locale`
--
ALTER TABLE `oc_t_locale`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_short_name` (`s_short_name`);

--
-- Ευρετήρια για πίνακα `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_i_field_id`),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Ευρετήρια για πίνακα `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Ευρετήρια για πίνακα `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Ευρετήρια για πίνακα `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD PRIMARY KEY (`fk_i_pages_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Ευρετήρια για πίνακα `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD KEY `fk_i_category_id` (`fk_i_category_id`);

--
-- Ευρετήρια για πίνακα `oc_t_preference`
--
ALTER TABLE `oc_t_preference`
  ADD UNIQUE KEY `s_section` (`s_section`,`s_name`);

--
-- Ευρετήρια για πίνακα `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_slug` (`s_slug`);

--
-- Ευρετήρια για πίνακα `oc_t_rslides`
--
ALTER TABLE `oc_t_rslides`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `oc_t_user`
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
-- Ευρετήρια για πίνακα `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD PRIMARY KEY (`fk_i_user_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Ευρετήρια για πίνακα `oc_t_voting_item`
--
ALTER TABLE `oc_t_voting_item`
  ADD KEY `fk_i_item_id` (`fk_i_item_id`);

--
-- Ευρετήρια για πίνακα `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT για πίνακα `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `oc_t_category`
--
ALTER TABLE `oc_t_category`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT για πίνακα `oc_t_city`
--
ALTER TABLE `oc_t_city`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=510811;
--
-- AUTO_INCREMENT για πίνακα `oc_t_item`
--
ALTER TABLE `oc_t_item`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT για πίνακα `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT για πίνακα `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT για πίνακα `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT για πίνακα `oc_t_region`
--
ALTER TABLE `oc_t_region`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=782764;
--
-- AUTO_INCREMENT για πίνακα `oc_t_rslides`
--
ALTER TABLE `oc_t_rslides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT για πίνακα `oc_t_user`
--
ALTER TABLE `oc_t_user`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT για πίνακα `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD CONSTRAINT `oc_t_category_ibfk_1` FOREIGN KEY (`fk_i_parent_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Περιορισμοί για πίνακα `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD CONSTRAINT `oc_t_category_description_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_category_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Περιορισμοί για πίνακα `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD CONSTRAINT `oc_t_category_stats_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Περιορισμοί για πίνακα `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD CONSTRAINT `oc_t_city_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_city_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Περιορισμοί για πίνακα `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD CONSTRAINT `oc_t_city_area_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Περιορισμοί για πίνακα `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD CONSTRAINT `oc_t_city_stats_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Περιορισμοί για πίνακα `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD CONSTRAINT `oc_t_country_stats_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Περιορισμοί για πίνακα `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD CONSTRAINT `oc_t_keywords_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category.orig` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_2` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_3` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Περιορισμοί για πίνακα `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Περιορισμοί για πίνακα `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD CONSTRAINT `oc_t_pages_description_ibfk_1` FOREIGN KEY (`fk_i_pages_id`) REFERENCES `oc_t_pages` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_pages_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Περιορισμοί για πίνακα `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD CONSTRAINT `oc_t_plugin_category_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Περιορισμοί για πίνακα `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD CONSTRAINT `oc_t_region_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Περιορισμοί για πίνακα `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD CONSTRAINT `oc_t_user_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_user_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_3` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_4` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Περιορισμοί για πίνακα `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD CONSTRAINT `oc_t_user_description_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
