<?php
/*
 * DATABASE PARAMS
 * 
 * */
$config = Config::singleton();
$config->set('dbhost', 'localhost');
$config->set('dbname', 'DATABASE'); //<-- DATABASE NAME
$config->set('dbuser', 'USER'); //<-- USER
$config->set('dbpass', 'PASS'); //<-- PASS
$config->set('dbchar', 'utf8' ); //<-- NOT MODIFIED

/*
 * DATABASE TABLES  ** PLEASE NOT MODIFIED **
 * 
 * */
define('ADMIN_SETTINGS', 'admin_settings');
define('PAGES_GENERAL', 'pages_general');
/*
 * SITE NAME PATH
 * */
define('URL_BASE', 'http://yousite.com/'); //<-- IMPORTANT: place a backslash at the end
?>
