<?php
	@session_start();//開啟session
	@header('Content-Type: text/html; charset=utf-8');//告知編碼
	
	$credentials = md5(date("Y").$project_name.date("md"));
	if(@$_SESSION[$credentials]!=true){//如果不是已登入的使用者
		echo "<script>location.href = \"login.php\";"."</script>";//告知錯誤訊息後導頁至登入頁
	}else{
		$Authenticate = true;
	}
?>