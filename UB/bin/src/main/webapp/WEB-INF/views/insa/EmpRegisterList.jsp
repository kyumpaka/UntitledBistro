<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

function EmpRegisterRead(empnum){
	//alert("삭제");
	location.href="/UntitledBistro/EmpRegisterRead?empregister_empnum="+empnum; 
/*   window.open('/UntitledBistro/EmpRegisterRead?EmpRegister_empnum='+empnum , '_blank', 'width=1000,height=1500,location=no,status=no,scrollbars=yes' ); 
 */
}
</script>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
	<table class="table table-bordered">

		<tr>
			<th>이름</th>
			<th>사번</th>
			<th>나이</th>
			<th>전화번호</th>
			<th>주민1</th>
			<th>주민2</th>
			<th>직급</th>
			<th>입사날짜</th>
			<th>퇴사여부</th>
		</tr>
		<c:forEach var="b" items="${EmpRegisterList}">

			<tr>
				<td>${b.empregister_name}</td>

				<td><a href="/UntitledBistro/EmpRegisterRead?empregister_empnum=${b.empregister_empnum }" onclick="window.open(this.href, '_blank', 'width=700,height=600,toolbars=no,scrollbars=yes'); return false;">${b.empregister_empnum }</a></td>

				<%-- <td>${b.empregister_empnum }</td> --%>
				<td>${b.empregister_age }</td>
				<td>${b.empregister_tel }</td>
				<td>${b.empregister_jumin }</td>
				<td><c:if
						test="${b.empregister_jumin2 ne null && b.empregister_jumin2!=''}">
${fn:substring(b.empregister_jumin2,1,fn:length(b.empregister_jumin2)-4)}******</c:if>
				</td>
				<td>${b.empregister_grade 	}</td>
				<td><fmt:formatDate value="${b.empregister_entryday }"
						pattern="yyyy-MM-dd" /></td>
				<td>${b.empregister_leavecompany }</td>
				
				<!-- <button onclick="window.open('EmpRegisterRead','Read','width=1000,height=1500,location=no,status=no,scrollbars=yes');">상세보기</button> -->
			</tr>

		</c:forEach>
	</table>
	<table width="600">

		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="EmpRegisterList?pg=1">◀◀</a>]
			[<a href="EmpRegisterList?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="EmpRegisterList?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="EmpRegisterList?pg=${toPage+1}">▶</a>]
				[<a href="EmpRegisterList?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>

			</td>
			<td><button
					onclick="window.open('EmpRegisterInsertForm','insert','width=1000,height=400,location=no,status=no,scrollbars=yes');">사원등록</button>

			</td>
		</tr>
	</table>




</body>
</html>