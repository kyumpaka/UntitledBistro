<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>예약 양식</title>
</head>
<%-- <body>
<h1>예약 양식</h1>
<form id="testForm" >
번호:<input type="text" name="reserve_num" /><br>
ID:<input type="text" name="reserve_member_id"  id="reserve_member_id"/><br>
이름: <input type="text" name="reserve_name" /><br>
전화: <input type="tel" name="reserve_phone1" /><br>
예약일: <input type="text" name="reserve_dateString"  value="${date}" readonly="readonly"/><br>
</form>
<input type="button" value="예약하기" onclick="gogo()"/> --%>

<body>
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">예약 양식</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" id="testForm">
        <h5 class="form-signin-heading">예약 정보를 입력하세요</h5>
        <label for="input" class="sr-only">번호</label>
        	<input type="text"  name="reserve_num" class="form-control" placeholder="번호" required autofocus><br>
         <label for="input" class="sr-only">회원 아이디</label>
        	<input type="text" id="reserve_member_id" name="reserve_member_id" class="form-control" placeholder="회원 아이디" required autofocus><BR>
        <label for="input" class="sr-only">이름</label>
        	<input type="text"  name="reserve_name" class="form-control" placeholder="이름" required autofocus><br>
         <label for="input" class="sr-only">전화</label>
        	<input type="tel" name="reserve_phone1" class="form-control" placeholder="전화" required autofocus><br>
         <label for="input" class="sr-only">예약일</label>
        	<input type="text" name="reserve_dateString" class="form-control" value="${date}" readonly="readonly"><br>
         <label for="input" class="sr-only">시작 시간</label>
        	<input type="time" name="reserve_start" class="form-control" ><br>
         <label for="input" class="sr-only">마감 시간</label>
        	<input type="time" name="reserve_end" class="form-control" ><br>
      </form>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" value="예약하기"  onclick="gogo()">예 약</button>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" value="취소" onclick="sc()">닫기</button>
		</div>
	</div>

	<div class="modal">
	</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function sc(){
    self.close();
}

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