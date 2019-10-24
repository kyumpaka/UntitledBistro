<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@include file="Show_List.jsp" %>

	 <form name="form1" method="post" action="Day_DeadLineForm.html" >
<h2 align="center">매니저 입력</h2>
		<table style="width: 1200px; margin: auto;" border="1">
		
			<tr>
				<td>현금</td>
				<td><input type="number" name="jungsan_input_cash" value="0"/></td>
				<td>카드</td>
				<td><input type="number" name="jungsan_input_card" value="0"/></td>
				<td>포인트사용</td>
				<td><input type="number" name="jungsan_input_point" value="0"/></td>
			</tr>
			<tr>
				<td>지출</td>
				<td><input type="number" name="jungsan_input_expenditure" value="0"/></td>
				<td>근무시간</td>
				<td><input type="number" name="jungsan_input_worktime" value="0"/></td>
				<td>기입자</td>
				<td><input type="text" name="jungsan_input_grade"value="매니져"/></td>
			</tr>
			<tr>
			
				<td>환불 유무</td>
				<td>
					<input type="radio" name="type" value="유"  onclick="typeInput()">환불 유
					<input type="radio" name="type" value="무"  checked="checked" onclick="typeInput()">환불 무
				</td>				
				<td>환불 금액</td>
				<td><div id="price"></div></td>
				<td>환불내용</td>
				<td><div id="content"></div></td>
				</tr>
			</table>
			<div align="center">
				<input type="reset" value="취소"/>
				<input type="submit" value="저장"/>
			</div>
			</form>
			


</body>
<script type="text/javascript">
function typeInput() {
	var type = $('input[name="type"]:checked').val();
	var frm = "";
	if(type == '유') {
		frm = '<input type="number" name="jungsan_input_refund" value="0"/>';
		$("#price").html(frm);
		frm = '<textarea name="jungsan_input_reason" placeholder="내용을 기입하세요" ></textarea>';
		$("#content").html(frm);
	} else if(type == '무') {
		frm = '<input type="number" name="jungsan_input_refund" value="0" disabled="disabled"/>';
		$("#price").html(frm);
		frm = '<textarea name="jungsan_input_reason" placeholder="내용을 기입하세요" disabled="disabled"></textarea>';
		$("#content").html(frm);
	}
}
</script>
</html>