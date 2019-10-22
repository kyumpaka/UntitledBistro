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
				<strong class="card-title">좌석 관리</strong>
			</div>
			<div class="table-stats order-table ov-h">
				<table class="table">
					<thead>
						<tr align="center">
							<th>테이블 이름</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${ tableList }" var="tableList">
						<tr>
							<td align="center">${ tableList.TABLESAVE_CODE }</td>
							<c:if test="${ tableList.ORDERS_TABLESAVE_CODE != null }">
							<td align="center" id="check${ tableList.TABLESAVE_CODE }">사용중</td>
							</c:if>
							<c:if test="${ tableList.ORDERS_TABLESAVE_CODE == null }">
							<td align="center" id="check${ tableList.TABLESAVE_CODE }">미사용</td>
							</c:if>
							<td id="td${ tableList.TABLESAVE_CODE }">
								<c:if test="${ tableList.ORDERS_TABLESAVE_CODE != null }">
								<button onclick="moveTable('${ tableList.TABLESAVE_CODE }')" class="btn btn-primary btn-sm">이동</button>
								</c:if>
								<c:if test="${ tableList.ORDERS_TABLESAVE_CODE != null }">
								<button onclick="joinTable('${ tableList.TABLESAVE_CODE }')" class="btn btn-primary btn-sm">합석</button>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="card-footer" align="right">
				<button onclick="goCloseMoveTable()" class="btn btn-primary btn-sm">
					<i class="fa fa-dot-circle-o"></i> 완료
				</button>
			</div>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function moveTable(tableCode) {
	var changebutton = "<input type=\"number\" id=\"input"+tableCode+"\" value="+tableCode+" style=\"width: 50px;\">&nbsp;";
	changebutton += "<button onclick=\"moveTableEnd(\'"+tableCode+"\')\" class=\"btn btn-primary btn-sm\">완료</button>";
	$("#td"+tableCode).html(changebutton);
}

function moveTableEnd(tableCode) {
	var newTableCode = $("#input"+tableCode).val();
	var checkUsed = $("#check"+newTableCode).html();

	if(checkUsed == '미사용' && newTableCode != tableCode) {
		$.ajax({
			  url: 'tableControl.do',
			  type: 'post',
			  data: JSON.stringify({ oldTable: tableCode,
				  	  newTable: newTableCode}),
			  dataType: 'json',
			  contentType: 'application/json',
			  success : function(result) {
				  swal({
					  title: "이동되었습니다.",
					  icon: "success",
					  button: "닫기",
					}).then((value) => {
							opener.document.location.reload();
							window.close();
					});
			  }
		});
	} else {
		swal({
				title: "이용이 불가능한 테이블입니다.",
				icon: "warning",
				button: "닫기",
			}).then((value) => {
				$("#input"+tableCode).focus();
			});
	}
}

function joinTable(tableCode) {
	var changebutton = "<input type=\"number\" id=\"input"+tableCode+"\" value="+tableCode+" style=\"width: 50px;\">&nbsp;";
	changebutton += "<button onclick=\"joinTableEnd(\'"+tableCode+"\')\" class=\"btn btn-primary btn-sm\">완료</button>";
	$("#td"+tableCode).html(changebutton);
}

function joinTableEnd(tableCode) {
	var newTableCode = $("#input"+tableCode).val();
	var checkUsed = $("#check"+newTableCode).html();

	if(checkUsed == '사용중' && newTableCode != tableCode) {
		$.ajax({
			  url: 'tableControl.do',
			  type: 'post',
			  data: JSON.stringify({ oldTable: tableCode,
				  	  newTable: newTableCode}),
			  dataType: 'json',
			  contentType: 'application/json',
			  success : function(result) {
				  swal({
					  title: "합석 처리되었습니다.",
					  icon: "success",
					  button: "닫기",
					}).then((value) => {
							opener.document.location.reload();
							window.close();
					});
			  }
		});
	} else {
		swal({
				title: "합석이 불가능한 테이블입니다.",
				icon: "warning",
				button: "닫기",
			}).then((value) => {
				$("#input"+tableCode).focus();
			});
	}
}

function goCloseMoveTable() {
	  opener.document.location.reload();
	  window.close();
}
</script>
</html>