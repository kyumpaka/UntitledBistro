<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- 발주서 검색 창에서는 일자와 품목코드만을 입력받아서 발주건에 대한 검색을 진행한다.

	1.입력창에 존재해야 하는것 1일자 (데이트셀렉트레인지) 데이트피커를 통해서 일자범위를 지정하고
	품목코드를 골라서 해당 품목이 존재하는 [진행상태]칼럼이 [진행중]인 데이터를 검색한다 
	
	2.이에대해서 금일,전일,금주,전주,금월,전월에 대응하는 검색버튼을 각각 작성한다.
	ajax 처리할 항목은 없으며 검색 결과는 Balju_result로 넘겨준다-->


<head>
<!-- 템플릿 link rel -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">


<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- 템플릿 link rel -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<meta charset="UTF-8">
<title>발주 계획 작성</title>
</head>
<body>
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>발주서관리</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="${path}/balju/Balju_Mng_All" > 전체 </a></li>
								<li><a href="${path}/balju/Balju_Mng" > 진행중 </a></li>
								<li><a href="${path}/balju/Balju_Com" > 완료 </a></li>
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
				<!-- body -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							발주서 관리
						</div>
						<div class="card-body">
							<table class="table table-striped table-hover">
								<thead style="text-align: center;">
									<tr>
										<th width=25px;><input type="checkbox" name="checkAll" 
											id="checkAll_prime" onclick="checkAll()"></th>
										<th width=100px;>발주번호</th>
										<th width=200px;>일자</th>
										<th width=150px;>담당자</th>
										<th>품목</th>
										<th>총 금액</th>
										<th>종결</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									<c:forEach var="Mng" items="${Mng_list}" varStatus="status">
										<tr>
											<td><input type="checkbox" name="checkRow"
												value="${status.count}"></td>
											<td>${Mng.ORDER_ORDIN_NUM}</td>
											<td>${Mng.ORPLIN_DATE}</td>
											<td>${Mng.ORDER_WR}</td>
											<td>${Mng.ORDER_PRODUCT_NAME}외${Mng.ORDER_PRODUCT_COUNT}개</td>
											<td>${Mng.TOTAL_PR}</td>
											<td><input type="button" class="endBtn" 
													style="background-color: transparent !important;
													background-image: none !important;
													border-color: transparent;
													border: none;
													color: #007BFF;" value="${Mng.ORDER_END}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<button class="btn btn-dark btn-lg pull-left"
								style="margin-right: 20px;" onclick="location.href='${path}/balju/Balju'">신규</button>
							<button class="btn btn-dark btn-lg pull-left" 
								onclick="deleteCheck()">선택삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
	
	
<script>
	//체크박스 전체선택
	function checkAll(){
		if($("#checkAll_prime").is(":checked")){
				$("input[name=checkRow]").prop("checked",true);
		}else{
				$("input[name=checkRow]").prop("checked",false);
			}
		}
</script>
<script>
	function deleteCheck(){
		var deleteRow =  new Array();
		var rowVal = new Object();
		var checkBox = $("input[name='checkRow']:checked");
		checkBox.each(function(idx){
			var tr = checkBox.parent().parent().eq(idx);
			var td = tr.children();

			rowVal = td.eq(1).text();
			//rowVal[idx] = $(this).val();
			console.log("rowVal값 체크 : " + rowVal);
			deleteRow.push(rowVal)
			console.log("deleteRow값 체크 : " + deleteRow); 
			})
		console.log("deleteRow값 체크 : "+deleteRow);
		if(deleteRow==""){
			alert("삭제할 대상을 선택하세요.");
			return false;
			}
		
		if(confirm("선택한 발주서를 삭제하시겠습니까?")){
				$.ajax({
					method : "post",
					dataType : "json",
					data : JSON.stringify(deleteRow),
					contentType : "application/json",
					url : "${path}/balju/deleteBalju",
					success : function(result){
						var jsonResult = JSON.parse(JSON.stringify(result));
						if(jsonResult.result == "success"){
								alert(jsonResult.resultMsg);
								location.href="${path}/balju/Balju_Mng"
						}else if(jsonResult.result == "failure"){
								alert(jsonResult.resultMsg);
								return false;
							}
						//success end
						}
					//ajax end
					});
			//if confirm end
			}
		
		
		}
</script>
<script>
	$('.endBtn').click(function(){
	
	var ynParam = $(this).attr('value'); //종결이냐 취소냐
	var endVal = $(this); // 버튼위치
	var endParam = new Array();
	var data = new Object();
	
	console.log(ynParam);
	console.log(endVal);
	
		var tr = endVal.parent().parent();
		var td = tr.children();
		
				//발주번호 td.eq(1)
		data.ORDIN_NUM = td.eq(1).text();
		
		console.log("data값 체크 : " + data);
				//종결값 종결/취소 
				
		if(ynParam == "종결"){
			ynParam="취소";
		}else if(ynParam == "취소"){
			ynParam="종결";
			}
				
		data.ORDIN_END = ynParam;
		console.log("data값 체크 : " + data);
		
		endParam.push(data);
		console.log("endParam값 체크 : " + endParam);
		
	if(confirm("해당 발주서의 종결여부를 결정 하시겠습니까?")){
			$.ajax({
				method : "post",
				dataType : "json",
				data : JSON.stringify(endParam),
				contentType : "application/json",
				url : "${path}/balju/BaljuEnd",
				success : function(result){
					var jsonResult = JSON.parse(JSON.stringify(result));
					if(jsonResult.result == "success"){
							alert(jsonResult.resultMsg);
							location.href="${path}/balju/Balju_Mng?isRiskItemCount=" + jsonResult.riskItemCount;
					}else if(jsonResult.result == "failure"){
							alert(jsonResult.resultMsg);
							return false;
					}
					//success end
				}
					
				//ajax end
			});
		//if confirm end
		}
	
	});
</script>
</body>
</html>

