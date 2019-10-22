<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- result에서는  1항목씩 전체적인 부분을 그리드를 통해서 inner join insert하며
		그리드의 update 기능을 이용하여 item을 ajax update 처리 한다 
		update와 delete 기능을 ajax로 처리할수 있도록 한다.
		
	발주계획현황은 전체, 진행중, 완료 3개의 탭으로 구분하며 보여주며
	수량조정은 그리드상에서 적용하며 [신규]는 blaju_plan.jsp로 이동한다
	[종결]이나 [선택삭제]또한 체크박스를 통해서 일괄적으로 처리할수 있도록 버튼을 지원한다
	
	>>> 발주진행(혹은 발주서버튼) <<< 을 통해서 체크한 값을 발주로 balju table에 insert 해줄수 있어야한다. -->

<head>
<meta charset="UTF-8">
<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<title>JSP</title>
</head>
<body>
	<!-- <button id="delete">jsgrid 데이터 업데이트</button>
	<button id="cancel">취소</button> -->
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>발주계획조회</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="#"> 전체 </a></li>
								<li class="active"><a href="#"> 진행중 </a></li>
								<li><a href="#"> 완료 </a></li>
								<!-- <li class="active">Basic</li> -->
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header -->
	<!-- jsGrid 생성을 합니다.-->
	<div class="content">
		<div class="animated fadeIn">
		<div class="row">
				<!-- body -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							발주물품 정보<small><code> 수량만 수정가능합니다 </code></small>
						</div>
			<div id="jsGrid"></div>
	<script>
	$.ajax({
		type : "get",
		url : "${path}/balju_Plan_Result",
		}).done(function(json) {
			$("#jsGrid").jsGrid({
				width : "100%",
				height : "auto",
				editing : true,
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				// 페이징 처리
				paging : true,
				pageSize : 10,
				pageButtonCount : 5,
				//json 배열을 데이터에 연결함.
				data : json,
				//수정하고싶은 데이터를 추출해서 처리함
				onItemUpdated : function(args){
					console.log(args.item);
					console.log(args.item.ORDPL_ORDLIN_NUM);
					console.log(args.item.ORDPL_ONUM);
					console.log(args.item.ORDPL_QT);
					
					var UpdateList = new Array();
					UpdateList.push(args.item.ORDPL_ORDLIN_NUM);
					UpdateList.push(args.item.ORDPL_ONUM);
					UpdateList.push(args.item.ORDPL_QT);

					console.log(UpdateList);
					
					$.ajax({
						method: "post",
						dataType:"json",
						contentType: "application/json",
						data: JSON.stringify(UpdateList),
						url: "${path}/balju_Plan_Update",
						success:function(result){
								var jsonResult = JSON.parse(JSON.stringify(result));
								if(jsonResult.result == "success"){
										alert(jsonResult.resultMsg);
										
									/* sweetAlert은 일반 alert과는 다르게 location.href을 후속으로 두어서 연계할수 없고 바로 실행시킴 
									swal({
										  title: jsonResult.resultMsg,
										  text: "확인을 눌러주세요",
										  icon: jsonResult.result,
										  button: "확인",
										});  */
									//location.href="${path}/balju/Balju_Plan"
									//window.location.reload(true);
									
								} else if (jsonResult.result == "failure"){
										aleart(jsonResult.resultMsg);
										return false;
									}
							//success end
							}
						//ajax end
						});
					},
				deleteConfirm: function(item){
						return item.ORDPL_PRODUCT_NAME + "를 삭제하시겠습니까?"
					},
				onItemDeleted: function(args){
					console.log(args.item);
					console.log(args.item.ORDPL_ORDLIN_NUM);
					console.log(args.item.ORDPL_ONUM);

					var DeleteList = new Array();
					DeleteList.push(args.item.ORDPL_ORDLIN_NUM);
					DeleteList.push(args.item.ORDPL_ONUM);

					console.log(DeleteList);

					$.ajax({
						method: "post",
						dataType:"json",
						contentType: "application/json",
						data: JSON.stringify(DeleteList),
						url: "${path}/balju_Plan_Delete",
						success:function(result){
								var jsonResult = JSON.parse(JSON.stringify(result));
								if(jsonResult.result == "success"){
										alert(jsonResult.resultMsg);
										
									/* sweetAlert은 일반 alert과는 다르게 location.href을 후속으로 두어서 연계할수 없고 바로 실행시킴 
									swal({
										  title: jsonResult.resultMsg,
										  text: "확인을 눌러주세요",
										  icon: jsonResult.result,
										  button: "확인",
										});  */
									//location.href="${path}/balju/Balju_Plan"
									//window.location.reload(true);
									
								} else if (jsonResult.result == "failure"){
										aleart(jsonResult.resultMsg);
										return false;
									}
							//success end
							}
						//ajax end
						});
					},
				//grid에 표현될 필드 요소
				fields : [ 
					{name : "TO_CHAR(ORPLIN_DATE,'YYYY-MM-DD')", type : "text", title : "일자", align: "center",
						 readOnly : true, width : 100}, 
					{name : "ORDPL_ORDLIN_NUM",  type : "text", title : "발주계획번호", align: "center",
					 readOnly : true, width : 100}, 
					{name : "ORDPL_ONUM",  type : "text", title : "발주물품번호", align: "center",
						 readOnly : true, sorting : true, width : 100}, 
					{name : "ORDPL_PRODUCT_CODE",type : "text",title : "품목코드", align: "center",
					 readOnly : true, width : 150}, 
					{name : "ORDPL_PRODUCT_NAME",type : "text",title : "품목명", align: "center",
					 readOnly : true, width : 150}, 
					{name : "ORDPL_PRODUCT_STNDR",type : "text",title : "규격", align: "center",
					 readOnly : true, width : 150}, 
					{name : "ORDPL_QT", type : "text", title : "수량", align: "center", width : 120},
					{name : "ORDPL_PR_EA", type : "text", title : "단가", align: "center", readOnly : true, width : 120}, 
					{name : "ORDPL_WR", type : "text", title : "작성자", align: "center", readOnly : true, width : 100}, 
					{type : "control", editButton: false, deleteButton : true} ]

					}); // 그리드 끝
				}); // ajax 끝

				//버튼 클릭시 grid에 데이터를 업데이트
				/* $("#delete").click(function() {
					$("#jsGrid").jsGrid("deleteItem", item);
				});
				
				$("#cancel").click(function() {
					$("#jsGrid").jsGrid("cancelEdit");
				}); */
			</script>
			<!-- 꾸미기용 card-footer -->
			<div class="card-footer">
							<br>
						</div>
			<!-- 꾸미기용 card-footer -->			
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
</body>
</html>