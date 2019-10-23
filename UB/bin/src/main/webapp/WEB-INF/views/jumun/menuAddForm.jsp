<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>POS</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="card">
		<div class="card-header">
			<strong>메뉴 추가</strong>
		</div>
		<div class="card-body card-block">
			<form action="/erp/menuAdd.do" method="post" enctype="multipart/form-data" id="multiform" class="form-horizontal">
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="select" class=" form-control-label">메뉴 구분 이름</label>
					</div>
					<div class="col-12 col-md-9">
						<select id="select" class="form-control" name="menu_Mt_Code">
						<c:forEach items="${ menuTypeList }" var="menuTypeList">
							<option value="${ menuTypeList.mt_Code }">${ menuTypeList.mt_Name }</option>
						</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class=" form-control-label">메뉴 이름</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="text" id="text-input" class="form-control" name="menu_Name">
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class=" form-control-label">가격</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="number" id="text-input" class="form-control" name="menu_Price">
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="file-input" class=" form-control-label">사진</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="file" id="file-input" name="file" class="form-control-file">
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="select" class=" form-control-label">상태</label>
					</div>
					<div class="col-12 col-md-9">
						<select id="select" class="form-control" name="menu_State">
							<option value="판매">판매</option>
							<option value="품절">품절</option>
						</select>
					</div>
				</div>
				
				<div id="addIgd"></div>
			</form>
		</div>
		<div class="card-footer">
			<button onclick="ingAdd()" class="btn btn-primary btn-sm">재료 추가</button>
			<button class="btn btn-primary btn-sm" onclick="upload()"> <i class="fa fa-dot-circle-o"></i> 완료 </button>
			<button onclick="windowClose()" class="btn btn-primary btn-sm"><i class="fa fa-dot-circle-o"></i> 취소</button>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var igdcnt = 0;
var cntend = igdcnt;
function ingAdd() {
	  event.preventDefault();
	  var frmTag = '<div id="addIgd'+igdcnt+'"><div class="row form-group"> <div class="col col-md-3"> <label for="text-input" class=" form-control-label">재료 이름</label> </div>';
		  frmTag += '<div class="col-12 col-md-9"> <select class="form-control" name="ingredientDTO['+igdcnt+'].ingredient_Product_Code">';
		  frmTag += '<c:forEach items="${ productList }" var="productList"><option value="${ productList.PRODUCT_CODE }">${productList.PRODUCT_NAME}</option></c:forEach></select></div> </div>';
		  frmTag += '<div class="row form-group"> <div class="col col-md-3"> <label for="text-input" class=" form-control-label">개수</label> </div>';
		  frmTag += '<div class="col-12 col-md-9"> <input type="number" id="text-input" class="form-control" name="ingredientDTO['+igdcnt+'].ingredient_Qty"> </div>';
		  frmTag += '</div> <button onclick="igdRemove(\''+igdcnt+'\')" class="btn btn-primary btn-sm" >재료 삭제</button><hr> </div>';
	  $("#addIgd").append(frmTag);
	  if(cntend == igdcnt) {
		  igdcnt++;
		  cntend = igdcnt;
	  } else {
		  igdcnt = cntend;
	  }
}

function igdRemove(num) {
	event.preventDefault();
	$("#addIgd"+num).remove();
	if(eval(igdcnt-1) == num) {
		igdcnt--;
		cntend = igdcnt;
	} else {
		igdcnt = num;
	}
}

function windowClose(){
	window.close();
}

function upload(){
	if(igdcheck()){
		if(menucheck()){
			var menu_Name = $("input[name='menu_Name']").val().trim();
			$.ajax({
				  url: 'menuNameCheck.do',
				  type: 'post',
				  data: {name:menu_Name},
				  dataType: 'json',
				  success : function(result) {
					  if(result > 0) {
						  swal({
							  title: "같은 메뉴 이름이 등록되어 있습니다.",
							  icon: "warning",
							});
					  } else if(result == 0) {
						    var form = $('#multiform')[0];
							var formData = new FormData(form);
							$.ajax({
					            type: "POST",
					            enctype: 'multipart/form-data',
					            url: "menuAdd.do",
					            data: formData,
					            processData: false,
					            contentType: false,
					            cache: false,
					            success: function (result) {
					            	swal({
										  title: result + "개 등록되었습니다.",
										  icon: "success",
										  button: "닫기",
										}).then(() => {
										  opener.document.location.reload();
										  window.close();
									  });
					            },
					        });
					  }
				  }
			});
		}
	}
}

function menucheck() {
	var menu_Name = $("input[name='menu_Name']").val().trim();
	var menu_Price = $("input[name='menu_Price']").val().trim();
	
	if(menu_Name == "" || menu_Name == null) {
		swal({
			  title: "메뉴명을 입력해주세요.",
			  icon: "warning",
			});
		$("input[name='menu_Name']").focus();
		$("input[name='menu_Name']").val("");
		return false;
	}
	if(menu_Price == "" || menu_Price == 0) {
		swal({
			  title: "가격을 입력해주세요.",
			  icon: "warning",
			});
		$("input[name='menu_Price']").focus();
		$("input[name='menu_Price']").val("");
		return false;
	}
	return true;
}

function igdcheck() {
	for(var i = 0; i < igdcnt; i++){
		var code = $("select[name='ingredientDTO["+i+"].ingredient_Product_Code']").val().trim();
		var qty = $("input[name='ingredientDTO["+i+"].ingredient_Qty']").val().trim();
		if(code == "" || code == null) {
			swal({
				  title: "재료명을 입력해주세요.",
				  icon: "warning",
				});
			$("input[select='ingredientDTO["+i+"].ingredient_Product_Code']").focus();
			$("input[select='ingredientDTO["+i+"].ingredient_Product_Code']").val("");
			return false;
		}
		if(qty == "" || qty == 0) {
			swal({
				  title: "수량을 입력해주세요.",
				  icon: "warning",
				});
			$("ingredientDTO["+i+"].ingredient_Qty").focus();
			$("ingredientDTO["+i+"].ingredient_Qty").val("");
			return false;
		}
	}
	if(igdcnt == 0){
		swal({
			  title: "재료를 추가해주세요.",
			  icon: "warning",
			});
		return false;
	}
	return true;
}
</script>
</html>