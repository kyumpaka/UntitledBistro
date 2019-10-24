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
					// ?ì—…?ì„œ ê²€?‰ê²°ê³? ??ª©?? ?´ë¦­?ˆì„?? ?¤í–‰?? ì½”ë“œë¥? ?‘ì„±?˜ëŠ” ë¶€ë¶?.

					// ?„ë¡œëª? ì£¼ì†Œ?? ?¸ì¶œ ê·œì¹™?? ?°ë¼ ì£¼ì†Œë¥? ?œì‹œ?œë‹¤.
					// ?´ë ¤?¤ëŠ” ë³€?˜ê? ê°’ì´ ?†ëŠ” ê²½ìš°?? ê³µë°±('')ê°’ì„ ê°€ì§€ë¯€ë¡?, ?´ë? ì°¸ê³ ?˜ì—¬ ë¶„ê¸° ?œë‹¤.
					var roadAddr = data.roadAddress; // ?„ë¡œëª? ì£¼ì†Œ ë³€??
					var extraRoadAddr = ''; // ì°¸ê³  ??ª© ë³€??

					// ë²•ì •?™ëª…?? ?ˆì„ ê²½ìš° ì¶”ê??œë‹¤. (ë²•ì •ë¦¬ëŠ” ?œì™¸)
					// ë²•ì •?™ì˜ ê²½ìš° ë§ˆì?ë§? ë¬¸ìê°€ "??/ë¡?/ê°€"ë¡? ?ë‚œ??.
					if (data.bname !== '' && /[??ë¡?ê°€]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// ê±´ë¬¼ëª…ì´ ?ˆê³ , ê³µë™ì£¼íƒ?? ê²½ìš° ì¶”ê??œë‹¤.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// ?œì‹œ?? ì°¸ê³ ??ª©?? ?ˆì„ ê²½ìš°, ê´„í˜¸ê¹Œì? ì¶”ê??? ìµœì¢… ë¬¸ì?´ì„ ë§Œë“ ??.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// ?°í¸ë²ˆí˜¸?€ ì£¼ì†Œ ?•ë³´ë¥? ?´ë‹¹ ?„ë“œ?? ?£ëŠ”??.
					document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById("sample4_roadAddress").value = roadAddr;
					document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

					// ì°¸ê³ ??ª© ë¬¸ì?´ì´ ?ˆì„ ê²½ìš° ?´ë‹¹ ?„ë“œ?? ?£ëŠ”??.
					if (roadAddr !== '') {
						document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					} else {
						document.getElementById("sample4_extraAddress").value = '';
					}

					var guideTextBox = document.getElementById("guide");
					// ?¬ìš©?ê? '? íƒ ?ˆí•¨'?? ?´ë¦­?? ê²½ìš°, ?ˆìƒ ì£¼ì†Œ?¼ëŠ” ?œì‹œë¥? ?´ì???.
					if (data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document.getElementById("sample4_roadAddress").value = extraRoadAddr;
						guideTextBox.innerHTML = '(?ˆìƒ ?„ë¡œëª? ì£¼ì†Œ : '
								+ expRoadAddr + ')';
						guideTextBox.style.display = 'block';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document.getElementById("sample4_jibunAddress").value = expJibunAddr;
						guideTextBox.innerHTML = '(?ˆìƒ ì§€ë²? ì£¼ì†Œ : '
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

function payclassfiy(){
	$("input:radio[name='empregister_payclassfiy']").is(":checked");
	
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
				<td rowspan='2' class='ti' width='100'>?±ëª…</td>
				<td rowspan='2' class='ti'>${b.empregister_name}</td>
				<td colspan='2' class='ti' width='200'>ì£? ë¯? ?? ë¡? ë²? ??</td>
			</tr>
			<tr>
				<td colspan='2'class='ti'>${b.empregister_jumin }-${b.empregister_jumin2 }</td>

			</tr>
			<tr>
				<td colspan='1' class='ti' width='100'>?¬ë²ˆ</td>
					<td class='ti'>${b.empregister_empnum }<input type="hidden" name="empregister_empnum" value="${b.empregister_empnum }"></td>
					<td class='ti' colspan='1'>?±ë³„</td>
					<td class='ti'>${b.empregister_gender }</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>?°ë½ì²?</td>
				<td colspan='2' class='ti'><input type="text"
					name="empregister_tel" value="${b.empregister_tel }"></td>
				<td colspan='1' class='ti'>?˜ì´</td>
				<td><input type="number" name="empregister_age" value="${b.empregister_age }"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3' rowspan='2'>ê±°ì£¼ì§€</td>
				<td class='ti'><input type="button"
					onclick="sample4_execDaumPostcode()" value="?°í¸ë²ˆí˜¸ ì°¾ê¸°"></td>
				<td class='ti'><input type="text" id="sample4_postcode" value="${b.empregister_addr }"
					name="empregister_addr"></td>
				<td class='ti' rowspan='1'><input type="text"
					id="sample4_roadAddress" name="empregister_addr2"
					value="${b.empregister_addr2 }"><br></td>
				<td rowspan='1' class='ti'><input type="text" id="sample4_jibunAddress"
					name="empregister_addr3" value="${b.empregister_addr3 }"></td>

			</tr>
			<tr>
				<td class='ti'>?ì„¸ì£¼ì†Œ
				<td class='ti'><input type="text" id="sample4_detailAddress"
					name="empregister_addr4" value="${b.empregister_addr4 }"></td>

				<td class='ti'>ì§ê¸‰</td>
				<td class='ti'><input type="text" name="empregister_grade"
					value="${b.empregister_grade}"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>?€?‰ëª…</td>
				<td class='ti' colspan="2"><select name="empregister_bankname">
						<option value="?˜ë‚˜?€??">?˜ë‚˜?€??</option>
						<option value="êµ???€??">êµ???€??</option>
						<option value="ê¸°ì—…?€??" selected="selected">${b.empregister_bankname }</option>
				</select></td>


				<td class='ti' width='100'>?ˆê¸ˆì£?</td>

				<td class='ti'><input type="text" name="empregister_accountholder" value="${b.empregister_accountholder}"></td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>ê³„ì¢Œë²ˆí˜¸</td>
				<td colspan='2'><input type="text" name="empregister_banknum" value="${b.empregister_banknum}"></td>
				<td colspan='1' class='ti' id="payclassfiy ">ê¸‰ì—¬ êµ¬ë¶„</td>
				<td>?œê¸‰<input type="radio" id="payclassfiy1" name="empregister_payclassfiy" value="?œê¸‰">
				?¼ê¸‰<input type="radio" id="payclassfiy2"name="empregister_payclassfiy" value="?¼ê¸‰">
				</td>


			</tr>

			<tr>

				<td class='ti' colspan='3'>?…ì‚¬ ? ì§œ</td>
				<td class='ti' colspan='2'><fmt:formatDate value="${b.empregister_entryday }"
						pattern="yyyy-MM-dd" /></td>
				<td colspan='1' class='ti' >?¬ì§ ?¬ë?</td>
				<td colspan='2'><input type="radio" name="empregister_leavecompany" value="?¬ì§ì¤?">?¬ì§ì¤?
				<input type="radio" name="empregister_leavecompany" value="?´ì§">?´ì§
				</td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>?œê¸‰</td>
				<td colspan='2'><input type="number" name="empregister_pay" value="${b.empregister_pay }">ì²œì›</td>
				<td class='ti' colspan='1'>?¼ê¸‰</td>
				<td colspan='2'><!--<input type="number" name="empregister_pay" value="${b.empregister_pay }">-->ë§Œì›</td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>ì´ê·¼ë¬´ì‹œê°?</td>


				<td colspan='3'><input type="number"
					name="empregister_workplan" value="${b.empregister_workplan}">?œê°„<%-- <select id="empregister_workplan"
					name="empregister_workplan">
						<option value="empregister_workplan">?œê°„ ? íƒ</option>
						<%
							for (int i = 1; i <= 24; i++) {
						%>
						<option value="<%=i%>"><%=i + "??"%></option>
						<%
							}
						%>

				</select> --%></td>
				<td>
			<button  onclick="EmpregisterUpdate()" >?±ë¡</button>
				</td>
			</tr>
		</table>	
	</form>


</body>
</html>