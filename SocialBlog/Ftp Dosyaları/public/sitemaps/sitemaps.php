<?php 
//<<<--- Requiere Class --->>>
require_once '../../class_ajax_request/classAjax.php';
$obj              = new AjaxRequest();
$response         = $obj->allUsername();
$res_pages        = $obj->allPages();

//<<<--- Header --->>>
header('Content-Type: text/xml; charset=utf-8');
echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
	
	<?php
   			foreach ( $res_pages as $k ) {
   				
   			 ?>
	<url>
         <loc><?php echo URL_BASE.$k['url']; ?>/</loc>
         <lastmod>2014-02-04</lastmod>
         <priority>0.8</priority>
   </url>
   <?php }//<<<<--- End Foreach ?>
   
	<?php
   			foreach ( $response as $key ) {
   				
   			 ?>
	<url>
         <loc><?php echo URL_BASE.$key['username']; ?></loc>
         <lastmod>2014-02-04</lastmod>
         <priority>0.8</priority>
   </url>
   <?php }//<<<<--- End Foreach ?>
</urlset>