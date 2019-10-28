<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- 발주서의 기능은 기본적으로 발주계획작성과 흡사하다 다만 핵심적으로

	발주서 조회나 발주서 현황과의 연계와
	1. 발주계획에 입력이 완료된 데이터를 불러와서 적용시킬수 있어야 한다. 
	   이 경우에는 [새창으로 발주계획서를 조회하여 체크박스 선택을 통해서 [적용]버튼으로 적용한다.
	2. 발주서 전표를 출력하는 테이블이 필요하고 이를 인쇄할수 있는 기능도 지원해야한다
	3. 추가적으로 pdf excel email fax로 할수 있는지 여부를 체크한다.
	
	발주서에서의 상단버튼은 발주계획작성과 동일하여
	[주요발주품목] (balju_save)
	 [소요에서는] 
	 [안전재고(혹은적정재고)] 전체 재고량과 안전재고량을 계산, 발주량을 조절할수 있는 방식을 고려해야한다.
	 
	하단메뉴는 [저장] [저장 및 전표 출력] [다시작성] [발주현황]을 적용한다 -->
<head>
	<style>
		.btn_space{
			margin-right: 5px;
		}
	</style>
<!-- 템플릿 link rel -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">


<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- 템플릿 link rel -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- ↑ 이것은 스윗얼럿 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->

<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<meta charset="UTF-8">
<title>발주서 작성</title>
<script type="text/javascript">

	var openItemWin;

	function openItemList(){

		//부모창
		window.name = "Balju";
		//자식창셋팅
		openItemWin = window.open("${path}/balju/popup/Item_list",'itemInfo',"width=500, height=600, toolbars=no");
		
		}
	// openItemList end
	
	var openResultWin;
	
	function openItemResult(){

		//부모창
		window.name = "Balju";
		//자식창셋팅
		openResultWin = window.open("${path}/balju/popup/Item_Result",'itemInfo',"width=700, height=600, toolbars=no");
		}
	//openItemResult end
	
	var openBookMarkWin;

	function openBkList(){

		//부모창
		window.name = "Balju";
		//자식창셋팅
		openBookMarkWin = window.open("${path}/balju/popup/BookMark_list", 'BookMark', "width=700, height=600, toolbars=no");
		}
	//openBookMark end
	
	function openBkInsert(){

		//부모창
		window.name = "Balju";
		//자식창셋팅
		openBookMarkWin = window.open("${path}/balju/popup/BookMark_REG", 'BookMark', "width=900, height=600, toolbars=no");
		}

	var openBpWin;
	
	function openBaljuPlan(){

		//부모창
		window.name = "Balju";
		//자식창셋팅
		openBpWin = window.open("${path}/balju/popup/BPlan_Load", 'Balju_Plan', "width=900, height=600, toolbars=no");
		}
</script>
</head>
<body>
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>발주서등록</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="#"> 발주 </a></li>
								<!-- <li class="active">Basic</li> -->
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header -->
	<div class="content">
		<div class="animated fadeIn">
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> 발주 정보 </h5><br> -->
			<div class="row">
				<div class="col-lg-3">
					<h6>발주자</h6>
					<section class="card">
						<div class="card-body text-secondary">${sessionScope.empregister_name}</div>
					</section>
				</div>
				<div class="col-lg-3">
					<h6>발주일</h6>
					<section class="card">
						<div class="card-body text-secondary">${balju_date}</div>
					</section>
				</div>
			</div>
				
					
				
			<div class="row">
				<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<div class="row"></div>
						<div class="col-lg-8">
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openItemList()">제품정보</button>
							<!-- <button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;">소요</button> -->
								<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openBaljuPlan()">발주계획 불러오기</button>
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:50px;"onclick="openItemResult()">재고현황</button>
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openBkList()">관심품목</button>
								<button type="button" class="btn btn-dark btn-sm" 
								 onclick="openBkInsert()">관심품목등록</button>
						</div>
					</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>품목코드</th>
							<th>품목명</th>
							<th>규격</th>
							<th>수량</th>
							<th>단가</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" id="code" readonly></td>
							<td><input type="text" id="name" readonly></td>
							<td><input type="text" id="stndr" readonly></td>
							<td><input type="text" id="qt" placeholder="수량 입력"></td>
							<td><input type="text" id="price" readonly></td>
							<td><button class="btn btn-dark" id="addData">등록</button>
						</tr>            
  					</tbody>
 				</table>
 					<div class="card-footer"><BR></div>
 				</div>
			</div>
			</div>
			<div class="row">
				<!-- body -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							발주물품 정보<small><code> 관심품목을 먼저 등록하세요 </code></small>
						</div>
						<div id="jsGrid"></div>
						<script>
							var Data = [];
							$("#jsGrid").jsGrid({
								width:"100%",
								height : "400px",
								autoload: true,
								filtering: true,
								sorting : true,
								editing : true,
								data : Data,
								noDataContent: "데이터를 입력해주세요",
								 deleteConfirm: function(item){
												return item.ORDER_PRODUCT_NAME +" 상품을 삭제하시겠습니까?";},

								fields : [
									{name:"ORDER_PRODUCT_CODE", type:"text", width:150, title:"품목코드", readOnly:true},
									{name:"ORDER_PRODUCT_NAME", type:"text", width:150, title:"품목명", readOnly:true},
									{name:"ORDER_PRODUCT_STNDR", type:"text", width:150, title:"규격", readOnly:true},
									{name:"ORDER_QT", type:"text", width:150, title:"수량"},
									{name:"ORDER_PR_EA", type:"text", width:150, title:"단가", readOnly:true},
									{name:"ORDER_WR", type:"text", width:150, title:"작성자", readOnly:true},
									{ type : 'control'}
									]
								
								});
						</script>
						<div class="card-footer">
							<button class="btn btn-primary btn-lg pull-right" onclick="insert()">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
</body>
<script>
		$("#addData").click(function(){
		var flag = true;
		var insertItem={};
		insertItem.ORDER_PRODUCT_CODE = $("#code").val();
		insertItem.ORDER_PRODUCT_NAME = $("#name").val();
		insertItem.ORDER_PRODUCT_STNDR = $("#stndr").val();
		insertItem.ORDER_QT = $("#qt").val();
		insertItem.ORDER_PR_EA = $("#price").val();
		insertItem.ORDER_WR = "${sessionScope.empregister_name}";

			if(insertItem.ORDER_QT<1||isNaN(insertItem.ORDER_QT)){
					alert("수량을 정확히 입력해주세요");
					flag = false;
					return false;
				}
			if(flag == false){
					return false;
				}
		console.log(insertItem);
		$("#jsGrid").jsGrid("insertItem", insertItem);

		$("#code").val("");
		$("#name").val("");
		$("#stndr").val("");
		$("#qt").val("");
		$("#price").val("");
		});
</script>
<script>
		function insert(){
		var items = $("#jsGrid").jsGrid("option", "data");
		var flag = true;
		$.each(items,function(idx,row){
			if(items[idx].ORDER_QT<1||isNaN(items[idx].ORDER_QT)){
				alert("수량을 정확히 입력해주세요");
				flag = false;
				return false;
			}
		})
	if(flag == false){
		return false;
	}else{	
		console.log(JSON.stringify(items));
			$.ajax({
				method: "post",
				dataType:"json",
				contentType: "application/json",
				data: JSON.stringify(items),
				url: "${path}/balju_Input",
				success:function(result){
						var jsonResult = JSON.parse(JSON.stringify(result));
						if(jsonResult.result == "success"){
								alert(jsonResult.resultMsg);
								//sweetalert을 에이젝스 끝나고로 이동시켜보자
							/* sweetAlert은 일반 alert과는 다르게 location.href을 후속으로 두어서 연계할수 없고 바로 실행시킴 
							swal({
								  title: jsonResult.resultMsg,
								  text: "확인을 눌러주세요",
								  icon: jsonResult.result,
								  button: "확인",
								});  */
							location.href="${path}/balju/Balju"
							//window.location.reload(true);
							
						} else if (jsonResult.result == "failure"){
								aleart(jsonResult.resultMsg);
								return false;
							}
					//success end
					}
				//ajax end
				});
			}
		};	
</script>
<script>
	function getReturnValue(items){
		console.log(items);
//		var insertItem={};
		$.each(items, function(idx){
				console.log(items);
				$("#jsGrid").jsGrid("insertItem", items[idx]);
			});
		};

</script>
<script>
	function getReturnValue2(ORDPL_ORDLIN_NUM){
		console.log("발주계획불러오기 창에서 가져온 발주계획목록번호 : " + ORDPL_ORDLIN_NUM);
		var SearchParam = new Array();
		SearchParam.push(ORDPL_ORDLIN_NUM);
		console.log(SearchParam);
		$.ajax({
			method: "post",
			dataType: "json",
			contentType: "application/json",
			data: JSON.stringify(SearchParam),
			url: "${path}/balju/popup/BPlan_Search",
			success : function(list){
				$("#jsGrid").jsGrid({data : list});
				$("#jsGrid").jsGrid("loadData");
				
			//success end
			}
		//ajax end
		})
	//function end
	}
</script>
<script>
	/* $(document).ready(function(){
		$.ajax({
			url: "${path}/balju_Plan_Check",
			type: "post",
			success:function(result){
				console.log("리절트값 : " +result);
				console.log("리절트메세지값 : " + resultMsg);
				var jsonResult = (JSON.parse(JSON.stringify(result)));
					alert("목록번호 정리완료");
				},
			error:function(){
					alert("정상적으로 처리되지 않았습니다");
				}
			});
		//.ready 종료
		}); */
</script>
</html>