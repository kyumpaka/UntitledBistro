<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<script>

$(document).ready(function(){
$("#btnLogin").click(function(){
	var empregister_empnum = $("#empregister_empnum").val();
	var empregister_jumin = $("#empregister_jumin").val();
	alert('여기');
	if(empregister_empnum == ""){
		alert("사번을 입력해주세요.");
		$("#empregister_empnum").focus(); 
		return; 
	}
	if(empregister_jumin == ""){
		alert("비밀번호를 입력해주세요.");
		$("#empregister_jumin").focus();
		return;
		
	}
	
	document.loginform.submit();
});

	
	
});



</script>

</head>
<body>
<form name="loginform" action="InsaLoginCheck" method="post">
<table border="1" width="400px"> 
<tr>
<td>사번</td>
<td><input type ="text" name="empregister_empnum" id="empregister_empnum"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="empregister_jumin" id="empregister_jumin"></td>
</tr>
<tr>
<td>

<button type="button" id="btnLogin">로그인</button>
</td>
</tr>
</table>
</form>

</body>
</html>
