<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/seobis/bootstrap.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/seobis/bootstrap.js"></script>
<title>회원 가입창</title>
<style>
   .text_center{
     text-align:center;
   }
</style>
</head>
<body>
	<header>
		<h1 class="text_center">회원 추가</h1>
	</header>
	<form method="post"   action="Seobis_createMember">
	<table  class="table table-hover">
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="member_id"></td>
	   </tr>
	    <tr>
	       <td width="200"><p align="right">이름</td>
	       <td width="400"><p><input type="text" name="member_name"></td>
	    </tr>
	    <tr>
	    	<td width="200"><p align="right">남자</td>
	    	<td width="400"><p><input type="radio" name="member_gender" value="man"></td>
	     </tr>
	      <tr>
	    	<td width="200"><p align="right">여자</td>
	    	<td width="400"><p><input type="radio" name="member_gender" value="girl"></td>
	     </tr>
	    <tr>
	       <td width="200"><p align="right">이메일</td>
	       <td width="400"><p><input type="text" name="member_email"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">전화 번호</td>
	       <td width="400"><p><input type="text" name="member_phone1"></td>
	    </tr>
	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="submit" value="가입하기"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	</form>
</body>






