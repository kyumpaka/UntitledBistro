<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.20/rr-1.2.6/sc-2.0.1/sl-1.3.1/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.20/rr-1.2.6/sc-2.0.1/sl-1.3.1/datatables.min.js"></script>




<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
	<table id="Emplist" class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>이름</th>
				<th>사번</th>
				<th>나이</th>
				<th>전화번호</th>
				<th>주민1</th>
				<th>주민2</th>
				<th>직급</th>
				<th>입사날짜</th>
				<th>재직여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="b" items="${EmpRegisterList}">

				<tr>
					<td>${b.empregister_name}</td>
					<td><a href="/UntitledBistro/insa/EmpRegisterRead?empregister_empnum=${b.empregister_empnum }" onclick="window.open(this.href, '_blank', 'width=700,height=600,toolbars=no,scrollbars=yes'); return false;">${b.empregister_empnum }</a></td>
					<td>${b.empregister_age }</td>
					<td>${b.empregister_tel }</td>
					<td>${b.empregister_jumin }</td>
					<td><c:if test="${b.empregister_jumin2 ne null && b.empregister_jumin2!=''}">
					${fn:substring(b.empregister_jumin2,1,fn:length(b.empregister_jumin2)-4)}******</c:if>
					</td>
					<td>${b.empregister_grade 	}</td>
					<td><fmt:formatDate value="${b.empregister_entryday }"
							pattern="yyyy-MM-dd" /></td>
					<td>${b.empregister_leavecompany }</td>
					
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<button
		onclick="window.open('EmpRegisterInsertForm','insert','width=1700,height=1000,location=no,status=no,scrollbars=yes');">사원등록</button>


	<script type="text/javascript">
		$('#Emplist').DataTable({ // 페이징 처리, 검색, show entries
			pageLength : 10,
			bPaginate : true,
			bLengthChange : true,
			lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ],
			bAutoWidth : false,
			processing : true,
			ordering : true,
			serverSide : false,
			searching : true,
			bStateSave : true,
			"iDisplayLength" : 10,
			"language" : {
				search : "Search : "
			},
		});
		
		
		function EmpRegisterRead(empnum) {
			//alert("삭제")
			location.href = "/UntitledBistro/EmpRegisterRead?empregister_empnum="
					+ empnum;
		}

		function list() {
			alert("등록완료");
			window.location.href = window.location.href;
			window.location.replace('EmpRegisterList');

		}

		function EmpRegisterRead(empnum) {
			//alert("삭제");
			location.href = "/UntitledBistro/EmpRegisterRead?empregister_empnum="
					+ empnum;
		}

		function list() {
			alert("등록완료");
			window.location.href = window.location.href;
			window.location.replace('EmpRegisterList');

		}

		
	</script>




</body>
</html>