-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-03-2014 a las 19:36:18
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `social`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `short` varchar(4) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short` (`short`),
  KEY `name` (`country`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Volcar la base de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `short`, `country`) VALUES
(1, 'af', 'Afghanistan'),
(2, 'dz', 'Algeria'),
(3, 'ar', 'Argentina'),
(4, 'au', 'Australia'),
(5, 'bd', 'Bangladesh'),
(6, 'br', 'Brazil'),
(7, 'cm', 'Cameroon'),
(8, 'ca', 'Canada'),
(9, 'co', 'Colombia'),
(10, 'dk', 'Denmark'),
(11, 'eg', 'Egypt'),
(12, 'et', 'Ethiopia'),
(13, 'fr', 'France'),
(14, 'de', 'Germany'),
(15, 'gh', 'Ghana'),
(16, 'gr', 'Greece'),
(17, 'in', 'India'),
(18, 'id', 'Indonesia'),
(19, 'iq', 'Iraq'),
(20, 'ie', 'Ireland'),
(21, 'il', 'Israel'),
(22, 'it', 'Italy'),
(23, 'jp', 'Japan'),
(24, 'ke', 'Kenya'),
(25, 'mg', 'Madagascar'),
(26, 'my', 'Malaysia'),
(27, 'mx', 'Mexico'),
(28, 'ma', 'Morocco'),
(29, 'mz', 'Mozambique'),
(30, 'np', 'Nepal'),
(31, 'nl', 'Netherlands'),
(32, 'nz', 'New Zealand'),
(33, 'ng', 'Nigeria'),
(34, 'pk', 'Pakistan'),
(35, 'pe', 'Peru'),
(36, 'ph', 'Philippines'),
(37, 'pl', 'Poland'),
(38, 'ro', 'Romania'),
(39, 'ru', 'Russia'),
(40, 'sa', 'Saudi Arabia'),
(41, 'sg', 'Singapore'),
(42, 'za', 'South Africa'),
(43, 'kr', 'South Korea'),
(44, 'es', 'Spain'),
(45, 'lk', 'Sri Lanka'),
(46, 'se', 'Sweden'),
(47, 'ch', 'Switzerland'),
(48, 'tw', 'Taiwan'),
(49, 'tz', 'Tanzania'),
(50, 'th', 'Thailand'),
(51, 'tr', 'Turkey'),
(52, 'ug', 'Uganda'),
(53, 'ua', 'Ukraine'),
(54, 'gb', 'United Kingdom'),
(55, 'us', 'United States'),
(56, 'uz', 'Uzbekistan'),
(57, 've', 'Venezuela'),
(58, 'vn', 'Vietnam'),
(59, 'ye', 'Yemen'),
(60, 'alb', 'Albania'),
(61, 'and', 'Andorra'),
(62, 'ang', 'Angola'),
(63, 'eth', 'Ethiopia'),
(64, 'arm', 'Armenia'),
(65, 'aru', 'Aruba'),
(66, 'aze', 'Azerbaijan'),
(67, 'bah', 'Bahamas'),
(68, 'brn', 'Barhain'),
(69, 'ban', 'Bangladesh'),
(70, 'bar', 'Barbados'),
(71, 'aut', 'Austria'),
(72, 'blr', 'Belarus'),
(73, 'bel', 'Belgium'),
(74, 'biz', 'Belice'),
(75, 'ben', 'Benin'),
(76, 'cyp', 'Cyprus'),
(77, 'cze', 'Czech Republic'),
(78, 'dom', 'Dominican Republic'),
(79, 'ecu', 'Ecuador'),
(80, 'esa', 'El Salvador'),
(81, 'ber', 'Bermuda'),
(82, 'bhu', 'Butan'),
(83, 'bol', 'Bolivia'),
(84, 'bot', 'Bostwana'),
(85, 'bru', 'Brunei'),
(86, 'bul', 'Bulgaria'),
(87, 'cpv', 'Cape Verde'),
(88, 'cay', 'Cayman Islands'),
(89, 'chi', 'Chile'),
(90, 'chn', 'China, P.R'),
(91, 'tpe', 'Chinese Taipei'),
(92, 'com', 'Comoros'),
(93, 'cgo', 'Congo'),
(94, 'crc', 'Costa Rica'),
(95, 'civ', 'Ivory Coast'),
(96, 'cro', 'Croatia'),
(97, 'cub', 'Cuba'),
(98, 'eng', 'England'),
(99, 'fin', 'Finland'),
(100, 'ivb', 'Islas Vírgenes Británicas'),
(101, 'uru', 'Uruguay'),
(102, 'vie', 'Vietnam'),
(103, 'ukr', 'Ukraine'),
(104, 'tog', 'Togo'),
(105, 'tri', 'Trinidad and Tobago'),
(106, 'ind', 'India'),
(107, 'qat', 'Qatar'),
(108, 'hkg', 'Hong Kong'),
(109, 'sen', 'Senegal');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
