<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
    <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->

<meta charset="UTF-8">
<title>발주 계획 작성</title>
</head>
<body>
	<form action="${path}/balju_Plan_Input" method="post">
	<label>품목코드 : </label>
		<input id="ORDPL_PRODUCT_CODE" name="ORDPL_PRODUCT_CODE" type="text" >
	<br>

	<label>품목수량 : </label>
		<input type="text" id="ORDPL_QT" name="ORDPL_QT">
	<br>

	<label>작성자 : </label>
		<input type="text" id="ORDPL_WR" name="ORDPL_WR">
	<br>

	<label>진행상태 : </label>
		<input type="text" id="ORDPL_STAT" name="ORDPL_STAT">
	<br>
	
	<label>완료여부 : </label>
		<input type="text" id="ORDPL_END" name="ORDPL_END">
	<br>

	<input type="submit" value="전송">
	</form>


	<%-- <form action="${path}/balju_Plan_Input" method="post">
		품목코드 : <input type="text" id="ORDPL_PRODUCT_CODE" name="ORDPL_PRODUCT_CODE">
		품목수량 : <input type="text" id="ORDPL_QT" name="ORDPL_QT">
		작성자 : <input type="text" id="ORDPL_WR" name="ORDPL_WR">
		진행상태 : <input type="text" id="ORDPL_STAT" name="ORDPL_STAT">
		완료여부 : <input type="text" id="ORDPL_END" name="ORDPL_END">
	<input type="submit" value="전송">
	</form> --%>
</body>
</html>