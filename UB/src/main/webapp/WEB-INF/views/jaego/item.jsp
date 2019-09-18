<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
	<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<title>JSP</title>
</head>
<body>
	<label>item_no : </label>
	<input id="item_no" type="text" placeholder="item_no"
		style="font-size: 14px;" tabindex="1">
	<br>

	<label>item_product_code : </label>
	<input id="item_product_code" type="text" placeholder="item_product_code" style="font-size: 14px;"
		tabindex="2">
	<br>

	<label>item_qty : </label>
	<input id="item_qty" type="text" placeholder="item_qty"
		style="font-size: 14px;" tabindex="3">
	<br>

	<button id="add">jsgrid 데이터 추가</button>
	<!-- 데이터 추가를 위해서 input 4개를 생성합니다.-->


<!-- jsGrid 생성을 합니다.-->
   	<div id="jsGrid"></div>
	<script>
		$.ajax({
			type:"get",
			url:"/UntitledBistro/jaego/grid",
		})
		.done(function(json) {
			$("#jsGrid").jsGrid({
				width : "100%",
				height : "400px",
				editing: true,
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				// 페이징 처리
				paging:true,
				pageSize : 5,
				pageButtonCount : 5,
				//json 배열을 데이터에 연결함.
				data : json, 
				//grid에 표현될 필드 요소
				fields : [ {
					name : "item_no",
					type : "text",
					title: "재고코드",
					width : 150
				}, {
					name : "item_product_code",
					type : "text",
					title: "품목코드",
					width : 50
				}, {
					name : "item_qty",
					type : "text",
					title: "재고수량",
					width : 200
				}, ]
			
			});
		});
		
	</script>
	
	<script>
		//버튼 클릭시 grid에 데이터를 추가
		$("#add").click(function() {
			//데이터를 추가를 위해서 json object 생성
			var insert_item = {};
			
			//grid에 넣을 데이터를 object의 만들기
			insert_item.item_no = $("#item_no").val();
			insert_item.item_product_code = $("#item_product_code").val();
			insert_item.item_qty = $("#item_qty").val();
			
			$.ajax({
				url:"/UntitledBistro/jaego/gridInsert",
				type:"post",
				/* data : {"item_no":$("#item_no").val(),
					   "item_product_code":$("#item_product_code").val(),
					   "item_qty":$("#item_qty").val(),
				}, */
				data : insert_item, 
				success:function(data){
					alert("grid 데이터 추가");
					//jsGrid에 insert_item object 추가
					$("#jsGrid").jsGrid("insertItem", insert_item);
				}
				
			});
			
		});
	</script>
</body>
</html>