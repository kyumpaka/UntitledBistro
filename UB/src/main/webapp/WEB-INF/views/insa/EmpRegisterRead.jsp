<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<style>
td {
	background-color: #FFFFFF;	
	height: 30px;
}

.ti {
	font-weight: bold;
	font-size: 12px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 function EmpregisterUpdate(){
	 location.href="EmpRegisterUpdateForm?empregister_empnum=${b.empregister_empnum}";

	 
 }
 
 
	</script>
</head>

<body>
	<form name="EmpRegisterRead"  id="read" Action="EmpRegisterRead" method="post">
		<table cellspacing='1' cellpadding='0' border='0' bgcolor='#000000'
			align='center'>
			<tr>
				<td colspan='3' rowspan='3' class='ti' >
					<div class="img-wrap" >
				<img src="${pageContext.request.contextPath}/resources/images/insa/${ b.empregister_photo }" width="120" height="120">
				</div>
				</td>
				<td rowspan='2' class='ti' width='100'>성명</td>
				<td rowspan='2' class='ti'>${b.empregister_name}</td>
				<td colspan='2' class='ti' width='200'>주 민 등 록 번 호</td>
			</tr>
			<tr>
				<td colspan='2'class='ti'>${b.empregister_jumin }-${b.empregister_jumin2 }</td>

			</tr>
			<tr>
				<td colspan='1' class='ti' width='100'>사번</td>
					<td class='ti'>${b.empregister_empnum }</td>
					<td class='ti' colspan='1'>성별</td>
					<td class='ti'>${b.empregister_gender }</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>연락처</td>
				<td colspan='2' class='ti'>${b.empregister_tel }</td>
				<td colspan='1' class='ti'>나이</td>
				<td>${b.empregister_age }</td>
			</tr>
			<tr>
				<td class='ti' colspan='3' rowspan='2'>거주지</td>
				<td class='ti'>주소</td>
				<td class='ti'>${b.empregister_addr }</td>
				<td class='ti' rowspan='1'>${b.empregister_addr2 }</td>
				<td rowspan='1' class='ti'>지번주소 ${b.empregister_addr3 }</td>

			</tr>
			<tr>
				<td class='ti'>상세주소
				<td class='ti'>${b.empregister_addr4 }</td>

				<td class='ti'>직급</td>
				<td class='ti'>${b.empregister_grade}</td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>은행명</td>
				<td class='ti' colspan="2">${b.empregister_bankname}</td>


				<td class='ti' width='100'>예금주</td>

				<td class='ti'>${b.empregister_accountholder}</td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>계좌번호</td>
				<td class='ti' colspan="2">${b.empregister_banknum}</td>
				<td colspan='1' class='ti'>급여 구분</td>
				<td>${b.empregister_payclassfiy}
				</td>

			</tr>

			<tr>

				<td class='ti' colspan='3'>입사 날짜</td>
				<td class='ti' colspan='1'><fmt:formatDate value="${b.empregister_entryday }"
						pattern="yyyy-MM-dd" /></td>
				<td colspan='1' class='ti' >재직 여부</td>
				<td colspan='2' class='ti'>${b.empregister_leavecompany}</td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>시급</td>
				<td colspan='2'>${b.empregister_pay }천원</td>
				<td class='ti' colspan='1'>일급</td>
				<td>${b.empregister_pay }만원</td>
			</tr>
			<tr>
				<td colspan='3'>총근무시간</td>


				<td colspan='3'>${b.empregister_workplan}시간<%-- <select id="empregister_workplan"
					name="empregister_workplan">
						<option value="empregister_workplan">시간 선택</option>
						<%
							for (int i = 1; i <= 24; i++) {
						%>
						<option value="<%=i%>"><%=i + "시"%></option>
						<%
							}
						%>

				</select> --%></td>
				<td>
			<input type="button" value="수정" onclick="EmpregisterUpdate()" width="1300" height="800"/>
				</td>
			</tr>
		</table>	
	</form>

</body>
</html>