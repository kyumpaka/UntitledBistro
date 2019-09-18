<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>POS</title>
</head>
<body>
	메뉴타입 수정 및 삭제<br>
	<c:forEach items="${ menuTypeList }" var="menuTypeList" >
	<div id="div${ menuTypeList.mt_Code }">
		<div id="preinput${ menuTypeList.mt_Code }">${ menuTypeList.mt_Name }</div>
		
		<button onclick="mt_Del('${ menuTypeList.mt_Name }', '${ menuTypeList.mt_Code }')">삭제</button>
		
		<div id="mt_Modistart${ menuTypeList.mt_Code }">
		<button onclick="mt_Modistart('${ menuTypeList.mt_Code }', '${ menuTypeList.mt_Name }')">수정</button>
		</div>
	</div>
	</c:forEach>
	<button onclick="mt_menuSetting()">완료</button><br>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript" ></script>
<script type="text/javascript">
	// 삭제 확인 및 처리
	function mt_Del(name, code) {
		if (confirm(name + ' 삭제하시겠습니까?')) {
			$.ajax({
				  url: 'menuTypeRemove.do',
				  type: 'get',
				  data: { mt_Code:code },
				  dataType: 'json',
				  success : function(result) {
					  alert(result + '개 삭제');
					  $("#div"+code).remove();
				  }
			});
		}
	}
	
	function mt_Modistart(code, name) {
		$("#modistart"+code).html('<button onclick="mt_Modiend(\''+ code +'\')">완료</button>');
		$("#preinput"+code).html("<input type='text' value="+ name +" id='input"+ code +"'>");
	};

	function mt_Modiend(code) {
		var name = $("#input"+code).val();
		var info = {mt_Code:code, mt_Name:name};
		
		$.ajax({
			  url: 'menuTypeModi.do',
			  type: 'post',
			  data: JSON.stringify(info),
			  dataType: 'json',
			  contentType: 'application/json',
			  success : function(result) {
				  alert(result + '개 수정');
				  $("#preinput"+code).html(name);
				  $("#modistart"+code).html('<button onclick="mt_Modistart(\'' + code + '\', \'' + name + '\')">수정</button>');
			  }
		});
	};

	function mt_menuSetting(){
		  opener.document.location.reload();
		  window.close();
	}
</script>
</html>