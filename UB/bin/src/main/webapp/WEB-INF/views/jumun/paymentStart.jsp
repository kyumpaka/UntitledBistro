<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="card">
		<div class="card-header">
			<strong>결제화면</strong>
		</div>
		<div class="card-body card-block">
			<form method="post" action="kakaoPay.do" id="kakaoPayForm">
				<input type="hidden" name="orders_No" value="${ orders_No }">
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label">총 금 액</label>
					</div>
					<div class="col col-md-3">
						<input type="number" id="allPrice" class="form-control" name="allPrice" value="${ allPrice }" readonly="readonly">
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label">할인금액</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="number" id="discountPrice" class="form-control" name="discountPrice" value="${ discountPrice }" readonly="readonly">
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label">결제금액</label>
					</div>
					<div class="col col-md-3">
						<input type="number" id="resultPrice" class="form-control" name="resultPrice" value="${ resultPrice }" readonly="readonly">
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label">현금금액</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="number" id="payment_Cash" class="form-control" name="payment_Cash" oninput="inputCash()">
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label">카드금액</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="number" id="payment_Card" class="form-control" name="payment_Card" value="0" readonly="readonly">
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label">회원아이디</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="text" id="payment_Member_Id" class="form-control" name="payment_Member_Id">
					</div>
				</div>
				<button class="btn btn-primary btn-sm" onclick="memCheck()"> 회원확인 </button>
				<button class="btn btn-primary btn-sm" onclick="joinMember()"> 회원가입 </button><br>
				<div id="pointArea"></div>
			</form>
		</div>
		<div class="card-footer">
			<button class="btn btn-primary btn-sm" onclick="payCheck()"> <i class="fa fa-dot-circle-o"></i> 완료 </button>
			<button onclick="windowClose()" class="btn btn-primary btn-sm"><i class="fa fa-dot-circle-o"></i> 취소</button>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function windowClose() {
	window.close();
}

function joinMember() {
	event.preventDefault();
	var width = 400;
	var height = 500;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY = (window.screen.height / 2) - (height / 2);
	window.open('${pageContext.request.contextPath}/Seobis/pop/jUs','회원가입','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
}

function pointCheck() {
	var point = $("#payment_Point").val();
	if(typeof point != 'undefined') {
		if(point.trim() == ""){
			swal({
				  title: "포인트를 입력해주세요.",
				  icon: "warning",
				});
			$("#payment_Point").focus();
			return false;
		} else {
			return true;
		}
	} else {
		return true;
	}
}

function cashCheck() {
	var cash = $("#payment_Cash").val().trim();
	
	if(cash == ""){
		swal({
			  title: "현금금액을 입력해주세요.",
			  icon: "warning",
			});
		$("#payment_Cash").focus();
		return false;
	} else {
		return true;
	}
	
}

function payCheck() {
	event.preventDefault();
	
	var resultPrice = $("#resultPrice").val();
	var payment_Cash = $("#payment_Cash").val();
	var payment_Card = $("#payment_Card").val();
	var payment_Point = $("#payment_Point").val();
	var sumPrice;
	if(typeof payment_Point == 'undefined') sumPrice = Number(payment_Cash) + Number(payment_Card);
	else sumPrice = Number(payment_Cash) + Number(payment_Card) + Number(payment_Point);
	
	if(cashCheck()) {
		if(pointCheck()) {
			if($("#payment_Member_Id").val().trim() == "") {
				swal({
					  title: "회원 없이 결제하시겠습니까?",
					  icon: "warning",
					  buttons: ["아니요", "네"],
					  dangerMode: true,
					}).then((willDelete) => {
						  if (willDelete) {
							  if(resultPrice == sumPrice) {
							  		goPayment();
							  }
						  }
					});
			} else {
				if(resultPrice == sumPrice && payment_Card >= 0) {
					var memberId = $("#payment_Member_Id").val().trim();
	
					// 회원여부 확인
					$.ajax({
						  url: 'memberPointSearchById.do',
						  type: 'post',
						  data: { member_Id:memberId },
						  dataType: 'json',
						  success : function(result) {
							  	goPayment();
						  },
						  error : function(request,status,error) {
							  swal({
								  title: "가입되지 않은 아이디입니다.",
								  icon: "warning",
							  });
						  }
					});
					
				} else {
					swal({
						  title: "금액을 확인해주세요.",
						  icon: "warning",
						});
				}
			}
		}
	}
}

function goPayment() {
	event.preventDefault();
	$("#kakaoPayForm").submit();
}

function memCheck() {
	event.preventDefault();
	
	if($("#payment_Member_Id").val().trim() == "") {
		swal({
			  title: "아이디를 입력해주세요.",
			  icon: "warning",
			});
		$("#payment_Member_Id").focus();
	} else {
		var memberId = $("#payment_Member_Id").val().trim();

		// 포인트 확인하기
		$.ajax({
			  url: 'memberPointSearchById.do',
			  type: 'post',
			  data: { member_Id:memberId },
			  dataType: 'json',
			  success : function(result) {
				  swal({
					  title: memberId + "님의 포인트는 " + result + "입니다. 포인트를 사용하시겠습니까?",
					  icon: "success",
					  buttons: ["아니요", "네"],
					  dangerMode: true,
					}).then((willDelete) => {
							if(willDelete) {
								if(result >= 1000) {
									var pointForm = "";
										pointForm += '<div class="row form-group"> <div class="col col-md-3">  <label for="text-input" class="form-control-label">포인트</label> </div>'; 
										pointForm += '<div class="col-12 col-md-9"> <input type="number" id="payment_Point" class="form-control" name="payment_Point" value='+result+' oninput="inputPoint()"> </div> </div>';
							
									$("#pointArea").html(pointForm);							
								} else {
									  swal({
										  title: "포인트가 부족합니다.",
										  icon: "warning",
										  button: "닫기",
										});
								}
							}
					});
			  },
			  error : function(request,status,error) {
				  swal({
					  title: "가입되지 않은 아이디입니다.",
					  icon: "warning",
				  });
			  }
		});
	}
}

function inputCash(){
	var payment_Point = $("#payment_Point").val();
	if(typeof payment_Point == 'undefined' || payment_Point == '') $("#payment_Card").val(eval(${ resultPrice } - $("#payment_Cash").val()));
	else $("#payment_Card").val(eval(${ resultPrice } - $("#payment_Cash").val() - $("#payment_Point").val()));
}

function inputPoint(){
	$("#payment_Card").val(eval(${ resultPrice } - $("#payment_Cash").val() - $("#payment_Point").val()));
}
</script>
</html>