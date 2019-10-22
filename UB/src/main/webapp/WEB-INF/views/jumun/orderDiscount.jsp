<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS</title>
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/ui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/pos/assets/fonts/fontawesome/css/fontawesome-all.min.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pos/assets/css/OverlayScrollbars.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<section class="section-content padding-y-sm bg-default">
		<form method="post" id="orderListForm">
			<div class="container-fluid">
				<div class="box">
					<div class="row">
						<input type="text" id="posInput" style="margin: 10px; width: 80%; height: 30px;">
						<div class="col-md-2">
							<div onclick="inputNum('<')" class="btn  btn-primary btn-lg btn-block"> &lt; </div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3">
							<div onclick="inputNum(7)" class="btn  btn-primary btn-lg btn-block"> 7 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum(8)" class="btn  btn-primary btn-lg btn-block"> 8 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum(9)" class="btn  btn-primary btn-lg btn-block"> 9 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum('%')" class="btn  btn-primary btn-lg btn-block"> %할인 </div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3">
							<div onclick="inputNum(4)" class="btn  btn-primary btn-lg btn-block"> 4 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum(5)" class="btn  btn-primary btn-lg btn-block"> 5 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum(6)" class="btn  btn-primary btn-lg btn-block"> 6 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum('⒲')" class="btn  btn-primary btn-lg btn-block"> ⒲할인 </div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3">
							<div onclick="inputNum(1)" class="btn  btn-primary btn-lg btn-block"> 1 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum(2)" class="btn  btn-primary btn-lg btn-block"> 2 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum(3)" class="btn  btn-primary btn-lg btn-block"> 3 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum('clear')" class="btn  btn-primary btn-lg btn-block"> Clear </div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3">
							<div onclick="inputNum(0)" class="btn  btn-primary btn-lg btn-block"> 0 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum('천원')" class="btn  btn-primary btn-lg btn-block"> 000 </div>
						</div>
						<div class="col-md-3">
							<div onclick="inputNum('만원')" class="btn  btn-primary btn-lg btn-block"> 0000 </div>
						</div>
						<div class="col-md-3">
							<div onclick="calc()" class="btn  btn-primary btn-lg btn-block"> Enter </div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-9">
							<div onclick="window.close();" class="btn  btn-primary btn-lg btn-block"> 닫기 </div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/OverlayScrollbars.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function inputNum(num) {
	var oldNum = $("#posInput").val();
	if(num == "<"){
		$("#posInput").val(oldNum.substr(0, oldNum.length-1));
	} else if(num == "clear") {
		$("#posInput").val("");
	} else if(num == "천원") {
		if(oldNum != "" && oldNum != 0) $("#posInput").val(oldNum + '000');
	} else if(num == "만원") {
		if(oldNum != "" && oldNum != 0) $("#posInput").val(oldNum + '0000');
	} else if(num == "0") {
		if(oldNum != "0") $("#posInput").val(oldNum + '0');
	}  else {
		if(oldNum.substr(oldNum.length-1, 1) != "%" && oldNum.substr(oldNum.length-1, 1) != "⒲") {
			if(oldNum == 0) $("#posInput").val(num);
			else $("#posInput").val(oldNum + num);
		}
	}
}

function calc() {
	var input = $("#posInput").val();
	var num = input.substr(0, input.length-1);
	var unit = input.substr(input.length-1, 1);
	
	if(unit == "%") {
		if(num <= 100) {
			var price = eval(${ allPrice } * num / 100);
			opener.document.getElementById("discountPrice").innerHTML = price;
			opener.document.getElementById("resultPrice").innerHTML = ${ allPrice } - price;
			window.close();
		} else swal({
			  title: "값이 잘못됬습니다.",
			  icon: "warning",
			  button: "닫기",
			});
	} else if(unit == "⒲") {
		if(num < ${ allPrice }) {
			opener.document.getElementById("discountPrice").innerHTML = num;
			opener.document.getElementById("resultPrice").innerHTML = ${ allPrice } - num;
			window.close();
		} else swal({
			  title: "값이 잘못됬습니다.",
			  icon: "warning",
			  button: "닫기",
			});
	} else {
		swal({
			  title: "단위를 선택해주세요.",
			  icon: "warning",
			  button: "닫기",
			}).then(() => {
				$("#posInput").focus();
			});
	}
}
</script>
</body>
</html>