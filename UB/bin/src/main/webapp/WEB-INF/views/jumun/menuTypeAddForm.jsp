<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>POS</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="card">
		<div class="card-header">
			<strong>메뉴타입 등록</strong>
		</div>
		<div class="card-body card-block">
			<form class="form-horizontal">
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class=" form-control-label">메뉴 구분 이름</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="text" id="text-input" name="mt_Name" placeholder="입력해주세요." class="form-control">
					</div>
				</div>
			</form>
		</div>
		<div class="card-footer">
			<button onclick="mt_Add()" class="btn btn-primary btn-sm"> <i class="fa fa-dot-circle-o"></i> 완료 </button>
			<button onclick="windowClose()" class="btn btn-primary btn-sm"> <i class="fa fa-dot-circle-o"></i> 취소 </button>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function mt_Add() {
	event.preventDefault();
	var name = $("input[name='mt_Name']").val().trim();
	if(name == "") {
		swal({
			  title: "메뉴 구분명을 입력해주세요.",
			  icon: "warning",
			  button: "닫기",
		});
		$("input[name='mt_Name']").focus();
		$("input[name='mt_Name']").val("");
		return;
	}
	var info = {mt_Name:name};
	console.log(name);
	$.ajax({
		  url: 'menuTypeAdd.do',
		  type: 'post',
		  data: JSON.stringify(info),
		  dataType: 'json',
		  contentType: 'application/json',
		  success : function(result) {
			  swal({
				  title: result + "개 등록되었습니다.",
				  icon: "success",
				  button: "닫기",
				}).then(() => {
				  opener.document.location.reload();
				  window.close();
			  });
		  }
	});
}

function windowClose() {
	window.close();
}
</script>
</html>