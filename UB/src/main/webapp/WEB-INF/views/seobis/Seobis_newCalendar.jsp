<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 양식</title>
</head>
<body>
<h1>예약 양식</h1>
<form id="testForm" >
번호:<input type="text" name="reserve_num" /><br>
ID:<input type="text" name="reserve_member_id"  id="reserve_member_id"/><br>
이름: <input type="text" name="reserve_name" /><br>
전화: <input type="tel" name="reserve_phone1" /><br>
예약일: <input type="text" name="reserve_dateString"  value="${date}" readonly="readonly"/><br>
</form>
<input type="button" value="예약하기" onclick="gogo()"/>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function gogo() {
	var id = $("#reserve_member_id").val().trim();
	$.ajax({
		  url: '${path}/Seobis/resCheck',
		  type: 'post',
		  data: {reserve_member_id:id},
		  dataType: 'json',
		  success : function(result) {
			  if(result == 0) {
				  swal({
					  title: "회원이 아닙니다.",
					  icon: "warning",
					  button: "닫기",
					});
				  return;
			  }
		  }
	});
	
	var formData = $("#testForm").serialize();
	alert(formData);
	$.ajax({
		  url: '${path}/Seobis/resAdd',
		  type: 'post',
		  data: formData,
		  success : function(result) {
			  swal({
				  title: result + "개 등록되었습니다.",
				  icon: "success",
				  button: "닫기",
				}).then(() => {
					  opener.document.location.reload();
					  window.close();
				  });
		  }
	});
};
</script>
</html>