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

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

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

#sejong {
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
	<div class="page-header">
	    <h1><a href="">위험재고 현황(RISK_ITEM)</a></h1>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
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
	

	<!-- 검색창 회색바탕화면 -->
	<div id="sejong"> 

		<div class="form-inline">
			
			<div id="search" class="form-group">
				<label for="product_code" class="col-2 col-form-label">품목코드</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">
						<i class="glyphicon glyphicon-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목코드 입력" id="product_code">
				</div>
			</div>
			
			<div id="search2" class="form-group">
				<label for="product_name" class="col-2 col-form-label">품목명</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open2" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">
						<i class="glyphicon glyphicon-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목명 입력" id="product_name">
				</div>
			</div>

		</div>
		
		<button type="button" id="searchBtn" class="btn btn-primary btn-sm">검색</button>
		<button type="button" id="cancle" class="btn btn-default btn-sm">취소</button>
		
	</div> <!-- sejong end -->
  
	<!-- jsGrid 생성을 합니다.-->
	<div id="jsGridBackground">
		<div id="jsGrid"></div> <!-- 그리드를 이용한 테이블 -->
		<div id="jsGridPage"></div> <!-- 그리드를 이용한 페이징 -->
	</div>
	
	
</body>

<!-- 메인화면 기능 및 그리드 생성 -->
<script type="text/javascript">
	
var originalData;

$(document).ready(function() {
	$.ajax({
		type : "get",
		url : "${path}/jaego/gridRiskItemSelectAll",
		success : function(json) {
			originalData = json;
			$("#jsGrid").jsGrid({
				width : "100%",
				height : "auto",
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				// 페이징 처리
				paging:true,
				pageSize : 10,
				pageButtonCount : 5,
				
				//json 배열을 데이터에 연결함.
				data : json, 
				//grid에 표현될 필드 요소
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
		} // success end		
	}); // ajax end
	
});

$("#searchBtn").click(function() {
	var product_code = $("#product_code").val();
	var product_name = $("#product_name").val();
	
	if(product_code !== "") changeData = valueTest(originalData,"item_product_code",product_code);
	if(product_name !== "") changeData = valueTest(originalData,"product_name",product_name);

	$("#jsGrid").jsGrid({data:changeData});
	$("#jsGrid").jsGrid("loadData");
});

</script>



<!-- 모달 검색창 및 그리드 생성 -->
<script type="text/javascript">
var productData = null;

$.ajax({
	url : "${path}/jaego/gridProductSelectAll",
	type : "get",
	success : function(json) {
		productData = json;
		$("#productJsGrid").jsGrid({
			width : "100%",
			height : "auto",
			//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
			autoload : true,
			//그리드 헤더 클릭시 sorting이 되게함
			sorting : true,
			filtering : true,
			// 페이징 처리
			paging:true,
			pageSize : 10,
			pageButtonCount : 5,
			
			pagerContainer: "#productPage",
            pagerFormat: "{first} {prev} {pages} {next} {last}",
            pagePrevText: "<",
            pageNextText: ">",
            pageFirstText: "<<",
            pageLastText: ">>",
			
			//json 배열을 데이터에 연결함.
			data : json, 
			//grid에 표현될 필드 요소
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
			
			rowClick: function(args) {
				$("#myModal").modal("hide");
				$(".modal-content").css("display","none");
				var product_code = args.item.product_code;
				var product_name = args.item.product_name;
				
				$("#product_code").val(product_code);
				$("#product_name").val(product_name);
				$("#myModal").trigger("click"); // 강제 클릭
			},
			
			controller : {
				loadData: function(filter) {
					
					// 아무값 입력없이 검색창에 엔터를 눌렸을 경우
					if(filter.product_code === "" && filter.product_name === "") {
						return productData;
					}
					
					var filterData;
					if(filter.product_code !== "") filterData = valueTest(productData,"product_code",filter.product_code);
					if(filter.product_name !== "") filterData = valueTest(productData,"product_name",filter.product_name);
					return filterData;
				}
		
			} // controller end
		}); // jsGrid end
	} // success end
}); // ajax end

// 검색할 때 필터와 일치하는 데이터 제거하기
function valueTest(arr,condition,value) {
	return $.grep(arr, function(i) {
		if(condition == "product_code") return i.product_code.indexOf(value) != -1;
		if(condition == "product_name") return i.product_name.indexOf(value) != -1;
	});
}

// 검색창을 새로 열때마다 품목데이터 초기화
$("#open").on("click",function() {
	$("#productJsGrid").jsGrid({data:productData});
	$("#productJsGrid").jsGrid("loadData");
	$("#myModal").modal("show");
	$(".modal-content").css("display","block");
});

</script>

</html>