<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>POS</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/pos/assets/images/logos/squanchy.jpg">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/pos/assets/images/logos/squanchy.jpg">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/pos/assets/images/logos/squanchy.jpg">
<!-- jQuery -->
<!-- Bootstrap4 files-->
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/ui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/pos/assets/fonts/fontawesome/css/fontawesome-all.min.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/OverlayScrollbars.css" type="text/css" rel="stylesheet" />
<!-- Font awesome 5 -->
<style>
.avatar {
	vertical-align: middle;
	width: 35px;
	height: 35px;
	border-radius: 50%;
}

.bg-default, .btn-default {
	background-color: #f2f3f8;
}

.btn-error {
	color: #ef5f5f;
}
</style>
<!-- custom style -->
</head>
<body>
	<section class="header-main">
		<div class="row align-items-center">
			<div class="col-lg-3">
				<div class="brand-wrap">
					<h3 class="logo-text">UntitledBistro</h3>
				</div>
				<!-- brand-wrap.// -->
			</div>
			<div class="col-lg-6">
				
			</div>
			<!-- col.// -->
			<div class="col-lg-3 col-sm-6">
				<div class="widgets-wrap d-flex justify-content-end">
					<div class="widget-header">
						<div class="col-lg-12" id="clock"></div>
					</div>
				</div>
				<!-- widgets-wrap.// -->
			</div>
			<!-- col.// -->
		</div>
	</section>
	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-content padding-y-sm bg-default ">
	<form method="get" id="menuform">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-10 card padding-y-sm card ">
					<ul class="nav bg radius nav-pills nav-fill mb-3 bg" role="tablist">
						<li class="nav-link" id="tab" onclick="location.href='menuSetting.do'" ><a class="nav-link" data-toggle="pill" href="#nav-tab-paypal"> ALL </a></li>
						<c:forEach items="${ menuTypeList }" var="menuTypeList" >
							<li class="nav-link" id="tab${ menuTypeList.mt_Code }" onclick="location.href='menuSetting.do?mt_Code=${ menuTypeList.mt_Code }'" ><a class="nav-link" data-toggle="pill" href="#nav-tab-card"> ${ menuTypeList.mt_Name } </a></li>
						</c:forEach>
					</ul>
					<span id="items">
						<div class="row">
							<c:forEach items="${ menuList }" var="menuList">
							<div class="col-md-3">
								<figure class="card card-product">
								<label onmouseenter="igdView('${ menuList.menu_Code }')">
								<input class="check" type="checkbox" value="${ menuList.menu_Code }" name="menu_Code" id="menu_Code${ menuList.menu_Code }">
									<div class="img-wrap">
										<img src="${pageContext.request.contextPath}/resources/images/jumun/${ menuList.menu_Image }">
									</div>
									<figcaption class="info-wrap">
										<div class="action-wrap">
											<div class="price-wrap h5">
												<img src="${pageContext.request.contextPath}/resources/images/jumun/체크.jpg" class="checkImg" id="menuimg${ menuList.menu_Code }">
												<span class="title">${ menuList.menu_Name }</span>
												<span class="price-new">/&nbsp;<fmt:formatNumber pattern="#,###" value="${ menuList.menu_Price }" />원</span>
											</div>
											<!-- price-wrap.// -->
										</div>
										<!-- action-wrap -->
									</figcaption>
								</label>
								</figure>
								<!-- card // -->
							</div>
							</c:forEach>
							<!-- col // -->
						</div>
						<!-- row.// -->
					</span>
				</div>
				<div class="col-md-2">
					<!-- card.// -->
					<div class="box">
						<div class="col-md-13" style="text-align: center; font-size: 20px;">&lt; 항목 &gt;</div>
						<br>
						<div class="col-md-13">
							<button value="menuTypeAddForm" class="btn  btn-primary btn-lg btn-block"> 등록 </button>
						</div>
						<br>
						<div class="col-md-13">
							<button value="menuTypeList" class="btn  btn-primary btn-lg btn-block"> 수정 및 삭제 </button>
						</div>
						<br><br><hr><br><br>
						<div class="col-md-13" style="text-align: center; font-size: 20px;">&lt; 메뉴 &gt;</div>
						<br>
						<div class="col-md-13">
							<button value="menuAddForm" class="btn  btn-primary btn-lg btn-block"> 등록 </button>
						</div>
						<br>
						<div class="col-md-13">
							<button value="menuModiForm" class="btn  btn-primary btn-lg btn-block"> 수정 </button>
						</div>
						<br>
						<div class="col-md-13">
							<button value="menuRemove" class="btn  btn-primary btn-lg btn-block"> 삭제 </button>
						</div>
						<br><hr><br>
						<div class="col-md-13">
							<button value="posMain" class="btn  btn-primary btn-lg btn-block"> 완료 </button>
						</div>
					</div>
					<!-- box.// -->
				</div>
			</div>
		</div>
		<!-- container //  -->
	</form>

		<!-- Modal  추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">결과</h4>
					</div>
					<div class="modal-body">처리가 완료되었습니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</section>
	<!-- ========================= SECTION CONTENT END// ========================= -->
	<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/pos/assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/pos/assets/js/OverlayScrollbars.js" type="text/javascript"></script>
	<script>
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
		});
		
		// 메뉴구분 탭 활성화
		$(document).ready(function() {
			if('' == '${ mt_Code }'){
				$("#tab").attr('class','nav-link active show');
			}
			<c:forEach items="${ menuTypeList }" var="menuTypeList" >
			 else if('${ menuTypeList.mt_Code }' == '${ mt_Code }'){
				$("#tab${ mt_Code }").attr('class','nav-link active show');
			}
			</c:forEach>

			// 체크박스 및 체크이미지 숨기기
			$("input[class='check']").css("display","none");
			$(".checkImg").css("display","none");

			// 결과 보이기
			var result = '${result}';
			checkModal(result);

			function checkModal(result) {
				if(result === '' || history.state){
					return;
				}

				if(parseInt(result) > 0){
					$(".modal-body").html(parseInt(result) + "개 삭제 되었습니다.");
				}

				$("#myModal").modal("show");
			}
		});

		// 체크된 메뉴 및 이미지 조절
		$('.check').click(function(){
			var num = $(this).val();
			
			if($("input:checkbox[id='menu_Code"+num+"']").is(":checked") == false) {
				$("#menuimg"+num).css("display","none");
			} else {
				$("#menuimg"+num).css("display","block");
				$("#menuimg"+num).css("float","left");
			}
		});
		
		$('.btn').click(function(){
			var button = $(this).val();
			
			if(button == "menuTypeAddForm") {
				window.open('menuTypeAddForm.do','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
			} else if(button == "menuTypeList") {
				window.open('menuTypeList.do','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
			} else if(button == "menuAddForm") {
				window.open('menuAddForm.do','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
			} else if(button == "menuModiForm") {
				if ($("input:checkbox[class='check']:checked").length == 1){
					var menu_CodeCk = $("input:checkbox[class='check']:checked").val();
					window.open('menuModiForm.do?menu_Code='+menu_CodeCk,'window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
				} else {
					alert("한개의 메뉴를 선택해주세요.");
				}
			} else if(button == "menuRemove") {
				// 유효성 검사
		        if($("input:checkbox[class='check']").is(":checked") == true){
		        	if(confirm($("input:checkbox[class='check']:checked").length+'개 메뉴를 삭제하시겠습니까?')){
						$("#menuform").attr("action", "menuRemove.do");
		        	}
		        } else {
			        alert("메뉴를 한개 이상 선택해주세요.");
		        }
			} else if(button == "posMain") {
				$("#menuform").attr("action", "posMain.do");
			}
			$("#menuform").submit();
		});
		
		// 시계
		$(document).ready(function startTime() {
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
		});
		// 숫자가 10보다 작을 경우 앞에 0을 붙이기
		function checkTime(i) {
		    if (i < 10) {i = "0" + i};
		    return i;
		};
		//1초마다 함수 갱신
		function realtimeClock() {
		  document.timeForm.timeInput.value = getTimeStamp();
		  setTimeout("realtimeClock()", 1000);
		}
		// 메뉴보기
		function igdView(num){
			$.ajax({
				  url: 'ingreSearchByMenuCode.do',
				  type: 'get',
				  data: { menu_Code:num },
				  dataType: 'json',
				  success : function(result) {
					  var resLen = result.length;
					  for(var i = 0; i < resLen; i++){
// 				  	  	alert(result[i].ingredient_Product_Code + ' / ' + result[i].ingredient_Qty);
					  }
				  }
			});
		}
	</script>
</body>
</html>