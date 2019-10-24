<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>


<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
//ì£¼ì†Œ?•ë³´
		function test1(){
		var obj = document.EmpRegisterInsertForm;
		if(obj.empregister_name.value == '' ){
			swal('?´ë¦„?? ?…ë ¥?˜ì„¸??');
			obj.empregister_name.focus();
			return false;
		}
		
		if(obj.empregister_jumin.length < 6 ){
			swal('ì£¼ë??±ë¡ë²ˆí˜¸ ?ìë¦¬ë? ?•í™•?? ?…ë ¥?´ì£¼?¸ìš”');
			obj.empregister_jumin.focus();
			return false;
		}
		if(obj.empregister_jumin2.length < 7 ){
			swal('ì£¼ë??±ë¡ë²ˆí˜¸ ?·ìë¦¬ë? ?•í™•?? ?…ë ¥?´ì£¼?¸ìš”');
			obj.empregister_jumin2.focus();
			return false;
		}
		if(obj.empregister_empnum.value == '' ){
			swal('?¬ë²ˆ?? ?…ë ¥?˜ì„¸??');
			obj.empregister_empnum.focus();
			return false;
		}
		if($(':radio[name="empregister_gender"]:checked').length < 1){
			swal('?±ë³„?? ì²´í¬?´ì£¼?¸ìš” ');
			return false; 
			}
		if(obj.empregister_tel.length < 11 ){
			swal('?¸ë“œ?°ì„ ?•í™•?? ?…ë ¥?´ì£¼?¸ìš”');
			obj.empregister_tel.focus();
			return false;
		}
		if(isNaN($("#empregister_tel").val)){
		swal('?¸ë“œ?? ë²ˆí˜¸ë¥? ?«ìë¡œë§Œ ?…ë ¥?´ì£¼?¸ìš”');
		obj.empregister_tel.focus();
			}
		if(obj.empregister_age.value == '' ){
			swal('?˜ì´ë¥? ?…ë ¥?˜ì„¸??');
			obj.empregister_age.focus();
			return false;
		}
		if(obj.sample4_postcode.value == '' ){
			swal('?°í¸ë²ˆí˜¸ë¥? ?…ë ¥?´ì£¼?¸ìš”');
			obj.sample4_postcode.focus();
			return false;
		}
		if(obj.empregister_grade.value == '' ){
			swal('ì§ê¸‰?? ? íƒ?´ì£¼?¸ìš” ');
			obj.empregister_grade.focus();
			return false;
		}
		if(obj.empregister_bankname.value == '' ){
			swal('?€?‰ì„ ? íƒ?´ì£¼?¸ìš” ');
			obj.empregister_bankname.focus();
			return false;
		}
		if(obj.empregister_accountholder.value == '' ){
			swal('?ˆê¸ˆì£¼ë? ?ì–´ì£¼ì„¸?? ');
			obj.empregister_accountholder.focus();
			return false;
		}
		
		if(obj.empregister_banknum.value == '' ){
			swal('ê³„ì¢Œë²ˆí˜¸ë¥? ?ì–´ì£¼ì„¸?? ');
			obj.empregister_banknum.focus();
			return false;
		}

		if($(':radio[name="empregister_payclassfiy"]:checked').length < 1){
			swal('ê¸‰ì—¬êµ¬ë¶„?? ì²´í¬?´ì£¼?¸ìš” ');
			return false; 
			}

		if($(':radio[name="empregister_leavecompany"]:checked').length < 1){
			swal('?¬ì§?¬ë?ë¥? ì²´í¬?´ì£¼?¸ìš” ');
			return false; 
			}
		
			if(obj.empregister_paytime.value == '' && obj.empregister_payday.value == '' ){
			
			swal('ê¸‰ì—¬ë¥? ?ì–´ì£¼ì„¸?? ');
			obj.empregister_paytime.focus();
			return false;
		}
			
			if(obj.empregister_paytime.value != '' && obj.empregister_payday.value != '' ){
			
			swal('ê¸‰ì—¬?? ?˜ë‚˜ë§? ?ì–´ì£¼ì„¸?? ');
			obj.empregister_paytime.focus();
			return false;
		}
		if(obj.empregister_workplan.value == '' ){
			swal('ì´ê·¼ë¬´ì‹œê°„ì„ ?ì–´ì£¼ì„¸?? ');
			obj.empregister_workplan.focus();
			return false;
		}
		var form = $('#insert')[0];
        var formData = new FormData(form);
        $.ajax({
              type: "POST",
              enctype: 'multipart/form-data',
              url: "EmpRegisterInsert",
              data: formData,
              processData: false,
              contentType: false,
              cache: false,
              success: function (result) {
                 swal({
                   title: result + "ê°? ?±ë¡?˜ì—ˆ?µë‹ˆ??.",
                   icon: "success",
                   button: "?«ê¸°",
                 }).then(() => {
                   opener.document.location.reload();
                   window.close();
                });
              },
          });

	}
	
	
	
	
	
	
	
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


</head>
<body>
	<form name="insa/EmpRegisterInsertForm" id="insert"
		 method="post" enctype="multipart/form-data">
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
					name="empregister_name" id="empregister_name"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='2' class='ti' width='200'>ì£? ë¯? ?? ë¡? ë²? ??</td>
			</tr>
			<tr>
				<td colspan='2'><input type="text" name="empregister_jumin" id="empregister_jumin"
					style="border: none; background: transparent; text-align: center" maxlength="6">-<input
					type="password" name="empregister_jumin2" id="empregister_jumin2"
					style="border: none; background: transparent; text-align: center" maxlength="7" ></td>

			</tr>
			<tr>
				<td colspan='2' class='ti' width='100'>?¬ë²ˆ <input type="text"
					name="empregister_empnum" id="empregister_empnum"
					style="border: none; background: transparent; text-align: center">
				<td class='ti' colspan='1'>?±ë³„
				<td class='ti'>??<input type="radio" name="empregister_gender" id="empregister_gender"
					value="??"> ??<input type="radio" name="empregister_gender" id="empregister_gender"
					value="??">

				</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>?°ë½ì²?</td>
				<td colspan='2' class='ti'><input type="text"
					name="empregister_tel" id="empregister_tel"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='1' class='ti'>?˜ì´</td>
				<td><input type="number" name="empregister_age" id="empregister_age"
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
					name="empregister_addr4"  placeholder="?ì„¸ì£¼ì†Œ"></td>

				<td class='ti'>ì§ê¸‰</td>
				<td><select name="empregister_grade" id="empregister_grade">
						<option value="ë§¤ë‹ˆ??">ë§¤ë‹ˆ??</option>
						<option value="?¬ì›" selected="selected">?¬ì›</option>
				</select></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>?€?‰ëª…</td>
				<td class='ti' colspan="2"><select name="empregister_bankname" id="empregister_bankname">
						<option value="?˜ë‚˜?€??">?˜ë‚˜?€??</option>
						<option value="êµ???€??">êµ???€??</option>
						<option value="ê¸°ì—…?€??" selected="selected">ê¸°ì—…?€??</option>
				</select></td>


				<td class='ti' width='100'>?ˆê¸ˆì£?</td>

				<td><input type="text"
					style="border: none; background: transparent; text-align: center"
					name="empregister_accountholder" id="empregister_accountholder" ></td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>ê³„ì¢Œë²ˆí˜¸</td>
				<td class='ti' colspan="2"><input type="text"
					style="border: none; background: transparent; text-align: center"
					name="empregister_banknum" id="empregister_banknum"></td>
				<td colspan='1' class='ti'>ê¸‰ì—¬ êµ¬ë¶„</td>
				<td>?œê¸‰<input type="radio" name="empregister_payclassfiy" id="empregister_payclassfiy" value="?œê¸‰"> 
					?¼ê¸‰<input type="radio" name="empregister_payclassfiy" id="empregister_payclassfiy" value="?¼ê¸‰">
				
				</td>

			</tr>

			<tr>

				<td class='ti' colspan='3'>?…ì‚¬ ? ì§œ</td>
				<td class='ti' colspan='2' name ="empregister_entryday"></td>
				<td colspan='1' class='ti' >?¬ì§ ?¬ë?</td>
				<td colspan='2'>?¬ì§ì¤?<input type="radio" name="empregister_leavecompany"
				id="empregister_leavecompany"
				value="?¬ì§ì¤?"> ?´ì§<input type="radio"
				value="?´ì§"  name="empregister_leavecompany" id="empregister_leavecompany" >
				</td>
			</tr>
			<tr> 
				<td class='ti' colspan='3'>?œê¸‰</td>

				<td colspan='2'><input type="number" name="empregister_paytime" id="empregister_paytime"
					style="border: none; background: transparent; text-align: center">ì²œì›</td>
				<td class='ti' colspan='1'>?¼ê¸‰</td>
				<td><input type="number" name="empregister_payday" id="empregister_payday"
					style="border: none; background: transparent; text-align: center">ë§Œì›</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>ì´? ê·¼ë¬´?œê°„</td>


				<td colspan='3'><input type="number"
					name="empregister_workplan" id="empregister_workplan">
				

				</td>
				<td>
					<input type="button" onclick="test1()" value="?¬ì›?±ë¡" />
					<input type="reset" value="ì·¨ì†Œ" />
				</td>
			</tr>
	
			<tr>
		</table>
	</form>

</body>
</html>