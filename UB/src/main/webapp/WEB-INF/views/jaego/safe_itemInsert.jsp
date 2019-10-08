<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

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
	.form-inline {
		display: grid;
	}
	.jsgrid-header-scrollbar {
		overflow: hidden;
	}
	
	.jsgrid-grid-body {
		overflow: hidden;
	}
	
	.input-group-addon {
		width: 39px;
		height: 34px;
	}
	
	.input-group {
		width: 25px;
	}
	
	.form-group {
		display: flex;
		padding-bottom: 5px;
		padding-top: 5px;
	}
	
	#searchBackground {
		margin: auto;
		width: 600px;
		margin-top: 15px;
		margin-bottom: 15px;
		padding: 10px;
		background-color: #f3f0f0;
	}
	
	#jsGridBackground {
		margin: auto;
		width: 600px;
	}
	
	#centher {
		width: 50px;
	}
	#search, #search2 {
		display: inline-flex;
	}
</style>
	
<title>JSP</title>
</head>
<body>
	<!-- 페이지 제목 -->
	<div class="page-header">
	    <h1>
	    	<a href="">안전재고 입력(SAFE_ITEM_INSERT)</a>
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
		<!-- 1줄(품목코드) 디자인 -->
		<div class="form-inline">
			
			<div id="search" class="form-group">
				<label for="product_code" class="col-2 col-form-label">품목코드</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">
						<i class="glyphicon glyphicon-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목코드 입력" id="product_code">
					<button id="applyBtn" class="btn btn-primary btn-sm">적용</button>
				</div>
			</div>

		</div> <!-- form-inline end -->
		
	</div> <!-- searchBackground end -->
  

	<!-- jsGrid 생성을 합니다.-->
	<div id="jsGridBackground">
		<div id="jsGrid"></div> <!-- 그리드를 이용한 테이블 -->
		<div id="jsGridPage"></div> <!-- 그리드를 이용한 페이징 -->
		<button id="insertBtn" class="btn btn-primary btn-sm">등록</button>
		<button id="listBtn" class="btn btn-primary btn-sm">목록</button>
		<button id="testBtn" class="btn btn-primary btn-sm">테스트</button>
	</div>
	
	
</body>

<!-- 메인화면 기능 -->
<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#jsGrid").jsGrid({
			// 그리드 크기설정
			width : "100%",
			height : "auto",
			inserting: true,
			editing : true,
			
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
            
         	// 비어있는 배열을 데이터에 연결.
			data : [], 
			
			// 그리드에 표현될 필드 요소
			fields : [ {
				name : "si_product_code",
				type : "text",
				title: "품목코드",
				width : 80
			}, {
				name : "si_qty",
				type : "text",
				title: "입고수량",
				width : 80
			}, {
				type: "control", editButton: true, modeSwitchButton: false   // show clear filter button
			}]
			
		}); // 그리드 끝
	}); // ready 끝
	
	// 적용 버튼 클릭했을 경우 DB에 적용하기
	$("#insertBtn").on("click",function() {
		$.ajax({
			url : "${path}/jaego/gridSafeItemInsert",
			type : "post",
			contentType : "application/json",
			// 배열객체를 json형태의 문자열로 변환하여 전달하기
			data : JSON.stringify($("#jsGrid").jsGrid("option","data"))
		})
		.done(function(result) {
			if(result == 0) {
				swal("등록 성공!", "안전재고 등록을 완료했습니다.", "success");
			} else {
				sweetAlert("등록 실패!", "이미 등록한 품목코드가 있습니다.", "error");
				return;
			}
			$("#jsGrid").jsGrid("clearInsert");
			$("#jsGrid").jsGrid({data : []});
			$("#jsGrid").jsGrid("loadData");
			
			// 실시간 위험재고 갯수 웹소켓을 통해서 전달하기
			$.ajax({
				url : "${path}/jaego/gridRiskItemCount",
				type : "get"
			})
			.done(function(count) {
				webSocket.send(count);
			});
		}); 
	});
	
	// 적용 버튼 클릭했을 경우 입력창 적용하기
	$("#applyBtn").on("click",function() {
		var product_code = $("#product_code").val();
		$($("#jsGrid .jsgrid-insert-row input")[0]).val(product_code);
	});
	
	// 목록 버튼 클릭했을 경우 이동하기
	$("#listBtn").on("click",function() {
		window.location.href = "${path}/jaego/safe_item";
	});

</script>


<!-- 모달 검색창 -->
<script type="text/javascript">
	var productData;
	
	$.ajax({
		url : "${path}/jaego/gridProductSelectAll",
		type : "get"
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
			
			//json 배열을 데이터에 연결
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
			
			// 특정 행을 클릭했을 경우
			rowClick: function(args) {
				var product_code = args.item.product_code;
				// 그리드 입력창 해당셀에 값 적용
				$($("#jsGrid .jsgrid-insert-row input")[0]).val(product_code);
				
				$("#product_code").val(product_code);
				$("#myModal").trigger("click"); // 강제 클릭
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
					if(filter.product_code !== "") filterData = valueTest(productData,"product_code",filter);
					if(filter.product_name !== "") filterData = valueTest(productData,"product_name",filter);
					return filterData;
				}
		
			} // controller end
			
		}); // jsGrid end
	}); // ajax end
	
	// 검색할 때 필터와 일치하는 데이터 제거하기
	function valueTest(arr,condition,filter) {
		return $.grep(arr, function(i) {
			if(condition == "product_code") return i.product_code.indexOf(filter.product_code) != -1;
			if(condition == "product_name") return i.product_name.indexOf(filter.product_name) != -1;
		});
	}
	
	// 검색창을 새로 열때마다 품목데이터 초기화
	$("#open").on("click",function() {
		$("#productJsGrid").jsGrid({data:productData, pageIndex: 1});
		$("#productJsGrid").jsGrid("loadData");
	});

</script>

</html>