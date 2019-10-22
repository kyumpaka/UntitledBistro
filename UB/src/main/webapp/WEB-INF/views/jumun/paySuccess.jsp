<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
</head>
<body>
<br>
<div align="center">
	<div class="col-md-6">
		<div class="card border border-primary">
			<div class="card-header" align="center">
				<strong class="card-title">현금 내역</strong>
			</div>
			<div class="card-body" align="left">
				<p class="card-text"><strong>결제일시</strong> &nbsp; <fmt:formatDate value="${payment_Time}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></p>
				<p class="card-text"><strong>결제번호</strong> &nbsp; ${sales_No}</p>
				<p class="card-text"><strong>매장명</strong> &nbsp; UntitledBistro</p>
				<p class="card-text"><strong>결제금액</strong> &nbsp; ${payment_Cash}</p>
				<p class="card-text"><strong>결제방법</strong> &nbsp; 현금</p>
				<p class="card-text"><strong>포 인 트</strong> &nbsp; ${payment_Point}</p>
			</div>
		<button class="btn btn-primary btn-sm" onclick="windowClose()"> 닫기 </button>
		</div>
	</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	opener.location.href = "posMain.do";
})

function windowClose() {
	window.close();
}
</script>
</html>