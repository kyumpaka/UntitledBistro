<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>리스트</title>
<style type="text/css">
	th{background: orange};
</style>

</head>
<body>

<h1>회원 목록</h1>

<table width="1000" cellpadding="3">
	<tr>
		<th width="150">회원 아이디</th>
		<th width="150">회원 이름</th>
		<th width="100">회원 등급</th>
		<th width="150">회원 포인트</th>
		<th width="150">전화번호</th>
		<th width="200">가입일</th>
		<th width="150">상세 정보</th>
		<th width="100">삭제</th>
	</tr>	

<c:forEach var="b" items="${Seobis_memberList}">
	<tr>
		<td>${b.member_id}</td>
		<td>${b.member_name}</td>
		<td>${b.member_grade}</td>
		<td>${b.member_point}</td>
		<td>${b.member_phone1}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${b.member_reg}" /></td>
		<td><button onclick='location.href="${path}/Seobis_update?member_id=${b.member_id}"'>상세 정보</button></td>
		<td><button class="Seobis_MemberDelete" >삭제</button></td>
	
		
		<%-- <td><a href="read.htm?num=${b.num}&pg=${pg}">${b.subject}</a></td>
		<td>${b.name}</td>
		<td><fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/></td>
		<td>${b.hit}</td> --%>
	</tr>
</c:forEach>

</table>
<div style="width:1000px;text-align:right"><a href="Seobis_jUs">회원 등록</a></div>
<table width="1000">
<tr>
	<td align="center">
		<!-- 처음 이전 링크 -->
		<c:if test="${pg>block}">  <!-- 5>10 : false / 15>10 : true -->
			[<a href="Seobis_memberList?pg=1">◀◀</a>]
			[<a href="Seobis_memberList?pg=${fromPage-1}">◀</a>]		
		</c:if>
		<c:if test="${pg<=block}"> <!-- 5<=10 :true / 15<=10:false -->
			[<span style="color:gray">◀◀</span>]	
			[<span style="color:gray">◀</span>]
		</c:if>
		
		<!-- 블록 범위 찍기 -->
		<c:forEach begin="${fromPage}" end="${toPage}" var="i">
			<c:if test="${i==pg}">[${i}]</c:if>
			<c:if test="${i!=pg}">
				[<a href="Seobis_memberList?pg=${i}">${i}</a>]
			</c:if>
		</c:forEach>
		
		<!-- 다음, 이후 -->
		<c:if test="${toPage<allPage}"> <!-- 20<21 : true -->
				[<a href="Seobis_memberList?pg=${toPage+1}">▶</a>]
				[<a href="Seobis_memberList?pg=${allPage}">▶▶</a>]
		
		</c:if>	
		<c:if test="${toPage>=allPage}"> <!-- 21>=21 :true -->
				[<span style="color:gray">▶</span>]
				[<span style="color:gray">▶▶</span>]
		
		</c:if>			
		
	</td>
</tr>
</table>
</body>

<script type="text/javascript">


$(".Seobis_MemberDelete").on("click", function(){
    var member_id = $(this).parent().parent().children().eq(0).text();
    if(confirm("회원 ID : "+member_id+"을 삭제하시겠습니까?")){
        $(location).attr("href", "${path}/Seobis_delete?member_id=" + member_id);
    }
});

</script>
</html>