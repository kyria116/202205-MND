<?php
include '../system/ready.mak';
$page_name = basename(__FILE__);
include '../quote/head.php';
?>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/font-awesome.css" />
<link rel="stylesheet" href="../css/jquery-ui.css" />
<link rel="stylesheet" href="../css/icheck/flat/blue.css" />
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" href="../css/unicorn.css" />
<!--[if lt IE 9]>
		<script type="text/javascript" src="../js/respond.min.js"></script>
		<![endif]-->

</head>

<body data-color="grey" class="flat">
	<div id="wrapper">
		<?php
		include '../quote/header.php';
		include '../quote/sidebar.php';
		$_SESSION["dom_url"] = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

		$title = "新聞分類管理";
		$db_name = "n_class";
		$id_name = "nc_id";
		$title_name = "nc_title";
		$order_name = "nc_order";


		$paging = false; //如果不使用php分頁，請改為：false
		$paging_where = "";

		//資訊
		$query = "SELECT * FROM [$db_name] $paging_where ORDER BY $order_name";
		if ($paging) $query .= $paging_limit; //分頁用limit
		$data = sql_data($query, $link);
		if ($data) $count = count($data); //排序使用
		$link = null;
		?>
		<div id="content">
			<div id="content-header" class="mini">
				<h1><?php echo $title; ?></h1>

			</div>
			<div id="breadcrumb">
				<a href="index.php" title="<?php echo $cms_lang[9][$language]; ?>" class="tip-bottom"><i class="fa fa-home"></i> <?php echo $cms_lang[10][$language]; ?></a>
				<a class="current"><?php echo $title; ?></a>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon">
								<i class="fa fa-th"></i>
							</span>
							<h5><?php echo $title; ?></h5>
							<div style="padding-top: 3px;">
								<a href="<?php echo $db_name; ?>_add.php" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> <?php echo $cms_lang[22][$language]; ?></a>
							</div>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th><?php echo $cms_lang[21][$language]; ?></th>
										<th><?php echo $cms_lang[42][$language]; ?></th>
										<th>分類標題</th>
									</tr>
								</thead>
								<tbody>
									<?php
									if (isset($data) && $data != "") {
										foreach ($data as $k => $v) {
									?>
											<tr>
												<td style="text-align: center; vertical-align: middle;" width="20%" id="td_img">
													<div class="btn-group">
														<button style="margin:2px 5px;" class="btn btn-xs btn-info" onclick="javascript:location.href='news.php?id=<?php echo (int) $v[$id_name]; ?>';">新聞資訊</button>
														<button data-toggle="dropdown" class="btn btn-xs btn-info dropdown-toggle"><span class="caret"></span></button>
														<ul class="dropdown-menu dropdown-yellow">
															<li><a href="<?php echo $db_name; ?>_update.php?id=<?php echo (int) $v[$id_name]; ?>"><?php echo $cms_lang[23][$language]; ?></a></li>
															<li class="divider"></li>
															<li><a href="#" onclick="del(<?php echo (int) $v[$id_name]; ?>);return false;"><?php echo $cms_lang[24][$language]; ?></a></li>
														</ul>
													</div>
												</td>
												<td style="text-align: center; vertical-align: middle; word-break:break-all;" width="20%">
													<?php include '../quote/order_select.php'; //排序功能
													?>
												</td>
												<td style="text-align: center; vertical-align: middle; word-break:break-all;" width="60%">
													<?php echo  filter_var($v[$title_name], FILTER_SANITIZE_SPECIAL_CHARS); ?>
												</td>
											</tr>
									<?php
										}
									}
									?>
								</tbody>
							</table>
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
	<script src="../js/bootbox.min.js"></script>
	<script src="../js/jquery.icheck.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/jquery.dataTables.min.js"></script>
	<script src="../js/jquery.nicescroll.min.js"></script>
	<script src="../js/unicorn.js"></script>
	<script src="../js/unicorn.tables.js"></script>
	<script src="../js/window_load.js"></script>
	<script type="text/javascript">
		<?php include '../quote/del_box.php'; //刪除功能
		?>
	</script>
	<?php include '../quote/order_send.php'; //排序from表
	?>
</body>

</html>