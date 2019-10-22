<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style>
/* 데이트피커용 손가락 변환 */
.hasDatepicker{cursor: pointer;}
</style>
<title>발주서 현황</title>
</head>
<body>
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>발주서현황</h1>
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
				<div class="col-md-7">
				<div class="card">
					<div class="card-header"></div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th></th>
							<th>시작일</th>
							<th>종료일</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td><input type="text" id="dateStart"></td>
							<td><input type="text" id="dateEnd"></td>
							<td><button class="btn btn-dark btn-sm" id="dateSub">검색</button></td>
						</tr>            
  					</tbody>
 				</table>
 					<div class="card-footer"></div>
 				</div>
			</div>
			</div>
			
			
			<div class="row">
				<!-- body -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							발주서 관리<small><code> 이 부분은 잠시대기 </code></small>
						</div>
	 						<div class="card-body">
							<table class="table table-striped table-hover">
								<thead style="text-align: center;">
									<tr>
										<th>일자</th>
										<th>발주번호</th>
										<th>담당자</th>
										<th>품목명</th>
										<th>수량</th>
										<th>단가</th>
										<th>공급가액</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									<c:forEach var="Rs" items="${Result_list}" varStatus="status">
										<tr>
											<td>${Rs.ORDIN_DATE}</td>
											<td>${Rs.ORDER_ORDIN_NUM}</td>
											<td>${Rs.ORDER_WR}</td>
											<td>${Rs.ORDER_PRODUCT_NAME}</td>
											<td>${Rs.ORDER_QT}</td>
											<td>${Rs.ORDER_PR_EA}</td>
											<td>${Rs.ORDER_PR_TOT}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<br>
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
	$(function(){
			$.datepicker.setDefaults({
					dateFormat: 'yy-mm-dd'
					,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
					,changeYear: true //콤보박스에서 년 선택 가능
					,changeMonth: true //콤보박스에서 월 선택 가능                
					,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
					,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
					,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
					,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
					,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
				});
			$("#dateStart").datepicker();
			$("#dateEnd").datepicker();

			$("#dateStart").datepicker("setDate", "-1D");
			$("#dateEnd").datepicker("setDate", "+1");
		});
</script>
<script>
	$("#dateSub").click(function(){
		/* var dateParam = new Array();
		var StartEnd = new Object(); */
		var DATESTART = $("#dateStart").val();
		console.log(DATESTART);
		var DATEEND = $("#dateEnd").val();
		console.log(DATEEND);
			
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "${path}/balju/Balju_Result_Search");
		
		var dateStart = document.createElement("input");
		dateStart.setAttribute("type","hidden");
		dateStart.setAttribute("name","DATESTART");
		dateStart.setAttribute("value",DATESTART);
		form.appendChild(dateStart);

		var dateEnd = document.createElement("input");
		dateEnd.setAttribute("type","hidden");
		dateEnd.setAttribute("name","DATEEND");
		dateEnd.setAttribute("value",DATEEND);
		form.appendChild(dateEnd);
		
		document.body.appendChild(form);
		form.submit();
		/* StartEnd.dateEnd = $("#dateEnd").val(); */
		/* var bbb = $("#dateEnd").val(); */


		/* dateParam.push(StartEnd);
		console.log(dateParam); */
	});
		
</script>