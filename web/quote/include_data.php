<?php
// session_start();
session_start([
    'use_only_cookies' => 1,
    'cookie_lifetime' => 0,
    'cookie_secure' => 1,
    'cookie_httponly' => 1,
    'cookie_samesite' => 'Strict'
]);
$this_page = $url_set . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

//TITLE資訊
$query = "SELECT d_id,d_text FROM `document` WHERE d_id IN(1,2,3,4,5,6,7,8)";
$meta_data = sql_data($query, $link, 2, "d_id");
$title_var = $meta_data[1]["d_text"];

//GOOGLE驗證碼
$sitekey = "";

//篩選項目
$search_type_arr = array(
    1 => array("", "全部"),
    2 => array("n_date", "日期"),
    3 => array("n_title", "主題"),
    4 => array("n_unit", "公告單位"),
    5 => array("n_name", "公告人員"),
    6 => array("n_area", "地區"),
);
