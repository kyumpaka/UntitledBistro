<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<strong>메뉴 수정</strong>
		</div>
		<div class="card-body card-block">
			<div class="col col-md-3" align="center">
				<img alt="사진 등록 안됨" src="${pageContext.request.contextPath}/resources/images/jumun/${ menuDTO.menu_Image }" height="200" width="400">
			</div>
			<form action="/erp/menuModi.do" method="post" enctype="multipart/form-data" id="multiform" class="form-horizontal">
				<input type="hidden" value="${ menuDTO.menu_Code }" name="menu_Code">
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="select" class=" form-control-label">메뉴 구분</label>
					</div>
					<div class="col-12 col-md-9">
						<select id="select" class="form-control" name="menu_Mt_Code">
							<c:forEach items="${ menuTypeList }" var="menuTypeList">
								<c:if test="${ menuDTO.menu_Mt_Code eq menuTypeList.mt_Code }">
									<option value="${ menuTypeList.mt_Code }" selected="selected">${ menuTypeList.mt_Name }</option>
								</c:if>
								<c:if test="${ menuDTO.menu_Mt_Code ne menuTypeList.mt_Code }">
									<option value="${ menuTypeList.mt_Code }">${ menuTypeList.mt_Name }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class=" form-control-label">메뉴 이름</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="text" id="text-input" class="form-control" name="menu_Name" value="${ menuDTO.menu_Name }">
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class=" form-control-label">가격</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="number" id="text-input" class="form-control" name="menu_Price" value="${ menuDTO.menu_Price }">
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
							<c:if test="${ menuDTO.menu_State eq '판매' }">
								<option value="판매" selected="selected">판매</option>
								<option value="품절">품절</option>
							</c:if>
							<c:if test="${ menuDTO.menu_State eq '품절' }">
								<option value="판매">판매</option>
								<option value="품절" selected="selected">품절</option>
							</c:if>
						</select>
					</div>
				</div>
				<div id="addIgd">
					<c:forEach items="${ menuDTO.ingredientDTO }" var="IngredientDTO" varStatus="stauts">
						<div id="addIgd${ stauts.index }">
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">재료 이름</label>
								</div>
								<div class="col-12 col-md-9">
									<select class="form-control" name="ingredientDTO[${ stauts.index }].ingredient_Product_Code">
									<c:forEach items="${ productList }" var="productList">
									<c:if test="${ IngredientDTO.ingredient_Product_Code eq productList.PRODUCT_NAME }">
									<option value="${ productList.PRODUCT_CODE }" selected="selected">${ productList.PRODUCT_NAME }</option>
									</c:if>
									<c:if test="${ IngredientDTO.ingredient_Product_Code != productList.PRODUCT_NAME }">
									<option value="${ productList.PRODUCT_CODE }">${ productList.PRODUCT_NAME }</option>
									</c:if>
									</c:forEach>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">개수</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="number" id="text-input" class="form-control"
										name="ingredientDTO[${ stauts.index }].ingredient_Qty"
										value="${ IngredientDTO.ingredient_Qty }">
								</div>
							</div>
							<button onclick="igdRemove('${ stauts.index }')"
								class="btn btn-primary btn-sm">재료 삭제</button>
							<hr>
						</div>
					</c:forEach>
				</div>
				
			</form>
		</div>
		<div class="card-footer">
			<button onclick="igdAdd()" class="btn btn-primary btn-sm">재료 추가</button>
			<button class="btn btn-primary btn-sm" onclick="upload()"> <i class="fa fa-dot-circle-o"></i> 완료 </button>
			<button onclick="windowClose()" class="btn btn-primary btn-sm"><i class="fa fa-dot-circle-o"></i> 취소</button>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var igdcnt = ${fn:length(menuDTO.ingredientDTO)};
var cntend = igdcnt;
function igdAdd() {
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

function upload() {
	if(igdcheck()){
		if(menucheck()){
			var menu_Name = $("input[name='menu_Name']").val().trim();
			$.ajax({
				  url: 'menuNameCheck.do',
				  type: 'post',
				  data: {name:menu_Name},
				  dataType: 'json',
				  success : function(result) {
					  if(result > 1) {
						  swal({
							  title: "같은 메뉴 이름이 등록되어 있습니다.",
							  icon: "warning",
							});
					  } else if(result <= 1) {
						    var form = $('#multiform')[0];
							var formData = new FormData(form);
							$.ajax({
					            type: "POST",
					            enctype: 'multipart/form-data',
					            url: "menuModi.do",
					            data: formData,
					            processData: false,
					            contentType: false,
					            cache: false,
					            success: function (result) {
					            	swal({
										  title: result + "개 수정되었습니다.",
										  icon: "success",
										  button: "닫기",
										}).then(() => {
										  opener.document.location.reload();
										  window.close();
									  	});
					            },
					            error:function(request,status,error) {
					            	swal({
										  title: "같은 메뉴 이름이 등록되어 있습니다.",
										  icon: "warning",
										});
					            }
					        });
					  }
				  }
			});
		}
	}
}

function menucheck(){
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

function igdcheck(){
	for(var i = 0; i < igdcnt; i++){
		var code = $("select[name='ingredientDTO["+i+"].ingredient_Product_Code']").val().trim();
		var qty = $("input[name='ingredientDTO["+i+"].ingredient_Qty']").val().trim();
		if(code == "" || code == null) {
			swal({
				  title: "재료명을 입력해주세요.",
				  icon: "warning",
				});
			$("select[name='ingredientDTO["+i+"].ingredient_Product_Code']").focus();
			$("select[name='ingredientDTO["+i+"].ingredient_Product_Code']").val("");
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
	if(igdcnt == 0) return false;
	return true;
}
</script>
</html>