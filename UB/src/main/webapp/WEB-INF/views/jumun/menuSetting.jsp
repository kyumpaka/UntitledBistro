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
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/ui.css" rel="stylesheet type="text/css" />
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
	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-content padding-y-sm bg-default ">
	<form method="post" id="menuform">
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
								<label id="${ menuList.menu_Code }" onmouseenter="igdView('${ menuList.menu_Code }')">
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
							<button value="menuTypeList" class="btn  btn-primary btn-lg btn-block"> 관리 </button>
						</div>
						<br><hr><br>
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
	</section>
	<!-- ========================= SECTION CONTENT END// ========================= -->
	<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript"></script>
<%-- 	<script src="${pageContext.request.contextPath}/resources/pos/assets/js/bootstrap.bundle.min.js" type="text/javascript"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/pos/assets/js/OverlayScrollbars.js" type="text/javascript"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
			console.log(result);
			checkModal(result);

			function checkModal(result) {
				if(result === '' || history.state){
					return;
				} else {
					swal({
						  title: result + "개 삭제되었습니다.",
						  icon: "success",
						  button: "닫기",
						});
				}
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
			event.preventDefault();
			var button = $(this).val();
			
			if(button == "menuTypeAddForm") {
				var width = 400;
				var height = 300;
				var popupX = (window.screen.width / 2) - (width / 2);
				var popupY = (window.screen.height / 2) - (height / 2);
				window.open('menuTypeAddForm.do','메뉴타입추가','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
			} else if(button == "menuTypeList") {
				var width = 400;
				var height = 300;
				var popupX = (window.screen.width / 2) - (width / 2);
				var popupY = (window.screen.height / 2) - (height / 2);
				window.open('menuTypeList.do','메뉴타입관리','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
			} else if(button == "menuAddForm") {
				var width = 500;
				var height = 300;
				var popupX = (window.screen.width / 2) - (width / 2);
				var popupY = (window.screen.height / 2) - (height / 2);
				window.open('menuAddForm.do','메뉴추가','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
			} else if(button == "menuModiForm") {
				// 유효성 검사
				if ($("input:checkbox[class='check']:checked").length == 1){
					var menu_CodeCk = $("input:checkbox[class='check']:checked").val();
					var width = 500;
					var height = 400;
					var popupX = (window.screen.width / 2) - (width / 2);
					var popupY = (window.screen.height / 2) - (height / 2);
					window.open('menuModiForm.do?menu_Code='+menu_CodeCk,'메뉴수정','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
				} else {
					swal({
						  title: "한개의 메뉴를 선택해주세요.",
						  icon: "warning",
						});
					event.preventDefault();
					return;
				}
			} else if(button == "menuRemove") {
				// 유효성 검사
		        if($("input:checkbox[class='check']").is(":checked") == true){
		        	swal({
		  			  title: "삭제하시겠습니까?",
		  			  icon: "warning",
		  			  buttons: ["아니요", "네"],
		  			  dangerMode: true,
		  			}).then((willDelete) => {
		  				  if (willDelete) {
		  					$("#menuform").attr("action", "menuRemove.do");
		  					$("#menuform").submit();
		  				  }
		  			});
		        } else {
		        	swal({
						  title: "메뉴를 한개 이상 선택해주세요.",
						  icon: "warning",
						});
					event.preventDefault();
					return;
		        }
			} else if(button == "posMain") {
				$("#menuform").attr("action", "posMain.do");
				$("#menuform").submit();
			}
		});
		
		// 메뉴 재료보기
		function igdView(num){
			$.ajax({
				  url: 'ingreSearchByMenuCode.do',
				  type: 'post',
				  data: { menu_Code:num },
				  dataType: 'json',
				  success : function(result) {
					  var resLen = result.length;
					  for(var i = 0; i < resLen; i++){
// 				  	  	alert('재료 : ' + result[i].ingredient_Product_Code + ' / 수량 : ' + result[i].ingredient_Qty);
					  }
				  }
			});
		};
	</script>
</body>
</html>