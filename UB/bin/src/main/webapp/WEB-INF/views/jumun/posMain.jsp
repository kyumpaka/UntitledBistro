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
			?¬ìš© ?Œì´ë¸”ìˆ˜ : ${ tableUseList[0] } &nbsp;/&nbsp; ì´? ?Œì´ë¸”ìˆ˜ : ${ tableUseList[1] }
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
							<button onclick="goTableControl()" class="btn  btn-primary btn-lg btn-block"> ì¢Œì„ê´€ë¦? </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goReserveList()" class="btn  btn-primary btn-lg btn-block"> ?ˆì•½ê´€ë¦? </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goSalesList()" class="btn  btn-primary btn-lg btn-block"> ?ë§¤?´ì—­ </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goWork()" class="btn  btn-primary btn-lg btn-block"> ì¶œí‡´ê´€ë¦? </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goDaily()" class="btn  btn-primary btn-lg btn-block"> ?•ì‚°?´ì—­ </button>
						</div>
						<hr>
						<div class="col-md-13">
							<button onclick="goSetting()" class="btn  btn-primary btn-lg btn-block"> ?¤ì • </button>
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
	window.open('${pageContext.request.contextPath}/Seobis/pop/Seobis_calendar','?ˆì•½?´ì—­','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goWork() {
	event.preventDefault();
	var width = 1000;
	var height = 400;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('${pageContext.request.contextPath}/insa/WorkManagementForm','ì¶œí‡´ê´€ë¦?','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goDaily() {
	event.preventDefault();
	var width = 1000;
	var height = 600;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('${pageContext.request.contextPath}/pop/Daily.html','?¼ë§¤ì¶œí™•??','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goSalesList() {
	event.preventDefault();
	var width = 1000;
	var height = 600;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('salesList.do','?ë§¤?´ì—­','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function goTableControl() {
	var width = 400;
	var height = 400;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('tableControl.do','?Œì´ë¸? ?´ë™','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
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
  
  // ?Œì´ë¸? ?ì„±
function tableAdd() {
    event.preventDefault();
	var frmTag = "<div id='drag_div"+tablecnt+"' style='display: block; border: 1px solid grey; width: 100px; height: 150px; position: absolute; left: "+table_left+"px; top: "+table_top+"px; cursor: pointer; cursor: hand' class='btn' onclick='goOrderList("+tablecnt+")'>";
	frmTag += "<div align='center'>?Œì´ë¸?"+tablecnt+"</div>";
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

// ?œê³„
function startTime() {
    var today = new Date();
    var now = new Date();
    
    var year = now.getFullYear(); //??
    var month = now.getMonth(); //??
    var date = now.getDate();  //??
    var day = now.getDay();  //?”ì¼
    var hour = now.getHours();  //??
    var min = now.getMinutes();  //ë¶?
    var sec = now.getSeconds();  //ì´?
    
    month = checkTime(month);
    date = checkTime(date);
    hour = checkTime(hour);
    min = checkTime(min);		    
    sec = checkTime(sec);
    var week = ['??', '??', '??', '??', 'ëª?', 'ê¸?', '??'];
    
    document.getElementById('clock').innerHTML = 
    	year + "?? " + month + "?? " + date + "?? [" + week[day] + "] " + hour + ":" + min + ":" + sec;
   	
    var t = setTimeout(startTime, 1000);
}
// ?«ìê°€ 10ë³´ë‹¤ ?‘ì„ ê²½ìš° ?ì— 0?? ë¶™ì´ê¸?
function checkTime(i) {
    if (i < 10) {i = "0" + i};
    return i;
}
//1ì´ˆë§ˆ?? ?¨ìˆ˜ ê°±ì‹ 
function realtimeClock() {
  document.timeForm.timeInput.value = getTimeStamp();
  setTimeout("realtimeClock()", 1000);
}
</script>
</body>
</html>