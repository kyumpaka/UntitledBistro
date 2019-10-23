<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>POS</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="col-lg-6">
		<div class="card">
			<div class="card-header">
				<strong class="card-title">메뉴타입 관리</strong>
			</div>
			<div class="table-stats order-table ov-h">
				<table class="table ">
					<thead>
						<tr>
							<th class="serial">#</th>
							<th>메뉴 구분</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ menuTypeList }" var="menuTypeList" varStatus="status">
							<tr id="tr${ menuTypeList.mt_Code }">
								<td class="serial">${ status.count }</td>
								<td><span class="name"><div id="preinput${ menuTypeList.mt_Code }">${ menuTypeList.mt_Name }</div></span></td>
								<td>
									<button onclick="mt_Del('${ menuTypeList.mt_Name }', '${ menuTypeList.mt_Code }')" class="btn btn-primary btn-sm">삭제</button>
									<span id="mt_Modistart${ menuTypeList.mt_Code }">
										<button onclick="mt_Modistart('${ menuTypeList.mt_Code }', '${ menuTypeList.mt_Name }')" class="btn btn-primary btn-sm">수정</button>
									</span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="card-footer" align="right">
				<button onclick="goCloseMTList()" class="btn btn-primary btn-sm">
					<i class="fa fa-dot-circle-o"></i> 완료
				</button>
			</div>
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
						  $("#tr"+code).remove();
					  }
				  });
			  }
		});
}

function mt_Modistart(code, name) {
	$("#preinput"+code).html("<input type='text' value="+ name +" id='input"+ code +"' class='form-control'>");
	$("#mt_Modistart"+code).html('<button onclick="mt_Modiend(\''+ code +'\')" class="btn btn-primary btn-sm">완료</button>');
}

function mt_Modiend(code) {
	event.preventDefault();
	var name = $("#input"+code).val().trim();
	if(name == "") {
		swal({
			  title: "메뉴 구문명을 입력해주세요.",
			  icon: "warning",
			});
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
					  title: result + "개 수정되었습니다.",
					  icon: "success",
					  button: "닫기",
					}).then((value) => {
						  $("#preinput"+code).html(name);
						  $("#mt_Modistart"+code).html('<button onclick="mt_Modistart(\'' + code + '\', \'' + name + '\')" class="btn btn-primary btn-sm">수정</button>');
					  });
			  }
		});
	}
}

function goCloseMTList() {
	  opener.document.location.reload();
	  window.close();
}
</script>
</html>