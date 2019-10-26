<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- 이 jsp 파일에서는 데이터입력 처리를 한다
	1. 첫째로 두개의 단으로 나누어서 입력 처리를 하며 
	  1단에서는 발주일자는 시스데이트로 처리하며 보여주기만 할뿐 직접적으로 입력값이 전달되지는 않는다
	  담당자 설정하는 부분이 있으며 이때는 아이디값을 바탕으로 해서 이름을 조회해서 넣어야한다
	  그다음 참조란이 있는데 이때는 2단의 테이블이 아니라 1단의 테이블에서 입력하며 현황조회에서도 1단에서 나오도록 한다
	 
	 [주요발주품목]에서는 다음의 데이터를 셀렉트해서 새창으로 띄워준다 [balju_save]
	 [소요에서는] bom항목을 띄워주며
	 [안전재고(혹은적정재고)]에서는 안전재고와 현재고를 출력하여 비교해준다. >>>>>>>>>>안전재고와 소요의 기능을 확인하자<<<<<<<<<<
	 
	 [저장]버튼은 데이터를 컨트롤러로 넘겨주며
	 [다시작성]은 인풋데이터를 클린 시켜준다
	 [계획현황]버튼은 balju_plan_result로 이동한다.
	 
	 
	 2. 2단에서는 발주항목을 작성하여야 하는데 이는 원하는 값만큼 늘어나야하므로 제이쿼리의 append를 이용하여 입력창을 늘려야 할것이다.
	 	또한 입력항목을 취합하여 json 타입으로 저장하여 컨트롤러로 보내야 하며(아마도.. 어떻게 해야되는지는 모름) 
	 	이를 리스트에 담아서 서비스단으로 보낸다.
	 	후에 매퍼에서 이를 forEach를 사용하여 다중 insert를 접목시켜줘야 할것같다.
	 	
	 	2단의 수량과 공급가액 하단에는 총수량 및 총 발주액을 표기해준다.
	 -->


<head>
<style>
.btn_space {
	margin-right: 5px;
}
</style>
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
<!-- 템플릿 link rel -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- ↑ 이것은 스윗얼럿 cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->

<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<meta charset="UTF-8">
<title>관심 품목 작성</title>
<script type="text/javascript">
	var openItemWin;

	function openItemList() {

		//부모창
		window.name = "BookMark_REG";
		//자식창셋팅
		openItemWin = window.open("${path}/balju/popup/Item_list", 'itemInfo',
				"width=500, height=600, toolbars=no");

	}
</script>
</head>
<body>
	<div class="content">
		<div class="animated fadeIn">
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> 발주 정보 </h5><br> -->
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<div class="row"></div>
							<div class="col-lg-8">
								<button type="button" class="btn btn-dark btn-sm"
									style="margin-right: 5px;" onclick="openItemList()">제품정보</button>
							</div>
						</div>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>품목코드</th>
									<th>품목명</th>
									<th>규격</th>
									<th>단가</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="code" readonly></td>
									<td><input type="text" id="name" readonly></td>
									<td><input type="text" id="stndr" readonly></td>
									<td><input type="text" id="price" readonly></td>
									<td><button class="btn btn-dark" id="addData">등록</button>
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
							관심물품 등록<small><code> 제품정보를 눌러 데이터를 입력하세요 </code></small>
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
								noDataContent: "데이터를 입력해주세요",
								deleteConfirm : function(item) {
									return item.BK_NAME + " 상품을 삭제하시겠습니까?";
								},

								fields : [ {
									name : "BK_CODE",
									type : "text",
									width : 150,
									title : "품목코드",
									readOnly : true
								}, {
									name : "BK_NAME",
									type : "text",
									width : 150,
									title : "품목명",
									readOnly : true
								}, {
									name : "BK_STNDR",
									type : "text",
									width : 150,
									title : "규격",
									readOnly : true
								}, {
									name : "BK_PR_EA",
									type : "text",
									width : 150,
									title : "공급가액",
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
								onclick="insertBK()">등록</button>
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
		alert("관심품목이 추가되었습니다")
		var flag = true;
		var insertItem = {};
		insertItem.BK_CODE = $("#code").val();
		insertItem.BK_NAME = $("#name").val();
		insertItem.BK_STNDR = $("#stndr").val();
		insertItem.BK_PR_EA = $("#price").val();
		insertItem.BK_QT = 0;
		insertItem.BK_WR = "${sessionScope.empregister_name}";

			if(insertItem.ORDER_QT<1||isNaN(insertItem.ORDER_QT)){
					alert("수량을 정확히 입력해주세요");
					flag = false;
					return false;
				}
			if(flag == false){
					return false;
				}
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