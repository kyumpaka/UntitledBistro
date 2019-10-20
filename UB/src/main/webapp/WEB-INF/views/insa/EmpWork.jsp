<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
        jQuery(function($){
            $("#EmpWorkTable").DataTable();
        });
    </script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table id="EmpWorkTable" class="table table-bordered">
        
     <tr>
     		<th>no</th>
			<th>사번</th>
			<th>이름</th>
			<th>출근</th>
			<th>퇴근</th>
			<th>급여</th>
			
		</tr>
		<c:forEach var="b" items="${EmpRegisterList}">

			<tr>
				<td>${b.schedule_no}</td>
				<td>${b.empregister_empnum }</td>
				<td>${b.empregister_name }</td>
				<td>${b.Schedule_WorkingStart }</td>
				<td>${b.Schedule_WorkingEnd }</td>
				<td>${b.empregister_jumin }</td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>


