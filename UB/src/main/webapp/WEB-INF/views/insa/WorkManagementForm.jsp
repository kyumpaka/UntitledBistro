<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


var empregister_empnum = $("#empregister_empnum").val();
var empregister_jumin = $("#empregister_jumin").val();

var obj = new Object;
obj.empregister_empnum = empregister_empnum;
obj.empregister_jumin = empregister_jumin;


$(document).ready(function() {
	$("#btnwork").click(function() {
		var empregister_empnum = $("#empregister_empnum").val();
		var empregister_jumin = $("#empregister_jumin").val();
		
		if (empregister_empnum == "") {
			swal("사번을 입력해주세요.", {
				 icon: "warning",
			});
			$("#empregister_empnum").focus();
			return;
		}
		if (empregister_jumin == "") {
			swal("비밀번호를 입력해주세요.", {
				 icon: "warning",
			});
			$("#empregister_jumin").focus();
			return;
		}
	 	 WorkManagement();

	});
	
});
		
	
		
		function WorkManagement(){
		    $.ajax({
		        type:"POST",
		        url:"WorkCheck", 
		        data :JSON.stringify(obj),
		        dataType : "json",
		        success: function(data) {
		        	if(data == 0) {
		        		swal("안녕");
		        	} else if(data != 1) {
		        	/* 	출근 알람띄우고 창닫기 */
		        	swal("1번");
		        	} else if(data != 2) {
		        		/* 퇴근 알람띄우고 창 닫기 */
		        		swal("2번");
		        	}
		        		
		        	alert("작동완료"+data);
		        },
		        error: function(xhr, status, error) {
		          	alert("에럽니다");
		        }  
		    });
		};

 
	

	
	
	
</script>
</head>
<body>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">사번</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="empregister_empnum"
					name="empregister_empnum" value="${empregister_empnum }">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="empregister_jumin"
					name="empregister_jumin" value="${empregister_jumin }"
					placeholder="Password">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="button" id="btnwork" class="btn btn-default">로그인</button>
				
			</div>
		</div>


</body>
</html>