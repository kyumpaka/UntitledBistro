<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Modal -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
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
	    <h1><a href="">불량처리 입력(DEFECT_ITEM)</a></h1>
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

		</div>
		
		<button type="button" id="searchBtn" class="btn btn-primary btn-sm">검색</button>
		<button type="button" id="cancle" class="btn btn-default btn-sm">취소</button>
		
	</div> <!-- sejong end -->
  

	<!-- jsGrid 생성을 합니다.-->
	<div id="jsGridBackground">
		<div id="jsGrid"></div> <!-- 그리드를 이용한 테이블 -->
		<div id="jsGridPage"></div> <!-- 그리드를 이용한 페이징 -->
	<button id="insertBtn" class="btn btn-primary btn-sm">적용</button>
	</div>
	
	
</body>

<!-- 메인화면 기능 및 그리드 생성 -->
<script type="text/javascript">
	
var ogEndDate;

$(document).ready(function() {
	
	$("#jsGrid").jsGrid({
		width : "100%",
		height : "auto",
		inserting: true,
		editing : true,
		//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
		autoload : true,
		//그리드 헤더 클릭시 sorting이 되게함
		sorting : true,
		// 페이징 처리
		paging:true,
		pageSize : 10,
		pageButtonCount : 5,
		
		//json 배열을 데이터에 연결함.
		data : [], 
		//grid에 표현될 필드 요소
		fields : [ {
			name : "di_product_code",
			type : "text",
			title: "품목코드",
			width : 80
		}, {
			name : "di_qty",
			type : "text",
			title: "입고수량",
			width : 80
		}, {
			name : "di_state",
			type : "text",
			title: "불량상태",
			width : 100
		}, {
			name : "di_reason",
			type : "text",
			title: "불량이유",
			width : 150
		}, {
			type : "control", 
			editButton: false,                               // show edit button
            deleteButton: false,                             // show delete button
            clearFilterButton: true                        // show clear filter button
		}]
		
	}); // 그리드 끝
});
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$("#insertBtn").on("click",function() {
		
		$.ajax({
			url : "${path}/jaego/gridDefectItemInsert",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify($("#jsGrid").jsGrid("option","data")),
			success : function() {
				alert("추가 성공");
				$("#jsGrid").jsGrid("clearInsert");
			}
		}); 
	});
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function dataLoad(page, endDate, product_code, product_name) {

		$.ajax({
			type : "get",
			url : "/UntitledBistro/jaego/gridDefectItemSelectAll",
			data : {
				"pageNum" : page,
				"endDate" : endDate,
				"keyword" : product_code,
				"keyword2" : product_name
			},
			success : function(json) {
				$(".pagination").html(json[json.length - 1]);
				console.log(json);
				$("#jsGrid").jsGrid({
					data : json
				});
				$("#jsGrid").jsGrid("loadData");
			}
		})
	}
	$("#searchBtn").click(function() {
		if ($("#yy-mm-dd").css("border") == "1px solid rgb(255, 0, 0)") {
			alert("올바른 검색조건으로 입력하세요.");
			return;
		}

		var endDate = $("#date").val();
		if (endDate == "") {
			endDate = ogEndDate
		}

		var product_code = $("#product_code").val();
		var product_name = $("#product_name").val();
		console.log("aaaaaaaaaaaaaaaaaaa");
		console.log(product_code);
		console.log(product_name);
		console.log("bbbbbbbbbbbbbbbbbbb");
		$("#dateResult").text(endDate);
		dataLoad(1, endDate, product_code, product_name);

	});
	$(document).on("click", "#cancle", function() {
		$("#date").val("");
		$("#dateResult").text("");
		$("#product_code").text("");
		$("#product_name").text("");
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
				$('#myModal').modal('hide')
				var product_code = args.item.product_code;
				console.log("rowClick()");
				$($("#jsGrid .jsgrid-insert-row input")[0]).val(product_code);
				
				console.log("product_code : " + product_code);
				$("#product_code").val(product_code);
				//$("#myModal").trigger("click"); // 강제 클릭
			},
			
			controller : {
				loadData: function(filter) {
					// 아무값 입력없이 검색창에 엔터를 눌렸을 경우
					if(filter.product_code === "" && filter.product_name === "") {
						return productData;
					}
					
					var filterData = original;
					if(filter.product_code !== "") filterData = valueTest(productData,"product_code",filter);
					if(filter.product_name !== "") filterData = valueTest(productData,"product_name",filter);
					return filterData;
				}
		
			} // controller end
		}); // jsGrid end
	} // success end
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
	$('#myModal').modal('show');
	$("#productJsGrid").jsGrid({data:productData});
	$("#productJsGrid").jsGrid("loadData");
});

</script>

</html>