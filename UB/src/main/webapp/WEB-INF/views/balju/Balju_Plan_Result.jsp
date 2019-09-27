<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- result에서는  1항목씩 전체적인 부분을 그리드를 통해서 inner join insert하며
		그리드의 update 기능을 이용하여 item을 ajax update 처리 한다 
		update와 delete 기능을 ajax로 처리할수 있도록 한다.
		
	발주계획현황은 전체, 진행중, 완료 3개의 탭으로 구분하며 보여주며
	수량조정은 그리드상에서 적용하며 [신규]는 blaju_plan.jsp로 이동한다
	[종결]이나 [선택삭제]또한 체크박스를 통해서 일괄적으로 처리할수 있도록 버튼을 지원한다
	
	>>> 발주진행(혹은 발주서버튼) <<< 을 통해서 체크한 값을 발주로 balju table에 insert 해줄수 있어야한다. -->

<head>
<meta charset="UTF-8">
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
	<!-- <button id="delete">jsgrid 데이터 업데이트</button>
	<button id="cancel">취소</button> -->
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>발주계획조회</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="#"> 전체 </a></li>
								<li class="active"><a href="#"> 진행중 </a></li>
								<li><a href="#"> 완료 </a></li>
								<!-- <li class="active">Basic</li> -->
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header -->
	<!-- jsGrid 생성을 합니다.-->
	<div class="content">
		<div class="animated fadeIn">
		<div class="row">
				<!-- body -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							발주물품 정보<small><code> 이 부분은 잠시대기 </code></small>
						</div>
			<div id="jsGrid"></div>
			<script>
				var update_item = {};
				//수정할 데이터의 값을 임시적으로 갖고 있을 jsonobj

				//데이트 피커 부분

				$.ajax({
					type : "get",
					url : "${path}/balju_Plan_Result",
				}).done(function(json) {
					$("#jsGrid").jsGrid({
						width : "100%",
						height : "auto",
						editing : true,
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
						deleteConfirm: function(item){
								return item.ORDPL_ONUM + "를 삭제하시겠습니까?"
							},
						//grid에 표현될 필드 요소
						fields : [  
							{
							name : "ORDPL_ORDLIN_NUM",
							type : "text",
							title : "발주계획번호",
							align: "center",
							readOnly : true,
							width : 120
						}, {
							name : "TO_CHAR(ORPLIN_DATE,'YYYY-MM-DD')",
							type : "text",
							title : "날짜",
							width : 100
						}, {
							name : "ORDPL_ONUM",
							type : "text",
							title : "발주물품번호",
							align: "center",
							width : 120
						}, {
							name : "ORDPL_PRODUCT_CODE",
							type : "text",
							title : "제품번호",
							align: "center",
							width : 150
						}, {
							name : "ORDPL_QT",
							type : "text",
							title : "수량",
							align: "center",
							width : 120
						}, {
							name : "ORDPL_WR",
							type : "text",
							title : "작성자",
							align: "center",
							width : 100
						}, {
							name : "ORDPL_STAT",
							type : "text",
							title : "발주상태",
							align: "center",
							width : 100
						}, {
							name : "ORDPL_END",
							type : "text",
							title : "완료여부",
							align: "center",
							width : 100
						}, {
							type : "control",
							deleteButton : true
						} ]
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
			<div class="card-footer">
							<button id="grid_Data" class="btn btn-primary btn-lg pull-right">등록</button>
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
</html>