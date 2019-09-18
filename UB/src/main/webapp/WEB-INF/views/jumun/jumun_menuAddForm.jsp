<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>POS</title>
</head>
<body>
	메뉴추가
	<form action="menuAdd.do" method="post" enctype="multipart/form-data"
		id="multiform">
		menu_Mt_Code : <select name="menu_Mt_Code">
			<c:forEach items="${ menuTypeList }" var="menuTypeList">
				<option value="${ menuTypeList.mt_Code }">${ menuTypeList.mt_Name }</option>
			</c:forEach>
		</select><br> menu_Name : <input type="text" name="menu_Name"><br>
		menu_Price : <input type="number" name="menu_Price"><br>
		menu_Image : <input type="file" name="file"><br>
		menu_State : <select name="menu_State">
			<option value="판매">판매</option>
			<option value="미판매">미판매</option>
		</select>
		<br><br>
		<div id="add"></div>
		<button onclick="ingAdd()">재료 추가</button>
		<br>
		<input type="button" value="전송" id="uploadbutton">
	</form>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript" ></script>
<script type="text/javascript">
		var cnt = 0;
		function ingAdd() {
		  event.preventDefault();
		  
		  var frmTag = "<div id='add'>ingredient_Product_Code : 	<input type='text' name='jumun_IngredientDTO["+cnt+"].ingredient_Product_Code'><br>";
		  frmTag += "ingredient_Qty : 	<input type='number' name='jumun_IngredientDTO["+cnt+"].ingredient_Qty'><br><br></div>";
		  cnt++;
		  $("#add").append(frmTag);
		}

		$("#uploadbutton").click(function() {
			for(var i = 0; i < cnt; i++){
				var code = $("input[name='jumun_IngredientDTO["+i+"].ingredient_Product_Code']").val();
				var qty = $("input[name='jumun_IngredientDTO["+i+"].ingredient_Qty']").val();
				if(code == "" || code == null) {
					alert('재료명을 입력해주세요.');
					$("input[name='jumun_IngredientDTO["+i+"].ingredient_Product_Code']").focus();
					return;
				}
				if(qty == "" || qty == 0) {
					alert('수량을 입력해주세요.');
					$("jumun_IngredientDTO["+i+"].ingredient_Qty").focus();
					return;
				}
			}
			
			var form = $('#multiform')[0];
			var formData = new FormData(form);
			$.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "menuAdd.do",
	            data: formData,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function (result) {
		            alert(result + "개 등록");
	            	opener.document.location.reload();
	  			  	window.close();
	            },
	        });
		});
</script>
</html>