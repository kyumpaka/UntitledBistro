<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- ë°œì£¼?œì˜ ê¸°ëŠ¥?€ ê¸°ë³¸?ìœ¼ë¡? ë°œì£¼ê³„íš?‘ì„±ê³? ?¡ì‚¬?˜ë‹¤ ?¤ë§Œ ?µì‹¬?ìœ¼ë¡?

	ë°œì£¼?? ì¡°íšŒ?? ë°œì£¼?? ?„í™©ê³¼ì˜ ?°ê³„?€
	1. ë°œì£¼ê³„íš?? ?…ë ¥?? ?„ë£Œ?? ?°ì´?°ë? ë¶ˆëŸ¬?€?? ?ìš©?œí‚¬?? ?ˆì–´?? ?œë‹¤. 
	   ?? ê²½ìš°?ëŠ” [?ˆì°½?¼ë¡œ ë°œì£¼ê³„íš?œë? ì¡°íšŒ?˜ì—¬ ì²´í¬ë°•ìŠ¤ ? íƒ?? ?µí•´?? [?ìš©]ë²„íŠ¼?¼ë¡œ ?ìš©?œë‹¤.
	2. ë°œì£¼?? ?„í‘œë¥? ì¶œë ¥?˜ëŠ” ?Œì´ë¸”ì´ ?„ìš”?˜ê³  ?´ë? ?¸ì‡„? ìˆ˜ ?ˆëŠ” ê¸°ëŠ¥?? ì§€?í•´?¼í•œ??
	3. ì¶”ê??ìœ¼ë¡? pdf excel email faxë¡? ? ìˆ˜ ?ˆëŠ”ì§€ ?¬ë?ë¥? ì²´í¬?œë‹¤.
	
	ë°œì£¼?œì—?œì˜ ?ë‹¨ë²„íŠ¼?€ ë°œì£¼ê³„íš?‘ì„±ê³? ?™ì¼?˜ì—¬
	[ì£¼ìš”ë°œì£¼?ˆëª©] (balju_save)
	 [?Œìš”?ì„œ?? 
	 [?ˆì „?¬ê³ (?¹ì??ì •?¬ê³ )] ?„ì²´ ?¬ê³ ?‰ê³¼ ?ˆì „?¬ê³ ?‰ì„ ê³„ì‚°, ë°œì£¼?‰ì„ ì¡°ì ˆ? ìˆ˜ ?ˆëŠ” ë°©ì‹?? ê³ ë ¤?´ì•¼?œë‹¤.
	 
	?˜ë‹¨ë©”ë‰´?? [?€?? [?€?? ë°? ?„í‘œ ì¶œë ¥] [?¤ì‹œ?‘ì„±] [ë°œì£¼?„í™©]?? ?ìš©?œë‹¤ -->
<head>
	<style>
		.btn_space{
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid ?¬ìš©?? ?„í•œ jqueryë¥? cdn ?°ê²°-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid ?¬ìš©?? ?„í•œ ?„ìš”?? ?”ì†Œ cdn ?°ê²°-->

<!-- jsgrid ?¬ìš©?? ?„í•œ ?„ìš”?? ?”ì†Œ cdn ?°ê²°-->
<meta charset="UTF-8">
<title>ë°œì£¼?? ?‘ì„±</title>
<script type="text/javascript">

	var openItemWin;

	function openItemList(){

		//ë¶€ëª¨ì°½
		window.name = "Balju";
		//?ì‹ì°½ì…‹??
		openItemWin = window.open("${path}/balju/popup/Item_list",'itemInfo',"width=500, height=600, toolbars=no");
		
		}
	// openItemList end
	
	var openResultWin;
	
	function openItemResult(){

		//ë¶€ëª¨ì°½
		window.name = "Balju";
		//?ì‹ì°½ì…‹??
		openResultWin = window.open("${path}/balju/popup/Item_Result",'itemInfo',"width=700, height=600, toolbars=no");
		}
	//openItemResult end
	
	var openBookMarkWin;

	function openBkList(){

		//ë¶€ëª¨ì°½
		window.name = "Balju";
		//?ì‹ì°½ì…‹??
		openBookMarkWin = window.open("${path}/balju/popup/BookMark_list", 'BookMark', "width=700, height=600, toolbars=no");
		}
	//openBookMark end
	
	function openBkInsert(){

		//ë¶€ëª¨ì°½
		window.name = "Balju";
		//?ì‹ì°½ì…‹??
		openBookMarkWin = window.open("${path}/balju/popup/BookMark_REG", 'BookMark', "width=900, height=600, toolbars=no");
		}

	var openBpWin;
	
	function openBaljuPlan(){

		//ë¶€ëª¨ì°½
		window.name = "Balju";
		//?ì‹ì°½ì…‹??
		openBpWin = window.open("${path}/balju/popup/BPlan_Load", 'Balju_Plan', "width=900, height=600, toolbars=no");
		}
</script>
</head>
<body>
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>ë°œì£¼?œë“±ë¡?</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="#"> ë°œì£¼ </a></li>
								<!-- <li class="active">Basic</li> -->
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header -->
	<div class="content">
		<div class="animated fadeIn">
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> ë°œì£¼ ?•ë³´ </h5><br> -->
			<div class="row">
				<div class="col-lg-3">
					<h6>ë°œì£¼??</h6>
					<section class="card">
						<div class="card-body text-secondary">${sessionScope.empregister_name}</div>
					</section>
				</div>
				<div class="col-lg-3">
					<h6>ë°œì£¼??</h6>
					<section class="card">
						<div class="card-body text-secondary">${balju_date}</div>
					</section>
				</div>
			</div>
				
					
				
			<div class="row">
				<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<div class="row"></div>
						<div class="col-lg-8">
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openItemList()">?œí’ˆ?•ë³´</button>
							<!-- <button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;">?Œìš”</button> -->
								<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openBaljuPlan()">ë°œì£¼ê³„íš ë¶ˆëŸ¬?¤ê¸°</button>
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:50px;"onclick="openItemResult()">?¬ê³ ?„í™©</button>
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openBkList()">ê´€?¬í’ˆëª?</button>
								<button type="button" class="btn btn-dark btn-sm" 
								 onclick="openBkInsert()">ê´€?¬í’ˆëª©ë“±ë¡?</button>
						</div>
					</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>?ˆëª©ì½”ë“œ</th>
							<th>?ˆëª©ëª?</th>
							<th>ê·œê²©</th>
							<th>?˜ëŸ‰</th>
							<th>?¨ê?</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" id="code" readonly></td>
							<td><input type="text" id="name" readonly></td>
							<td><input type="text" id="stndr" readonly></td>
							<td><input type="text" id="qt" placeholder="?˜ëŸ‰ ?…ë ¥"></td>
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
							ë°œì£¼ë¬¼í’ˆ ?•ë³´<small><code> ê´€?¬í’ˆëª©ì„ ë¨¼ì? ?±ë¡?˜ì„¸?? </code></small>
						</div>
						<div id="jsGrid"></div>
						<script>
							var Data = [];
							$("#jsGrid").jsGrid({
								width:"100%",
								height : "400px",
								autoload: true,
								filtering: true,
								sorting : true,
								editing : true,
								data : Data,
								 deleteConfirm: function(item){
												return item.ORDER_PRODUCT_NAME +" ?í’ˆ?? ?? œ?˜ì‹œê² ìŠµ?ˆê¹Œ?";},

								fields : [
									{name:"ORDER_PRODUCT_CODE", type:"text", width:150, title:"?ˆëª©ì½”ë“œ", readOnly:true},
									{name:"ORDER_PRODUCT_NAME", type:"text", width:150, title:"?ˆëª©ëª?", readOnly:true},
									{name:"ORDER_PRODUCT_STNDR", type:"text", width:150, title:"ê·œê²©", readOnly:true},
									{name:"ORDER_QT", type:"text", width:150, title:"?˜ëŸ‰"},
									{name:"ORDER_PR_EA", type:"text", width:150, title:"?¨ê?", readOnly:true},
									{name:"ORDER_WR", type:"text", width:150, title:"?‘ì„±??", readOnly:true},
									{ type : 'control'}
									]
								
								});
						</script>
						<div class="card-footer">
							<button class="btn btn-primary btn-lg pull-right" onclick="insert()">?±ë¡</button>
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
		$("#addData").click(function(){
		alert("ë°œì£¼?ˆì´ ì¶”ê??˜ì—ˆ?µë‹ˆ??")
		var insertItem={};
		insertItem.ORDER_PRODUCT_CODE = $("#code").val();
		insertItem.ORDER_PRODUCT_NAME = $("#name").val();
		insertItem.ORDER_PRODUCT_STNDR = $("#stndr").val();
		insertItem.ORDER_QT = $("#qt").val();
		insertItem.ORDER_PR_EA = $("#price").val();
		insertItem.ORDER_WR = "${sessionScope.empregister_name}";
								
		console.log(insertItem);
		$("#jsGrid").jsGrid("insertItem", insertItem);
		});
</script>
<script>
		function insert(){
		var items = $("#jsGrid").jsGrid("option", "data");
		var flag = true;
		$.each(items,function(idx,row){
			if(items[idx].ORDER_QT<1||isNaN(items[idx].ORDER_QT)){
				alert("?˜ëŸ‰?? ?•í™•?? ?…ë ¥?´ì£¼?¸ìš”");
				flag = false;
				return false;
			}
		})
	if(flag == false){
		return false;
	}else{	
		console.log(JSON.stringify(items));
			$.ajax({
				method: "post",
				dataType:"json",
				contentType: "application/json",
				data: JSON.stringify(items),
				url: "${path}/balju_Input",
				success:function(result){
						var jsonResult = JSON.parse(JSON.stringify(result));
						if(jsonResult.result == "success"){
								alert(jsonResult.resultMsg);
								//sweetalert?? ?ì´?ìŠ¤ ?ë‚˜ê³ ë¡œ ?´ë™?œì¼œë³´ì
							/* sweetAlert?€ ?¼ë°˜ alertê³¼ëŠ” ?¤ë¥´ê²? location.href?? ?„ì†?¼ë¡œ ?ì–´?? ?°ê³„? ìˆ˜ ?†ê³  ë°”ë¡œ ?¤í–‰?œí‚´ 
							swal({
								  title: jsonResult.resultMsg,
								  text: "?•ì¸?? ?ŒëŸ¬ì£¼ì„¸??",
								  icon: jsonResult.result,
								  button: "?•ì¸",
								});  */
							location.href="${path}/balju/Balju"
							//window.location.reload(true);
							
						} else if (jsonResult.result == "failure"){
								aleart(jsonResult.resultMsg);
								return false;
							}
					//success end
					}
				//ajax end
				});
			}
		};	
</script>
<script>
	function getReturnValue(items){
		console.log(items);
//		var insertItem={};
		$.each(items, function(idx){
				console.log(items);
				$("#jsGrid").jsGrid("insertItem", items[idx]);
			});
		};

</script>
<script>
	function getReturnValue2(ORDPL_ORDLIN_NUM){
		console.log("ë°œì£¼ê³„íšë¶ˆëŸ¬?¤ê¸° ì°½ì—?? ê°€?¸ì˜¨ ë°œì£¼ê³„íšëª©ë¡ë²ˆí˜¸ : " + ORDPL_ORDLIN_NUM);
		var SearchParam = new Array();
		SearchParam.push(ORDPL_ORDLIN_NUM);
		console.log(SearchParam);
		$.ajax({
			method: "post",
			dataType: "json",
			contentType: "application/json",
			data: JSON.stringify(SearchParam),
			url: "${path}/balju/popup/BPlan_Search",
			success : function(list){
				$("#jsGrid").jsGrid({data : list});
				$("#jsGrid").jsGrid("loadData");
				
			//success end
			}
		//ajax end
		})
	//function end
	}
</script>
<script>
	/* $(document).ready(function(){
		$.ajax({
			url: "${path}/balju_Plan_Check",
			type: "post",
			success:function(result){
				console.log("ë¦¬ì ˆ?¸ê°’ : " +result);
				console.log("ë¦¬ì ˆ?¸ë©”?¸ì?ê°? : " + resultMsg);
				var jsonResult = (JSON.parse(JSON.stringify(result)));
					alert("ëª©ë¡ë²ˆí˜¸ ?•ë¦¬?„ë£Œ");
				},
			error:function(){
					alert("?•ìƒ?ìœ¼ë¡? ì²˜ë¦¬?˜ì? ?Šì•˜?µë‹ˆ??");
				}
			});
		//.ready ì¢…ë£Œ
		}); */
</script>
</html>