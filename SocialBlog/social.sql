-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-08-2013 a las 19:21:12
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `social_database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(200) NOT NULL DEFAULT '',
  `status` enum('active','approval','trash') NOT NULL DEFAULT 'approval',
  PRIMARY KEY (`id`),
  KEY `User` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `user`, `name`, `pass`, `status`) VALUES
(1, 'admin', 'Administrator', '8cb2237d0679ca88db6464eac60da96345513964', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_settings`
--

CREATE TABLE IF NOT EXISTS `admin_settings` (
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `message_length` int(11) unsigned NOT NULL COMMENT 'messages private',
  `post_length` int(11) unsigned NOT NULL,
  `ad` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `admin_settings`
--

INSERT INTO `admin_settings` (`title`, `description`, `keywords`, `message_length`, `post_length`, `ad`) VALUES
('Social ™ Microblogging', 'Social Microblogging - Discover, Share and  Communicate with Yours', 'social,media,micro-blogging', 140, 140, '<a href="http://codecanyon.net/"><img src="public/img_ad/ad.jpg"></a>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `block_user`
--

CREATE TABLE IF NOT EXISTS `block_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `user_blocked` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL COMMENT '0 unlocked, 1 active',
  PRIMARY KEY (`id`),
  KEY `user` (`user`,`user_blocked`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `block_user`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `short` varchar(2) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short` (`short`),
  KEY `name` (`country`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

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
(59, 'ye', 'Yemen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorites`
--

CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usr` int(11) unsigned NOT NULL,
  `id_favorite` int(10) unsigned NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8 NOT NULL COMMENT '0 trash, 1 active',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usr` (`id_usr`,`id_favorite`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `favorites`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `follower` int(11) unsigned NOT NULL,
  `following` int(10) unsigned NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '0 Trash, 1 Active',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `follower` (`follower`,`following`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `followers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interactions`
--

CREATE TABLE IF NOT EXISTS `interactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `destination` int(10) unsigned NOT NULL,
  `autor` int(10) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `type` enum('1','2','3','4','5','6') NOT NULL COMMENT '1 Follow, 2 Reposted, 3 favorite, 4 reply, 5 Mentions, 6 Mentions in replies',
  `status` enum('0','1') NOT NULL COMMENT '0 No, 1 Yes',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0 No'',''1Yes''',
  PRIMARY KEY (`id`),
  KEY `destination` (`destination`,`autor`,`target`,`status`),
  KEY `trash` (`trash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `interactions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(10) unsigned NOT NULL,
  `to` int(10) unsigned NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('new','readed') CHARACTER SET utf8 NOT NULL DEFAULT 'new',
  `remove_from` enum('0','1') CHARACTER SET utf8 NOT NULL COMMENT '0 Delete, 1 Active',
  PRIMARY KEY (`id`),
  KEY `from` (`from`,`to`,`status`),
  KEY `remove_from` (`remove_from`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `messages`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages_general`
--

CREATE TABLE IF NOT EXISTS `pages_general` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `pages_general`
--

INSERT INTO `pages_general` (`id`, `title`, `content`, `url`) VALUES
(1, 'Help', '<p>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'help'),
(2, 'Terms of Service', '<p>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'terms'),
(3, 'Privacy', '<p>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'privacy'),
(4, 'Advertise with us', '<p>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'advertising'),
(5, 'About Us', '<p>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\r\n\r\n<p>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'about');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repost_of_id` int(10) unsigned NOT NULL,
  `token_id` varchar(50) NOT NULL,
  `post_details` text NOT NULL,
  `photo` varchar(40) NOT NULL,
  `video_code` varchar(200) NOT NULL,
  `video_title` varchar(200) NOT NULL,
  `video_site` varchar(100) NOT NULL COMMENT 'Website of Video',
  `video_url` varchar(250) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 trash, 1 active',
  `video_thumbnail` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_general` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Delete, 1 Active',
  `url_soundcloud` varchar(255) NOT NULL,
  `title_soundcloud` varchar(255) NOT NULL,
  `thumbnail_song` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`,`status`,`date`),
  KEY `repost_of_id` (`repost_of_id`),
  KEY `token_id` (`token_id`),
  KEY `status_general` (`status_general`),
  KEY `url_soundcloud` (`url_soundcloud`),
  KEY `title_soundcloud` (`title_soundcloud`),
  FULLTEXT KEY `post_details` (`post_details`),
  FULLTEXT KEY `video_title` (`video_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `posts`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_reported`
--

CREATE TABLE IF NOT EXISTS `post_reported` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `post_reported` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user` (`user`,`post_reported`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `post_reported`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_design`
--

CREATE TABLE IF NOT EXISTS `profile_design` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `bg` varchar(50) NOT NULL,
  `bg_position` enum('left','center','right') NOT NULL,
  `bg_attachment` enum('fixed','scroll') NOT NULL,
  `color_link` varchar(20) NOT NULL,
  `bg_color` varchar(20) NOT NULL,
  `cover_image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `profile_design`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recover_pass`
--

CREATE TABLE IF NOT EXISTS `recover_pass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_hash` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `verified` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  `date_lost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_hash` (`id_hash`),
  KEY `verified` (`verified`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `recover_pass`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reply`
--

CREATE TABLE IF NOT EXISTS `reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post` int(11) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `reply` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Trash, 1 Active',
  PRIMARY KEY (`id`),
  KEY `post` (`post`,`user`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `reply`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trends_topic`
--

CREATE TABLE IF NOT EXISTS `trends_topic` (
  `user` int(11) unsigned NOT NULL,
  `trends` varchar(255) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `time_stamp` (`time_stamp`),
  KEY `trends` (`trends`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `trends_topic`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `country` varchar(150) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `website` varchar(200) NOT NULL,
  `bio` varchar(140) NOT NULL,
  `avatar` varchar(70) NOT NULL,
  `activation_code` varchar(100) NOT NULL,
  `type_account` enum('0','1') NOT NULL COMMENT '0 Normal, 1 Verified',
  `mode` enum('0','1') NOT NULL COMMENT '0 Private, 1 Public',
  `status` enum('pending','active','suspended','delete') NOT NULL DEFAULT 'pending',
  `messages_private` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '0 Everyone, 1 following, 2 Nobody',
  `email_notification_follow` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0 No'',''1Yes''',
  `email_notification_msg` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0 No'',''1Yes''',
  `language` varchar(20) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `username` (`username`,`type_account`,`mode`,`status`),
  KEY `language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `users`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_reported`
--

CREATE TABLE IF NOT EXISTS `users_reported` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `id_reported` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user` (`user`,`id_reported`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `users_reported`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
