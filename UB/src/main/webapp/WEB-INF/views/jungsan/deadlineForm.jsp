<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="container" >
	<table border="1" style="width: 35%;">
		<tr bgcolor="gray">
			<td colspan="2">구분</td><td colspan="2">Cash</td><td colspan="2">card</td><td colspan="2">deadline</td>
		</tr>
		<tr>
			<td colspan="2">매출</td><td colspan="2">Cash</td><td colspan="2">card</td><td colspan="2">deadline</td>
		</tr>
		<tr>
			<td colspan="2">지출</td><td colspan="2">Cash</td><td colspan="2">card</td><td colspan="2">deadline</td>
		</tr>
		<tr>
			<td colspan="2">환불</td><td colspan="2">Cash</td><td colspan="2">card</td><td colspan="2">deadline</td>
		</tr>
		</table>
	</div>



<div class="container">
	<table style="width: 100%;" border="2">
		추후 css로 조정 필요
		<tr >
			<td colspan="5">금일 매출 : {현금+카드} ${day_profit} </td>
			<td colspan="5">현금 : sum{현금}</td>
			<td colspan="5">카드 : sum{카드}</td>
		</tr>
		<tr >
			<td colspan="5" >금일 지출 : {현금+카드} ${day_expenditure}</td>
			<td colspan="5" >현금 : sum{현금}</td>
			<td colspan="5" >카드 : sum{카드}</td>
		</tr>
		<tr >
			<td colspan="5">환불 금액 : {환불} ${day_refund}</td>
			<td colspan="5" >현금 : sum{현금}</td>
			<td colspan="5">카드 : sum{카드}</td>
		</tr>
		
		<tr bordercolor="black" style="font-color:white;">
			<td colspan="3">금일 총 매출 :{현금+카드-포인트사용가} ${day_profit - day_refund}</td>
			<td colspan="6" >당일 직원 근무시간 :{총 인건 시간} ${day_worktime}</td>
			<td colspan="6">포인트 사용가 : {사용한 포인트}</td>
		</tr>
	</table>
	여기까지가 일마감
	<br><br><br><br><br>
	<table style="width: 100%;" border="2">
	<tr>
		<td>금일 매출 : </td>
		<td><input type="text" value="${day_profit}" ></td>
		<td>금일 지출 :</td>
		<td><input type="text" value="${day_expenditure}"></td>
		<td>금일 환불 : </td><td><input type="text" value="${day_refund}"></td>
	</tr>
	<tr>
		<td>총 매출 : </td><td colspan="3"><input type="text" size="60" value="${day_profit - day_refund}"></td>
		<td>직원 근무 시간 : </td><td><input type="text" value="${day_worktime}"></td>
	</tr>
	</table>
	<div id="btn" align="right">
		<input type="submit" value="수정"/><input type="reset" value="취소"/><input type="submit" value="저장"/>
	</div>
	<br><br><br><br><br>
	
	
	<table  border="2" style="width: 100%;">
		월마감
		<tr >
			<td colspan="5" >월 매출 :sum{일마감 금일 매출[조건문 date]} ${month_profit}</td>
			<td colspan="5" >현금 : {조건문 현금 합}</td>
			<td colspan="5">카드 :{조건문 카드 합}</td>
		</tr>
		<tr>
			<td colspan="5">당월 지출 :sum{일마감 금일 지출[조건문 date]} ${month_expenditure} </td>
			<td colspan="5" >현금 : {조건문 현금 합}</td>
			<td colspan="5">카드 :{조건문 카드 합}</td>
		</tr>
		<tr>
			<td colspan="5" >인건비 : {총 급여} ${month_worktime}</td>
			<td colspan="5">정직원 월급 :{조건문(사원번호-정직원)}</td>
			<td colspan="5"  >알바비 :{조건문(사원번호-파트타임)}</td>
		</tr>
		
		<tr bordercolor="black" style="font:gray;">
			<td colspan="6">순  매 출 : ${month_max_profit}</td>
			<td colspan="9">{sum(금일 총 매출)-인건비}</td>
	</table>
</div>

<div class="container" align="center" style="margin-top: 100px;">
<table border="1" width="1200" cellpadding="3">
	<tr>
		<th>인권비</th>
		<th>근무일수</th>
		<th>기본시급</th>
		<th>총인권비</th>
		<th>현금</th>
		<th>카드</th>
		<th>포인트</th>
		<th>갯수</th>
		<th>단가</th>
		<th>무엇</th>
		<th>직급</th>
		<th>판매현황</th>
		<th>주문유무</th>
		<th>날짜</th>
	</tr>	
<c:forEach var="c" items="${Deadlinelist}">
	<tr>
		<td>${c.salary_workingTime}</td>
		<td>${c.salary_workingDate}</td>
		<td>${c.laborcosts}</td>
		<td>${c.salary_workingTime*c.salary_workingDate*c.laborcosts}원</td><%-- ${c.laborcosts_total} --%>
		<td>${c.payment_cash}</td>
		<td>${c.payment_card}</td>
		<td>${c.payment_point}</td>
		<td>${c.order_pr_ea}</td>
		<td>${c.orsa_qt }</td>
		<td>${c.salary_empregister_empnum}</td>
		<td>${c.empregister_grade}</td>
		<td>${c.payment_state}</td>
		<td>${c.order_end}</td>
		<td><fmt:formatDate value="${c.laborcosts_date}" pattern="yyyy-MM-dd"/></td>
	</tr> 
</c:forEach> 
</table>
</div>
<%-- <br><br><br><br><br><br><br><br><br>
${getdeadlineList}<br>
${day_profit}<br>
${month_profit}<br>
${day_expenditure}<br>
${month_expenditure}<br>
${day_refund}<br>
${day_worktime}<br>
${month_worktime}<br>
${day_max_profit}<br>
${month_max_profit} --%>
</body>
</html>