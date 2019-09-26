/**
 * 
 */

$(document).ready(function() {
	$("#yearInput").hide();
	yearBasic();
	var today = dateFormat(new Date());
	var date = today.split("/");
	$("#year").val(date[0]);
	$("#month").val(date[1]);
	$("#day").val(date[2]);
});
function yearBasic(year) {
	$("#year option").remove();
	var todayYear = new Date().getFullYear();
	for(var i = todayYear+1; i>=todayYear-2; i--) {
		$("#year").append("<option value='" + i + "'>" + i);
	}
	if(year != '' && year != null) {
		$("#year").append("<option value='" + year + "'>" + year);
	}
	$("#year").append("<option value='directInput'>직접입력");
}

$("#date").on("change",function(){
	var date = $("#date").val().split("/");
	$("#year").val(date[0]);
	$("#month").val(date[1]);
	$("#day").val(date[2]);
	console.log("======01=======")
	console.log($("#date").val());
	console.log("===============")
});

function year() {
	var yearInput = $("#yearInput");
	console.log(yearInput.val());
	console.log(yearInput.val() + ">= 1900");
	console.log(yearInput.val() >= 1900);
	if(yearInput.val() >= 1900 && yearInput.val() <= new Date().getFullYear()+1) {
		yearBasic(yearInput.val());
		yearInput.hide();
		$("#year").show();
		return;
	}
	$("#yy-mm-dd").css("border","1px solid red");
}

$("#yy-mm-dd input, #yy-mm-dd select").on("change", function() {
	if(this.id == "yearInput") {
		console.log("=*=*= yearInput =*=*=");
		year();
		return;
	}
	if(this.id == "year" && this.value == "directInput") {			
		$("#yearInput").val("");
		$("#yearInput").show();
		$("#" + this.id).hide();
		return;
	}
	
	var date = $("#date").val().split("/");
	if(this.id == "year") date[0] = this.value;
	if(this.id == "month") date[1] = this.value;
	if(this.id == "day") date[2] = this.value;
	
	var dateResult = dateFormat(new Date(date[0] + "/" + date[1] + "/" + date[2]));
	
	if(dateResult != "NaN/NaN/NaN" && date[0] >= 1900 && date[0] <= (new Date().getFullYear()+1)) {
		$("#date").val(dateResult);
		var date = dateResult.split("/");
		$("#year").val(date[0]);
		$("#month").val(date[1]);
		$("#day").val(date[2]);
	} else {
		alert("올바르지 않는 날짜형식입니다.");
	}
	console.log("======02=======")
	console.log($("#date").val());
	console.log("===============")
});

function dateFormat(format) {
    var year = format.getFullYear();
    
    var month = format.getMonth() + 1;
    if(month<10) month = '0' + month;
    
    var date = format.getDate();
    if(date<10) date = '0' + date;

    return year + "/" + month + "/" + date;

}

$(function(){

    $('.input-group.date').datepicker({
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        buttonImageOnly: true,
        format: "yyyy/mm/dd",
        language: "kr"

    });

});

;(function($){
	$.fn.datepicker.dates['kr'] = {
		days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
		daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
		daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
		months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	};
}(jQuery));