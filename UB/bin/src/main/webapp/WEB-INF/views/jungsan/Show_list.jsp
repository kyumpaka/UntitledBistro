<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="path" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h2 align="center">매출 현황</h2><br><br>

	<div class="container" align="center">
		<table border="5" style="width: 100%;">
			<tr bgcolor="gray" align="center">
				<td>매출</td>
				<td>현금</td>
				<td>카드</td>
				<td>포인트</td>
			</tr>	
	<c:forEach var="a" items="${getjungsan_viewList}">
			<tr>
				<td>${a.payment_cash+a.payment_card}</td>
				<td>${a.payment_cash}</td>
				<td>${a.payment_card}</td>
				<td>${a.payment_point}</td> 
			</tr>
	</c:forEach>
			<tr bgcolor="gray" align="center">
				<td>직급</td>
				<td>근무 인원</td>
				<td>근무예정시간</td>
				<td>근무진행시간</td>
			</tr>
			<tr>
				<td>직원/알바</td>
				<td>n명</td>
				<td>16+H</td>
				<td>8+H</td>
			</tr>
			<tr align="center">
				<td bgcolor="red">환불</td>
				<td>3만원</td>
				<td bgcolor="red">환불사유</td>
				<td align="center">
				<select>
						<option value="누락">누락</option>	
						<option value="실수">실수</option>		
						<option value="하자">하자</option>	
						<option value="기타">기타</option>			
				</select>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>