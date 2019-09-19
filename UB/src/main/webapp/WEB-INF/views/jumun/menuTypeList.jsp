<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<title>POS</title>
</head>
<body>
	<div class="card">
		<div class="card-header">
			<strong>메뉴타입 관리</strong>
		</div>
		<div class="card-body card-block">
			<c:forEach items="${ menuTypeList }" var="menuTypeList">
				<form class="form-horizontal">
					<div id="div${ menuTypeList.mt_Code }" class="row form-group">
						<span>
							<span>
								<button onclick="mt_Del('${ menuTypeList.mt_Name }', '${ menuTypeList.mt_Code }')" class="btn btn-primary btn-sm">삭제</button> 
								<span id="mt_Modistart${ menuTypeList.mt_Code }">
									<button onclick="mt_Modistart('${ menuTypeList.mt_Code }', '${ menuTypeList.mt_Name }')" class="btn btn-primary btn-sm">수정</button>
								</span>
							</span>
						</span>
						&nbsp;<div id="preinput${ menuTypeList.mt_Code }">${ menuTypeList.mt_Name }</div>
					</div>
				</form>
			</c:forEach>
		</div>
		<div class="card-footer">
			<button onclick="mt_menuSetting()" class="btn btn-primary btn-sm">
				<i class="fa fa-dot-circle-o"></i> 완료
			</button>
		</div>
	</div>
</body>

<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	// 삭제 확인 및 처리
	function mt_Del(name, code) {
		event.preventDefault();
		swal({
			  title: "삭제하시겠습니까?",
			  icon: "warning",
			  buttons: ["아니요", "네"],
			  dangerMode: true,
			}).then((willDelete) => {
				  if (willDelete) {
					  $.ajax({
						  url: 'menuTypeRemove.do',
						  type: 'post',
						  data: { mt_Code:code },
						  dataType: 'json',
						  success : function(result) {
							  swal({
								  title: result + "개 삭제되었습니다.",
								  icon: "success",
								  button: "닫기",
								});
							  $("#div"+code).remove();
						  }
					  });
				  }
			});
	};
	
	function mt_Modistart(code, name) {
		$("#preinput"+code).html("<input type='text' value="+ name +" id='input"+ code +"' class='form-control'>");
		$("#mt_Modistart"+code).html('<button onclick="mt_Modiend(\''+ code +'\')" class="btn btn-primary btn-sm">완료</button>');
	};

	function mt_Modiend(code) {
		var name = $("#input"+code).val().trim();
		if(name == "") {
			alert('메뉴 구문명을 입력해주세요.');
			$("#input"+code).focus();
			$("#input"+code).val("");
			event.preventDefault();
		} else {
			var info = {mt_Code:code, mt_Name:name};
			
			$.ajax({
				  url: 'menuTypeModi.do',
				  type: 'post',
				  data: JSON.stringify(info),
				  dataType: 'json',
				  contentType: 'application/json',
				  success : function(result) {
					  swal({
						  title: result + "개 등록되었습니다.",
						  icon: "success",
						  button: "닫기",
						});
					  $("#preinput"+code).html(name);
					  $("#mt_Modistart"+code).html('<button onclick="mt_Modistart(\'' + code + '\', \'' + name + '\')">수정</button>');
				  }
			});
		}
	};

	function mt_menuSetting(){
		  opener.document.location.reload();
		  window.close();
	};
</script>
</html>