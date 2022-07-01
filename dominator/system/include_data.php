<?php	
// 	聯絡訊息資訊
if(1 <> 1){
	$contact_data = "";
	for($i = 1;$i <= 1;$i++){
		$contact_data = $link -> query("SELECT COUNT(c_id) FROM `contact` WHERE c_status = '1'") -> fetch_row();
		$contact_count[$i] = $contact_data[0];
	}
}

	//頁面標頭資訊
// 	$head_title = $link -> query("SELECT d_text FROM `document` WHERE d_id = 1") -> fetch_row()[0];



/*
 【權限判斷】
*/
if(isset($page_name)){
	$query = "SELECT m_main_purview,m_sub_purview FROM `menu` WHERE m_url = '$page_name'";
	$data = sql_data($query,$link);
	
	if($data){
		$purview = 0;
		if($data[1]["m_main_purview"] > $_SESSION["dominator_main"] || 
			($data[1]["m_main_purview"] == $_SESSION["dominator_main"] && 
				($data[1]["m_sub_purview"] == 0 || $_SESSION["dominator_sub"] == 0 || $data[1]["m_sub_purview"] == $_SESSION["dominator_sub"]))) 
					$purview = 1;
		if(!$purview) header("Location:index.php");
	}
}
?>