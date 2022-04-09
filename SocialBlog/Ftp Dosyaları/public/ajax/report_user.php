<?php
session_start();
error_reporting(0);
if ( 
	isset( $_POST['_userId'] ) 
	&& !empty( $_POST['_userId'] )
)
{
  if ( isset( $_SESSION['authenticated'] ) )
	{
		/*
		 * --------------------------
		 *   Require File
		 * -------------------------
		 */
		require('../../class_ajax_request/classAjax.php');
		/*
		 * ----------------------
		 *   Instance Class
		 * ----------------------
		 */
		$obj             = new AjaxRequest();
		$_POST['_userId'] = is_numeric( $_POST['_userId'] ) ? $_POST['_userId'] : die();
		
		$query = $obj->reportUser();
		
		if( $query == 1 ){
		 echo json_encode( array( 'status' => 'ok', 'res' => $_SESSION['LANG']['successfully_reported'] ) );
	} else if( $query == 2 ){
		 echo json_encode( array( 'status' => 'ok', 'res' => $_SESSION['LANG']['error'] ) );
	} else if( $query == 3 ){
		 echo json_encode( array( 'status' => 'ok', 'res' => $_SESSION['LANG']['already_report'] ) );
	} else {
		echo json_encode( array( 'status' => 'error', 'res' => $_SESSION['LANG']['error'] ) );
	}
  }//<-- SESSION
}//<-- if token id
?>