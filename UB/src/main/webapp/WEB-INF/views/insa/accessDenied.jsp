<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한부족</title>
</head>
<body onload="start()">
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function start() {
	swal({
		  title: "권한이 부족합니다.",
		  icon: "warning",
		  button: "다시 로그인하기",
		}).then(() => {
			location.href='/UntitledBistro/login';
	});
}
</script>
</html>