<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>	<!-- 기능 !!!충돌--> 
	<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	
	<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
	
	<!-- datePicker -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>	<!-- 디자인 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">	<!-- 디자인 및 기능 -->
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>	<!-- 기능 -->	

	<style type="text/css">
		#jsGrid {margin: auto;}
		.jsgrid-header-scrollbar {overflow: hidden;}
		.jsgrid-grid-body {overflow: hidden;}
		.container {width: 165px; display: inline-block;}
	</style>

<title>JSP</title>
</head>
<body>
<h1>재고현황</h1>
<input type="button" id="btn" value="적용">
<input type="button" id="cancle" value="취소">
    <input type="text" id="product_name" placeholder="품목명">
<div class="container">
    <div class="input-group date">
        <input type="text" id="startDate" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
    </div>
</div>

<!-- jsGrid 생성을 합니다.-->
<span id="dateResult"></span>
   	<div id="jsGrid"></div>
	<script>
		$("#btn").click(function(){
			var startDate = $("#startDate").val();
			var product_name = $("#product_name").val();
			if(startDate.length > 0) $("#dateResult").text(startDate);
			
			$.ajax({
				type : "get", 
				url : "/UntitledBistro/jaego/gridSelectAll",
				data : {"startDate" : startDate, "keyword" : product_name},
				success : function(select) {
					$("#jsGrid").jsGrid({data:select});
					$("#jsGrid").jsGrid("loadData");
				}
			})
			
		});
		$("#cancle").click(function(){
			$("#startDate").val("");
			$("#endDate").val("");
			$("#dateResult").text("");
		});
	
		$.ajax({
			type : "get",
			url : "/UntitledBistro/jaego/gridSelectAll"
		})
		.done(function(json) {
			$("#jsGrid").jsGrid({
				width : "70%",
				height : "auto",
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				//json 배열을 데이터에 연결함.
				data : json, 
				//grid에 표현될 필드 요소
				fields : [ {
					name : "item_product_code",
					type : "text",
					title: "품목코드",
					width : 100
				}, {
					name : "product_name",
					type : "text",
					title : "품목명",
					width : 100
				}, {
					name : "item_qty",
					type : "text",
					title: "재고수량",
					width : 100,
				}]
			
			});
		});
		
		$('.input-group.date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });
	
		
			$.fn.datepicker.dates['kr'] = {
				days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
				daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
				daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
				months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			};
		
	
	</script>
</body>
</html>