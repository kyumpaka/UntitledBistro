<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">

@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 80px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		background:linear-gradient(to bottom right, #0098FF, #6BA8D1);
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>로그인 폼</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function loginCheck() {
	var empregister_empnum = $("#empregister_empnum").val().trim();
	var empregister_jumin = $("#empregister_jumin").val().trim();

	if (empregister_empnum == "") {
		swal({
			  title: "사번을 입력해주세요.",
			  icon: "warning",
			  button: "닫기",
			});
			$("#empregister_empnum").focus();
			return false;
	}
	if (empregister_jumin == "") {
		swal({
			  title: "비밀번호를 입력해주세요.",
			  icon: "warning",
			  button: "닫기",
			});
			$("#empregister_jumin").focus();
			return false;
	}
	
	return true;
}

function login() {
	if(loginCheck()) {
		$("#loginForm").submit();
	}
}

function press(e){
	if(e.keyCode == 13){ // javascript에서는 13이 enter키를 의미함
		login();
	} 
} 
</script>

</head>
<body>
	<div class="card align-middle" style="width:20rem; border-radius:20px; margin-top: 250px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">환영합니다.</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" id="loginForm" method="POST" action="InsaLoginCheck" name="loginForm">
        <label for="inputEmail" class="sr-only"></label>
        <input type="text" id="empregister_empnum" name="empregister_empnum" class="form-control" placeholder="사원번호" autofocus onkeypress="press(event)"><BR>
        <label for="inputPassword" class="sr-only"></label>
        <input type="password" id="empregister_jumin" name="empregister_jumin" class="form-control" placeholder="비밀번호" onkeypress="press(event)"><br>
      </form>
        <button onclick="login()" class="btn btn-outline-primary btn-lg btn-block">로그인</button>
      
		</div>
	</div>
  </body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
</html>
