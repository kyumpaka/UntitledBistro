<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
 업데이트 폼 입니다.
 <form action="Update.html">
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
				<td>직급</td>
				<td><input type="text" name="jungsan_input_grade" value="매니져"/></td>
			</tr>
			<tr>
				<td>환불 유무</td>
				<td>환불 유<input type="radio">환불 무<input type="radio" value="무"></td>				
				<td>환불 금액</td>
				<td><input type="number" name="jungsan_input_refund" value="0"/></td>
				<td>환불내용</td>
				<td><textarea name="jungsan_input_reason" placeholder="내용을 기입하세요"></textarea></td>
				</tr>
			</table>
			<div align="center">
				<input type="reset" value="취소"/>
				<input type="submit" value="저장"/>
			</div>
 </form>
</body>
</html>