<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(".Seobis_MemberUpdate").on("click", function(){
    var member_id = $(this).parent().parent().children().eq(0).text();
    if(confirm("회원 ID : "+member_id+"을 수정하시겠습니까?")){
        $(location).attr("href", "${path}/Seobis_update?member_id=" + member_id);
    }
});
</script>
<form method="post"   action="Seobis_update">
	<h1  class="text_center">회원 정보 상세</h1>
	<c:forEach items="${Seobis_MemberUpdate}" var="c">
		<table  align="center">
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="member_id" value="${c.member_id} readonly="readonly"></td>
	   </tr>
	    <tr>
	       <td width="200"><p align="right">이름</td>
	       <td width="400"><p><input type="text" name="member_name" value="${c.member_name}"></td>
	    </tr>
	    <tr>
	    	<td width="200"><p align="right">남자</td>
	    	<td width="400"><p><input type="radio" name="member_gender" value="${c.member_gender}" ></td>
	     </tr>
	    <tr>
	    	<td width="200"><p align="right">여자</td>
	    	<td width="400"><p><input type="radio" name="member_gender" value="${c.member_gender}"></td>
	     </tr>
	    <tr>
	       <td width="200"><p align="right">이메일</td>
	       <td width="400"><p><input type="text" name="member_email" value="${c.member_email}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">전화 번호</td>
	       <td width="400"><p><input type="text" name="member_phone1" value="${c.member_phone1}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="submit" value="수정" ></td>
	    </tr>
	</table>
	</c:forEach>
	
	</form>
</body>
</html>