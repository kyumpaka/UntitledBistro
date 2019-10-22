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
<title>예약 확인</title>
</head>

<body>
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
		<c:if test="${Seobis_reserveSelect.reserve_member_id != null}">
			<h2 class="card-title text-center" style="color:#113366;">회원 예약</h2>
		</c:if>
		<c:if test="${Seobis_reserveSelect.reserve_name != null}">
			<h2 class="card-title text-center" style="color:#113366;">비회원 예약</h2>
		</c:if>
		</div>
		<div class="card-body">
      <form class="form-signin" id="tf" >
        <h5 class="form-signin-heading">예약 번호</h5>
        <label for="input" class="sr-only">번호</label>
        	<input type="text"  name="reserve_num" class="form-control" value="${Seobis_reserveSelect.reserve_num}"  readonly="readonly" ><br>
        	<c:if test="${Seobis_reserveSelect.reserve_member_id != null}">
        <h5 class="form-signin-heading">회원 아이디</h5>
         <label for="input" class="sr-only">회원 아이디</label>
        	<input type="text" id="reserve_member_id" name="reserve_member_id" value="${Seobis_reserveSelect.reserve_member_id}" class="form-control" readonly="readonly"><BR>
        	</c:if>
        	<c:if test="${Seobis_reserveSelect.reserve_name != null}">
            <h5 class="form-signin-heading">성함</h5>
        	<label for="input" class="sr-only">성함</label>
        	<input type="text"  id="reserve_name" name="reserve_name" class="form-control" value="${Seobis_reserveSelect.reserve_name}"   readonly="readonly"><br>
        	</c:if>
        	<h5 class="form-signin-heading">전화</h5>
         <label for="input" class="sr-only">전화</label>
        	<input type="tel" id="reserve_phone1" name="reserve_phone1" class="form-control" value="${Seobis_reserveSelect.reserve_phone1}" required autofocus><br>
         <h5 class="form-signin-heading">예약 등록일</h5>
         <label for="input" class="sr-only">예약 등록일</label>
        	<input type="text" id="reserve_firstString" name="reserve_firstString" class="form-control" value="<fmt:formatDate value="${Seobis_reserveSelect.reserve_firsttime}" pattern="yyyy-MM-dd  hh:mm"/>" readonly="readonly"><br>
          <h5 class="form-signin-heading">예약일</h5>
         <label for="input" class="sr-only">예약일</label>
        	<input type="text" id="reserve_dateString" name="reserve_dateString" class="form-control" value="<fmt:formatDate value="${Seobis_reserveSelect.reserve_date}" pattern="yyyy-MM-dd"/>" readonly="readonly"><br>
        <h5 class="form-signin-heading">시작 시간</h5>
         <label for="input" class="sr-only">시작 시간</label>
        	<input type="time" id="reserve_start" name="reserve_start" class="form-control"  value="${Seobis_reserveSelect.reserve_start}" /><br>
        <h5 class="form-signin-heading">마감 시간</h5>
         <label for="input" class="sr-only">마감 시간</label>
        	<input type="time" id="reserve_end" name="reserve_end" class="form-control"  value="${Seobis_reserveSelect.reserve_end}" /><br>
      </form>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" value="예약하기" onclick="gogo()">수정</button>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" value="삭제" onclick="del()">예약 취소</button>
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
//확인 메소드
function gogo() {

	var reserve_phone1 = $("#reserve_phone1").val().trim();
    var num1 = reserve_phone1.substr(0,3); //첫번째 번호 ex) 010
    var num2 = reserve_phone1.substr(3,4); //두번째 번호 ex) 9999 -1
    var num3 = reserve_phone1.substr(3,3) //두번째 번호 ex) 999 -245
    var num4 = reserve_phone1.substr(7) //세번째 번호 ex) 8888 -1  
    var num5 = reserve_phone1.substr(6) //세번째 번호 ex) 8888 - 2 
    
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
		
	var formData = $("#tf").serialize();
	$.ajax({
		  url: '${path}/Seobis/rUpdate',
		  type: 'post',
		  data: formData,
		  dataType: 'json',
		  success : function(result) {
			  if(result == 1) {
				  swal({
					  title: result + "개 수정되었습니다.",
					  icon: "success",
					  button: "닫기",
					}).then(() => {
						  opener.document.location.reload();
						  window.close();
					  });
			  } else {
				  swal({
					  title: "수정 실패 했습니다.",
					  icon: "warning",
					  button: "닫기",
					});
			  }
		  }
	});
};

function del(){
	var formData = $("#tf").serialize();
	$.ajax({
		  url: '${path}/Seobis/rDelete',
		  type: 'post',
		  data: formData,
		  
		  success : function() {
			  swal({
				  title: "삭제 되었습니다.",
				  icon: "success",
				  button: "닫기",
				}).then(() => {
					  opener.document.location.reload();
					  window.close();
				  });
		  },
		  error:function() {
			  swal({
				  title: "삭제 실패 했습니다.",
				  icon: "warning",
				  button: "닫기",
				});
		  }
	});
}
</script>
</html>