<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- ?? jsp ?Œì¼?ì„œ?? ?°ì´?°ì…?? ì²˜ë¦¬ë¥? ?œë‹¤
	1. ì²«ì§¸ë¡? ?ê°œ?? ?¨ìœ¼ë¡? ?˜ëˆ„?´ì„œ ?…ë ¥ ì²˜ë¦¬ë¥? ?˜ë©° 
	  1?¨ì—?œëŠ” ë°œì£¼?¼ì?? ?œìŠ¤?°ì´?¸ë¡œ ì²˜ë¦¬?˜ë©° ë³´ì—¬ì£¼ê¸°ë§? ? ë¿ ì§ì ‘?ìœ¼ë¡? ?…ë ¥ê°’ì´ ?„ë‹¬?˜ì??? ?ŠëŠ”??
	  ?´ë‹¹?? ?¤ì •?˜ëŠ” ë¶€ë¶„ì´ ?ˆìœ¼ë©? ?´ë•Œ?? ?„ì´?”ê°’?? ë°”íƒ•?¼ë¡œ ?´ì„œ ?´ë¦„?? ì¡°íšŒ?´ì„œ ?£ì–´?¼í•œ??
	  ê·¸ë‹¤?? ì°¸ì¡°?€?? ?ˆëŠ”?? ?´ë•Œ?? 2?¨ì˜ ?Œì´ë¸”ì´ ?„ë‹ˆ?? 1?¨ì˜ ?Œì´ë¸”ì—?? ?…ë ¥?˜ë©° ?„í™©ì¡°íšŒ?ì„œ?? 1?¨ì—?? ?˜ì˜¤?„ë¡ ?œë‹¤
	 
	 [ì£¼ìš”ë°œì£¼?ˆëª©]?ì„œ?? ?¤ìŒ?? ?°ì´?°ë? ?€?‰íŠ¸?´ì„œ ?ˆì°½?¼ë¡œ ?„ì›Œì¤€?? [balju_save]
	 [?Œìš”?ì„œ?? bom??ª©?? ?„ì›Œì£¼ë©°
	 [?ˆì „?¬ê³ (?¹ì??ì •?¬ê³ )]?ì„œ?? ?ˆì „?¬ê³ ?€ ?„ì¬ê³ ë? ì¶œë ¥?˜ì—¬ ë¹„êµ?´ì???. >>>>>>>>>>?ˆì „?¬ê³ ?€ ?Œìš”?? ê¸°ëŠ¥?? ?•ì¸?˜ì<<<<<<<<<<
	 
	 [?€??ë²„íŠ¼?€ ?°ì´?°ë? ì»¨íŠ¸ë¡¤ëŸ¬ë¡? ?˜ê²¨ì£¼ë©°
	 [?¤ì‹œ?‘ì„±]?€ ?¸í’‹?°ì´?°ë? ?´ë¦° ?œì¼œì¤€??
	 [ê³„íš?„í™©]ë²„íŠ¼?€ balju_plan_resultë¡? ?´ë™?œë‹¤.
	 
	 
	 2. 2?¨ì—?œëŠ” ë°œì£¼??ª©?? ?‘ì„±?˜ì—¬?? ?˜ëŠ”?? ?´ëŠ” ?í•˜?? ê°’ë§Œ?? ?˜ì–´?˜ì•¼?˜ë?ë¡? ?œì´ì¿¼ë¦¬?? appendë¥? ?´ìš©?˜ì—¬ ?…ë ¥ì°½ì„ ?˜ë ¤?? ? ê²ƒ?´ë‹¤.
	 	?í•œ ?…ë ¥??ª©?? ì·¨í•©?˜ì—¬ json ?€?…ìœ¼ë¡? ?€?¥í•˜?? ì»¨íŠ¸ë¡¤ëŸ¬ë¡? ë³´ë‚´?? ?˜ë©°(?„ë§ˆ??.. ?´ë–»ê²? ?´ì•¼?˜ëŠ”ì§€?? ëª¨ë¦„) 
	 	?´ë? ë¦¬ìŠ¤?¸ì— ?´ì•„?? ?œë¹„?¤ë‹¨?¼ë¡œ ë³´ë‚¸??.
	 	?„ì— ë§¤í¼?ì„œ ?´ë? forEachë¥? ?¬ìš©?˜ì—¬ ?¤ì¤‘ insertë¥? ?‘ëª©?œì¼œì¤˜ì•¼ ? ê²ƒê°™ë‹¤.
	 	
	 	2?¨ì˜ ?˜ëŸ‰ê³? ê³µê¸‰ê°€?? ?˜ë‹¨?ëŠ” ì´ìˆ˜?? ë°? ì´? ë°œì£¼?¡ì„ ?œê¸°?´ì???.
	 -->


<head>
<style>
.btn_space {
	margin-right: 5px;
}
</style>
<!-- ?œí”Œë¦? link rel -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">


<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- ?œí”Œë¦? link rel -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- ?? ?´ê²ƒ?€ ?¤ìœ—?¼ëŸ¿ cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid ?¬ìš©?? ?„í•œ jqueryë¥? cdn ?°ê²°-->
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid ?¬ìš©?? ?„í•œ ?„ìš”?? ?”ì†Œ cdn ?°ê²°-->

<!-- jsgrid ?¬ìš©?? ?„í•œ ?„ìš”?? ?”ì†Œ cdn ?°ê²°-->
<meta charset="UTF-8">
<title>ë°œì£¼ ê³„íš ?‘ì„±</title>
<script type="text/javascript">
	var openItemWin;

	function openItemList() {

		//ë¶€ëª¨ì°½
		window.name = "BookMark_REG";
		//?ì‹ì°½ì…‹??
		openItemWin = window.open("${path}/balju/popup/Item_list", 'itemInfo',
				"width=500, height=600, toolbars=no");

	}
</script>
</head>
<body>
	<div class="content">
		<div class="animated fadeIn">
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> ë°œì£¼ ?•ë³´ </h5><br> -->
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<div class="row"></div>
							<div class="col-lg-8">
								<button type="button" class="btn btn-dark btn-sm"
									style="margin-right: 5px;" onclick="openItemList()">?œí’ˆ?•ë³´</button>
							</div>
						</div>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>?ˆëª©ì½”ë“œ</th>
									<th>?ˆëª©ëª?</th>
									<th>ê·œê²©</th>
									<th>?¨ê?</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="code" readonly></td>
									<td><input type="text" id="name" readonly></td>
									<td><input type="text" id="stndr" readonly></td>
									<td><input type="text" id="price" readonly></td>
									<td><button class="btn btn-dark" id="addData">?±ë¡</button>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- body -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							ê´€?¬ë¬¼?? ?±ë¡<small><code> ?œí’ˆ?•ë³´ë¥? ?ŒëŸ¬ ?°ì´?°ë? ?…ë ¥?˜ì„¸?? </code></small>
						</div>
						<div id="jsGrid"></div>
						<script>
							var Data = [];
							$("#jsGrid").jsGrid({
								width : "100%",
								height : "400px",
								autoload : true,
								filtering : true,
								sorting : true,
								editing : true,
								data : Data,
								deleteConfirm : function(item) {
									return item.BK_NAME + " ?í’ˆ?? ?? œ?˜ì‹œê² ìŠµ?ˆê¹Œ?";
								},

								fields : [ {
									name : "BK_CODE",
									type : "text",
									width : 150,
									title : "?ˆëª©ì½”ë“œ",
									readOnly : true
								}, {
									name : "BK_NAME",
									type : "text",
									width : 150,
									title : "?ˆëª©ëª?",
									readOnly : true
								}, {
									name : "BK_STNDR",
									type : "text",
									width : 150,
									title : "ê·œê²©",
									readOnly : true
								}, {
									name : "BK_PR_EA",
									type : "text",
									width : 150,
									title : "ê³µê¸‰ê°€??",
									readOnly : true
								},{
									name : "BK_QT",
									type : "text",
									width : 0,
									visible : false
								},{
									name : "BK_WR",
									type : "text",
									width : 0,
									visible : false
								},{
									type : 'control'
								} ]

							});
						</script>
						<div class="card-footer">
							<button class="btn btn-dark btn-sm pull-right"
								onclick="insertBK()">?±ë¡</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
</body>
<script>
	$("#addData").click(function() {
		alert("ê´€?¬í’ˆëª©ì´ ì¶”ê??˜ì—ˆ?µë‹ˆ??")
		var insertItem = {};
		insertItem.BK_CODE = $("#code").val();
		insertItem.BK_NAME = $("#name").val();
		insertItem.BK_STNDR = $("#stndr").val();
		insertItem.BK_PR_EA = $("#price").val();
		insertItem.BK_QT = 0;
		insertItem.BK_WR = "${sessionScope.empregister_name}";

		console.log(insertItem);
		$("#jsGrid").jsGrid("insertItem", insertItem);

		$("#code").val("");
		$("#name").val("");
		$("#stndr").val("");
		$("#qt").val("");
		$("#price").val("");
	});
</script>
<script>
	function insertBK() {
		var items = $("#jsGrid").jsGrid("option", "data");
		console.log(JSON.stringify(items));
		$.ajax({
			method : "post",
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(items),
			url : "${path}/insert_BookMark",
			success : function(result) {
				var jsonResult = JSON.parse(JSON.stringify(result));
				if (jsonResult.result == "success") {
					alert(jsonResult.resultMsg);
					window.close();
				} else if (jsonResult.result == "failure") {
					aleart(jsonResult.resultMsg);
					return false;
				}
				//success end
			}
		//ajax end
		});
	};
</script>
</html>