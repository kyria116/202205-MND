<?php
include 'dominator/system/ready.mak';
include 'quote/include_data.php';

    //分類標題
    $query = "SELECT nc_id,nc_title FROM `n_class` JOIN `news` USING(nc_id) ORDER BY nc_order";
    $c_data = sql_data($query,$link,2,"nc_id");

    if(!isset($nid) || !is_numeric($nid)){
        $where = "";
        $order = "ORDER BY n_date DESC,n_id DESC";
        $page_set = "?p="; //頁碼
        $webtitle = ""; //分類標題
    }else{
        $where = "WHERE nc_id = $nid";
        $order = "ORDER BY n_order";
        $page_set = "?nid=$nid&p="; //頁碼
        $webtitle = $c_data[$nid]["nc_title"]."|";//分類標題
    }

    $check = 8; //分頁數量
    //分頁設定開始
    $query = "SELECT COUNT(n_id) FROM `news` JOIN `n_class` USING(nc_id) $where";
    if (!isset ($p) || !is_numeric($p) || $p < 1) $p = 1;
    $r = $link -> query($query) -> fetch_row();
    $total = $r[0];
    $maxPage = $total > 0 ? ceil ($total / $check) : 1;
    $p = $p > $maxPage ? 1 : $p;
    $start = ($p - 1) * $check;
    $end_page = $p + 2 <= $maxPage ? $p + 2 : $maxPage;
    $start_page = $end_page - 4 >= 1 ? $end_page - 4 : 1;
    if($end_page - $start_page < 4) $end_page = $start_page + 4 <= $maxPage ? $start_page + 4 : $maxPage;

    //內容
    $query = "SELECT n_id,n_title,DATE_FORMAT(n_date, '%Y.%m.%d') AS n_date,n_stext,n_unit,n_name,n_area,nc_title,nc_id FROM `news` JOIN `n_class` USING(nc_id) $where $order LIMIT {$start},{$check}";
    $data = sql_data($query,$link,2,"n_id");

    $link -> close();	
    $title_var = $webtitle." 最新消息  | ".$title_var;

include "quote/template/head.php";
?>
<link rel="stylesheet" href="dist/css/news.css">
</head>

<body class="lang_tw">
    <main>
        <section class="search-section">
            <div class="container">
                <div class="search-box">
                    <select id="category" onchange="$('#typename').val($(this).val());">
                        <?php 
                            foreach($search_type_arr as $k => $v){
                                echo '<option value="'.$k.'">'.$v[1].'</option>';
                            }                                
                        ?>
                    </select>
                    <form action="search.php" method="get" id="searchForm">
                        <input type="text" name="kw" id="keywords">
                        <input type="hidden" name="type" id="typename" value="1">
                        <a class="btn" href="#" onclick="document.getElementById('searchForm').submit()"></a>
                    </form>
                </div>
            </div>
        </section>
        <section class="topmenu-section">
            <div class="container">
                <div id="topmenu1" class="top-menu-ul">
                    <div class="item_Menu">
                        <div class="item_menu_Box">
                            <ul class="item_menu_list slides">
                                <li <?php echo (!isset($nid))? 'class="active"':'';?>>
                                    <a href="./">
                                        <div>
                                            全部消息
                                        </div>
                                    </a>
                                </li>
                                <?php foreach($c_data as $k => $v){?>
                                <li <?php echo (isset($nid) && $nid == $k)? 'class="active"':'';?>>
                                    <a href="?nid=<?php echo $k;?>">
                                        <div>
                                            <?php echo $v["nc_title"];?>
                                        </div>
                                    </a>
                                </li>
                                <?php }?>
                            </ul>
                        </div>
                    </div>
                    <div class="flex-direction-nav">
                        <a href="javascript:;" class="lbtn flex-prev">
                            <div></div>
                        </a>
                        <a href="javascript:;" class="rbtn flex-next">
                            <div></div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <section class="lists-section">
            <div class="container">
                <ul class="list-title">
                    <li class="l1">發布日期</li>
                    <li class="l2">類別</li>
                    <li class="l3">主題</li>
                    <li class="l4">公告單位</li>
                    <li class="l5">公告人員</li>
                    <li class="l6">地區</li>
                    <li class="l7"></li>
                </ul>
                <?php foreach ($data as $k => $v){?>
                <a class="list-wrap" href="detail.php?id=<?php echo $k;?>">
                    <ul class="list-content">
                        <li class="l1"><?php echo $v["n_date"];?></li>
                        <li class="l2">
                            <div class="tag"><?php echo $v["nc_title"];?></div>
                        </li>
                        <li class="l3"><?php echo $v["n_title"];?></li>
                        <li class="l4"><?php echo $v["n_unit"];?></li>
                        <li class="l5"><?php echo $v["n_name"];?></li>
                        <li class="l6"><?php echo $v["n_area"];?></li>
                        <li class="l7"></li>
                        <li class="l8">
                            <?php 
                                $v["n_stext"] = mb_substr(str_replace('&nbsp;','',strip_tags(html_decode($v["n_stext"]))),0,145,"utf-8");
                                echo $v["n_stext"]."...";
                            ?>
                        </li>
                    </ul>
                </a>
                <?php }?>
            </div>
        </section>
        <section class="page-section">
            <div class="container">
            <?php if ($end_page > 1) { ?>
                <dl class="page asj fadeUp">
                    <dt class="ltbn  <?php echo $p == 1 ? "nopage" : ""; ?>">
                        <a <?php echo $p == 1 ? '' : "href='" . $page_set . ($p - 1) . "'"; ?>>
                            <span></span>
                        </a>
                    </dt>
                    <?php for ($i = $start_page; $i <= $end_page; $i++) { ?>
                        <dd class="<?php echo $p == $i ? 'active' : ''; ?>"><a <?php echo $i == $p ? '' : "href='" . $page_set . $i . "'"; ?>><?php echo $i; ?></a></dd>
                    <?php } ?>
                    <dt class="rtbn <?php echo $p == $maxPage ? "nopage" : ""; ?>">
                        <a <?php echo $p == $maxPage ? '' : "href='" . $page_set . ($p + 1) . "'"; ?>>
                            <span></span>
                        </a>
                    </dt>
                </dl>
            <?php } ?>
            </div>
        </section>
    </main>
    <script src="dist/js/main.js"></script>
    <script src="dist/js/news.js"></script>
</body>

</html>