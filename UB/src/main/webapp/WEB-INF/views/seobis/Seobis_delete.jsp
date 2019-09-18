<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글 삭제</h1>
<a href="list.htm?pg=${param.pg}">리스트</a>
<form name="f"  action ="delete.htm" method="post">
<table width="400">
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="hidden" name="pg" value="${param.pg}" />
			<input type="hidden" name="num" value="${param.num}" />
			<input type="password" name="pwd" size="12" maxlength="12"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left">
			<input type="button" value="삭제" onclick="deletepro()"/>
			<input type="button" value="취소"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>