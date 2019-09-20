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

<script type="text/javascript">
function EmpregisterInsert(){
		alert("하이");

		if(document.EmpregisterInsertForm.empregister_name.value==""){
				alert("이름을 입력해주세요");
			}else if(document.EmpregisterInsertForm.empregister_jumin.value==""){
				alert("주민등록번호를 입력해주세요");
				document.EmpregisterInsertForm.empregister_jumin.focus();
			}else if(document.EmpregisterInsertForm.empregister_jumin2.value==""){
				alert("주민등록번호를을 입력해주세요");
				document.EmpregisterInsertForm.empregister_jumin2.focus();
			}else if(document.EmpregisterInsertForm.empregister_empnum.value==""){
				alert("사번을 입력해주세요");
				document.EmpregisterInsertForm.Empregister_empnum.focus();
			}else if(document.EmpregisterInsertForm.Empregister_gender.value==""){
				alert("성별을 입력해주세요");
				document.EmpregisterInsertForm.Empregister_tel.focus();
			}else if(document.EmpregisterInsertForm.Empregister_tel.value==""){
				alert("전화번로를 입력해주세요");
				document.EmpregisterInsertForm.Empregister_age.focus();
			}else if(document.EmpregisterInsertForm.Empregister_age.value==""){
				alert("나이를 입력해주세요");
				document.EmpregisterInsertForm.Empregister_addr.focus();{
			}else if(document.EmpregisterInsertForm.Empregister_addr.value==""){
				alert("주소를 입력해주세요");
				document.EmpregisterInsertForm.Empregister_grade.focus();
			}else if(document.EmpregisterInsertForm.Empregister_grade.value==""){
				alert("직급을 입력해주세요");
				document.EmpregisterInsertForm.Empregister_bankname.focus();
			}else if(document.EmpregisterInsertForm.Empregister_bankname.value==""){
				alert("은행명을 입력해주세요");
				document.EmpregisterInsertForm.Empregister_AccountHolder.focus();
			}else if(document.EmpregisterInsertForm.Empregister_AccountHolder.value==""){
				alert("예금주을 입력해주세요");
				document.EmpregisterInsertForm.Empregister_banknum.focus();
			}else if(document.EmpregisterInsertForm.Empregister_banknum.value==""){
				alert("계좌번호를 입력해주세요");
				document.EmpregisterInsertForm.Empregister_payClassfiy.focus();
			}else if(document.EmpregisterInsertForm.Empregister_payClassfiy.value==""){
				alert("급여구분을 입력해주세요");
				document.EmpregisterInsertForm.Empregister_entryDay.focus();
			}else if(document.EmpregisterInsertForm.Empregister_entryDay.value==""){
				alert("입사날짜 입력해주세요");
				document.EmpregisterInsertForm.Empregister_leavecompany.focus();
			}else if(document.EmpregisterInsertForm.Empregister_leavecompany.value==""){
				alert("퇴사여부를 입력해주세요");
				document.EmpregisterInsertForm.Empregister_pay.focus();
			}else if(document.EmpregisterInsertForm.Empregister_pay.value==""){
				alert("시급을 입력해주세요");
				document.EmpregisterInsertForm.Empregister_pay.focus();
			}else if(document.EmpregisterInsertForm.Empregister_workPlan.value==""){
				alert("근무예정시간을 입력해주세요");
				document.EmpregisterInsertForm.Empregister_workPlan.focus();
					
			}else{
		document.EmpregisterInsertForm.submit(); //전송
}
			}
}
//이미지
$(function () {
   $('#btn-upload').click(function(e) {
         e.preventDefault();
         $('#file').click();
      });
   });
function preview(id, input, target) {
    var idok = id;
    if (input.files && input.files[0]) {
       var fileName = input.files[0].name;
       var ext = fileName.substr(fileName.length - 3, fileName.length);
       var isCheck = false;
       if (ext.toLowerCase() == 'jpg' || ext.toLowerCase() == 'gif'
             || ext.toLowerCase() == 'png') {
          isCheck = true;
       }
       if (isCheck == false) {
          alert("이미지 파일 아님");
          jQuery(input).val("");
          return;
       }
       var reader = new FileReader();
       reader.readAsDataURL(input.files[0]);
       reader.onload = function(e) {
          jQuery(target).attr('src', e.target.result);
          if (idok == "file") {
             document.getElementById('btn-upload').style.visibility = 'hidden';
             document.getElementById('select-del').style.visibility = 'visible';
          } 
   
       }
 }
}
function del() {
    document.getElementById('file').value = "";
    document.getElementById('image1').src = "";
    document.getElementById('btn-upload').style.visibility = 'visible';
    document.getElementById('select-del').style.visibility = 'hidden';
 }
function check() {
    alert("등록 완료");
    return true;
}

//주소정보
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
             if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById("sample4_roadAddress").value = extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
               document.getElementById("sample4_jibunAddress").value = expJibunAddr;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
             getlatlng(roadAddr,data.jibunAddress);
        }
    }).open();
}

</script>
</head>
<body>
	<form name="EmpRegisterInsertForm" id="insert" action="EmpRegisterInsert" method="post">
		<table cellspacing='1' cellpadding='0' border='0' bgcolor='#000000'
			align='center'>
			<tr>
				<td colspan='3' rowspan='3' width='120' class='ti'>
					<div>
						<input class="i-btn" type="file" id="file" name="FILE1"
							onchange="preview(this.id,this, $('#image1'));" />
						<button class="i-btn" type="button" id="btn-upload" name="btn1">Image</button>
					</div>
					<div class="selectable">
						<div class="selectable-content">
							<img src="" style="width: 108px; height: 81px;" id="image1">
						</div>
						<div class="selectable-layer">
							<button id="select-del" class="selectable-del" type="button"
								onclick="del()" style="visibility: hidden">X</button>
						</div>
					</div> <width='120' class='ti'>
				</td>
				<td rowspan='2' class='ti' width='100'>성명</td>
				<td rowspan='2' width='150'><input type="text"
					name="empregister_name"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='2' class='ti' width='200'>주 민 등 록 번 호</td>
			</tr>
			<tr>
				<td colspan='2'><input type="text" name="empregister_jumin"
					style="border: none; background: transparent; text-align: center">-<input
					type="text" name="empregister_jumin2"
					style="border: none; background: transparent; text-align: center"></td>

			</tr>
			<tr>
				<td colspan='4' class='ti' width='100' style="text-align: left">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 사번 <input
					type="text" name="empregister_empnum"
					style="border: none; background: transparent; text-align: center">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 남<input
					type="radio" name="empregister_gender" value="남"> 여<input
					type="radio" name="empregister_gender" value="여">
				</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>연락처</td>
				<td colspan='2' class='ti'><input type="text"
					name="empregister_tel"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='1' class='ti'>나이</td>
				<td><input type="number" name="empregister_age"
					style="border: none; background: transparent; text-align: center"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3' rowspan='2'>거주지</td>
				<td class='ti'><input type="button"
					onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호"></td>
				<td class='ti' rowspan='1' width='100'><input type="text"
					id="sample4_roadAddress" name="empregister_addr"
					placeholder="도로명주소"><br></td>
				<td rowspan='1'><input type="text" id="sample4_jibunAddress"
					name="empregister_addr" placeholder="지번주소"></td>

			</tr>
			<tr>
				<td><td class='ti'><input type="text" id="sample4_detailAddress"
					name="empregister_addr" placeholder="상세주소"></td></td>

				<td class='ti'>직급</td>
				<td><input type="text" name="empregister_grade"
					style="border: none; background: transparent; text-align: center"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>은행명</td>
				<td class='ti' colspan="2"><select name="empregister_bankname">
						<option value="하나은행">하나은행</option>
						<option value="국민은행">국민은행</option>
						<option value="기업은행" selected="selected">기업은행</option>
				</select></td>


				<td class='ti' width='100'>예금주</td>

				<td><input type="text"
					style="border: none;  background: transparent; text-align: center" name= "empregister_accountholder"></td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>계좌번호</td>
				<td class='ti' colspan="2"><input type="text" style="border: none; background: transparent; text-align: center" name="empregister_banknum"></td>
				<td colspan='1' class='ti'>급여 구분</td>
				<td>시급<input type="radio" name="empregister_payclassfiy"
					value="0"> 일급<input type="radio"
					name="empregister_payclassfiy" value="1">
				</td>

			</tr>

			<tr>

				<td class='ti' colspan='3'>입사 날짜</td>
				<td class='ti' colspan='2'></td>
				<td class='ti' colspan='1'>퇴사여부</td>
				<td><input type="checkbox" name="empregister_leavecompany"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>시급</td>

				<td colspan='2'><input type="number" name="empregister_pay"
					"style="border: none; background: transparent; text-align: center">천원</td>
				<td class='ti' colspan='1'>일급</td>
				<td><input type="number" name="empregister_pay"
					style="border: none; background: transparent; text-align: center">만원</td>
				</td>
			</tr>
			<tr>
				<td colspan='3'>총근무시간</td>


				<td colspan='3'><input type="number" name ="empregister_workplan"><%-- <select id="empregister_workplan"
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
					<button type="submit" class="btn btn-orange" id="EmpregisterInsert">등록</button>
					<input type="button" value="쓰기" onclick="document.getElementById('insert').submit();" /> 
					<input type="reset" value="취소" />
				</td>
			</tr>

			<tr>
		</table>
	</form>

</body>
</html>