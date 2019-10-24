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
<%-- <link href="${pageContext.request.contextPath}/resources/pos/assets/fonts/fontawesome/css/fontawesome-all.min.css" type="text/css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/OverlayScrollbars.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jumun/jumun.css">
</head>
<body>
	<section class="section-content padding-y-sm bg-default ">
		<div class="container-fluid">
				<div class="row">
					<div id="tableArea" class="col-md-10 card" style="height: 750px; relative; left: 10px;"></div>
					<div class="col-md-2">
						<div class="box">
							<div class="col-md-13" style="text-align: center; font-size: 20px;">&lt; 테이블 관리 &gt;</div>
							<br>
							<div class="col-md-13">
								<button onclick="tableAdd()" class="btn  btn-primary btn-lg btn-block">추가</button>
							</div>
							<br>
							<div class="col-md-13">
								<button onclick="tableRemove()" class="btn  btn-primary btn-lg btn-block">삭제</button>
							</div>
							<br>
							<div class="col-md-13">
								<button onclick="tableSave()" class="btn  btn-primary btn-lg btn-block">저장</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/OverlayScrollbars.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#items").height(552);
	$("#items").overlayScrollbars({
		overflowBehavior : {
			x : "hidden",
			y : "scroll"
		}
	});
	$("#cart").height(445);
	$("#cart").overlayScrollbars({});
})
  
  // 전역 변수 설정
  var img_L = 0;
  var img_T = 0;
  var targetObj;

  // div, 이미지 움직이기
  function moveDrag(e) {
    var e_obj = window.event? window.event : e;
    var targetid = targetObj.id
    
    var dmvx = parseInt(e_obj.clientX + img_L);
    var dmvy = parseInt(e_obj.clientY + img_T);

    var areasizeWidth = $('#tableArea').width();
    var areasizeHeight = $('#tableArea').height();

    var divsizeWidth = parseInt(document.getElementById(targetid).style.width.replace("px",""));
    var divsizeHeight = parseInt(document.getElementById(targetid).style.height.replace("px",""));

    var rightposition = dmvx + divsizeWidth;
    var bottomposition = dmvy + divsizeHeight;

  		//창크기 이상 움직이지 못하게
    if((dmvx > 0 && dmvy > 0) && (( rightposition < areasizeWidth) && (bottomposition < areasizeHeight))) {
	     targetObj.style.left = dmvx + "px";
	     targetObj.style.top = dmvy + "px";

	     return false;
    }
  }

  // 드래그 시작
  function startDrag(e, obj) {
    targetObj = obj;
    var e_obj = window.event? window.event : e;
    img_L = parseInt(obj.style.left.replace('px', '')) - e_obj.clientX;
    img_T = parseInt(obj.style.top.replace('px', '')) - e_obj.clientY;
    
    // 움직이기
    document.onmousemove = moveDrag;
    document.onmouseup = stopDrag;
    if(e_obj.preventDefault){e_obj.preventDefault();}
  }

  // 드래그 멈추기
  function stopDrag() {
    document.onmousemove = null;
    document.onmouseup = null;
  }

  var tablecnt = 1;
  var table_left = 0;
  var table_top = 0;
  
  // 테이블 생성
  function tableAdd() {
    event.preventDefault();
	var frmTag = "<div id='drag_div"+tablecnt+"' style='display: block; border: 1px solid grey; width: 100px; height: 150px; position: absolute; left: "+table_left+"px; top: "+table_top+"px; cursor: pointer; cursor: hand' onmousedown='startDrag(event, this)'>";
	frmTag += "<div align='center'>테이블"+tablecnt+"</div></div>";
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
})

  // 테이블 삭제
  function tableRemove() {
   event.preventDefault();
   if(tablecnt != 1){
	   tablecnt--;
	   $("#drag_div"+tablecnt).remove();
   } else {
	   swal({
			  title: "테이블이 없습니다.",
			  icon: "warning",
			  button: "닫기",
			});
   }
  }

  // 테이블 저장(위치 중복 확인)
  function tableSave() {
   event.preventDefault();
   var templeftarr = new Array();
   var temptoparr = new Array();
   var div;
   var tableflag = true;
   for(var i = 1; i < tablecnt; i++){
	   	div = $("#drag_div"+i);
	   	templeftarr[i-1] = div.position().left;
	   	temptoparr[i-1] = div.position().top;
   }
   
   for(var i = 0; i < templeftarr.length; i++){
	   for(var j = i; j < templeftarr.length; j++){
		   if(i != j){
			   var leftflag = ((templeftarr[i] <= templeftarr[j]) && (templeftarr[j]) <= (templeftarr[i]+div.width()+2));
			   var topflag = ((temptoparr[i] <= temptoparr[j]) && (temptoparr[j]) <= (temptoparr[i]+div.height()+2));
			   if(leftflag && topflag){
				   swal({
						  title: "테이블 위치가 겹쳤습니다.",
						  icon: "warning",
						});
					    tableflag = false;
						return;
			   }
		   }
		   
	   }
   }
   
   if(tableflag){
	   var tableArray = new Array();
	   for(var i = 1; i <= templeftarr.length; i++){
   		    var tablePosition = new Object();
		    
	   		tablePosition.tableSave_Code = i;
	   		tablePosition.tableSave_X = templeftarr[i-1];
	   		tablePosition.tableSave_Y = temptoparr[i-1];
		    
		    tableArray.push(tablePosition);
	   }

	   $.ajax({
			  url: 'tableSave.do',
			  type: 'post',
			  data: JSON.stringify(tableArray),
			  dataType: 'json',
			  contentType: 'application/json',
			  success : function(result) {
				  swal({
					  title: result + "개 등록되었습니다.",
					  icon: "success",
					  button: "닫기",
					}).then(() => {
						  location.href='${pageContext.request.contextPath}/erp?empregister_empnum=<sec:authentication property="principal.username"/>'
					  });
			  }
		});
   }
  }
</script>
</html>