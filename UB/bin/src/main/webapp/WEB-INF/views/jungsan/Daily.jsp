<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2 align="center">Daily List</h2><br><br>

	<div class="container" align="center">
		<table border="5" style="width: 100%;">
			<tr bgcolor="gray" align="center">
				<td>날짜</td>
				<td>현금</td>
				<td>카드</td>
				<td>총매출</td>
				<td>순매출</td>
				<td>업무시간</td>
				<td>지출</td>
				<td>포인트사용가</td>
				<td>환불</td>
				<td>환불이유</td>
				<td>기입자</td>
				<td>차액</td>
			</tr>	
	<c:forEach var="dto" items="${getjungsan_inputList}">
			<tr>
				<td><a href="UpdateForm.html">${dto.jungsan_input_date}</a></td>
				<td>${dto.jungsan_input_cash}</td>
				<td>${dto.jungsan_input_card}</td>
				<td>${dto.jungsan_input_card +dto.jungsan_input_cash}</td>
				<td>${dto.jungsan_input_card +dto.jungsan_input_cash-dto.jungsan_input_point}</td>
				<td>${dto.jungsan_input_worktime}</td>
				<td>${dto.jungsan_input_expenditure}</td> 
				<td>${dto.jungsan_input_point}</td>
				<td>${dto.jungsan_input_refund}</td>
				<td>${dto.jungsan_input_reason}</td>
				<td>${dto.jungsan_input_grade}</td> 
				<td>포스 입력 금액 - 매니저 입력금액</td>
			</tr>
	</c:forEach>
		</table>
	</div>
	<button type="button"><a href="Monthly.html">월마감</a></button>
	<button type="button"><a href="View_jungsan.html">현황 그래프 보기</a></button>
</body>
</html>