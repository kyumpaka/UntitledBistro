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
			<h2 class="card-title text-center" style="color:#113366;">예약 양식</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" id="testForm" >
        <h5 class="form-signin-heading">예약 정보</h5>
        <label for="input" class="sr-only">번호</label>
        	<input type="text"  name="reserve_num" class="form-control" value="${Seobis_reserveSelect.reserve_num}"  readonly="readonly" ><br>
        	<c:if test="${Seobis_reserveSelect.reserve_member_id != null}">
         <label for="input" class="sr-only">회원 아이디</label>
        	<input type="text" id="reserve_member_id" name="reserve_member_id" value="${Seobis_reserveSelect.reserve_member_id}" class="form-control" required autofocus><BR>
        	</c:if>
        	<c:if test="${Seobis_reserveSelect.reserve_name != null}">
        <label for="input" class="sr-only">이름</label>
        	<input type="text"  id="reserve_name" name="reserve_name" class="form-control" value="${Seobis_reserveSelect.reserve_name}"   readonly="readonly"><br>
        	</c:if>
         <label for="input" class="sr-only">전화</label>
        	<input type="tel" id="reserve_phone1" name="reserve_phone1" class="form-control" value="${Seobis_reserveSelect.reserve_phone1}" required autofocus><br>
         <label for="input" class="sr-only">예약일</label>
        	<input type="text" id="reserve_dateString" name="reserve_dateString" class="form-control" value="<fmt:formatDate value="${Seobis_reserveSelect.reserve_date}" pattern="yyyy / MM / dd"/>" readonly="readonly"><br>
         <label for="input" class="sr-only">시작 시간</label>
        	<input type="time" id="reserve_start" name="reserve_start" class="form-control"  value="${Seobis_reserveSelect.reserve_start}" /><br>
         <label for="input" class="sr-only">마감 시간</label>
        	<input type="time" id="reserve_end" name="reserve_end" class="form-control"  value="${Seobis_reserveSelect.reserve_end}" /><br>
      </form>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" value="예약하기" onclick="gogo()">수정</button>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" value="삭제" onclick="realDelete('${Seobis_reserveSelect.reserve_num}')">예약 취소</button>
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
	var formData = $("#testForm").serialize();
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

//삭제 메소드
function realDelete(reserve_num) {
	swal({
	   	  title: "회원 ID : " + reserve_num + "을 삭제하시겠습니까?",
	   	  icon: "warning",
	   	  buttons: true,
	   	  dangerMode: true,
	   	})
	.then((value) => {
		if(value) {
			if(false) swal("ss");
			realMod(reserve_num);
		}
	});
};

function realMod(reserve_num) {
	swal("성공적으로 삭제하였습니다.", {
 	      icon: "success",
   	  	
   	    })
	.then((value) => {
		if(value) {
			if(false) swal("ss");
			 $(location).attr("href", "${path}/Seobis/rDelete?reserve_num=" + reserve_num);
		}
	});
}
</script>
</html>