<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<body>
	<section class="header-main">
		<div class="row align-items-center">
			<div class="col-lg-3">
				<div class="brand-wrap">
					<a href="posMain.do"><h3 class="logo-text">UntitledBistro</h3></a>
				</div>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-4">
			최초 주문 : <fmt:formatDate value="${ ordersList.orders_First }" pattern="yyyy-MM-dd HH시 MM분 ss초"/>&nbsp;/&nbsp;
			마지막 주문 : <fmt:formatDate value="${ ordersList.orders_Final }" pattern="yyyy-MM-dd HH시 MM분 ss초"/>
			</div>
			<div class="col-lg-4 col-sm-6">
				<div class="widgets-wrap d-flex justify-content-end">
					<div class="widget-header">
						<div class="col-lg-12" id="clock"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="section-content padding-y-sm bg-default">
	<form method="post" id="orderListForm">
		<input type="hidden" name="order_Table" value="${ order_Table }">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 card padding-y-sm card ">
					<ul class="nav bg radius nav-pills nav-fill mb-3 bg" role="tablist">
						<li class="nav-link movemove" id="tab" onclick="mtView()" ><a class="nav-link" data-toggle="pill" href="#nav-tab-paypal"> ALL </a></li>
						<c:forEach items="${ menuTypeList }" var="menuTypeList">
							<li class="nav-link" id="tab${ menuTypeList.mt_Code }" onclick="mtView('${ menuTypeList.mt_Code }')" ><a class="nav-link" data-toggle="pill" href="#nav-tab-card"> ${ menuTypeList.mt_Name } </a></li>
							<div id="tabMt_Code"></div>
						</c:forEach>
					</ul>
					<span id="items">
						<div class="row">
							<c:forEach items="${ menuList }" var="menuList">
							<div class="col-md-3">
								<figure class="card card-product">
								<label id="${ menuList.menu_Code }" onclick="plusOrder('${ menuList.menu_Code }', '${ menuList.menu_Name }', '${ menuList.menu_Price }')">
									<div class="img-wrap">
										<img src="${pageContext.request.contextPath}/resources/images/jumun/${ menuList.menu_Image }">
									</div>
									<figcaption class="info-wrap">
										<div class="action-wrap">
											<div class="price-wrap h5" x>
												<span class="title">${ menuList.menu_Name }</span>
												<span class="price-new">/&nbsp;<fmt:formatNumber pattern="#,###" value="${ menuList.menu_Price }" />원</span>
											</div>
										</div>
									</figcaption>
								</label>
								</figure>
							</div>
							</c:forEach>
						</div>
					</span>
				</div>
					<div class="col-md-4">
						<div class="card">
							<span id="cart">
								<table class="table table-hover shopping-cart-wrap">
									<thead class="text-muted">
										<tr>
											<th scope="col" width="150"><div align="center">메뉴이름</div></th>
											<th scope="col" width="120"><div align="center">수량</div></th>
											<th scope="col" width="120"><div align="center">단가</div></th>
											<th scope="col" class="text-right" width="100"><div
													align="right">삭제&nbsp;</div></th>
										</tr>
									</thead>
									<tbody id="orderCart">
										<c:forEach items="${ ordersList.ordersListDTO }" var="ordersListDTO">
											<tr id="tr${ ordersListDTO.OD_MENU_CODE }">
												<td>
													<figure class="media">
														<figcaption class="media-body" align="center">
															<h6 class="title text-truncate" id="orderMenuName${ ordersListDTO.OD_MENU_CODE }">${ ordersListDTO.MENU_NAME }</h6>
														</figcaption>
														<input type="hidden" id="test${ ordersListDTO.OD_MENU_CODE }" value="0">
													</figure>
												</td>
												<td class="text-center">
													<div class="m-btn-group m-btn-group--pill btn-group mr-2" role="group" aria-label="...">
														<button type="button" class="m-btn btn btn-default" onclick="minusOrder('${ ordersListDTO.OD_MENU_CODE }', '${ ordersListDTO.MENU_PRICE }')">
															<i class="fa fa-minus"></i>
														</button>
														<button type="button" class="m-btn btn btn-default" disabled id="orderMenuCode${ ordersListDTO.OD_MENU_CODE }">${ ordersListDTO.OD_QTY }</button>
														<button type="button" class="m-btn btn btn-default" onclick="plusOrder('${ ordersListDTO.OD_MENU_CODE }', '${ ordersListDTO.MENU_NAME }', '${ ordersListDTO.MENU_PRICE }')">
															<i class="fa fa-plus"></i>
														</button>
													</div>
												</td>
												<td>
													<div class="price-wrap" align="center">
														<var class="price" id="orderMenuPrice${ ordersListDTO.OD_MENU_CODE }">${ ordersListDTO.MENU_PRICE }</var>
													</div>
												</td>
												<td class="text-right" align="center">
													<button onclick="removeOrder('${ ordersListDTO.OD_MENU_CODE }', '${ ordersListDTO.MENU_PRICE }')" class="btn btn-outline-danger">
														<i class="fa fa-trash"></i>
													</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</span>
						</div>
						<div class="box">
							<dl class="dlist-align">
								<dt>총 금 액</dt>
								<dd class="text-right h4 b">
									<div id="allPrice">${ allPrice }</div>
								</dd>
							</dl>
							<dl class="dlist-align">
								<dt>할인금액</dt>
								<dd class="text-right h4 b">
									<div id="discountPrice">0</div>
								</dd>
							</dl>
							<dl class="dlist-align">
								<dt>받을금액</dt>
								<dd class="text-right h4 b">
									<div id="resultPrice">${ allPrice }</div>
								</dd>
							</dl>
							<br>
							<div class="row">
								<div class="col-md-4">
									<div onclick="goPay()" class="btn  btn-primary btn-lg btn-block"><i class="fa fa-shopping-bag"></i> 결제 </div>
								</div>
								<div class="col-md-4">
									<div onclick="goDiscount()" class="btn  btn-primary btn-lg btn-block"><i class="fa fa-shopping-bag"></i> 서비스 </div>
								</div>
								<div class="col-md-4">
									<div onclick="removeOrderAll()" class="btn  btn-primary btn-lg btn-block"><i class="fa fa-shopping-bag"></i> 전체취소 </div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-4">
									<div class="btn  btn-primary btn-lg btn-block"><i class="fa fa-shopping-bag"></i> 주문 </div>
								</div>
								<div class="col-md-4">
									<div class="btn  btn-primary btn-lg btn-block"><i class="fa fa-shopping-bag"></i> 출력 </div>
								</div>
								<div class="col-md-4">
									<a href="posMain.do" class="btn  btn-primary btn-lg btn-block"><i class="fa fa-shopping-bag"></i> 메인 </a>
								</div>
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
		
		$(document).ready(function() {
			// 메뉴구분 탭 활성화
			if('' == '${ mt_Code }'){
				$("#tab").attr('class','nav-link active show');
			}
			<c:forEach items="${ menuTypeList }" var="menuTypeList" >
			 else if('${ menuTypeList.mt_Code }' == '${ mt_Code }'){
				$("#tab${ mt_Code }").attr('class','nav-link active show');
			}
			</c:forEach>
			
			// 시계 시작
			startTime();

			// 주문개수
			oderCntMap = new Map();
			<c:forEach items="${menuList}" var="menuList">
				oderCntMap.set('${menuList.menu_Code}', 0);
			</c:forEach>
			<c:forEach items="${menuList}" var="menuList">
				<c:forEach items="${ ordersList.ordersListDTO }" var="ordersListDTO">
					<c:if test="${menuList.menu_Code eq ordersListDTO.OD_MENU_CODE}">
						oderCntMap.delete('${menuList.menu_Code}');
						oderCntMap.set('${menuList.menu_Code}', ${ ordersListDTO.OD_QTY });
					</c:if>
				</c:forEach>
			</c:forEach>
		});
		
		function mtView(code) {
			if(code != undefined){
				$("#tabMt_Code").append('<input type="hidden" name="mt_Code" value="'+code+'">');
			}
			$("#tabMt_Code").append('<input type="hidden" name="orders_No" value="${orders_No}">');
			$("#orderListForm").attr("action", "ordersList.do");
			$("#orderListForm").submit();
		};
		
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
		};
		
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

		// 결제
		function goPay() {
			var width = 800;
			var height = 600;
			var popupX = (window.screen.width / 2) - (width / 2);
			var popupY = (window.screen.height / 2) - (height / 2);
			var allPrice = $("#allPrice").html();
			var discountPrice = $("#discountPrice").html();
			var resultPrice = $("#resultPrice").html();
			var price = '&allPrice=' + allPrice + '&discountPrice=' + discountPrice + '&resultPrice=' + resultPrice;
			var openWin = window.open('paymentStart.do?orders_No='+${orders_No}+price,'결제','width='+width+',height='+height+',status=no,scrollbars=no, left='+ popupX + ', top='+ popupY);
		};

		// 서비스
		function goDiscount() {
			var width = 800;
			var height = 450;
			var popupX = (window.screen.width / 2) - (width / 2);
			var popupY = (window.screen.height / 2) - (height / 2);
			window.open('orderDiscount.do?allPrice='+$("#allPrice").html(),'서비스','width='+width+',height='+height+',status=no,scrollbars=no, left='+ popupX + ', top='+ popupY);
		};
		
		// 각 메뉴 주문 개수
		var oderCntMap;

		// 주문하기
		function plusOrder(code, name, price) {
			var count = oderCntMap.get(code) + 1;
			
   		    var ordersDetailDTO = new Object();
   				ordersDetailDTO.od_Menu_Code = code;
   				ordersDetailDTO.od_Qty = count;
   				ordersDetailDTO.od_Orders_No = ${orders_No};

			$.ajax({
				  url: 'ordersPlus.do',
				  type: 'post',
				  data: JSON.stringify(ordersDetailDTO),
				  dataType: 'json',
				  contentType: 'application/json',
				  success : function(result) {
					  if(result > 0){
						  if($("#test"+code).val() == '0') {
								$("#orderMenuCode"+code).html(count);
							} else {
								var add = '<tr id="tr'+code+'">		<td>			<figure class="media">				<figcaption class="media-body" align="center">					<h6 class="title text-truncate" id="orderMenuName'+code+'">'+name+'</h6>				</figcaption><input type="hidden" id="test'+code+'" value="0">			</figure>		</td>		<td class="text-center">			<div class="m-btn-group m-btn-group--pill btn-group mr-2" role="group" aria-label="...">				<button type="button" class="m-btn btn btn-default" onclick="minusOrder(\''+code+'\', \''+price+'\')">					<i class="fa fa-minus"></i>				</button>				<button type="button" class="m-btn btn btn-default" disabled id="orderMenuCode'+code+'">'+count+'</button>				<button type="button" class="m-btn btn btn-default" onclick="plusOrder(\''+code+'\', \''+name+'\' , \''+price+'\')">					<i class="fa fa-plus"></i>				</button>			</div>		</td>		<td>			<div class="price-wrap" align="center">				<var class="price" id="orderMenuPrice'+code+'">'+price+'</var>			</div>		</td>		<td class="text-right" align="center">			<button onclick="removeOrder(\''+code+'\', \''+price+'\')" class="btn btn-outline-danger"><i class="fa fa-trash"></i></button>		</td>	</tr>';
								$("#orderCart").append(add);
							}
							oderCntMap.delete(code);
							oderCntMap.set(code, count);
							
							var allPrice = $("#allPrice").html();
							$("#allPrice").html(Number(allPrice) + Number(price));
							$("#resultPrice").html(Number(allPrice) + Number(price));
					  }
				  }
			});
		};

		// 모든주문취소
		function removeOrderAll() {
			event.preventDefault();
			
			var ordersDetailDTO = new Object();
   		 	ordersDetailDTO.od_Orders_No = ${orders_No};
   		 	
			$.ajax({
				  url: 'ordersRemoveAll.do',
				  type: 'post',
				  data: JSON.stringify(ordersDetailDTO),
				  dataType: 'json',
				  contentType: 'application/json',
				  success : function(result) {
					  if(result > 0){
						  $("#allPrice").html(0);
						  $("#resultPrice").html(0);
						  for(var i = 1; i <= oderCntMap.size; i++) {
							  $("#trMN"+i).remove();
							  oderCntMap.delete("MN"+i);
							  oderCntMap.set("MN"+i, 0);
						  }
					  }
				  }
			});
		};

		// 한개 제품 모든 주문취소
		function removeOrder(code, price) {
			event.preventDefault();
			
   		    var ordersDetailDTO = new Object();
   			ordersDetailDTO.od_Menu_Code = code;
   		 	ordersDetailDTO.od_Orders_No = ${orders_No};
   		 	
			$.ajax({
				  url: 'ordersRemove.do',
				  type: 'post',
				  data: JSON.stringify(ordersDetailDTO),
				  dataType: 'json',
				  contentType: 'application/json',
				  success : function(result) {
					  if(result > 0){
						  $("#tr"+code).remove();
							var allPrice = $("#allPrice").html();
							var count = oderCntMap.get(code);
							
							$("#allPrice").html(Number(allPrice) - (Number(price) * Number(count)));
							$("#resultPrice").html(Number(allPrice) - (Number(price) * Number(count)));
							oderCntMap.delete(code);
							oderCntMap.set(code, 0);
					  }
				  }
			});
		};

		// 한개 주문취소
		function minusOrder(code, price) {
			var count = oderCntMap.get(code) - 1;
			
   		    var ordersDetailDTO = new Object();
   				ordersDetailDTO.od_Menu_Code = code;
   				ordersDetailDTO.od_Qty = count;
   				ordersDetailDTO.od_Orders_No = ${orders_No};
			if(count == 0){
				removeOrder(code, price);
			} else {
				$.ajax({
					  url: 'ordersMinus.do',
					  type: 'post',
					  data: JSON.stringify(ordersDetailDTO),
					  dataType: 'json',
					  contentType: 'application/json',
					  success : function(result) {
						  if(result > 0){
							    $("#orderMenuCode"+code).html(count);
								
								oderCntMap.delete(code);
								oderCntMap.set(code, count);
								
								var allPrice = $("#allPrice").html();
								$("#allPrice").html(Number(allPrice) - Number(price));
						  }
					  }
				});
			}
		};
	</script>
</body>
</html>