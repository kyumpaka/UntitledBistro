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
	<table class="table table-striped table-hover" id="listTable">
					<thead>
						<tr>
							<th>품목코드</th>
							<th>품목명</th>
							<th>규격</th>
							<th>공급가액</th>
							<th>적용</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="Item_DTO" items="${item_list}" varStatus="status">
						<tr>
							<td>${Item_DTO.PRODUCT_CODE}</td>
							<td>${Item_DTO.PRODUCT_NAME}</td>
							<td>${Item_DTO.PRODUCT_STNDR}</td>
							<td>${Item_DTO.PRODUCT_PRICE}</td>
							<td><input type="button" class="insertBtn" style="border-radius: 0.25rem; color:#fff; 
								background-color: #343a40; border-color: #343a40;" value="선택"/></td>
						</tr> 
					</c:forEach>          
  					</tbody>
 				</table>
 				
 				
		<div class="col-lg-12" id="ex2_Result1" ></div> 
		<div class="col-lg-12" id="ex2_Result2" ></div> 

<script>
		
	$('.insertBtn').click(function(){ 
		
		var tdArr = new Array();	// 배열 선언
		var checkBtn = $(this);
		
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		var CODE = td.eq(0).text();
		var NAME = td.eq(1).text();
		var STNDR = td.eq(2).text();
		var PRICE = td.eq(3).text();
		
		opener.document.getElementById("code").value=CODE;
		opener.document.getElementById("name").value=NAME;
		opener.document.getElementById("stndr").value=STNDR;
		opener.document.getElementById("price").value=PRICE;
		window.close();
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		/* td.each(function(i){	
			tdArr.push(td.eq(i).text()); 
		});*/
		
		/* console.log("배열에 담긴 값 : "+tdArr);
		
		str +=	" * 클릭된 Row의 td값 = 품목코드 : <font color='red'>" + CODE + "</font>" +
				", 품목명 : <font color='red'>" + NAME + "</font>" +
				", 규격 : <font color='red'>" + STNDR + "</font>" +
				", 공급가액 : <font color='red'>" + PRICE + "</font>";		
		
		$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
		$("#ex2_Result2").html(str); */
		
	});
	</script>
</body>

</html>