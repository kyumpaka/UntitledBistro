<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- datePicker -->
<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<style type="text/css">
	#jsGrid {
		margin: auto;
	}
	
	/* 디자인 수정부분 */
	.form-inline {
		display: grid;
		margin-bottom: 8px;
	}
	
	/* jsGird 스크롤바 없애기 */
	.jsgrid-header-scrollbar {overflow: hidden;}
	.jsgrid-grid-body {overflow: hidden;}
	
	.form-group {
		display: flex;
		padding-bottom: 5px;
		padding-top: 5px;
	}
	.input-group date {
		margin-left: -4px;
	}
	
	/* 디자인 수정부분 */
	#yearInput {
		width: 79px;
		margin-right: 5px;
	}
	#year {
		width: 84px;
		margin-right: 5px;
	}
	#month {
		width: 80px;
		margin-right: 5px;
	}
	#day {
		width: 43px;
	}
	
	#searchBackground {
		margin: auto;
		width: 600px;
		margin-top: 15px;
		margin-bottom: 15px;
		padding: 10px;
		background-color: #f3f0f0;
	}
	#dateResult {
		text-align: right;
		font-weight: bold;
		padding-right: 1px;
	}
	#jsGridBackground {
		margin: auto;
		width: 600px;
	}
	
	#search, #search2 {
		display: inline-flex;
	}
	
	/* 디자인 수정부분 */
	label {
		font-weight: bold;
		margin-left: 10px;
	}
</style>

<title>JSP</title>
</head>
<body>
	<!-- 페이지 제목 -->
	<div class="page-header">
	    <h1>
	    	<a href="">출고현황(OUT_ITEM)</a>
	    </h1>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">검색창</h4>
				</div> 
				
				<div class="modal-body">
					<div id="productJsGrid"></div>
					<div id="productPage"></div>
				</div> 
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div> 
				
			</div> <!-- Modal content end -->
		</div> <!-- modal-dialog end -->
	</div> <!-- Modal end -->
	

	<!-- 검색 회색바탕화면 -->
	<div id="searchBackground"> 
		<!-- 3줄(날짜,품목코드,품목명) 디자인 -->
		<div class="form-inline">
			<!-- 날짜 -->
			<div class="form-group" id="yy-mm-dd">
				<input type="text" id="yearInput" class="form-control"> <!-- 년도 직접입력 -->
				<select id="year" class="form-control"></select> <!-- 년도 -->
				<select id="month" class="form-control"> <!-- 월 -->
					<option value="01">1월
					<option value="02">2월
					<option value="03">3월
					<option value="04">4월
					<option value="05">5월
					<option value="06">6월
					<option value="07">7월
					<option value="08">8월
					<option value="09">9월
					<option value="10">10월
					<option value="11">11월
					<option value="12">12월
				</select> <input type="text" id="day" class="form-control" maxlength="2"> <!-- 일 -->
				<!-- 달력(datePicker) -->
				<div class="input-group date">
					<input type="hidden" class="form-control" id="date"> 
					<span class="input-group-addon"> 
						<i class="fa fa-calendar"></i>
					</span>
				</div>
			</div> <!-- 날짜 end -->
			
			<div id="search" class="form-group">
				<label for="product_code" class="text-dark">품목코드</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open" type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목코드 입력" id="product_code">
				</div>
			</div>
			
			<div id="search2" class="form-group">
				<label for="product_name" class="text-dark">품목명</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open2" type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목명 입력" id="product_name">
				</div>
			</div>

		</div> <!-- form-inline end -->
		
		<button type="button" id="searchBtn" class="btn btn-primary btn-sm">검색</button>
		<button type="button" id="cancle" class="btn btn-success btn-sm">취소</button>
		
	</div> <!-- searchBackground end -->
  

	<!-- jsGrid 생성을 합니다.-->
	<div id="jsGridBackground">
		<div id="dateResult"></div> <!-- 년월일 결과(작은글씨) -->
		<div id="jsGrid"></div> <!-- 그리드를 이용한 테이블 -->
		<div id="jsGridPage"></div> <!-- 그리드를 이용한 페이징 -->
	</div>
	

<!-- 달력 유효성 및 기능 -->
<script type="text/javascript" src="${path}/resources/js/jaego/datePicker.js"></script>

<!-- 모달 검색창 -->
<script type="text/javascript" src="${path}/resources/js/jaego/searchModal.js"></script>

<!-- 메인화면 기능 -->
<script type="text/javascript" src="${path}/resources/js/jaego/gridItemAjax.js"></script>

<script type="text/javascript">
	var fieldsData = [ {
		name : "oi_product_code",
		type : "text",
		title: "품목코드",
		width : 100
	}, {
		name : "oi_product_name",
		type : "text",
		title: "품목명",
		width : 100
	}, {
		name : "oi_qty",
		type : "text",
		title: "출고수량",
		width : 100
	}, {
		name : "oi_date",
		type : "text",
		title: "출고날짜",
		width : 100
	}];
		
	$(document).ready(function() {
		gridProductAjax("${path}");
		gridItemAjax("${path}/jaego/gridOutItemSelectList", fieldsData);
	}); 
	
</script>