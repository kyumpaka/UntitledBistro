/**
 * 
 */

var pathUrl;

function gridItemAjax(path, fieldsData) {
	pathUrl = path;
	$.ajax({
		type: "get",
		url: pathUrl,
	})
	.done(function(json) {
		$("#jsGrid").jsGrid({
			width : "100%",
			height : "auto",
			// 데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
			autoload : true,
			
			// 그리드 헤더 클릭시 sorting이 되게함
			sorting : true,
			
			// 페이징 기본설정
			paging:true,
			pageSize : 10,
			pageButtonCount : 5,
			
			// 커스텀 페이징 설정
			pagerContainer: "#jsGridPage",
            pagerFormat: "{first} {prev} {pages} {next} {last}",
            pagePrevText: "<",
            pageNextText: ">",
            pageFirstText: "<<",
            pageLastText: ">>",
            
			// json 배열을 데이터에 연결
			data : json, 
			
			// 그리드에 표현될 필드 요소
			fields : fieldsData
            
		}); // 그리드 끝
	}); // ajax 끝
}

// 데이터를 읽어와서 그리드에 표현하기
function dataLoad(endDate, product_code, product_name) {
	
	$.ajax({
		type : "get", 
		url : pathUrl,
		data : {"endDate" : endDate, "keyword" : product_code, "keyword2" : product_name},
	})
	.done(function(json) {
		$("#jsGrid").jsGrid({data:json, pageIndex: 1}); // 새로 받은 데이터 반영
		$("#jsGrid").jsGrid("loadData"); // 그리드에 데이터를 표현
	}); // ajax 끝
	
} // dataLoad 끝

// 검색 버튼 클릭했을 경우
$("#searchBtn").click(function(){
	
	// 빨간 테두리 존재여부
	if($("#year").css("border") == "1px solid rgb(255, 0, 0)") {
		swal({
			  title: "잘못된 년도입력!",
			  text: "올바른 범위로 년도를 입력하세요.! (1900 ~ " + (year+1) + ")",
			  icon: "error",
			  button: "확인",
		});
		return;
	}
	
	// 바뀐 날짜 날짜화면에 보여주기
	var endDate = $("#date").val();
	$("#dateResult").text(endDate);	
			
	// 검색조건으로 그리드 다시 불러오기
	var product_code = $("#product_code").val();
	var product_name = $("#product_name").val();
	dataLoad(endDate, product_code, product_name);
	
}); // searchBtn.click 끝

// 취소 버튼 클릭했을 경우 검색부분 값초기화
$("#cancle").on("click",function(){
	dateBasic();
	$("#product_code").val("");
	$("#product_name").val("");
	
}); // cancle.click 끝