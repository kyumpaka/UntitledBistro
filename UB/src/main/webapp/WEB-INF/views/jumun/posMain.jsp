<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>POS</title>
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/ui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/pos/assets/fonts/fontawesome/css/fontawesome-all.min.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/OverlayScrollbars.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jumun/jumun.css">
</head>
<body>
	<section class="header-main">
		<div class="row align-items-center">
			<div class="col-lg-3">
				<div class="brand-wrap">
					<a href="posMain.do"><h3 class="logo-text">UntitledBistro</h3></a>
				</div>
			</div>
			<div class="col-lg-3">
			</div>
			<div class="col-lg-3">
			사용 테이블수 : ${ tableUseList[0] } &nbsp;/&nbsp; 총 테이블수 : ${ tableUseList[1] }
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="widgets-wrap d-flex justify-content-end">
					<div class="widget-header">
						<div class="col-lg-12" id="clock"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section-content padding-y-sm bg-default ">
	<form method="post" id="posMenuForm">
		<div class="container-fluid">
			<div class="row">
				<div id="tableArea" class="col-md-10 card" style="height: 750px;"></div>
				<div class="col-md-2">
					<div class="box">
						<div class="col-md-13">
							<button onclick="goTableControl()" class="btn  btn-primary btn-lg btn-block"> 좌석관리 </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goReserveList()" class="btn  btn-primary btn-lg btn-block"> 예약관리 </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goSalesList()" class="btn  btn-primary btn-lg btn-block"> 판매내역 </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goWork()" class="btn  btn-primary btn-lg btn-block"> 출퇴관리 </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goDaily()" class="btn  btn-primary btn-lg btn-block"> 정산내역 </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goSetting()" class="btn  btn-primary btn-lg btn-block"> 설정 </button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</section>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/OverlayScrollbars.js" type="text/javascript"></script>
<script type="text/javascript">
function goReserveList() {
	event.preventDefault();
	var width = 1000;
	var height = 600;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('${pageContext.request.contextPath}/Seobis/pop/Seobis_calendar','예약내역','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goWork() {
	event.preventDefault();
	var width = 1000;
	var height = 400;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('${pageContext.request.contextPath}/insa/WorkManagementForm','출퇴관리','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goDaily() {
	event.preventDefault();
	var width = 1000;
	var height = 600;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('${pageContext.request.contextPath}/pop/Daily.html','일매출확인','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goSalesList() {
	event.preventDefault();
	var width = 1000;
	var height = 600;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('salesList.do','판매내역','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goTableControl() {
	var width = 400;
	var height = 400;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('tableControl.do','테이블 이동','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goSetting() {
	event.preventDefault();
	location.href="${pageContext.request.contextPath}/erp?empregister_empnum=<sec:authentication property='principal.username'/>";
}

function goOrderList(tableNum) {
	$("#order_TableNum").append("<input type='hidden' name='orders_No' value='"+tableNum+"'>");
	$("#posMenuForm").attr("action", "ordersList.do");
	$("#posMenuForm").submit();
}

var tablecnt = 1;
  	var table_left = 0;
  	var table_top = 0;
  
  // 테이블 생성
function tableAdd() {
    event.preventDefault();
	var frmTag = "<div id='drag_div"+tablecnt+"' style='display: block; border: 1px solid grey; width: 100px; height: 150px; position: absolute; left: "+table_left+"px; top: "+table_top+"px; cursor: pointer; cursor: hand' class='btn' onclick='goOrderList("+tablecnt+")'>";
	frmTag += "<div align='center'>테이블"+tablecnt+"</div>";
	<c:forEach items="${ posMainList }" var="posMainList" >
	   if('${ posMainList.OD_ORDERS_NO }' == tablecnt){
		   frmTag += "${ posMainList.MENU_NAME }&nbsp;";
		   frmTag += "${ posMainList.OD_QTY }<br>";
	   }
	</c:forEach>
	frmTag += "<div id='order_TableNum'></div></div>"
	$("#tableArea").append(frmTag);
	tablecnt++;
}
  
$(document).ready(function() {
   <c:forEach items="${tableList}" var="tableList" >
	table_left = parseInt(${tableList.tableSave_X});
	table_top = parseInt(${tableList.tableSave_Y});
	tableAdd();
</c:forEach>
table_left = 0;
table_top = 0;

startTime();
})

// 시계
function startTime() {
    var today = new Date();
    var now = new Date();
    
    var year = now.getFullYear(); //년
    var month = now.getMonth(); //월
    var date = now.getDate();  //일
    var day = now.getDay();  //요일
    var hour = now.getHours();  //시
    var min = now.getMinutes();  //분
    var sec = now.getSeconds();  //초
    
    month = checkTime(month);
    date = checkTime(date);
    hour = checkTime(hour);
    min = checkTime(min);		    
    sec = checkTime(sec);
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    
    document.getElementById('clock').innerHTML = 
    	year + "년 " + month + "월 " + date + "일 [" + week[day] + "] " + hour + ":" + min + ":" + sec;
   	
    var t = setTimeout(startTime, 1000);
}
// 숫자가 10보다 작을 경우 앞에 0을 붙이기
function checkTime(i) {
    if (i < 10) {i = "0" + i};
    return i;
}
//1초마다 함수 갱신
function realtimeClock() {
  document.timeForm.timeInput.value = getTimeStamp();
  setTimeout("realtimeClock()", 1000);
}
</script>
</body>
</html>