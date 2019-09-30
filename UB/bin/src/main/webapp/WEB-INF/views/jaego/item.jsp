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
		#jsGrid {margin: auto;}
		.jsgrid-header-scrollbar {overflow: hidden;}
		.jsgrid-grid-body {overflow: hidden;}
		.container {width: 165px; display: inline-block;}
		.input-group-addon {
	    	width: 39px;
			height: 34px;
	    }
	    #yy-mm-dd {
	    	width: 81px;
	    	display: -webkit-box;
	    	margin-left: 0px;
	    }
	    #sejong {
			margin: auto;
			width: 600px;
			margin-bottom: 15px;
			padding: 10px;
			background-color: #f3f0f0;
		}
		#dateResult	{
			text-align: right;
			font-weight: bold;
			padding-right: 1px;
		}
		#jsGridBackground {
			margin: auto;
			width: 600px;
		}
	</style>

<title>JSP</title>
</head>
<body>
<h1>재고현황</h1>
<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
<div id="sejong">
	<div class="form-group row" id="yy-mm-dd">
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
	        <input type="hidden" id="date" >
	        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	    </span>
	</div>
	<div class="form-group row">
	  <label for="product_name" class="col-2 col-form-label">품목명</label>
	  <div class="col-10">
	    <input class="form-control" type="search" placeholder="검색할 품목명 입력" id="product_name">
	  </div>
	</div>
	<button type="button" id="searchBtn" class="btn btn-primary btn-sm">검색</button>
	<button type="button" id="cancle" class="btn btn-default btn-sm">취소</button>
</div>
<!-- ///////////////////////////////////////////////////////////////////////// -->

<!-- jsGrid 생성을 합니다.-->
<div id="jsGridBackground">
	<div id="dateResult"></div>
	<div id="jsGrid"></div>
</div>
   	
<!-- Paging 처리, Bootstrap -->
<nav aria-label="..." style="text-align: center;">
  <ul class="pagination">
    
  </ul>
</nav>
	<script>
	var regDate;
	var product_name;
		$("#searchBtn").click(function(){
			regDate = $("#date").val();
			product_name = $("#product_name").val();
			if(regDate.length > 0) $("#dateResult").text(regDate);
			
			dataLoad(1, regDate, product_name)
			
		});
		$(document).on("click","#cancle",function(){
			$("#date").val("");
			$("#dateResult").text("");
			$("#product_name").text("");
		});
	
		$.ajax({
			type : "get",
			url : "/UntitledBistro/jaego/gridSelectAll"
		})
		.done(function(json) {
			var realData = json.shift();
			$("#jsGrid").jsGrid({
				width : "auto",
				height : "auto",
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				//json 배열을 데이터에 연결함.
				data : [realData], 
				//grid에 표현될 필드 요소
				
				fields : [ {
					name : "item_product_code",
					type : "text",
					title: "품목코드",
					width : 200
				}, {
					name : "product_name",
					type : "text",
					title : "품목명",
					width : 200
				}, {
					name : "item_qty",
					type : "text",
					title: "재고수량",
					width : 200,
				}]
			
			});
			$(".pagination").html(json[json.length-1]);
		});
		
		function dataLoad(page, regDate, product_name) {
			$.ajax({
				type : "get", 
				url : "/UntitledBistro/jaego/gridSelectAll",
				data : {"pageNum" : page, "endDate" : regDate, "keyword" : product_name},
				success : function(json) {
					$(".pagination").html(json[json.length-1]);
					$("#jsGrid").jsGrid({data:json});
					$("#jsGrid").jsGrid("loadData");
				}
			})
		}
		
	</script>
	
</body>
<script type="text/javascript" src="${path}/resources/js/jaego/datePicker.js"></script>
</html>