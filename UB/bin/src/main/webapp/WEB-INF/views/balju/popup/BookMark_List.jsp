<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 템플릿 link rel -->
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

<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<title>JSP</title>
</head>
<body>
	<div class="content">
		<div class="animated fadeIn">
		<div class="row">
				<!-- body -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							관심물품<small><code> 수정은 할수 없습니다 </code></small>
						</div>
			<div id="jsGrid"></div>
	<script>
	$.ajax({
		type : "get",
		url : "${path}/balju/popup/BookMark_Result",
		}).done(function(json) { console.log(json);
			$("#jsGrid").jsGrid({
				width : "100%",
				height : "auto",
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				// 페이징 처리
				paging : true,
				pageSize : 10,
				pageButtonCount : 5,
				//json 배열을 데이터에 연결함.
				data : json,
				//수정하고싶은 데이터를 추출해서 처리함
				deleteConfirm: function(item){
						return item.ORDER_PRODUCT_NAME + "를 삭제하시겠습니까?"
					},
				onItemDeleted: function(args){
					console.log(args.item);
					console.log(args.item.ORDER_PRODUCT_CODE);

					var DeleteParam = new Array();
					DeleteParam.push(args.item.ORDER_PRODUCT_CODE);

					console.log(DeleteParam);

					$.ajax({
						method: "post",
						dataType:"json",
						contentType: "application/json",
						data: JSON.stringify(DeleteParam),
						url: "${path}/BookMark_delete",
						success:function(result){
								var jsonResult = JSON.parse(JSON.stringify(result));
								if(jsonResult.result == "success"){
										alert(jsonResult.resultMsg);
									//location.href="${path}/balju/Balju_Plan"
									//window.location.reload(true);
									
								} else if (jsonResult.result == "failure"){
										aleart(jsonResult.resultMsg);
										return false;
									}
							//success end
							}
						//ajax end
						});
					},
				//grid에 표현될 필드 요소
				fields : [ 
					{name : "ROWNUM",type : "text",title : "번호", align: "center",
						 readOnly : true, width : 150}, 
					{name : "ORDER_PRODUCT_CODE",type : "text",title : "품목코드", align: "center",
					 readOnly : true, width : 150}, 
					{name : "ORDER_PRODUCT_NAME", type : "text", title : "품목명", align: "center", width : 120, readOnly : true},
					{name : "ORDER_PRODUCT_STNDR", type : "text", title : "규격", align: "center", readOnly : true, width : 120}, 
					{name : "ORDER_PR_EA", type : "text", title : "공급가액", align: "center", readOnly : true, width : 100},
					{name : "ORDER_QT", type : "text", visible : false, width : 0},
					{name : "ORDER_WR", type : "text", visible : false, width : 0},
					 ]

					}); // 그리드 끝
				}); // ajax 끝

				//버튼 클릭시 grid에 데이터를 업데이트
				/* $("#delete").click(function() {
					$("#jsGrid").jsGrid("deleteItem", item);
				});
				
				$("#cancel").click(function() {
					$("#jsGrid").jsGrid("cancelEdit");
				}); */
			</script>
			<!-- 꾸미기용 card-footer -->
			<div class="card-footer">
							<button class="btn btn-dark btn-sm pull-right" id="dataInput">발주등록</button>
						</div>
			<!-- 꾸미기용 card-footer -->			
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
<script>
	$("#dataInput").click(function(){
		var items = $("#jsGrid").jsGrid("option", "data");
			console.log(items);
			window.opener.getReturnValue(items);
			window.close();
		})
</script>
</body>
</html>