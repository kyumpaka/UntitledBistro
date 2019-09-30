<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- datePicker -->	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
	
	<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
		
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

/* .container {
	width: 165px;
	display: inline-block;
} */

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

.input-group date {
	margin-left: -4px;
}

#yearInput, #yearInput2 {
	width: 79px;
	margin-right: 5px;
}

#year, #year2 {
	width: 79px;
	margin-right: 5px;
}

#month, #month2 {
	width: 75px;
	margin-right: 5px;
}

#day, #day2 {
	width: 42px;
}

#sejong {
	margin: auto;
	width: 600px;
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
    <h1><a href="">출고현황(OUT_ITEM)</a></h1>
</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
<div id="sejong">

		<!-- //////////////////////////////////////////////////////////////////////// -->
		<div class="form-inline">
			<div class="form-group" id="yy-mm-dd">
				<!-- //////////////////////////////////////////////////////////////////////// -->
				<input type="text" id="yearInput" class="form-control"> 
				<select id="year" class="form-control"></select> 
				<select id="month" class="form-control">
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
			
				</select>
			<input type="text" id="day" class="form-control" maxlength="2">
		    <span class="input-group date">
		        <input type="hidden" id="date">
		        <span class="input-group-addon">
		        	<i class="glyphicon glyphicon-calendar"></i>
		        </span>
		    </span>
		</div>
	  
	<div id="search" class="form-group">
		  <label for="product_code" class="col-2 col-form-label">품목코드</label>
		  <div class="col-10">
		  	<input class="form-control" type="search" placeholder="검색할 품목코드 입력" id="product_code">
		  </div>
	</div>
	<div id="search2" class="form-group">
		  <label for="product_name" class="col-2 col-form-label">품목명</label>
		  <div class="col-10">
		  	<input class="form-control" type="search" placeholder="검색할 품목명 입력" id="product_name">
		  </div>
	</div>
		
	</div>
	<button type="button" id="searchBtn" class="btn btn-primary btn-sm">검색</button>
	<button type="button" id="cancle" class="btn btn-default btn-sm">취소</button>
	<!-- //////////////////////////////////////////////////////////////////////// -->
</div>
<!-- jsGrid 생성을 합니다.-->
<div id="jsGridBackground">
	<div id="dateResult"></div>
	<div id="jsGrid"></div>
</div>
	
</body>
	<script>
	var ogStartDate;
	var ogEndDate;
	$(document).ready(function() {
		var now = new Date();
		ogEndDate = dateFormat(now);

		$.ajax({
			type:"get",
			url:"${path}/jaego/gridOutItemSelectAll",
			data : {"endDate" : ogEndDate}
		})
		.done(function(json) {
			original = json;
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
					name : "oi_product_code",
					type : "text",
					title: "품목코드",
					width : 100
				}, {
					name : "product_name",
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
					title: "등록일자",
					width : 100
				}]
			}); // 그리드 끝
		}); // ajax 끝
	});

	function dataLoad(page, endDate, product_code, product_name) {
		
		$.ajax({
			type : "get", 
			url : "/UntitledBistro/jaego/gridOutItemSelectAll",
			data : {"pageNum" : page, "endDate" : endDate, "keyword" : product_code, "keyword2" : product_name},
			success : function(json) {
				$(".pagination").html(json[json.length-1]);
				console.log(json);
				$("#jsGrid").jsGrid({data:json});
				$("#jsGrid").jsGrid("loadData");
			}
		})
	}
	$("#searchBtn").click(function(){
		console.log("검색테스트...");
		if($("#yy-mm-dd").css("border") == "1px solid rgb(255, 0, 0)") {
		console.log("검색테스트2...");
			alert("올바른 검색조건으로 입력하세요.");
			return;
		}
		
		var endDate = $("#date").val();
		if(endDate == "") {
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
	$(document).on("click","#cancle",function(){
		$("#date").val("");
		$("#dateResult").text("");
		$("#product_code").text("");
		$("#product_name").text("");
	});
		
	</script>
	<script type="text/javascript" src="${path}/resources/js/jaego/datePicker.js"></script>
</html>