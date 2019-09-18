<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
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
	
    <title>jsGrid - Basic Scenario</title>
</head>
<body>
    <h1>Basic Scenario2222</h1>
	<!-- jsGrid 생성을 합니다.-->
   	<div id="jsGrid"></div>
   	
	<script>
		//grid에 들어갈 초기 내용
		var clients = [ {
			"Name" : "Otto Clay",
			"Age" : 25,
			"Country" : 1,
			"Address" : "Ap #897-1459 Quam Avenue",
			"Married" : false
		}, {
			"Name" : "Connor Johnston",
			"Age" : 45,
			"Country" : 2,
			"Address" : "Ap #370-4647 Dis Av.",
			"Married" : true
		}, {
			"Name" : "Lacey Hess",
			"Age" : 29,
			"Country" : 3,
			"Address" : "Ap #365-8835 Integer St.",
			"Married" : false
		}, {
			"Name" : "Timothy Henson",
			"Age" : 56,
			"Country" : 1,
			"Address" : "911-5143 Luctus Ave",
			"Married" : true
		}, {
			"Name" : "Ramona Benton",
			"Age" : 32,
			"Country" : 3,
			"Address" : "Ap #614-689 Vehicula Street",
			"Married" : false
		} ];

		$("#jsGrid").jsGrid({
			width : "100%",
			height : "400px",

			//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
			autoload : true,
			//그리드 헤더 클릭시 sorting이 되게함
			sorting : true,
			//clients를 생성된 배열를 연결함.
			data : clients,

			fields : [ {
				name : "Name",
				type : "text",
				width : 150
			}, {
				name : "Age",
				type : "number",
				width : 50
			}, {
				name : "Address",
				type : "text",
				width : 200
			}, {
				name : "Married",
				type : "checkbox",
				title : "Is Married",
				sorting : false
			} ]
		//grid에 표현될 필드 요소
		});
	</script>

    
</body>
</html>
