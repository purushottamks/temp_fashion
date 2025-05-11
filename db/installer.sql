-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2018 at 12:07 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `installer`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `image`, `thumbnail`, `category`, `price`, `date_time`) VALUES
(4, 'light blue flowered', 'accessoryImages/14296321532087644.jpg', 'accessoryImages/thumbnail/14296321532087644.jpg', 3, 2000, '2018-07-20 11:54:04'),
(5, 'grey mini flower', 'accessoryImages/89458481532087672.jpg', 'accessoryImages/thumbnail/89458481532087672.jpg', 3, 1500, '2018-07-20 11:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `accessories_cat`
--

CREATE TABLE `accessories_cat` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessories_cat`
--

INSERT INTO `accessories_cat` (`id`, `name`, `date_time`) VALUES
(1, 'Socks', '2018-07-20 09:54:58'),
(3, 'ties', '2018-07-20 11:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `accessory_options`
--

CREATE TABLE `accessory_options` (
  `id` int(11) NOT NULL,
  `accessory_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accessory_options_values`
--

CREATE TABLE `accessory_options_values` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `accessory_option_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `date_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buttons`
--

CREATE TABLE `buttons` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `fabric_id` int(11) NOT NULL,
  `fit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buttons`
--

INSERT INTO `buttons` (`id`, `image`, `thumbnail`, `name`, `description`, `fabric_id`, `fit_id`) VALUES
(1, 'buttonImages/7681831533030605.png', 'buttonImages/thumbnail/7681831533030605.png', 'Single Two', 'Description of buttons', 11, 26);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `thumbnail`, `parent`) VALUES
(1, 'suit', 'categoryImages/57282491536575280.jpg', 'categoryImages/thumbnail/57282491536575280.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `coat_components`
--

CREATE TABLE `coat_components` (
  `id` int(11) NOT NULL,
  `fabric_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `fitting_id` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `button_style` enum('no_button','single_one','single_two','single_three','double_four','double_six') NOT NULL DEFAULT 'no_button',
  `vent_style` enum('no_vent','one_vent','two_vents') NOT NULL DEFAULT 'no_vent',
  `thumbnail` varchar(150) NOT NULL,
  `trousers_style` enum('pressed','unpressed') NOT NULL DEFAULT 'unpressed',
  `trousers_pleats` enum('no_pleats','single_pleats','double_pleats') NOT NULL DEFAULT 'no_pleats',
  `pocket_style` enum('empty','flaped','slanted','piped','patched') NOT NULL DEFAULT 'empty',
  `number_of_pockets` enum('two','three','no') NOT NULL DEFAULT 'no',
  `lapel_style` enum('notched','peaked','shawl','empty') DEFAULT 'empty',
  `lapel_width` enum('narrow','normal','wide','empty') DEFAULT 'empty',
  `button_holes` enum('no_buttonhole','one_buttonhole','two_buttonhole') DEFAULT NULL,
  `side` enum('front','back') NOT NULL DEFAULT 'front',
  `material_id` int(11) NOT NULL,
  `pattern_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `coat_type` enum('suit','dress_coat','morning_coat','frock_coat','tuxedo') NOT NULL DEFAULT 'suit',
  `price` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coat_components`
--

INSERT INTO `coat_components` (`id`, `fabric_id`, `component_id`, `fitting_id`, `image`, `button_style`, `vent_style`, `thumbnail`, `trousers_style`, `trousers_pleats`, `pocket_style`, `number_of_pockets`, `lapel_style`, `lapel_width`, `button_holes`, `side`, `material_id`, `pattern_id`, `color_id`, `category_id`, `coat_type`, `price`) VALUES
(1, 2, 1, 1, 'coatImages/36144421535699991.png', 'single_one', 'no_vent', 'coatImages/thumbnail/36144421535699991.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(2, 2, 1, 2, 'coatImages/30427091535699991.png', 'single_one', 'no_vent', 'coatImages/thumbnail/30427091535699991.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(3, 2, 1, 1, 'coatImages/78467471535700007.png', 'single_two', 'no_vent', 'coatImages/thumbnail/78467471535700007.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(4, 2, 1, 2, 'coatImages/14004851535700007.png', 'single_two', 'no_vent', 'coatImages/thumbnail/14004851535700007.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(5, 2, 1, 1, 'coatImages/14478221535700121.png', 'single_three', 'no_vent', 'coatImages/thumbnail/14478221535700121.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(6, 2, 1, 2, 'coatImages/48825071535700121.png', 'single_three', 'no_vent', 'coatImages/thumbnail/48825071535700121.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(7, 2, 1, 1, 'coatImages/8566681535700224.png', 'double_four', 'no_vent', 'coatImages/thumbnail/8566681535700224.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(8, 2, 1, 2, 'coatImages/79245011535700224.png', 'double_four', 'no_vent', 'coatImages/thumbnail/79245011535700224.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(9, 2, 1, 1, 'coatImages/37459201535700236.png', 'double_six', 'no_vent', 'coatImages/thumbnail/37459201535700236.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(10, 2, 1, 2, 'coatImages/71721741535700236.png', 'double_six', 'no_vent', 'coatImages/thumbnail/71721741535700236.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(11, 2, 2, 1, 'coatImages/16291811535700430.png', 'single_two', 'no_vent', 'coatImages/thumbnail/16291811535700430.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(12, 2, 2, 2, 'coatImages/84424681535700430.png', 'single_two', 'no_vent', 'coatImages/thumbnail/84424681535700430.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(13, 2, 3, 1, 'coatImages/21974571535700539.png', 'single_one', 'no_vent', 'coatImages/thumbnail/21974571535700539.png', 'unpressed', '', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(14, 2, 3, 2, 'coatImages/63366771535700539.png', 'single_one', 'no_vent', 'coatImages/thumbnail/63366771535700539.png', 'unpressed', '', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(15, 2, 3, 1, 'coatImages/61806441535700578.png', 'single_two', 'no_vent', 'coatImages/thumbnail/61806441535700578.png', 'unpressed', '', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(16, 2, 3, 2, 'coatImages/7120121535700578.png', 'single_two', 'no_vent', 'coatImages/thumbnail/7120121535700578.png', 'unpressed', 'double_pleats', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(17, 2, 3, 1, 'coatImages/12684951535700603.png', 'single_three', 'no_vent', 'coatImages/thumbnail/12684951535700603.png', 'unpressed', 'double_pleats', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(18, 2, 3, 2, 'coatImages/18581701535700603.png', 'single_three', 'no_vent', 'coatImages/thumbnail/18581701535700603.png', 'unpressed', '', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(19, 2, 3, 1, 'coatImages/69322211535700673.png', 'double_four', 'no_vent', 'coatImages/thumbnail/69322211535700673.png', 'unpressed', '', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(20, 2, 3, 2, 'coatImages/10593521535700673.png', 'double_four', 'no_vent', 'coatImages/thumbnail/10593521535700673.png', 'unpressed', '', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(21, 2, 3, 1, 'coatImages/78274181535700687.png', 'double_six', 'no_vent', 'coatImages/thumbnail/78274181535700687.png', 'unpressed', '', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(22, 2, 3, 2, 'coatImages/29054661535700687.png', 'double_six', 'no_vent', 'coatImages/thumbnail/29054661535700687.png', 'unpressed', '', 'empty', 'no', 'shawl', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(23, 2, 3, 1, 'coatImages/92299501535700717.png', 'double_four', 'no_vent', 'coatImages/thumbnail/92299501535700717.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(24, 2, 3, 2, 'coatImages/36582711535700717.png', 'double_four', 'no_vent', 'coatImages/thumbnail/36582711535700717.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(25, 2, 3, 1, 'coatImages/39500331535700745.png', 'double_six', 'no_vent', 'coatImages/thumbnail/39500331535700745.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(26, 2, 3, 2, 'coatImages/42365551535700745.png', 'double_six', 'no_vent', 'coatImages/thumbnail/42365551535700745.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(27, 2, 3, 1, 'coatImages/86261811535700807.png', 'double_six', 'no_vent', 'coatImages/thumbnail/86261811535700807.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(28, 2, 3, 2, 'coatImages/91560501535700807.png', 'double_six', 'no_vent', 'coatImages/thumbnail/91560501535700807.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(29, 2, 3, 1, 'coatImages/57372651535700848.png', 'double_four', 'no_vent', 'coatImages/thumbnail/57372651535700848.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(30, 2, 3, 2, 'coatImages/69232761535700848.png', 'double_four', 'no_vent', 'coatImages/thumbnail/69232761535700848.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(31, 2, 4, 1, 'coatImages/4170821535700870.png', 'single_two', 'no_vent', 'coatImages/thumbnail/4170821535700870.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(32, 2, 4, 1, 'coatImages/28850401535700870.png', 'single_two', 'no_vent', 'coatImages/thumbnail/28850401535700870.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(35, 2, 5, 1, 'coatImages/68955481535700930.png', 'single_two', 'no_vent', 'coatImages/thumbnail/68955481535700930.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(36, 2, 5, 2, 'coatImages/6114051535700930.png', 'single_two', 'no_vent', 'coatImages/thumbnail/6114051535700930.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(37, 2, 5, 1, 'coatImages/81495821535701025.png', 'single_one', 'no_vent', 'coatImages/thumbnail/81495821535701025.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(38, 2, 5, 2, 'coatImages/323181535701025.png', 'single_one', 'no_vent', 'coatImages/thumbnail/323181535701025.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(39, 2, 5, 1, 'coatImages/28471141535701044.png', 'single_three', 'no_vent', 'coatImages/thumbnail/28471141535701044.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(40, 2, 5, 2, 'coatImages/15493821535701044.png', 'single_three', 'no_vent', 'coatImages/thumbnail/15493821535701044.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(41, 2, 5, 1, 'coatImages/81886281535701063.png', 'double_four', 'no_vent', 'coatImages/thumbnail/81886281535701063.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(42, 2, 5, 2, 'coatImages/92643931535701063.png', 'double_four', 'no_vent', 'coatImages/thumbnail/92643931535701063.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(45, 2, 5, 1, 'coatImages/26375291535701120.png', 'double_six', 'no_vent', 'coatImages/thumbnail/26375291535701120.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(46, 2, 5, 2, 'coatImages/32604821535701120.png', 'double_six', 'no_vent', 'coatImages/thumbnail/32604821535701120.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(47, 2, 6, 1, 'coatImages/40480431535701183.png', 'single_two', 'no_vent', 'coatImages/thumbnail/40480431535701183.png', 'unpressed', '', 'flaped', 'three', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(48, 2, 6, 2, 'coatImages/40480431535701183.png', 'single_two', 'no_vent', 'coatImages/thumbnail/40480431535701183.png', 'unpressed', '', 'flaped', 'three', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(49, 2, 6, 1, 'coatImages/57949391535701214.png', 'single_two', 'no_vent', 'coatImages/thumbnail/57949391535701214.png', 'unpressed', '', 'slanted', 'three', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(50, 2, 6, 2, 'coatImages/57949391535701214.png', 'single_two', 'no_vent', 'coatImages/thumbnail/57949391535701214.png', 'unpressed', '', 'slanted', 'three', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(51, 2, 6, 1, 'coatImages/10738781535701243.png', 'single_two', 'no_vent', 'coatImages/thumbnail/10738781535701243.png', 'unpressed', '', 'piped', 'two', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(52, 2, 6, 2, 'coatImages/10738781535701243.png', 'single_two', 'no_vent', 'coatImages/thumbnail/10738781535701243.png', 'unpressed', '', 'piped', 'two', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(53, 2, 6, 1, 'coatImages/11958311535701264.png', 'single_two', 'no_vent', 'coatImages/thumbnail/11958311535701264.png', 'unpressed', '', 'patched', 'two', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(54, 2, 6, 2, 'coatImages/11958311535701264.png', 'single_two', 'no_vent', 'coatImages/thumbnail/11958311535701264.png', 'unpressed', '', 'patched', 'two', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(55, 2, 7, 1, 'coatImages/99973851535701382.png', 'single_two', 'one_vent', 'coatImages/thumbnail/99973851535701382.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(56, 2, 7, 2, 'coatImages/62162331535701382.png', 'single_two', 'one_vent', 'coatImages/thumbnail/62162331535701382.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(57, 2, 7, 1, 'coatImages/61325101535701398.png', 'single_two', 'two_vents', 'coatImages/thumbnail/61325101535701398.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(58, 2, 7, 2, 'coatImages/49119471535701398.png', 'single_two', 'two_vents', 'coatImages/thumbnail/49119471535701398.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(59, 2, 8, 1, 'coatImages/82272911535701431.png', 'single_two', 'no_vent', 'coatImages/thumbnail/82272911535701431.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(60, 2, 8, 2, 'coatImages/36526371535701431.png', 'single_two', 'no_vent', 'coatImages/thumbnail/36526371535701431.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(61, 2, 9, 1, 'coatImages/27602551535702121.png', 'single_two', 'no_vent', 'coatImages/thumbnail/27602551535702121.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(62, 2, 9, 2, 'coatImages/70005151535702121.png', 'single_two', 'no_vent', 'coatImages/thumbnail/70005151535702121.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(63, 2, 10, 1, 'coatImages/90499791535702146.png', 'single_two', 'no_vent', 'coatImages/thumbnail/90499791535702146.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(64, 2, 10, 2, 'coatImages/90499791535702146.png', 'single_two', 'no_vent', 'coatImages/thumbnail/90499791535702146.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(65, 2, 11, 1, 'coatImages/43921531535702157.png', 'single_two', 'no_vent', 'coatImages/thumbnail/43921531535702157.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(66, 2, 11, 2, 'coatImages/43921531535702157.png', 'single_two', 'no_vent', 'coatImages/thumbnail/43921531535702157.png', 'unpressed', '', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(67, 2, 3, 1, 'coatImages/94826091535714607.png', 'single_two', 'no_vent', 'coatImages/thumbnail/94826091535714607.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(68, 2, 3, 2, 'coatImages/25050311535714607.png', 'single_two', 'no_vent', 'coatImages/thumbnail/25050311535714607.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(69, 2, 3, 1, 'coatImages/20636731535714640.png', 'single_two', 'no_vent', 'coatImages/thumbnail/20636731535714640.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(70, 2, 3, 2, 'coatImages/64106021535714640.png', 'single_two', 'no_vent', 'coatImages/thumbnail/64106021535714640.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(71, 2, 3, 1, 'coatImages/58769831535714685.png', 'single_two', 'no_vent', 'coatImages/thumbnail/58769831535714685.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(72, 2, 3, 2, 'coatImages/45431411535714685.png', 'single_two', 'no_vent', 'coatImages/thumbnail/45431411535714685.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(75, 2, 3, 1, 'coatImages/68353461535714863.png', 'single_two', 'no_vent', 'coatImages/thumbnail/68353461535714863.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(76, 2, 3, 2, 'coatImages/36669501535714863.png', 'single_two', 'no_vent', 'coatImages/thumbnail/36669501535714863.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(77, 2, 3, 1, 'coatImages/71208231535714888.png', 'single_two', 'no_vent', 'coatImages/thumbnail/71208231535714888.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(78, 2, 3, 2, 'coatImages/29942621535714888.png', 'single_two', 'no_vent', 'coatImages/thumbnail/29942621535714888.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(79, 2, 3, 1, 'coatImages/11708971535714929.png', 'single_two', 'no_vent', 'coatImages/thumbnail/11708971535714929.png', 'unpressed', '', 'empty', 'no', 'peaked', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(80, 2, 3, 2, 'coatImages/77961171535714929.png', 'single_two', 'no_vent', 'coatImages/thumbnail/77961171535714929.png', 'unpressed', '', 'empty', 'no', 'peaked', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(85, 2, 3, 1, 'coatImages/88499421535721863.png', 'single_two', 'no_vent', 'coatImages/thumbnail/88499421535721863.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(86, 2, 3, 2, 'coatImages/68138711535721863.png', 'single_two', 'no_vent', 'coatImages/thumbnail/68138711535721863.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(87, 2, 3, 1, 'coatImages/23517521535721897.png', 'single_two', 'no_vent', 'coatImages/thumbnail/23517521535721897.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(88, 2, 3, 2, 'coatImages/90998251535721897.png', 'single_two', 'no_vent', 'coatImages/thumbnail/90998251535721897.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(89, 2, 3, 1, 'coatImages/9292551535971473.png', 'single_one', 'no_vent', 'coatImages/thumbnail/9292551535971473.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(90, 2, 3, 2, 'coatImages/68649271535971473.png', 'single_one', 'no_vent', 'coatImages/thumbnail/68649271535971473.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(91, 2, 3, 1, 'coatImages/98697131535971608.png', 'single_three', 'no_vent', 'coatImages/thumbnail/98697131535971608.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(92, 2, 3, 2, 'coatImages/62781231535971608.png', 'single_three', 'no_vent', 'coatImages/thumbnail/62781231535971608.png', 'unpressed', '', 'empty', 'no', 'shawl', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(93, 2, 3, 1, 'coatImages/85125861535972974.png', 'single_three', 'no_vent', 'coatImages/thumbnail/85125861535972974.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(94, 2, 3, 2, 'coatImages/21407881535972974.png', 'single_three', 'no_vent', 'coatImages/thumbnail/21407881535972974.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(95, 2, 3, 1, 'coatImages/7061341535973153.png', 'single_one', 'no_vent', 'coatImages/thumbnail/7061341535973153.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(96, 2, 3, 2, 'coatImages/28473101535973153.png', 'single_one', 'no_vent', 'coatImages/thumbnail/28473101535973153.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(97, 2, 3, 1, 'coatImages/85228201535973343.png', 'single_three', 'no_vent', 'coatImages/thumbnail/85228201535973343.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(98, 2, 3, 2, 'coatImages/12702891535973343.png', 'single_three', 'no_vent', 'coatImages/thumbnail/12702891535973343.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(99, 2, 3, 1, 'coatImages/51858351535973458.png', 'double_four', 'no_vent', 'coatImages/thumbnail/51858351535973458.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(100, 2, 3, 2, 'coatImages/20804291535973458.png', 'double_four', 'no_vent', 'coatImages/thumbnail/20804291535973458.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(101, 2, 3, 1, 'coatImages/91083851535973513.png', 'double_six', 'no_vent', 'coatImages/thumbnail/91083851535973513.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(102, 2, 3, 2, 'coatImages/35148571535973513.png', 'double_six', 'no_vent', 'coatImages/thumbnail/35148571535973513.png', 'unpressed', '', 'empty', 'no', 'notched', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(103, 2, 3, 1, 'coatImages/51533651535973922.png', 'single_one', 'no_vent', 'coatImages/thumbnail/51533651535973922.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(104, 2, 3, 2, 'coatImages/41847541535973922.png', 'single_one', 'no_vent', 'coatImages/thumbnail/41847541535973922.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(105, 2, 3, 1, 'coatImages/45993281535974902.png', 'single_one', 'no_vent', 'coatImages/thumbnail/45993281535974902.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(106, 2, 3, 2, 'coatImages/60884921535974902.png', 'single_one', 'no_vent', 'coatImages/thumbnail/60884921535974902.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(107, 2, 3, 1, 'coatImages/22667021535975050.png', 'single_three', 'no_vent', 'coatImages/thumbnail/22667021535975050.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(108, 2, 3, 2, 'coatImages/56344921535975050.png', 'single_three', 'no_vent', 'coatImages/thumbnail/56344921535975050.png', 'unpressed', '', 'empty', 'no', 'shawl', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(109, 2, 3, 1, 'coatImages/34744421535975463.png', 'single_three', 'no_vent', 'coatImages/thumbnail/34744421535975463.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(110, 2, 3, 2, 'coatImages/96370931535975463.png', 'single_three', 'no_vent', 'coatImages/thumbnail/96370931535975463.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(111, 2, 3, 1, 'coatImages/2109631535975583.png', 'double_four', 'no_vent', 'coatImages/thumbnail/2109631535975583.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(112, 2, 3, 2, 'coatImages/71395161535975583.png', 'double_four', 'no_vent', 'coatImages/thumbnail/71395161535975583.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(113, 2, 3, 1, 'coatImages/53110591535975692.png', 'double_six', 'no_vent', 'coatImages/thumbnail/53110591535975692.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(114, 2, 3, 2, 'coatImages/51912001535975692.png', 'double_six', 'no_vent', 'coatImages/thumbnail/51912001535975692.png', 'unpressed', '', 'empty', 'no', 'peaked', 'normal', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(115, 2, 3, 1, 'coatImages/53864101535975862.png', 'single_one', 'no_vent', 'coatImages/thumbnail/53864101535975862.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(116, 2, 3, 2, 'coatImages/84363961535975862.png', 'single_one', 'no_vent', 'coatImages/thumbnail/84363961535975862.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(117, 2, 3, 1, 'coatImages/66251521535975998.png', 'double_four', 'no_vent', 'coatImages/thumbnail/66251521535975998.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(118, 2, 3, 2, 'coatImages/19861861535975998.png', 'double_four', 'no_vent', 'coatImages/thumbnail/19861861535975998.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(119, 2, 3, 1, 'coatImages/13529801535976085.png', 'double_six', 'no_vent', 'coatImages/thumbnail/13529801535976085.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(120, 2, 3, 2, 'coatImages/4257111535976085.png', 'double_six', 'no_vent', 'coatImages/thumbnail/4257111535976085.png', 'unpressed', '', 'empty', 'no', 'notched', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(121, 2, 3, 1, 'coatImages/91823191535977557.png', 'single_one', 'no_vent', 'coatImages/thumbnail/91823191535977557.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(122, 2, 3, 2, 'coatImages/43590191535977557.png', 'single_one', 'no_vent', 'coatImages/thumbnail/43590191535977557.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(123, 2, 3, 1, 'coatImages/67098001535977627.png', 'single_three', 'no_vent', 'coatImages/thumbnail/67098001535977627.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(124, 2, 3, 2, 'coatImages/12868271535977627.png', 'single_three', 'no_vent', 'coatImages/thumbnail/12868271535977627.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(125, 2, 3, 1, 'coatImages/68858821535977710.png', 'double_four', 'no_vent', 'coatImages/thumbnail/68858821535977710.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(126, 2, 3, 2, 'coatImages/66140421535977710.png', 'double_four', 'no_vent', 'coatImages/thumbnail/66140421535977710.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(127, 2, 3, 1, 'coatImages/20873981535977828.png', 'double_six', 'no_vent', 'coatImages/thumbnail/20873981535977828.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(128, 2, 3, 2, 'coatImages/3964931535977828.png', 'double_six', 'no_vent', 'coatImages/thumbnail/3964931535977828.png', 'unpressed', '', 'empty', 'no', 'notched', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(129, 2, 3, 1, 'coatImages/61885071535977990.png', 'single_one', 'no_vent', 'coatImages/thumbnail/61885071535977990.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(130, 2, 3, 2, 'coatImages/46217211535977990.png', 'single_one', 'no_vent', 'coatImages/thumbnail/46217211535977990.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(131, 2, 3, 1, 'coatImages/15134441535978067.png', 'single_three', 'no_vent', 'coatImages/thumbnail/15134441535978067.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(132, 2, 3, 2, 'coatImages/38423401535978067.png', 'single_three', 'no_vent', 'coatImages/thumbnail/38423401535978067.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(133, 2, 3, 1, 'coatImages/94991101535978132.png', 'double_four', 'no_vent', 'coatImages/thumbnail/94991101535978132.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(134, 2, 3, 2, 'coatImages/75152861535978132.png', 'double_four', 'no_vent', 'coatImages/thumbnail/75152861535978132.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(135, 2, 3, 1, 'coatImages/83848421535978169.png', 'double_six', 'no_vent', 'coatImages/thumbnail/83848421535978169.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(136, 2, 3, 2, 'coatImages/41003971535978169.png', 'double_six', 'no_vent', 'coatImages/thumbnail/41003971535978169.png', 'unpressed', '', 'empty', 'no', 'peaked', 'narrow', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(137, 2, 3, 1, 'coatImages/31911101536144915.png', 'double_six', 'no_vent', 'coatImages/thumbnail/31911101536144915.png', 'unpressed', '', 'empty', 'no', 'peaked', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(138, 2, 3, 2, 'coatImages/10712631536144915.png', 'double_six', 'no_vent', 'coatImages/thumbnail/10712631536144915.png', 'unpressed', '', 'empty', 'no', 'peaked', 'wide', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(147, 2, 13, 1, 'coatImages/86830911536303684.png', 'no_button', 'no_vent', 'coatImages/thumbnail/86830911536303684.png', 'unpressed', 'single_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(148, 2, 13, 2, 'coatImages/62151861536303684.png', 'no_button', 'no_vent', 'coatImages/thumbnail/62151861536303684.png', 'unpressed', 'single_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(149, 2, 13, 1, 'coatImages/53897251536303895.png', 'no_button', 'no_vent', 'coatImages/thumbnail/53897251536303895.png', 'unpressed', 'double_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(150, 2, 13, 2, 'coatImages/94443311536303895.png', 'no_button', 'no_vent', 'coatImages/thumbnail/94443311536303895.png', 'unpressed', 'double_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(151, 2, 14, 1, 'coatImages/71981111536314222.png', 'no_button', 'no_vent', 'coatImages/thumbnail/71981111536314222.png', 'unpressed', 'no_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(152, 2, 14, 2, 'coatImages/53552051536314222.png', 'no_button', 'no_vent', 'coatImages/thumbnail/53552051536314222.png', 'unpressed', 'no_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'back', 0, 0, 0, 0, 'suit', 10),
(153, 2, 14, 1, 'coatImages/9278681536317809.png', 'no_button', 'no_vent', 'coatImages/thumbnail/9278681536317809.png', 'unpressed', 'no_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(154, 2, 14, 2, 'coatImages/41778741536317809.png', 'no_button', 'no_vent', 'coatImages/thumbnail/41778741536317809.png', 'unpressed', 'no_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(155, 2, 8, 1, 'coatImages/55507001536562061.png', 'no_button', 'no_vent', 'coatImages/thumbnail/55507001536562061.png', 'pressed', 'no_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10),
(156, 2, 8, 2, 'coatImages/52898391536562061.png', 'no_button', 'no_vent', 'coatImages/thumbnail/52898391536562061.png', 'pressed', 'no_pleats', 'empty', 'no', 'empty', 'empty', NULL, 'front', 0, 0, 0, 0, 'suit', 10);

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `name`, `image`, `thumbnail`, `date_time`) VALUES
(1, 'Customizable', 'collectionImages/26403941532414116.png', 'collectionImages/thumbnail/26403941532414116.png', '2018-07-24 06:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `img`) VALUES
(1, 'green', ''),
(2, 'red', ''),
(3, 'yellow', '');

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `z_index` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `name`, `z_index`, `date_time`) VALUES
(1, 'coat_base_front', 6, '2018-08-02 09:53:44'),
(2, 'coat_base_back', 5, '2018-08-02 09:53:40'),
(3, 'lapels', 7, '2018-08-02 09:53:51'),
(4, 'coller', 8, '2018-08-02 09:53:58'),
(5, 'button', 9, '2018-08-02 09:54:02'),
(6, 'pocket', 10, '2018-08-02 09:54:07'),
(7, 'vent', 11, '2018-08-02 09:54:12'),
(8, 'trouser_front', 0, '2018-08-02 11:04:37'),
(9, 'trouser_back', 0, '2018-08-02 11:04:34'),
(10, 'waist_coat', 2, '2018-08-02 11:04:29'),
(11, 'lining', 2, '2018-08-07 06:10:48'),
(12, 'lapel_buttonholes', 8, '2018-09-05 10:30:54'),
(13, 'trousers_pleats', 1, '2018-09-07 07:08:32'),
(14, 'belt_loops', 1, '2018-09-07 10:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `custom_products`
--

CREATE TABLE `custom_products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_product_variants`
--

CREATE TABLE `custom_product_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(150) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_variant_components`
--

CREATE TABLE `custom_variant_components` (
  `id` int(11) NOT NULL,
  `custom_suit_id` int(11) NOT NULL,
  `accessory_id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fabrics`
--

CREATE TABLE `fabrics` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `color_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `pattern_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `thickness` varchar(200) NOT NULL,
  `composition` varchar(100) NOT NULL,
  `pattern` varchar(100) NOT NULL,
  `extra_price` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fabrics`
--

INSERT INTO `fabrics` (`id`, `name`, `image`, `thumbnail`, `color_id`, `material_id`, `pattern_id`, `category_id`, `description`, `thickness`, `composition`, `pattern`, `extra_price`) VALUES
(1, 'Philip Black', 'fabricImages/8880811532609864.png', 'fabricImages/thumbnail/8880811532609864.png', 1, 1, 1, 1, 'Description of Fabric', '', '', '', 33),
(2, 'Rex Light Grey', 'fabricImages/6355481533554798.png', 'fabricImages/thumbnail/6355481533554798.png', 2, 2, 2, 2, 'this is descrption', '2', '', '', 44);

-- --------------------------------------------------------

--
-- Table structure for table `fabric_category`
--

CREATE TABLE `fabric_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fabric_material`
--

CREATE TABLE `fabric_material` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fabric_material`
--

INSERT INTO `fabric_material` (`id`, `name`, `date_time`) VALUES
(1, 'material 1', '2018-09-28 10:12:21'),
(2, 'material 2', '2018-09-28 10:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `fabric_pattern`
--

CREATE TABLE `fabric_pattern` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fabric_pattern`
--

INSERT INTO `fabric_pattern` (`id`, `name`, `date_time`) VALUES
(1, 'pattern 1', '2018-09-28 10:13:16'),
(2, 'pattern 2', '2018-09-28 10:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `fit`
--

CREATE TABLE `fit` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fit`
--

INSERT INTO `fit` (`id`, `name`, `description`, `date_time`) VALUES
(1, 'Slim Fit', 'This model is tighter fitting than the Classic model, especially over the shoulders and chest. The waist is accentuated and the trouser legs narrow.', '2018-07-27 07:46:08'),
(2, 'Classic', 'This model has a classic design and compared with the Slim Fit model, is not as tight over the shoulders and chest. It is neither as narrow in the waist and the trouser legs are a little wider. Are you traditional? Then this is the model for you.', '2018-07-27 07:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `jacket_details`
--

CREATE TABLE `jacket_details` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lapels`
--

CREATE TABLE `lapels` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lapels_options`
--

CREATE TABLE `lapels_options` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `image` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `linings`
--

CREATE TABLE `linings` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail` varchar(150) NOT NULL,
  `lining_thumbnail` varchar(150) NOT NULL,
  `lining_image` varchar(150) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `linings`
--

INSERT INTO `linings` (`id`, `image`, `thumbnail`, `lining_thumbnail`, `lining_image`, `name`, `description`, `date_time`) VALUES
(6, 'liningImages/21150811533714539.png', 'liningImages/thumbnail/21150811533714539.png', 'liningImages/thumbnail/65784861533714539.png', 'liningImages/65784861533714539.png', 'New Lining1', '', '0000-00-00 00:00:00'),
(7, 'liningImages/36941041535536034.png', 'liningImages/thumbnail/36941041535536034.png', 'liningImages/thumbnail/14231535536034.png', 'liningImages/14231535536034.png', 'AC-010.jpg.sample', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_object` text NOT NULL,
  `order_status` enum('active','completed','cancelled') NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `paypalObject` text NOT NULL,
  `ipn` varchar(100) NOT NULL,
  `payment_status` enum('paid','not_paid') NOT NULL DEFAULT 'not_paid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date_time`, `order_object`, `order_status`, `user_email`, `user_id`, `paypalObject`, `ipn`, `payment_status`) VALUES
(1, '2018-09-14 12:41:35', '{\"7\":{\"product\":\"7\",\"quantity\":1},\"customSuit\":{\"product\":{\"customProduct\":\"customSuit\",\"product\":\"three_piece\",\"fit\":\"slim\",\"fabric\":\"2\",\"lining\":\"2\",\"button_type\":\"single_one\",\"lapel_type\":\"notched\",\"lapel_width\":\"narrow\",\"distinctStitch\":\"no\",\"lapelFabric\":\"2\",\"pocketStyle\":\"flaped\",\"pockets\":\"two\",\"vent\":\"two\",\"jacketMonogram\":\"no\",\"jacketMonogramText\":\"\",\"jacketMonogramFont\":\"\",\"jacketMonogramColor\":\"\",\"workingCuff\":\"no\",\"elbowPatch\":\"no\",\"jacketShinyButtons\":\"no\",\"jacketfloatingCanvas\":\"no\",\"jacketLiningType\":\"full_lining\",\"waistcoat\":\"yes\",\"waistcoatFabric\":\"2\",\"trousersFabric\":\"2\",\"trousersPleats\":\"no_pleats\",\"trousersBeltLoops\":\"no\",\"lapelButtonholes\":\"no\",\"trousersPressed\":\"unpressed\"},\"quantity\":1}}', 'active', 'yasir@ranksol.com', 1, '', '', 'not_paid'),
(3, '2018-09-14 12:57:26', '{\"customSuit\":{\"product\":{\"customProduct\":\"customSuit\",\"product\":\"three_piece\",\"fit\":\"slim\",\"fabric\":\"2\",\"lining\":\"2\",\"button_type\":\"single_one\",\"lapel_type\":\"notched\",\"lapel_width\":\"narrow\",\"distinctStitch\":\"no\",\"lapelFabric\":\"2\",\"pocketStyle\":\"flaped\",\"pockets\":\"two\",\"vent\":\"two\",\"jacketMonogram\":\"no\",\"jacketMonogramText\":\"\",\"jacketMonogramFont\":\"\",\"jacketMonogramColor\":\"\",\"workingCuff\":\"no\",\"elbowPatch\":\"no\",\"jacketShinyButtons\":\"no\",\"jacketfloatingCanvas\":\"no\",\"jacketLiningType\":\"full_lining\",\"waistcoat\":\"yes\",\"waistcoatFabric\":\"2\",\"trousersFabric\":\"2\",\"trousersPleats\":\"no_pleats\",\"trousersBeltLoops\":\"no\",\"lapelButtonholes\":\"no\",\"trousersPressed\":\"unpressed\"},\"quantity\":1}}', 'active', 'yasir@ranksol.com', 1, '', '', 'not_paid'),
(4, '2018-09-17 06:46:05', '{\"customSuit\":{\"product\":{\"customProduct\":\"customSuit\",\"product\":\"three_piece\",\"fit\":\"classic\",\"fabric\":\"2\",\"lining\":\"2\",\"button_type\":\"single_three\",\"lapel_type\":\"notched\",\"lapel_width\":\"narrow\",\"distinctStitch\":\"no\",\"lapelFabric\":\"2\",\"pocketStyle\":\"flaped\",\"pockets\":\"two\",\"vent\":\"two\",\"jacketMonogram\":\"no\",\"jacketMonogramText\":\"\",\"jacketMonogramFont\":\"\",\"jacketMonogramColor\":\"\",\"workingCuff\":\"no\",\"elbowPatch\":\"no\",\"jacketShinyButtons\":\"no\",\"jacketfloatingCanvas\":\"no\",\"jacketLiningType\":\"full_lining\",\"waistcoat\":\"yes\",\"waistcoatFabric\":\"2\",\"trousersFabric\":\"2\",\"trousersPleats\":\"no_pleats\",\"trousersBeltLoops\":\"no\",\"lapelButtonholes\":\"no\",\"trousersPressed\":\"unpressed\"},\"quantity\":1}}', 'active', 'yasir@ranksol.com', 1, '', '', 'not_paid'),
(5, '2018-09-17 10:27:24', '{\"customSuit\":{\"product\":{\"customProduct\":\"customSuit\",\"product\":\"three_piece\",\"fit\":\"classic\",\"fabric\":\"2\",\"lining\":\"2\",\"button_type\":\"single_one\",\"lapel_type\":\"notched\",\"lapel_width\":\"narrow\",\"distinctStitch\":\"no\",\"lapelFabric\":\"2\",\"pocketStyle\":\"flaped\",\"pockets\":\"two\",\"vent\":\"two\",\"jacketMonogram\":\"no\",\"jacketMonogramText\":\"\",\"jacketMonogramFont\":\"\",\"jacketMonogramColor\":\"\",\"workingCuff\":\"no\",\"elbowPatch\":\"no\",\"jacketShinyButtons\":\"no\",\"jacketfloatingCanvas\":\"no\",\"jacketLiningType\":\"full_lining\",\"waistcoat\":\"yes\",\"waistcoatFabric\":\"2\",\"trousersFabric\":\"2\",\"trousersPleats\":\"no_pleats\",\"trousersBeltLoops\":\"no\",\"lapelButtonholes\":\"no\",\"trousersPressed\":\"unpressed\",\"price\":240},\"quantity\":1}}', 'active', 'yasir@ranksol.com', 1, '', '', 'not_paid'),
(6, '2018-09-17 11:37:56', '{\"customSuit\":{\"product\":{\"customProduct\":\"customSuit\",\"product\":\"three_pieces\",\"fit\":\"classic\",\"fabric\":2,\"lining\":6,\"button_type\":\"double_six\",\"lapel_type\":\"peaked\",\"lapel_width\":\"normal\",\"distinctStitch\":\"yes\",\"lapelFabric\":\"2\",\"pocketStyle\":\"slanted\",\"pockets\":\"two\",\"vent\":\"one\",\"jacketMonogram\":\"no\",\"jacketMonogramText\":\"\",\"jacketMonogramFont\":\"\",\"jacketMonogramColor\":\"\",\"workingCuff\":\"no\",\"elbowPatch\":\"no\",\"jacketShinyButtons\":\"no\",\"jacketfloatingCanvas\":\"no\",\"jacketLiningType\":\"full_lining\",\"waistcoat\":\"yes\",\"waistcoatFabric\":\"2\",\"trousersFabric\":\"2\",\"trousersPleats\":\"no_pleats\",\"trousersBeltLoops\":\"no\",\"lapelButtonholes\":\"no\",\"trousersPressed\":\"unpressed\",\"price\":250,\"quantity\":\"6\"},\"quantity\":\"6\"}}', 'active', 'yasir@ranksol.com', 1, '', '', 'not_paid'),
(8, '2018-09-25 07:24:38', '{\"7\":{\"product\":\"7\",\"quantity\":1,\"item\":\"product\"}}', 'active', 'yasir@ranksol.com', 1, '', '', 'not_paid');

-- --------------------------------------------------------

--
-- Table structure for table `pockets`
--

CREATE TABLE `pockets` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pocket_options`
--

CREATE TABLE `pocket_options` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_custom` enum('no','yes') NOT NULL DEFAULT 'no',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `thumbnail`, `category_id`, `is_custom`, `date_time`) VALUES
(6, 'ProductOne', 2000, 'productImages/64036221536575506.jpg', 'productImages/thumbnail/64036221536575506.jpg', 1, 'no', '2018-09-10 10:31:46'),
(7, 'ProductTwo', 3000, 'productImages/33138401536575684.jpg', 'productImages/thumbnail/33138401536575684.jpg', 1, 'no', '2018-09-10 10:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `products_collections`
--

CREATE TABLE `products_collections` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `trouser_options`
--

CREATE TABLE `trouser_options` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(150) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trouser_styles`
--

CREATE TABLE `trouser_styles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(200) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birth_date` datetime NOT NULL,
  `joining_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(200) NOT NULL,
  `last_login_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role_id` int(11) NOT NULL,
  `activation_status` enum('active','deactive') DEFAULT 'deactive',
  `block_status` enum('blocked','unblocked') NOT NULL DEFAULT 'unblocked',
  `country` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `house` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postcode` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `waistcoat`
--

CREATE TABLE `waistcoat` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accessories_cat`
--
ALTER TABLE `accessories_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accessory_options`
--
ALTER TABLE `accessory_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accessory_options_values`
--
ALTER TABLE `accessory_options_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buttons`
--
ALTER TABLE `buttons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coat_components`
--
ALTER TABLE `coat_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_products`
--
ALTER TABLE `custom_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_product_variants`
--
ALTER TABLE `custom_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_variant_components`
--
ALTER TABLE `custom_variant_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabrics`
--
ALTER TABLE `fabrics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabric_category`
--
ALTER TABLE `fabric_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabric_material`
--
ALTER TABLE `fabric_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabric_pattern`
--
ALTER TABLE `fabric_pattern`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fit`
--
ALTER TABLE `fit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jacket_details`
--
ALTER TABLE `jacket_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lapels`
--
ALTER TABLE `lapels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `linings`
--
ALTER TABLE `linings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pockets`
--
ALTER TABLE `pockets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pocket_options`
--
ALTER TABLE `pocket_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_collections`
--
ALTER TABLE `products_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trouser_options`
--
ALTER TABLE `trouser_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trouser_styles`
--
ALTER TABLE `trouser_styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waistcoat`
--
ALTER TABLE `waistcoat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `accessories_cat`
--
ALTER TABLE `accessories_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `accessory_options`
--
ALTER TABLE `accessory_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accessory_options_values`
--
ALTER TABLE `accessory_options_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buttons`
--
ALTER TABLE `buttons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coat_components`
--
ALTER TABLE `coat_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `custom_products`
--
ALTER TABLE `custom_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_product_variants`
--
ALTER TABLE `custom_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_variant_components`
--
ALTER TABLE `custom_variant_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fabrics`
--
ALTER TABLE `fabrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fabric_category`
--
ALTER TABLE `fabric_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fabric_material`
--
ALTER TABLE `fabric_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fabric_pattern`
--
ALTER TABLE `fabric_pattern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fit`
--
ALTER TABLE `fit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jacket_details`
--
ALTER TABLE `jacket_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapels`
--
ALTER TABLE `lapels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linings`
--
ALTER TABLE `linings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pockets`
--
ALTER TABLE `pockets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pocket_options`
--
ALTER TABLE `pocket_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products_collections`
--
ALTER TABLE `products_collections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trouser_options`
--
ALTER TABLE `trouser_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trouser_styles`
--
ALTER TABLE `trouser_styles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waistcoat`
--
ALTER TABLE `waistcoat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
