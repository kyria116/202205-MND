<?php
	/*
	 * 來源頁面必需以get傳送：
	* 1、db：資料表名。
	* 2、page：來源頁面名稱。
	* 3、id_name：索引值欄位名稱。
	* 4、id：欲修改的索引值。
	*/
	header("Content-Type: text/html; charset=utf-8");//告知編碼
	include '../system/ready.mak';
	include '../system/session.php';
	
	if($Authenticate == true){
		$search_row = $link -> query("SELECT $key FROM `$db` WHERE $id_name = '$id'") -> fetch_row();//執行sql語法
		@unlink("../../upload/$search_row[0]");//刪除檔案
		$link -> query("UPDATE `$db` SET $key = NULL WHERE $id_name = $id");//執行sql語法
		echo "<script>alert('圖片/ 檔案已刪除。');history.go(-1);</script>";//執行導頁或輸出訊息後導頁
	}else exit();
	$link -> close();//關閉資料庫
?>