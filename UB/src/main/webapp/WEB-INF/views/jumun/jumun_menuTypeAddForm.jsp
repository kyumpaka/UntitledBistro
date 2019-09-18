<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>POS</title>
</head>
<body>
메뉴타입 등록
	<form>
		<input type="text" name="mt_Name">
		<button onclick="mt_Add()">전송</button>
	</form>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function mt_Add() {
		event.preventDefault();
		var name = $("input[name='mt_Name']").val();
		var info = {mt_Name:name};
		console.log(name);
		$.ajax({
			  url: 'menuTypeAdd.do',
			  type: 'post',
			  data: JSON.stringify(info),
			  dataType: 'json',
			  contentType: 'application/json',
			  success : function(result) {
				  alert(result + "개 등록");
				  opener.document.location.reload();
				  window.close();
			  }
		});
	};
</script>
</html>