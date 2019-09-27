<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<title>POS</title>
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
						<label for="text-input" class="form-control-label" id="allPrice">${ allPrice }</label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label">할인금액</label>
					</div>
					<div class="col-12 col-md-9">
						<label for="text-input" class="form-control-label" id="discountPrice">${ discountPrice }</label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label">결제금액</label>
					</div>
					<div class="col col-md-3">
						<label for="text-input" class="form-control-label" id="resultPrice">${ resultPrice }</label>
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
						<label for="text-input" class="form-control-label" id="payment_Card">0</label>
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
				<button class="btn btn-primary btn-sm" onclick="memCheck()"> 회원확인 </button><br>
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
};

function payCheck() {
	event.preventDefault();
	
	var resultPrice = $("#resultPrice").html();
	var payment_Cash = $("#payment_Cash").val();
	var payment_Card = $("#payment_Card").html();
	var payment_Point = $("#payment_Point").val();
	var sumPrice;
	if(typeof payment_Point == 'undefined' || payment_Point == '') sumPrice = Number(payment_Cash) + Number(payment_Card);
	else sumPrice = Number(payment_Cash) + Number(payment_Card) + Number(payment_Point);
	
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
		if(resultPrice == sumPrice) {
			goPayment();
		} else {
			swal({
				  title: "금액을 확인해주세요.",
				  icon: "warning",
				});
		}
	}
};

function goPayment() {
	$("#kakaoPayForm").submit();
};

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
		
		var pointForm = "";
			pointForm += '<div class="row form-group"> <div class="col col-md-3">  <label for="text-input" class="form-control-label">포인트</label> </div>'; 
			pointForm += '<div class="col-12 col-md-9"> <input type="number" id="payment_Point" class="form-control" name="payment_Point"> </div> </div>';

		$("#pointArea").html(pointForm);
	}
};

function inputCash(){
	$("#payment_Card").html(eval(${ resultPrice } - $("#payment_Cash").val()));
};
</script>
</html>