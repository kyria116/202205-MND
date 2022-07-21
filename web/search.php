<?php
include 'dominator/system/ready.mak';
include 'quote/include_data.php';

$type = !isset($type) ? 1 : $type;
$kw = !isset($kw) ? '' : $kw;

// 關鍵字
$kw_arr = explode(" ", $kw);

//項目
$type_name = $search_type_arr[$type][0];

$data_arr = array();
$where_text = "";
foreach ($kw_arr as $k => $v) {
    $where_text = ($k > 0) ? $where_text . " OR" : $where_text;
    if ($type == 1) {
        $where_text = $where_text . " n_date LIKE '%$v%' OR n_title LIKE '%$v%' OR n_stext LIKE '%$v%' OR n_unit LIKE '%$v%' OR n_name LIKE '%$v%' OR n_area LIKE '%$v%'";
    } else {
        $where_text = $where_text . " $type_name LIKE '%$v%'";
    }
}

$query = "SELECT n_id,n_title,DATE_FORMAT(n_date, '%Y.%m.%d') AS n_date,n_stext,n_unit,n_name,n_area,nc_title,nc_id 
                FROM `news` JOIN `n_class` USING(nc_id)
                WHERE $where_text
                ORDER BY n_date DESC,n_id DESC";
$data = sql_data($query, $link, 2, "n_id");


mysqli_close($link);
$title_var = "搜尋  | " . $title_var;


include "quote/template/head.php";
?>
<link rel="stylesheet" href="dist/css/search.css">
</head>

<body class="lang_tw">
    <main>
        <div class="container" style="text-align:center;">
            <img src="dist/images/logo.jpg" class="logo_new" alt="行政規則">
        </div>
        <section class="search-section">
            <div class="container">
                <div class="search-box">
                    <select id="category" onchange="$('#typename').val($(this).val());">
                        <?php
                        foreach ($search_type_arr as $k => $v) {
                            $selected = ($k == $type) ? 'selected' : '';
                            echo '<option value="' . $k . '"' . $selected . '>' . $v[1] . '</option>';
                        }
                        ?>
                    </select>
                    <form id="searchForm">
                        <input type="text" name="kw" id="keywords" value="<?php echo $kw; ?>">
                        <input type="hidden" name="type" id="typename" value="<?php echo $type; ?>">
                        <a class="btn" href="#" onclick="document.getElementById('searchForm').submit()"></a>
                    </form>
                </div>
            </div>
        </section>
        <section class="lists-section">
            <div class="container">
                <ul class="list-title">
                    <li class="l1">發布日期</li>
                    <li class="l2">類別</li>
                    <li class="l3">標題</li>
                    <li class="l4">公告單位</li>
                    <li class="l5">公告人員</li>
                    <li class="l6">地區</li>
                    <li class="l7"></li>
                </ul>
                <?php if (empty($data)) {
                    echo '<div>查無相符合資料</div>';
                } else {
                    foreach ($data as $k => $v) { ?>
                        <a class="list-wrap" href="detail.php?id=<?php echo $k; ?>">
                            <ul class="list-content">
                                <li class="l1"><?php echo $v["n_date"]; ?></li>
                                <li class="l2">
                                    <div class="tag"><?php echo $v["nc_title"]; ?></div>
                                </li>
                                <li class="l3"><?php echo $v["n_title"]; ?></li>
                                <li class="l4"><?php echo $v["n_unit"]; ?></li>
                                <li class="l5"><?php echo $v["n_name"]; ?></li>
                                <li class="l6"><?php echo $v["n_area"]; ?></li>
                                <li class="l7"></li>
                                <li class="l8">
                                    <?php
                                    $v["n_stext"] = mb_substr(str_replace('&nbsp;', '', strip_tags(html_decode($v["n_stext"]))), 0, 145, "utf-8");
                                    echo $v["n_stext"] . "...";
                                    ?>
                                </li>
                            </ul>
                        </a>
                <?php }
                } ?>
            </div>
        </section>
    </main>
    <script src="dist/js/main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function(event) {
            setTimeout(function() {
                heighlightAll()
            }, 100)
        })

        //全部
        function heighlightAll() {
            heighlightDate()
            heighlightHeadline()
            heighlightDepartment()
            heighlightPerson()
            heighlightLocation()
            heighlightContent()
        }
        // 日期
        function heighlightDate() {
            let keywords = document.getElementById("keywords").value;
            let keyword = keywords.split(' ')
            let contents = document.querySelectorAll(".list-wrap .l1");
            Array.from(contents).forEach(content => {
                let text = content.innerText
                for (let i = 0; i < keyword.length; i++) {
                    const x = new RegExp(keyword[i], 'ig');
                    text = text.replace(x, `<mark style='background-color:#fff87f;'>${keyword[i]}</mark>`);
                    content.innerHTML = text
                }
            });
        }
        // 標題
        function heighlightHeadline() {
            let keywords = document.getElementById("keywords").value;
            let keyword = keywords.split(' ')
            let contents = document.querySelectorAll(".list-wrap .l3");
            Array.from(contents).forEach(content => {
                let text = content.innerText
                for (let i = 0; i < keyword.length; i++) {
                    const x = new RegExp(keyword[i], 'ig');
                    text = text.replace(x, `<mark style='background-color:#fff87f;'>${keyword[i]}</mark>`);
                    content.innerHTML = text
                }
            });
        }
        // 公告單位
        function heighlightDepartment() {
            let keywords = document.getElementById("keywords").value;
            let keyword = keywords.split(' ')
            let contents = document.querySelectorAll(".list-wrap .l4");
            Array.from(contents).forEach(content => {
                let text = content.innerText
                for (let i = 0; i < keyword.length; i++) {
                    const x = new RegExp(keyword[i], 'ig');
                    text = text.replace(x, `<mark style='background-color:#fff87f;'>${keyword[i]}</mark>`);
                    content.innerHTML = text
                }
            });
        }
        // 公告人員
        function heighlightPerson() {
            let keywords = document.getElementById("keywords").value;
            let keyword = keywords.split(' ')
            let contents = document.querySelectorAll(".list-wrap .l5");
            Array.from(contents).forEach(content => {
                let text = content.innerText
                for (let i = 0; i < keyword.length; i++) {
                    const x = new RegExp(keyword[i], 'ig');
                    text = text.replace(x, `<mark style='background-color:#fff87f;'>${keyword[i]}</mark>`);
                    content.innerHTML = text
                }
            });
        }
        // 地區
        function heighlightLocation() {
            let keywords = document.getElementById("keywords").value;
            let keyword = keywords.split(' ')
            let contents = document.querySelectorAll(".list-wrap .l6");
            Array.from(contents).forEach(content => {
                let text = content.innerText
                for (let i = 0; i < keyword.length; i++) {
                    const x = new RegExp(keyword[i], 'ig');
                    text = text.replace(x, `<mark style='background-color:#fff87f;'>${keyword[i]}</mark>`);
                    content.innerHTML = text
                }
            });
        }
        //內文
        function heighlightContent() {
            let keywords = document.getElementById("keywords").value;
            let keyword = keywords.split(' ')
            let contents = document.querySelectorAll(".list-wrap .l8");
            Array.from(contents).forEach(content => {
                let text = content.innerText
                for (let i = 0; i < keyword.length; i++) {
                    const x = new RegExp(keyword[i], 'ig');
                    text = text.replace(x, `<mark style='background-color:#fff87f;'>${keyword[i]}</mark>`);
                    content.innerHTML = text
                }
            });
        }
    </script>
</body>

</html>