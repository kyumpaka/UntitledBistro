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
<title>휴가 양식</title>
</head>
<body>
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">휴가 양식</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" id="testForm">
         <h5 class="form-signin-heading">사번</h5>
         <label for="input" class="sr-only">사번</label>
        	<input type="text" id="salary_empRegister_empnum" name="salary_empRegister_empnum" class="form-control" placeholder="회원 아이디" required autofocus><BR>
         <h5 class="form-signin-heading">휴가 시작일</h5>
         <label for="input" class="sr-only">시작일</label>
        	<input type="date" name="salary_hollydaystart" class="form-control" value="${date}" ><br>
        	         <h5 class="form-signin-heading">휴가 종료일</h5>
         <label for="input" class="sr-only">종료일</label>
        	<input type="date" name="salary_hollydayend" class="form-control" value="${date}"><br>
      </form>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" value="휴가등록"  onclick="gogo()">휴가 등록</button>
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

	var formData = $("#testForm").serialize();
	$.ajax({
		  url: '${path}/insa/HollydayAdd',
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