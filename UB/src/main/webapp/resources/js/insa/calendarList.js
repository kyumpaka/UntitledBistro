// 캘린더 생성폼 호출
function calendarAddForm() {
	$('#calendarAddForm').modal();
}
// 캘린더 생성 처리
function calendarAdd() {
	var summary = $('#summary').val();
	if(summary.trim() == '' || summary.trim().length == 0) {
		swal('이름','입력해주세요');
		return false;
	}
	$('#frmCalendarAdd').submit();
}
//전체체크
function checkAllDel(bool) {
	var chkVal = document.getElementsByName("chkVal");
	for (var i = 0; i < chkVal.length; i++) {
		chkVal[i].checked = bool;
	}
}
//캘린더 삭제
function calendarRemove() {
	var chkVal = document.getElementsByName("chkVal");
	var n = 0;
	for (var i = 0; i < chkVal.length; i++) {
		if(chkVal[i].checked == true){
			n++;
		}
	}
	if(n>0){
		$('#frmCalendarRemove').submit();
	}else {
		swal("캘린더 삭제", '선택해주세요');
	}
}
