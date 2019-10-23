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
<body>
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">예약 양식</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" id="testForm">
         <h5 class="form-signin-heading">회원 아이디</h5>
         <label for="input" class="sr-only">회원 아이디</label>
        	<input type="text" id="reserve_member_id" name="reserve_member_id" class="form-control" placeholder="회원 아이디" required autofocus><BR>
        <h5 class="form-signin-heading">성함</h5>
        <label for="input" class="sr-only">성함</label>
        	<input type="text"  id="reserve_name" name="reserve_name" class="form-control" placeholder="성함" required autofocus><br>
         <h5 class="form-signin-heading">전화</h5>
         <label for="input" class="sr-only">전화</label>
        	<input type="tel" id="reserve_phone1" name="reserve_phone1" class="form-control" placeholder="전화" required autofocus><br>
         <h5 class="form-signin-heading">예약일</h5>
         <label for="input" class="sr-only">예약일</label>
        	<input type="text" name="reserve_dateString" class="form-control" value="${date}" readonly="readonly"><br>
         <h5 class="form-signin-heading">시작 시간</h5>
         <label for="input" class="sr-only">시작 시간</label>
        	<input type="time" id="reserve_start" name="reserve_start" class="form-control" ><br>
         <h5 class="form-signin-heading">마감 시간</h5>
         <label for="input" class="sr-only">마감 시간</label>
        	<input type="time" id="reserve_end" name="reserve_end" class="form-control" ><br>
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
	var reserve_phone1 = $("#reserve_phone1").val().trim();
	var reserve_name = $("#reserve_name").val().trim();
	var reserve_member_id = $("#reserve_member_id").val().trim();
	var reserve_name = $("#reserve_name").val().trim();
    var num1 = reserve_phone1.substr(0,3); //첫번째 번호 ex) 010
    var num2 = reserve_phone1.substr(3,4); //두번째 번호 ex) 9999 -1
    var num3 = reserve_phone1.substr(3,3); //두번째 번호 ex) 999 -245
    var num4 = reserve_phone1.substr(7); //세번째 번호 ex) 8888 -1  
    var num5 = reserve_phone1.substr(6); //세번째 번호 ex) 8888 - 2 

	
	if(reserve_member_id.length != 0 && reserve_name.length != 0){
		swal("회원이시면 ID, 비회원이시면 성함을 입력해 주세요");
		return false;
	}
	//이름 공백 사용여부 검사
	if(reserve_name.indexOf(" ") >= 0){
		swal("이름에 공백을 사용할 수 없습니다.");
		$("#reserve_name").focus();
		return false;
	}
	
	 //전화 입력여부 검사
	if(reserve_phone1.length == 0){
		swal("전화를 입력해 주세요");
		$("#reserve_phone1").focus();
		return false;
	}
	
	 //전화 공백여부 검사
	if(reserve_phone1.indexOf(" ") >= 0){
		swal("전화에 공백을 사용할 수 없습니다");
		$("#reserve_phone1").focus();
		return false;
	}
	 //전화 문자 검사
	for(i = 0; i < reserve_phone1.length; i++){
		ch = reserve_phone1.charAt(i)
		if(!(ch >= '0' && ch <= '9')){
			swal("전화는 숫자만 입력해 주세요");
		$("#reserve_phone1").focus();
		return false;
		}
	}
		//전화 형식 검사
		if(reserve_phone1.length != 0){
			if(num1 != '010'){
				swal("앞자리는 010 입니다.");
				reserve_phone1 = ""
				$("#reserve_phone1").focus();
				return false;
			}
			if(num2.length < 3 || num2.length > 4 || num3.length < 3 || num3.length > 4){
				swal("두번째 자리 전화 범위값이 부적절 합니다.");
				reserve_phone1 = ""
				$("#reserve_phone1").focus();
				return false;
			}
			if(num4.length < 3 || num4.length > 4 || num5.length < 3) {
				swal("세번째 자리 전화 범위값이 부적절 합니다.");
				reserve_phone1 = ""
				$("#reserve_phone1").focus();
				return false;
			}
		}
		
		var reserve_start = $("#reserve_start").val(); 
        var startDateArr = reserve_start.split(':');
        var reserve_end = $("#reserve_end").val(); 
        var endDateArr = reserve_end.split(':');
        if(startDateArr > endDateArr) {
        	swal("시작일이 종료일보다 늦을 수 없습니다.");
            return false;
        }

		if(reserve_start.length == 0){
			swal("시작 시간을 입력해 주세요");
			$("#reserve_start").focus();
			return false;
		}

		if(reserve_end.length == 0){
			swal("마감 시간을 입력해 주세요");
			$("#reserve_end").focus();
			return false;
		}

	
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