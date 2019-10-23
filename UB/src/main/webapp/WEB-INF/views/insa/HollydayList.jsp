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
		</div>
		<div class="card-body">
      <form class="form-signin" id="tf" >
        <h5 class="form-signin-heading">사번</h5>
         <label for="input" class="sr-only">사번</label>
        	<input type="text" id="salary_empRegister_empnum" name="salary_empRegister_empnum" value="${Schedule.salary_empRegister_empnum}" class="form-control" readonly="readonly"><BR>
         <h5 class="form-signin-heading">휴가 시작일</h5>
         <label for="input" class="sr-only">휴가 시작일</label>
        	<input type="text" id="salary_hollydaystart" name="salary_hollydaystart" class="form-control" value="${Schedule.salary_hollydaystart}" readonly="readonly"><br>
          <h5 class="form-signin-heading">휴가 종료일</h5>
         <label for="input" class="sr-only">휴가 종료일</label>
        	<input type="text" id="salary_hollydayend" name="salary_hollydayend" class="form-control" value="${Schedule.salary_hollydayend}" readonly="readonly"><br>
      </form>
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
</script>
</html>