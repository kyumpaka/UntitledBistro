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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		if("${Seobis_memberSelect.member_gender}" == "girl"){
			$("#girl").attr("checked", true);
			/* $("#girl").prop("checked",true); */
		}
		if("${Seobis_memberSelect.member_gender}" == "man"){
			$("#man").attr("checked", true);
			/* $("#girl").prop("checked",true); */
		} 
	});

	function sub() {
		   if(confirm("회원 ID : ${Seobis_memberSelect.member_id}을 수정하시겠습니까?")){
		        return true; 
		    }
		   return false;
	}
	
    /* var member_id = $(this).parent().parent().children().eq(0).text(); */
    	
    

</script>
<form method="post"   action="${pageContext.request.contextPath}/Seobis_update" onsubmit="return sub()">
	<h1  class="text_center">회원 정보 수정</h1>
		<table  align="center">
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="member_id" value="${Seobis_memberSelect.member_id}" readonly="readonly"></td>
	   </tr>
	    <tr>
	       <td width="200"><p align="right">이름</td>
	       <td width="400"><p><input type="text" name="member_name" value="${Seobis_memberSelect.member_name}"></td>
	    </tr>
	    <tr>
	    	<td width="200"><p align="right">남자</td>
	    	<c:if test="${Seobis_memberSelect.member_gender == 'man' }">
		    	<td width="400"><p><input type="radio" name="member_gender" value="man"  checked="checked"></td>
	    	</c:if>
	    	<c:if test="${Seobis_memberSelect.member_gender != 'man' }">
		    	<td width="400"><p><input type="radio" name="member_gender" value="man" ></td>
	    	</c:if>
	    </tr>
	    <tr>
	    	<td width="200"><p align="right">여자</td>
	    	<c:if test="${Seobis_memberSelect.member_gender == 'girl' }">
	    	<td width="400"><p><input type="radio" name="member_gender" value="girl"  checked="checked"></td>
	    	</c:if>
	    	<c:if test="${Seobis_memberSelect.member_gender != 'girl' }">
	    	<td width="400"><p><input type="radio" name="member_gender" value="girl" ></td>
	    	</c:if>
	     </tr>
	     <tr>
	       <td width="200"><p align="right">생일</td>
	       <td width="400"><p><input type="text" name="member_birth" value="${Seobis_memberSelect.member_birth}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이메일</td>
	       <td width="400"><p><input type="text" name="member_email" value="${Seobis_memberSelect.member_email}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">전화 번호</td>
	       <td width="400"><p><input type="text" name="member_phone1" value="${Seobis_memberSelect.member_phone1}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">전화 번호2</td>
	       <td width="400"><p><input type="text" name="member_phone2" value="${Seobis_memberSelect.member_phone2}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">주소</td>
	       <td width="400"><p><input type="text" name="member_addr1" value="${Seobis_memberSelect.member_addr1}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">주소 2</td>
	       <td width="400"><p><input type="text" name="member_addr2" value="${Seobis_memberSelect.member_addr2}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="submit" value="수정" ></td>
	    </tr>
	</table>
	
	</form>
</body>
</html>