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
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
	<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->

<title>JSP</title>
</head>
<body>

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
				
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				//clients를 생성된 배열를 연결함.
				data : json, 
				fields : [ {
					name : "item_no",
					type : "text",
					title: "재고코드",
					width : 150
				}, {
					name : "item_product_code",
					type : "number",
					title: "품목코드",
					width : 50
				}, {
					name : "item_qty",
					type : "text",
					title: "재고수량",
					width : 200
				}, ]
			//grid에 표현될 필드 요소
			});
		});
		
	</script>
</body>
</html>