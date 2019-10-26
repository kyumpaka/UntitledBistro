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
//주소정보
		function test1(){
		var obj = document.EmpRegisterInsertForm;
		if(obj.empregister_name.value == '' ){
			swal('이름을 입력하세요');
			obj.empregister_name.focus();
			return false;
		}
		if(obj.empregister_jumin.value.length  < 6 ){
			swal('주민등록번호 앞자리 자릿수를 정확하게 입력해주세요');
			obj.empregister_jumin.focus();
			return false;
		}
		if(obj.empregister_jumin2.value.length < 7 ){
			swal('주민등록번호 뒷자리 자릿수를 정확히 입력해주세요');
			obj.empregister_jumin2.focus();
			return false;
		}
		if($(':radio[name="empregister_gender"]:checked').length < 1){
			swal('성별을 체크해주세요 ');
			return false; 
			}
		if(obj.empregister_tel.value.length < 11 ){
			swal('핸드폰을 정확히 입력해주세요');
			obj.empregister_tel.focus();
			return false;
		}
		if(obj.empregister_age.value == '' ){
			swal('나이를 입력하세요');
			obj.empregister_age.focus();
			return false;
		}
		if(obj.sample4_postcode.value == '' ){
			swal('우편번호를 입력해주세요');
			obj.sample4_postcode.focus();
			return false;
		}
		if(obj.empregister_grade.value == '' ){
			swal('직급을 선택해주세요 ');
			obj.empregister_grade.focus();
			return false;
		}
		if(obj.empregister_bankname.value == '' ){
			swal('은행을 선택해주세요 ');
			obj.empregister_bankname.focus();
			return false;
		}
		if(obj.empregister_accountholder.value == '' ){
			swal('예금주를 적어주세요 ');
			obj.empregister_accountholder.focus();
			return false;
		}
		
		if(obj.empregister_banknum.value == '' ){
			swal('계좌번호를 적어주세요 ');
			obj.empregister_banknum.focus();
			return false;
		}

		if($(':radio[name="empregister_payclassfiy"]:checked').length < 1){
			swal('급여구분을 체크해주세요 ');
			return false; 
			}

		if($(':radio[name="empregister_leavecompany"]:checked').length < 1){
			swal('재직여부를 체크해주세요 ');
			return false; 
			}
		
			if(obj.empregister_paytime.value == '' && obj.empregister_payday.value == '' ){
			
			swal('급여를 적어주세요 ');
			obj.empregister_paytime.focus();
			return false;
		}
			
			if(obj.empregister_paytime.value != '' && obj.empregister_payday.value != '' ){
			
			swal('급여는 하나만 적어주세요 ');
			obj.empregister_paytime.focus();
			return false;
		}
		if(obj.empregister_workplan.value == '' ){
			swal('총근무시간을 적어주세요 ');
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
                   title: result + "개 등록되었습니다.",
                   icon: "success",
                   button: "닫기",
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
	<form name="EmpRegisterInsertForm" id="insert"
		 method="post" enctype="multipart/form-data">
		<table cellspacing='1' cellpadding='0' border='0' bgcolor='#000000' align='center'>
			<tr>
			
				<td colspan='3' rowspan='3' width='120' class='ti'>
					<div class="row form-group">
					<div class="col col-md-3">
						<label for="file-input" class=" form-control-label">사진</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="file" id="file-input" name="file" class="form-control-file">
					</div>
				</div>
				</td>

				<td rowspan='2' class='ti' width='100'>성명</td>
				<td rowspan='2' width='150'><input type="text"
					name="empregister_name" id="empregister_name"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='2' class='ti' width='200'>주 민 등 록 번 호</td>
			</tr>
			<tr>
				<td colspan='2'><input type="text" name="empregister_jumin" id="empregister_jumin"
					style="border: none; background: transparent; text-align: center" >-<input
					type="password" name="empregister_jumin2" id="empregister_jumin2"
					style="border: none; background: transparent; text-align: center" ></td>

			</tr>
			<tr>
				<td colspan='2' class='ti' width='100'>사번 
				<td class='ti' colspan='1'>성별
				<td class='ti'>남<input type="radio" name="empregister_gender" id="empregister_gender"
					value="남"> 여<input type="radio" name="empregister_gender" id="empregister_gender"
					value="여">

				</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>연락처</td>
				<td colspan='2' class='ti'><input type="number"
					name="empregister_tel" id="empregister_tel"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='1' class='ti'>나이</td>
				<td><input type="number" name="empregister_age" id="empregister_age"
					style="border: none; background: transparent; text-align: center"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3' rowspan='2'>거주지</td>
				<td class='ti'><input type="button"  
					onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호"
					name="empregister_addr"></td>
				<td class='ti' rowspan='1' width='100'><input type="text"
					id="sample4_roadAddress" name="empregister_addr2"
					placeholder="도로명주소"><br></td>
				<td rowspan='1'><input type="text" id="sample4_jibunAddress"
					name="empregister_addr3" placeholder="지번주소"></td>

			</tr>
			<tr>
				<td>
				<td class='ti'><input type="text" id="sample4_detailAddress"
					name="empregister_addr4"  placeholder="상세주소"></td>

				<td class='ti'>직급</td>
				<td><select name="empregister_grade" id="empregister_grade">
						<option value="매니저">매니저</option>
						<option value="사원" selected="selected">사원</option>
				</select></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>은행명</td>
				<td class='ti' colspan="2"><select name="empregister_bankname" id="empregister_bankname">
						<option value="하나은행">하나은행</option>
						<option value="국민은행">국민은행</option>
						<option value="기업은행" selected="selected">기업은행</option>
				</select></td>


				<td class='ti' width='100'>예금주</td>

				<td><input type="text"
					style="border: none; background: transparent; text-align: center"
					name="empregister_accountholder" id="empregister_accountholder" ></td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>계좌번호</td>
				<td class='ti' colspan="2"><input type="text"
					style="border: none; background: transparent; text-align: center"
					name="empregister_banknum" id="empregister_banknum"></td>
				<td colspan='1' class='ti'>급여 구분</td>
				<td>시급<input type="radio" name="empregister_payclassfiy" id="empregister_payclassfiy" value="시급"> 
					일급<input type="radio" name="empregister_payclassfiy" id="empregister_payclassfiy" value="일급">
				
				</td>

			</tr>

			<tr>

				<td class='ti' colspan='3'>입사 날짜</td>
				<td class='ti' colspan='2' name ="empregister_entryday"></td>
				<td colspan='1' class='ti' >재직 여부</td>
				<td colspan='2'>재직중<input type="radio" name="empregister_leavecompany"
				id="empregister_leavecompany"
				value="재직중"> 퇴직<input type="radio"
				value="퇴직"  name="empregister_leavecompany" id="empregister_leavecompany" >
				</td>
			</tr>
			<tr> 
				<td class='ti' colspan='3'>시급</td>

				<td colspan='2'><input type="number" name="empregister_paytime" id="empregister_paytime"
					style="border: none; background: transparent; text-align: center">원</td>
				<td class='ti' colspan='1'>일급</td>
				<td><input type="number" name="empregister_payday" id="empregister_payday"
					style="border: none; background: transparent; text-align: center">원</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>총 근무시간</td>


				<td colspan='3'><input type="number"
					name="empregister_workplan" id="empregister_workplan">
				

				</td>
				<td>
					<input type="button" onclick="test1()" value="사원등록" />
					<input type="reset" value="취소" />
				</td>
			</tr>
	
			<tr>
		</table>
	</form>

</body>
</html>