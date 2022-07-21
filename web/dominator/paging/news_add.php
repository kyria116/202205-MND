<?php
include '../system/ready.mak';


if (!isset($id) || !is_numeric($id)) {
	header("location:./");
	exit();
} else {
	$id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
	$id = (int)$id;

	$page_name = "n_class.php";
	$sql = "SELECT nc_title,nc_id FROM `n_class` WHERE nc_id = $id";
	$sql = filter_var($sql, FILTER_SANITIZE_SPECIAL_CHARS);
	$result = mysqli_query($link, $sql);
	if (mysqli_num_rows($result) == 1) {
		$row = mysqli_fetch_array($result);
	}
	$parents_id = $row[1];
}
include '../quote/head.php';
?>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/font-awesome.css" />
<link rel="stylesheet" href="../css/colorpicker.css" />
<link rel="stylesheet" href="../css/datepicker.css" />
<link rel="stylesheet" href="../css/icheck/flat/blue.css" />
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" href="../css/jquery-ui.css" />
<link rel="stylesheet" href="../css/unicorn.css" />
<link rel="stylesheet" href="../css/file.css" />
<link rel="stylesheet" href="../css/cropper.min.css">
<!--[if lt IE 9]>
		<script type="text/javascript" src="../js/respond.min.js"></script>
		<![endif]-->
</head>

<body data-color="grey" class="flat">
	<div id="wrapper">
		<?php
		include '../quote/header.php';
		include '../quote/sidebar.php';

		$title = html_decode("分類《" . $row[0] . "》消息資訊管理");
		$db_name = "news";
		$id_name = "n_id";
		$title_name = "n_title";
		$keyword_name = "n_keyword";
		$area_name = "n_area";
		$date_name = "n_date";
		$stext_name = "n_stext";
		$source_name = "n_source";
		$suggest_name = "n_suggest";
		$unit_name = "n_unit";
		$name_name = "n_name";
		$order_name = "n_order";
		$m_id_name = "nc_id";


		mysqli_close($link);
		$title_current = html_decode("分類《" . $row[0] . "》新聞資訊");

		// 1、型態：input、date、textarea、img、file、select
		// 2、ALL：標題
		// 3、ALL：欄位名
		// 4、input、date、textarea：描述，可不填	 / 	img、file：共用id，請編流水號 	/ 	select：下拉式選單資料陣列
		// 5、img：寬度 	/ 	textarea：HTML編輯器開關，0 or 1 	/ 	select：陣列如為二維，請加第二維key值	 / 	input：限數字值為1
		// 6、img：高度 	/ 	textarea：無HTML編輯器時，為textarea行數

		$group_array = array(
			array("input", "主題", $title_name, "", "", ""),
			array("input", "關鍵字", $keyword_name, "", "", ""),
			//array("select","新聞分類",$m_id_name,$classify_ary,"nc_title",""),
			array("input", "地區別", $area_name, "", "", ""),
			array("date", "日期", $date_name, "", "", ""),
			array("textarea", "摘要", $stext_name, "", "1", ""),
			array("textarea", "來源", $source_name, "", "1", ""),
			array("textarea", "研處建議", $suggest_name, "", "1", ""),
			array("input", "公告單位", $unit_name, "", "", ""),
			array("input", "公告人員", $name_name, "", "", ""),
		);
		$group_array = g_array($group_array, $data);
		?>
		<div id="content">
			<div id="content-header" class="mini">
				<h1><?php echo $cms_lang[22][$language]; ?> <?php echo $title_current; ?></h1>

			</div>
			<div id="breadcrumb">
				<a href="index.php" title="<?php echo $cms_lang[9][$language]; ?>" class="tip-bottom"><i class="fa fa-home"></i> <?php echo $cms_lang[10][$language]; ?></a>
				<a href="<?php echo $page_name; ?>">新聞分類管理</a>
				<a href="<?php echo $db_name; ?>.php?id=<?php echo $parents_id; ?>"><?php echo $title; ?></a>
				<a class="current"><?php echo $cms_lang[22][$language]; ?> <?php echo $title_current; ?></a>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="fa fa-align-justify"></i>
								</span>
								<h5><?php echo $cms_lang[22][$language]; ?> <?php echo $title_current; ?></h5>
							</div>
							<div class="widget-content nopadding">
								<form action="../control/doadd.php?db=<?php echo $db_name; ?>" method="post" class="form-horizontal" id="form_add" name="form_add" enctype="multipart/form-data">
									<input type="hidden" name="<?php echo $order_name; ?>" value="0" />
									<input type="hidden" name="<?php echo $m_id_name; ?>" value="<?php echo $id; ?>" />
									<?php foreach ($group_array as $v)	group($v[0], $v[1], $v[2], $v[3], $v[4], $v[5], $v[6]); ?>
									<div class="form-actions">
										<button type="button" class="btn btn-primary btn-sm" onclick="doadd();"><?php echo $cms_lang[22][$language]; ?></button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php include '../quote/footer.php'; ?>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-ui.custom.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/bootstrap-colorpicker.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/jquery.icheck.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/jquery.nicescroll.min.js"></script>
	<script src="../js/unicorn.js"></script>
	<script src="../js/unicorn.form_common.js"></script>
	<script src="ckeditor/ckeditor.js"></script>
	<script src="../js/window_load.js"></script>
	<script src="../js/cropper.min.js"></script>
	<script type="text/javascript">
		//加入備註
		$('.n_title input').after("<span style='color:red;font-weight:blod;'>*請務必確實填寫「主題」</span>");
		$('.n_unit input').after("<span style='color:red;font-weight:blod;'>*請務必確實填寫「公告單位」</span>");
		$('.n_name input').after("<span style='color:red;font-weight:blod;'>*請務必確實填寫「公告人員」</span>");
		//	     		新增
		function doadd() {
			$("#form_add").submit();
		};
	</script>
</body>

</html>