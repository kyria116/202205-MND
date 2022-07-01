<?php
include 'dominator/system/ready.mak';
include 'quote/include_data.php';

if (!isset($id) || !is_numeric($id)) {
    header("location:./");
    exit();
}

//內容
$query = "SELECT nc_id,nc_title,n_title,n_keyword,DATE_FORMAT(n_date ,'%Y.%m.%d') AS n_date,n_stext,n_unit,n_name,n_area,n_suggest,n_source,n_order FROM `news` JOIN `n_class` USING(nc_id) WHERE n_id = $id";
$data = sql_data($query, $link, 1);

//上一則&下一則
$nc_id = $data["nc_id"];
$query = "SELECT n_id FROM news WHERE nc_id = $nc_id ORDER BY n_order";
$btn_arr = array();
$result = $link->query($query);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        foreach ($row as $k => $v) array_push($btn_arr, $v);
    }
}
$current_id = array_search($id, $btn_arr);
$prev_id = ($current_id - 1 < 0) ? "" :  $btn_arr[$current_id - 1];
$next_id = ($current_id + 1 >= count($btn_arr)) ? "" :  $btn_arr[$current_id + 1];


$link->close();

$title_var = $data["n_title"] . " | " . $title_var;

include "quote/template/head.php";
?>
<link rel="stylesheet" href="dist/css/news-detail.css">
</head>

<body class="lang_tw">
    <main>
        <div class="container" style="text-align:center;">
            <img src="dist/images/logo.jpg" class="logo_new" alt="行政規則">
        </div>
        <section class="content-section">
            <div class="container-s">
                <div class="table">
                    <div class="table-flex">
                        <div class="table-title">
                            主題
                        </div>
                        <div class="table-content headline">
                            <?php echo $data["n_title"]; ?>
                        </div>
                    </div>
                    <div class="table-flex">
                        <div class="table-title">
                            關鍵字
                        </div>
                        <div class="table-content">
                            <?php echo $data["n_keyword"]; ?>
                        </div>
                    </div>
                    <div class="table-flex">
                        <div class="table-title">
                            類別
                        </div>
                        <div class="table-content">
                            <?php echo $data["nc_title"]; ?>
                        </div>
                    </div>
                    <div class="table-flex">
                        <div class="table-title">
                            地別區
                        </div>
                        <div class="table-content">
                            <?php echo $data["n_area"]; ?>
                        </div>
                    </div>
                    <div class="table-flex">
                        <div class="table-title">
                            日期
                        </div>
                        <div class="table-content">
                            <?php echo $data["n_date"]; ?>
                        </div>
                    </div>
                    <div class="table-flex">
                        <div class="table-title">
                            摘要
                        </div>
                        <div class="table-content">
                            <div class="editor_Content">
                                <div class="editor_box">
                                    <?php echo html_decode($data["n_stext"]); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-flex">
                        <div class="table-title">
                            資料來源
                        </div>
                        <div class="table-content">
                            <div class="editor_Content">
                                <div class="editor_box">
                                    <?php echo html_decode($data["n_source"]); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-flex">
                        <div class="table-title">
                            研處建議
                        </div>
                        <div class="table-content">
                            <div class="editor_Content">
                                <div class="editor_box">
                                    <?php echo html_decode($data["n_suggest"]); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="downladbtn">
                    <div class="producer">
                        <?php echo $data["n_unit"] . " " . $data["n_name"]; ?>
                    </div>
                    <a href="javascript:window.print();">
                        下載PDF <i></i>
                    </a>
                </div>
                <div class="btn-wrap">
                    <div class="prev">
                        <!-- 若無上一則刪除a保留prev -->
                        <?php if ($prev_id != "") { ?>
                            <a href="detail.php?id=<?php echo $prev_id; ?>"><i></i>上一則</a>
                        <?php } ?>
                    </div>
                    <div class="backbtn">
                        <a href="javascript:history.back();"><i></i>返回</a>
                    </div>
                    <div class="next">
                        <?php if ($next_id != "") { ?>
                            <a href="detail.php?id=<?php echo $next_id; ?>">下一則<i></i></a>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <?php
    include "quote/template/top_btn.php";
    ?>
    <script src="dist/js/main.js"></script>
</body>

</html>