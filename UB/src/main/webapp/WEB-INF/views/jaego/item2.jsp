<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 달력을 위환 jquery버전 cdn -->
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>	<!-- 기능 !!!충돌--> 
	
	<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
	
	<!-- datePicker -->	
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>	<!-- 기능 -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>	<!-- 디자인 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">	<!-- 디자인 및 기능 -->

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
        <input type="text" id="regDate" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
    </div>
</div>

<!-- jsGrid 생성을 합니다.-->
<span id="dateResult"></span>
   	<div id="jsGrid"></div>
	<div id="page"><a href="javascript:page(1)">1</a></div>

	<script>
	var regDate;
	var product_name;
		$("#btn").click(function(){
			regDate = $("#regDate").val();
			product_name = $("#product_name").val();
			if(regDate.length > 0) $("#dateResult").text(regDate);
			
			dataLoad(1, regDate, product_name)
			
		});
		$(document).on("click","#cancle",function(){
			$("#regDate").val("");
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
			
			pageMaker(json);
		});
		
		
		$('.input-group.date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });
		
		function page(page) {
			dataLoad(page, regDate, product_name);
		}
		function dataLoad(page, regDate, product_name) {
			$.ajax({
				type : "get", 
				url : "/UntitledBistro/jaego/gridSelectAll",
				data : {"page" : page, "startDate" : regDate, "keyword" : product_name},
				success : function(json) {
					pageMaker(json);
					$("#jsGrid").jsGrid({data:json});
					$("#jsGrid").jsGrid("loadData");
				}
			})
		}
		
		function pageMaker(json) {
			console.log(json);
			var pageMaker = json[json.length-1];
			$("#page").html("");
			if(pageMaker.prevButton){
				$("#page").append("<a href='javascript:page(" + pageMaker.startButton -1 + ")'>pre</a>");
			}
			for(var i=pageMaker.startButton; i<=pageMaker.endButton; i++) {
				$("#page").append("<a href='javascript:page(" + i + ")'>" + i + "</a>");
			}
			
			if(pageMaker.nextButton){
				$("#page").append("<a href='javascript:page(" + pageMaker.endButton +1 + ")'>next</a>");
			}
		}
		
		$('.input-group.date').datepicker.dates['kr'] = {
			days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
			daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
			daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
			months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		};
	</script>
</body>
</html>