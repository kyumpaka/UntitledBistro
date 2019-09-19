<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<title>POS</title>
</head>
<body>
	<div class="card">
		<div class="card-header">
			<strong>메뉴 추가</strong>
		</div>
		<div class="card-body card-block">
			<form action="menuAdd.do" method="post" enctype="multipart/form-data" id="multiform" class="form-horizontal">
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="select" class=" form-control-label">menu_Mt_Code</label>
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
						<label for="text-input" class=" form-control-label">menu_Name</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="text" id="text-input" class="form-control" name="menu_Name">
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="text-input" class=" form-control-label">menu_Price</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="number" id="text-input" class="form-control" name="menu_Price">
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="file-input" class=" form-control-label">File input</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="file" id="file-input" name="file" class="form-control-file">
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col col-md-3">
						<label for="select" class=" form-control-label">menu_State</label>
					</div>
					<div class="col-12 col-md-9">
						<select id="select" class="form-control" name="menu_State">
							<option value="판매">판매</option>
							<option value="미판매">미판매</option>
						</select>
					</div>
				</div>
				
				<div id="addIgd"></div>
			</form>
		</div>
		<div class="card-footer">
			<button onclick="ingAdd()" class="btn btn-primary btn-sm">재료 추가</button>
			<button class="btn btn-primary btn-sm" id="uploadbutton"> <i class="fa fa-dot-circle-o"></i> 완료 </button>
			<button onclick="windowClose()" class="btn btn-primary btn-sm"><i class="fa fa-dot-circle-o"></i> 취소</button>
		</div>
	</div>

</body>
<script src="${pageContext.request.contextPath}/resources/pos/assets/js/jquery-2.0.0.min.js" type="text/javascript" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
		var cnt = 0;
		var cntend = cnt;
		function ingAdd() {
			  event.preventDefault();
			  var frmTag = '<div id="addIgd'+cnt+'"><div class="row form-group"> <div class="col col-md-3"> <label for="text-input" class=" form-control-label">ingredient_Product_Code</label> </div>';
				  frmTag += '<div class="col-12 col-md-9"> <input type="text" id="text-input" class="form-control" name="jumun_IngredientDTO['+cnt+'].ingredient_Product_Code"> </div> </div>';
				  frmTag += '<div class="row form-group"> <div class="col col-md-3"> <label for="text-input" class=" form-control-label">ingredient_Qty</label> </div>';
				  frmTag += '<div class="col-12 col-md-9"> <input type="number" id="text-input" class="form-control" name="jumun_IngredientDTO['+cnt+'].ingredient_Qty"> </div>';
				  frmTag += '</div> <button onclick="igdRemove(\''+cnt+'\')" class="btn btn-primary btn-sm" >재료 삭제</button><hr> </div>';
			  $("#addIgd").append(frmTag);
			  if(cntend == cnt) {
				  cnt++;
				  cntend = cnt;
			  } else {
				  cnt = cntend;
			  }
		};
		
		function igdRemove(num) {
			event.preventDefault();
			$("#addIgd"+num).remove();
			if(eval(cnt-1) == num) {
				cnt--;
				cntend = cnt;
			} else {
				cnt = num;
			}
		};

		function windowClose(){
			window.close();
		};

		$("#uploadbutton").click(function() {
			for(var i = 0; i < cnt; i++){
				var code = $("input[name='jumun_IngredientDTO["+i+"].ingredient_Product_Code']").val().trim();
				var qty = $("input[name='jumun_IngredientDTO["+i+"].ingredient_Qty']").val().trim();
				if(code == "" || code == null) {
					alert('재료명을 입력해주세요.');
					$("input[name='jumun_IngredientDTO["+i+"].ingredient_Product_Code']").focus();
					$("input[name='jumun_IngredientDTO["+i+"].ingredient_Product_Code']").val("");
					return;
				}
				if(qty == "" || qty == 0) {
					alert('수량을 입력해주세요.');
					$("jumun_IngredientDTO["+i+"].ingredient_Qty").focus();
					$("jumun_IngredientDTO["+i+"].ingredient_Qty").val("");
					return;
				}
			}
			
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
						})
					  .then(() => {
						  opener.document.location.reload();
						  window.close();
					  });
	            },
	        });
		});
</script>
</html>