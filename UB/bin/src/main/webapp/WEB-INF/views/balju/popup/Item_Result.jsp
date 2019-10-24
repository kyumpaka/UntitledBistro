<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	<table class="table table-striped table-hover" id="list_ResultTable">
					<thead style="text-align:center">
						<tr>
							<th>번호</th>
							<th>품목코드</th>
							<th>품목명</th>
							<th>규격</th>
							<th>현재고</th>
							<th>안전재고</th>
							<th>단가</th>
						</tr>
					</thead>
					<tbody style="text-align:center">
					<c:forEach var="Item_DTO" items="${itemResult}" varStatus="status">
						<tr>
							<td>${Item_DTO.ITEM_INDEX}</td>
							<td>${Item_DTO.ITEM_PRODUCT_CODE}</td>
							<td>${Item_DTO.PRODUCT_NAME}</td>
							<td>${Item_DTO.PRODUCT_STNDR}</td>
							<td>${Item_DTO.ITEM_QTY}</td>
							<td>${Item_DTO.PRODUCT_SAFE}</td>
							<td>${Item_DTO.PRODUCT_PRICE}</td>
		 					<td><input type="button" class="insertBtn" style="border-radius: 0.25rem; color:#fff; 
								background-color: #343a40; border-color: #343a40;" value="선택"/></td>
						</tr> 
					</c:forEach>          
  					</tbody>
 				</table>

</body>
<script>
	$(".insertBtn").click(function(){
		var str = "";
		var tdArr = new Array();
		var click = $(this);

		var tr = click.parent().parent();
		var td = tr.children();

		console.log("클릭한 Row의 데이터 : " + tr.text());

		opener.document.getElementById("code").value = "";
		opener.document.getElementById("name").value = "";
		opener.document.getElementById("stndr").value = "";
		opener.document.getElementById("price").value = "";
		opener.document.getElementById("qt").value= "";
		
		var CODE = td.eq(1).text();
		var NAME = td.eq(2).text();
		var STNDR = td.eq(3).text();
		var QTY = td.eq(4).text();
		var SAFE = td.eq(5).text();
		var PRICE = td.eq(6).text();
		var SUM = 0;

		console.log(typeof QTY);
		console.log(typeof SAFE);

		QTY = parseInt(QTY);
		SAFE = parseInt(SAFE);

		console.log("파스인트 체크 : "+typeof QTY);
		console.log("파스인트 체크 : "+typeof SAFE);
		
		if(QTY<SAFE){
			//안전재고가 5고 현재고가 1이랑 그럼 4= 5-1
			opener.document.getElementById("qt").value=(SAFE-QTY);
		}
		
		opener.document.getElementById("code").value = CODE;
		opener.document.getElementById("name").value = NAME;
		opener.document.getElementById("stndr").value = STNDR;
		opener.document.getElementById("price").value = PRICE;
		window.close();
	});
</script>
</html>