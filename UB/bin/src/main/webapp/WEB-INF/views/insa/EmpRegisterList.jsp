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
	//alert("??†ú")
	location.href="/UntitledBistro/EmpRegisterRead?empregister_empnum="+empnum; 
}

function list(){
	alert("?±Î°ù?ÑÎ£å");
	window.location.href=window.location.href;
	window.location.replace('EmpRegisterList'); 

}

function EmpRegisterRead(empnum){
	//alert("??†ú");
	location.href="/UntitledBistro/EmpRegisterRead?empregister_empnum="+empnum; 
}

function list(){
	alert("?±Î°ù?ÑÎ£å");
	window.location.href=window.location.href;
	window.location.replace('EmpRegisterList'); 

}

</script>
<meta charset="UTF-8">
<title>Î¶¨Ïä§??</title>
</head>
<body>
	<table class="table table-bordered">

		<tr>
			<th>?¥Î¶Ñ</th>
			<th>?¨Î≤à</th>
			<th>?òÏù¥</th>
			<th>?ÑÌôîÎ≤àÌò∏</th>
			<th>Ï£ºÎ?1</th>
			<th>Ï£ºÎ?2</th>
			<th>ÏßÅÍ∏â</th>
			<th>?ÖÏÇ¨?†Ïßú</th>
			<th>?¨ÏßÅ?¨Î?</th>
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
				<td><a href="/UntitledBistro/EmpRegisterRead?empregister_empnum=${b.empregister_empnum }" onclick="window.open(this.href, '_blank', 'width=1000,height=700,toolbars=no,scrollbars=yes'); return false;">?ÅÏÑ∏Î≥¥Í∏∞</a></td>
			</tr>

		</c:forEach>
	</table>
	<table width="600">

		<tr>
			<td align="center">
				<!-- Ï≤òÏùå ?¥Ï†Ñ ÎßÅÌÅ¨ --> <c:if test="${pg>block}">	
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="EmpRegisterList?pg=1">?Ä?Ä</a>]
			[<a href="EmpRegisterList?pg=${fromPage-1}">?Ä</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">?Ä?Ä</span>]	
			[<span style="color: gray">?Ä</span>]
		</c:if> <!-- Î∏îÎ°ù Î≤îÏúÑ Ï∞çÍ∏∞ --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="EmpRegisterList?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- ?§Ïùå, ?¥ÌõÑ --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="EmpRegisterList?pg=${toPage+1}">??</a>]
				[<a href="EmpRegisterList?pg=${allPage}">?∂‚ñ∂</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">??</span>]
				[<span style="color: gray">?∂‚ñ∂</span>]
		
		</c:if>

			</td>
			<td><button onclick="window.open('EmpRegisterInsertForm','insert','width=1000,height=400,location=no,status=no,scrollbars=yes');">?¨Ïõê?±Î°ù</button>

			</td>
		</tr>
	</table>




</body>
</html>