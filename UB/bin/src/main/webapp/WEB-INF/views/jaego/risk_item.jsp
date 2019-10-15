<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- datePicker -->
<!-- <script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> -->

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
		margin-top: 10px;
		margin-bottom: 5px;
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
	
	<!-- 페이지 제목 -->
	<div class="page-header">
	    <h1>
	    	<a href="">위험재고 현황(RISK_ITEM)</a>
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
		<div id="jsGrid"></div> <!-- 그리드를 이용한 테이블 -->
		<div id="jsGridPage"></div> <!-- 그리드를 이용한 페이징 -->
	</div>
	

<!-- 메인화면 기능 -->
<script type="text/javascript">
	
	var ogData;
	
	$(document).ready(function() {
		$.ajax({
			type : "get",
			url : "${path}/jaego/gridRiskItemSelectList"
		})
		.done(function(json) {
			ogData = json;
			
			$("#jsGrid").jsGrid({
				// 그리드 크기설정
				width : "100%",
				height : "auto",
				
				// 데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				
				// 그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				
				// 페이징 기본설정
				paging:true,
				pageSize : 10,
				pageButtonCount : 5,
				
				// 커스텀 페이징 설정
				pagerContainer: "#jsGridPage",
	            pagerFormat: "{first} {prev} {pages} {next} {last}",
	            pagePrevText: "<",
	            pageNextText: ">",
	            pageFirstText: "<<",
	            pageLastText: ">>",
	            
				// json 배열을 데이터에 연결
				data : json, 
				
				// 그리드에 표현될 필드 요소
				fields : [ {
					name : "product_code",
					type : "text",
					title: "품목코드",
					width : 80
				}, {
					name : "product_name",
					type : "text",
					title: "품목명",
					width : 80
				},{
					name : "item_qty",
					type : "text",
					title: "재고수량",
					width : 80
				},{
					name : "si_qty",
					type : "text",
					title: "안전수량",
					width : 80
				}]
				
			}); // 그리드 끝
		}); // ajax end
	}); // ready 끝
	
	// 검색 버튼 클릭했을 경우
	$("#searchBtn").click(function() {
		
		var product_code = $("#product_code").val();
		var product_name = $("#product_name").val();
		var filterData;
		
		// 검색할 값이 없는 경우
		if(product_code === "" && product_name === "") {
			filterData = ogData;
		}

		// 검색할 값이 있을 경우
		if(product_code !== "") filterData = valueTest(ogData,"product_code",product_code);
		if(product_name !== "") filterData = valueTest(ogData,"product_name",product_name);
		
		// 검색조건으로 그리드 다시 불러오기
		$("#jsGrid").jsGrid({data : filterData, pageIndex: 1});
		$("#jsGrid").jsGrid("loadData");
		
	});
	
	// 취소 버튼 클릭했을 경우 검색부분 값초기화
	$("#cancle").on("click",function(){
		$("#product_code").val("");
		$("#product_name").val("");
		
	}); // cancle.click 끝

</script>



<!-- 모달 검색창 -->
<script type="text/javascript">
	var productData;
	
	$.ajax({
		url : "${path}/jaego/gridProductSelectList",
		type : "get",
	})
	.done(function(json) {
		productData = json;
		$("#productJsGrid").jsGrid({
			width : "100%",
			height : "auto",
			// 데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
			autoload : true,
			
			// 그리드 헤더 클릭시 sorting이 되게함
			sorting : true,
			
			// 그리드 검색 입력창 표시
			filtering : true,
			
			// 페이징 기본설정
			paging:true,
			pageSize : 10,
			pageButtonCount : 5,
			
			// 커스텀 페이징 설정
			pagerContainer: "#productPage",
            pagerFormat: "{first} {prev} {pages} {next} {last}",
            pagePrevText: "<",
            pageNextText: ">",
            pageFirstText: "<<",
            pageLastText: ">>",
			
         	// json 배열을 데이터에 연결
			data : json, 
			
			// 그리드에 표현될 필드 요소
			fields : [ {
				name : "product_code",
				type : "text",
				title: "품목코드",
				width : 100
			}, {
				name : "product_name",
				type : "text",
				title : "품목명",
				width : 100
			}],
			
			// 특저 행을 클릭했을 경우
			rowClick: function(args) {
				var product_code = args.item.product_code;
				var product_name = args.item.product_name;
				
				$("#product_code").val(product_code);
				$("#product_name").val(product_name);
				$("#myModal").trigger("click"); // 강제 클릭 함수
			},
			
			// filtering 입력창에 엔터를 누를 경우
			controller : {
				loadData: function(filter) {
					// 검색할 값이 없는 경우
					if(filter.product_code === "" && filter.product_name === "") {
						return productData;
					}

					// 검색할 값이 있을 경우
					var filterData;
					if(product_code !== "") filterData = valueTest(productData,"product_code",filter.product_code);
					if(product_name !== "") filterData = valueTest(productData,"product_name",filter.product_name);
					return filterData;
				}
		
			} // controller end
			
		}); // jsGrid end
	}); // ajax end
	
	// 검색할 때 필터와 일치하는 데이터 제거하기
	function valueTest(arr,condition,value) {
		return $.grep(arr, function(i) {
			if(condition == "product_code") return i.product_code.indexOf(value) != -1;
			if(condition == "product_name") return i.product_name.indexOf(value) != -1;
		});
	}
	
	// 검색창을 새로 열때마다 품목데이터 초기화
	$("#open, #open2").on("click",function() {
		$("#productJsGrid").jsGrid({data:productData, pageIndex: 1});
		$("#productJsGrid").jsGrid("loadData");
	});
	
</script>