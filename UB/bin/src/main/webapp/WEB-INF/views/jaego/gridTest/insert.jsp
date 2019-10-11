<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
	<h1>grid 추가 테스트공간</h1>
	<h4>입고내역</h4>

<!-- jsGrid 생성을 합니다.-->
   	<div id="jsGrid"></div>
	<script>
		$.ajax({
			type:"get",
			url:"${path}/jaego/gridSelectAll",
		})
		.done(function(json) {
			$("#jsGrid").jsGrid({
				width : "70%",
				height : "auto",
				inserting: true,
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
				}, {
					type : "control", 
					editButton: false,                               // show edit button
                    deleteButton: false,                             // show delete button
                    clearFilterButton: true                        // show clear filter button
				}],
				
				onItemInserted: function(args) {
			       $.ajax({
			    	  url : "${path}/jaego/gridInsert",
			    	  type : "post",
			    	  data : args.item,
			    	  success : function() {
			    		  alert("추가 성공");
			    		  $("#jsGrid").jsGrid("clearInsert");
			    	  }
			       });
			    }
				
			
			});
		});
		
	</script>
	
</body>
</html>