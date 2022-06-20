<?php
	include 'ready.mak';
	
	// 	資料庫資訊
	$db_set = "user";
	$id_set = "u_id";
	$name_set = "u_name";
	$password_set = "u_password";
	
	$result = $link -> query("SELECT $id_set FROM `$db_set` WHERE $id_set = '$id' AND $password_set = MD5('$password')");
	if($result -> num_rows > 0){
		echo "1";
	}else{
		echo "0";
	}
	$result -> free();
	$link -> close();//關閉資料庫
?>