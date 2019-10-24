<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	/* function EmpregisterInsert(){
		event.preventDefault();
		swal({
	           title: "?±ë¡?˜ì‹œê² ìŠµ?ˆê¹Œ?",
	           icon: "warning",
	           buttons: ["?„ë‹ˆ??", "??"],
	           dangerMode: true,
	         }).then((willDelete) => {
	              if (willDelete) {
	            	  $("#insert").submit;
	            	  swal({
	                      title: "?±ë¡?˜ì—ˆ?µë‹ˆ??.",
	                      icon: "success",
	                      button: "?«ê¸°",
	                    }).then((value) => {
	                		opener.document.location.reload();
	                		window.close();
	                    };
	              }
	         });
		
	}  */

	function EmpregisterInsert() {
		$("#insert").submit;
		opener.parent.list();
	
	
	}
	//ì£¼ì†Œ?•ë³´
	
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
	

</script>
</head>
<body>
	<form name="EmpRegisterInsertForm" id="insert"
		action="EmpRegisterInsert" method="post" enctype="multipart/form-data">
		<table cellspacing='1' cellpadding='0' border='0' bgcolor='#000000' align='center'>
			<tr>
			
				<td colspan='3' rowspan='3' width='120' class='ti'>
					<div class="row form-group">
					<div class="col col-md-3">
						<label for="file-input" class=" form-control-label">?¬ì§„</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="file" id="file-input" name="file" class="form-control-file">
					</div>
				</div>
				</td>

				<td rowspan='2' class='ti' width='100'>?±ëª…</td>
				<td rowspan='2' width='150'><input type="text"
					name="empregister_name"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='2' class='ti' width='200'>ì£? ë¯? ?? ë¡? ë²? ??</td>
			</tr>
			<tr>
				<td colspan='2'><input type="text" name="empregister_jumin"
					style="border: none; background: transparent; text-align: center">-<input
					type="text" name="empregister_jumin2"
					style="border: none; background: transparent; text-align: center"></td>

			</tr>
			<tr>
				<td colspan='2' class='ti' width='100'>?¬ë²ˆ <input type="text"
					name="empregister_empnum"
					style="border: none; background: transparent; text-align: center">
				<td class='ti' colspan='1'>?±ë³„
				<td class='ti'>??<input type="radio" name="empregister_gender"
					value="??"> ??<input type="radio" name="empregister_gender"
					value="??">

				</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>?°ë½ì²?</td>
				<td colspan='2' class='ti'><input type="text"
					name="empregister_tel"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='1' class='ti'>?˜ì´</td>
				<td><input type="number" name="empregister_age"
					style="border: none; background: transparent; text-align: center"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3' rowspan='2'>ê±°ì£¼ì§€</td>
				<td class='ti'><input type="button"
					onclick="sample4_execDaumPostcode()" value="?°í¸ë²ˆí˜¸ ì°¾ê¸°"></td>
				<td><input type="text" id="sample4_postcode" placeholder="?°í¸ë²ˆí˜¸"
					name="empregister_addr"></td>
				<td class='ti' rowspan='1' width='100'><input type="text"
					id="sample4_roadAddress" name="empregister_addr2"
					placeholder="?„ë¡œëª…ì£¼??"><br></td>
				<td rowspan='1'><input type="text" id="sample4_jibunAddress"
					name="empregister_addr3" placeholder="ì§€ë²ˆì£¼??"></td>

			</tr>
			<tr>
				<td>
				<td class='ti'><input type="text" id="sample4_detailAddress"
					name="empregister_addr4" placeholder="?ì„¸ì£¼ì†Œ"></td>

				<td class='ti'>ì§ê¸‰</td>
				<td><input type="text" name="empregister_grade"
					style="border: none; background: transparent; text-align: center"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>?€?‰ëª…</td>
				<td class='ti' colspan="2"><select name="empregister_bankname">
						<option value="?˜ë‚˜?€??">?˜ë‚˜?€??</option>
						<option value="êµ???€??">êµ???€??</option>
						<option value="ê¸°ì—…?€??" selected="selected">ê¸°ì—…?€??</option>
				</select></td>


				<td class='ti' width='100'>?ˆê¸ˆì£?</td>

				<td><input type="text"
					style="border: none; background: transparent; text-align: center"
					name="empregister_accountholder"></td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>ê³„ì¢Œë²ˆí˜¸</td>
				<td class='ti' colspan="2"><input type="text"
					style="border: none; background: transparent; text-align: center"
					name="empregister_banknum"></td>
				<td colspan='1' class='ti'>ê¸‰ì—¬ êµ¬ë¶„</td>
				<td>?œê¸‰<input type="radio" name="empregister_payclassfiy" value="?œê¸‰"> 
					?¼ê¸‰<input type="radio" name="empregister_payclassfiy" value="?¼ê¸‰">
				
				</td>

			</tr>

			<tr>

				<td class='ti' colspan='3'>?…ì‚¬ ? ì§œ</td>
				<td class='ti' colspan='2' name="empregister_entryday"></td>
				<td colspan='1' class='ti' >?¬ì§ ?¬ë?</td>
				<td clospan='2'>?¬ì§ì¤?<input type="radio" name="empregister_leavecompany"
				value="?¬ì§ì¤?"> ?´ì§<input type="radio"
				value="?´ì§"  name="empregister_leavecompany" >
				</td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>?œê¸‰</td>

				<td colspan='2'><input type="number" name="empregister_pay"
					style="border: none; background: transparent; text-align: center">ì²œì›</td>
				<td class='ti' colspan='1'>?¼ê¸‰</td>
				<td><input type="number" name="empregister_pay"
					style="border: none; background: transparent; text-align: center">ë§Œì›</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>ì´? ê·¼ë¬´?œê°„</td>


				<td colspan='3'><input type="number"
					name="empregister_workplan"> <%-- <select id="empregister_workplan"
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
					<button onclick="EmpregisterInsert()" id="insertform">?¬ì› ?±ë¡</button> <!-- 	<input type="button" value="?°ê¸°" onclick="document.getElementById('insert').submit();" /> -->
					<input type="reset" value="ì·¨ì†Œ" />
				</td>
			</tr>
	
			<tr>
		</table>
	</form>

</body>
</html>