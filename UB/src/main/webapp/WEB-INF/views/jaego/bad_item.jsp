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
	<h1>grid 검색 테스트공간</h1>
	<h4>불량처리</h4>
	<button id="search">jsgrid 데이터 검색</button>

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
				filtering : true,
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
					width : 100
				}, {
					name : "item_product_code",
					type : "text",
					title: "품목코드",
					width : 100
				}, {
					name : "item_qty",
					type : "text",
					title: "재고수량",
					width : 200
				}],
			    
				controller : {
					loadData: function(filter) {
						if(filter.item_no != "" || filter.item_product_code != "" || filter.item_qty != "") {	
							if(filter.item_no == null) filter.item_no = null;
							if(filter.item_product_code == null) filter.item_product_code = null;
							if(filter.item_qty == 0) filter.item_qty = 0;
							$.ajax({
								url : "${path}/jaego/gridSelect",
								type : "post",
								dataType: "JSON",
								data : filter,
								success : function() {
									alert("검색성공");
								}
							}); 
							
						}
					}
			
			
				},
				
				confirmDeleting: true,
			    deleteConfirm: "Are you sure?",
				
				
			}); // 그리드 끝
		}); // ajax 끝
		
		//버튼 클릭시 grid에 데이터를 업데이트
		$("#search").click(function() {
			$("#jsGrid").jsGrid("search"); 
		});
		
	</script>
	
</body>
</html>