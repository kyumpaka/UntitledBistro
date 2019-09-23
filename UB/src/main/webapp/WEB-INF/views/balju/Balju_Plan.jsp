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
<!-- 적용 안되는중 -->
<link rel="stylesheet"
	href="../src/main/webapp/resources/Admin/assets/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="../src/main/webapp/resources/Admin/assets/css/style.css">
<!-- 적용 안되는중 -->

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- 템플릿 link rel -->
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
<meta charset="UTF-8">
<title>발주 계획 작성</title>
</head>
<body>
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>발주계획등록</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="#"> 발주 </a></li>
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
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> 발주 정보 </h5><br> -->
			<div class="row">
				<div class="col-lg-3">
					<h6>발주자</h6>
					<section class="card">
						<div class="card-body text-secondary">아이디로 이름을 불러옴</div>
					</section>
				</div>
				<div class="col-lg-3">
					<h6>발주일</h6>
					<section class="card">
						<div class="card-body text-secondary">${balju_date}</div>
					</section>
				</div>
			</div>


			<div class="row">
				<!-- body -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							발주물품 정보<small><code> 이 부분은 잠시대기 </code></small>
						</div>
						<div id="jsGrid"></div>
						<script>
							var clients = [ {"ORDPL_ONUM" : "입력을 시작하세요."}, ];
							$("#jsGrid").jsGrid({
								width : "100%",
								height : "auto",
								inserting : true,
								editing : true,
								//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
								autoload : true,
								//그리드 헤더 클릭시 sorting이 되게함
								sorting : true,
								//json 배열을 데이터에 연결함.
								data : clients,
								//grid에 표현될 필드 요소
								fields : [ {
									name : "ORDPL_ONUM",
									type : "text",
									title : "품목코드",
									width : 200
								}, {
									name : "ORDPL_PRODUCT_CODE",
									type : "text",
									title : "품목명",
									width : 200
								}, {
									name : "ORDPL_QT",
									type : "text",
									title : "규격",
									width : 200
								}, {
									name : "ORDPL_WR",
									type : "text",
									title : "수량",
									width : 200
								}, {
									name : "ORDPL_STAT",
									type : "text",
									title : "공급가액",
									width : 200
								}, {
									name : "ORDPL_END",
									type : "text",
									title : "적요",
									width : 200
								}, {
									type : "control",
									deleteButton : true
								} ]
							}); // 그리드 끝
						</script>
						<div class="card-footer">
							<button id="grid_Data" class="btn btn-primary btn-lg pull-right">등록</button>
						</div>
						<script>
							//버튼 클릭시 grid에 있는 값 가져오기
							$("#grid_Data").click(function(){
								var items = $("#jsGrid").jsGrid("option", "data");
								console.log(items);
								});
						</script>
					</div>
				</div>
품목코드 품목수량 진행상태 완료여부
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
</body>
</html>