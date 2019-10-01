<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<style>
td {
	background-color: #FFFFFF;	
	height: 30px;
}

.ti {
	font-weight: bold;
	font-size: 12px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
 
function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById("sample4_roadAddress").value = roadAddr;
					document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					} else {
						document.getElementById("sample4_extraAddress").value = '';
					}

					var guideTextBox = document.getElementById("guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document.getElementById("sample4_roadAddress").value = extraRoadAddr;
						guideTextBox.innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr + ')';
						guideTextBox.style.display = 'block';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document.getElementById("sample4_jibunAddress").value = expJibunAddr;
						guideTextBox.innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr + ')';
						guideTextBox.style.display = 'block';
					} else {
						guideTextBox.innerHTML = '';
						guideTextBox.style.display = 'none';
					}
					getlatlng(roadAddr, data.jibunAddress);
				}
			}).open();
}


function EmpRegisterUpdate(empregister_empnum){
	$("#update").submit;
/* 	window.close(); */
	
}


</script>
</head>

<body>
	<form name="EmpRegisterUpdateForm"  id="update" Action="EmpRegisterUpdate" method="post">
		<table cellspacing='1' cellpadding='0' border='0' bgcolor='#000000'align='center'>
			<tr>
				<td colspan='3' rowspan='3' class='ti' >
					<div class="img-wrap" >
				<img src="${pageContext.request.contextPath}/resources/images/insa/${ b.empregister_photo }" width="120" height="120">
				</div>
				</td>
				<td rowspan='2' class='ti' width='100'>성명</td>
				<td rowspan='2' class='ti'>${b.empregister_name}</td>
				<td colspan='2' class='ti' width='200'>주 민 등 록 번 호</td>
			</tr>
			<tr>
				<td colspan='2'class='ti'>${b.empregister_jumin }-${b.empregister_jumin2 }</td>

			</tr>
			<tr>
				<td colspan='1' class='ti' width='100'>사번</td>
					<td class='ti'>${b.empregister_empnum }</td>
					<td class='ti' colspan='1'>성별</td>
					<td class='ti'>${b.empregister_gender }</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>연락처</td>
				<td colspan='2' class='ti'><input type="text"
					name="empregister_tel" value="${b.empregister_tel }"></td>
				<td colspan='1' class='ti'>나이</td>
				<td><input type="number" name="empregister_age" value="${b.empregister_age }"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3' rowspan='2'>거주지</td>
				<td class='ti'><input type="button"
					onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
				<td class='ti'><input type="text" id="sample4_postcode" placeholder=${b.empregister_addr }
					name="empregister_addr"></td>
				<td class='ti' rowspan='1'><input type="text"
					id="sample4_roadAddress" name="empregister_addr2"
					placeholder="${b.empregister_addr2 }"><br></td>
				<td rowspan='1' class='ti'><input type="text" id="sample4_jibunAddress"
					name="empregister_addr3" placeholder="${b.empregister_addr3 }"></td>

			</tr>
			<tr>
				<td class='ti'>상세주소
				<td class='ti'><input type="text" id="sample4_detailAddress"
					name="empregister_addr4" placeholder="${b.empregister_addr4 }"></td>

				<td class='ti'>직급</td>
				<td class='ti'><input type="text" name="empregister_grade"
					value="${b.empregister_grade}"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>은행명</td>
				<td class='ti' colspan="2"><select name="empregister_bankname">
						<option value="하나은행">하나은행</option>
						<option value="국민은행">국민은행</option>
						<option value="기업은행" selected="selected">${b.empregister_bankname }</option>
				</select></td>


				<td class='ti' width='100'>예금주</td>

				<td class='ti'><input type="text" name="empregister_accountholder" value="${b.empregister_accountholder}"></td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>계좌번호</td>
				<td colspan='2'><input type="text" name="empregister_banknum" value="${b.empregister_banknum}"></td>
				<td colspan='1' class='ti' >급여 구분</td>
				<td>시급<input type="radio" name="empregister_payclassfiy"
					value="시급"> 일급<input type="radio"
					value="일급" >
				</td>

			</tr>

			<tr>

				<td class='ti' colspan='3'>입사 날짜</td>
				<td class='ti' colspan='2'><fmt:formatDate value="${b.empregister_entryday }"
						pattern="yyyy-MM-dd" /></td>
				<td colspan='1' class='ti' >재직 여부</td>
				<td clospan='2'>재직중<input type="radio" name="empregister_leavecompany"
					value="재직중" checked="${b.empregister_leavecompany}"> 퇴직<input type="radio"
					 value="퇴직" >
				</td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>시급</td>
				<td colspan='2'><input type="number" name="empregister_pay" value="${b.empregister_pay }">천원</td>
				<td class='ti' colspan='1'>일급</td>
				<td colspan='2'><!--<input type="number" name="empregister_pay" value="${b.empregister_pay }">-->만원</td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>총근무시간</td>


				<td colspan='3'><input type="number"
					name="empregister_workplan" value="${b.empregister_workplan}">시간<%-- <select id="empregister_workplan"
					name="empregister_workplan">
						<option value="empregister_workplan">시간 선택</option>
						<%
							for (int i = 1; i <= 24; i++) {
						%>
						<option value="<%=i%>"><%=i + "시"%></option>
						<%
							}
						%>

				</select> --%></td>
				<td>
			<button  onclick="EmpregisterUpdate()" id="updateform">등록</button>
				</td>
			</tr>
		</table>	
	</form>

</body>
</html>