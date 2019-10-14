<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<title>JSP</title>
</head>
<body>

<!-- 페이지 제목 -->
<div class="page-header">
    <h1>
    	<a href="">출고 등록 테스트(ITEM_INSERT)</a>
    </h1>
</div>

<!-- jsGrid 생성을 합니다.-->
<div id="jsGridBackground">
	<div id="jsGrid"></div> <!-- 그리드를 이용한 테이블 -->
	<div id="jsGridPage"></div> <!-- 그리드를 이용한 페이징 -->
</div>


<script type="text/javascript">

	$(document).ready(function() {
		
		$("#jsGrid").jsGrid({
			// 그리드 크기설정
			width : "100%",
			height : "auto",
			inserting: true,
			editing : true,
			
			// 데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
			autoload : true,
			
			// 그리드 헤더 클릭시 sorting이 되게함
			sorting : true,
			
			// 페이징 기본설정
			paging:true,
			pageSize : 10,
			pageButtonCount : 5,
			
			// 커스텀 페이징 설정
			pagerContainer: "#jsGridPage",
	        pagerFormat: "{first} {prev} {pages} {next} {last}",
	        pagePrevText: "<",
	        pageNextText: ">",
	        pageFirstText: "<<",
	        pageLastText: ">>",
	        
	     	// 비어있는 배열을 데이터에 연결.
			data : [], 
			
			// 그리드에 표현될 필드 요소
			fields : [ {
				name : "oi_product_code",
				type : "text",
				title: "품목코드",
				width : 80
			}, {
				name : "oi_qty",
				type : "text",
				title: "출고수량",
				width : 80
			}, {
				type: "control", editButton: true, modeSwitchButton: false   // show clear filter button
			}],
			
			onItemInserted: function(args) {
				$.ajax({
					url : "${path}/jaego/gridOutItemInsert",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(args.item)
				})
				.done(function(count) {
					swal("등록 성공!", "안전재고 등록을 완료했습니다.", "success");
					//$("#jsGrid").jsGrid({data:[]});
					//$("#jsGrid").jsGrid("loadData");
					webSocket.send(count);
				})
				.fail(function() {
					swal("등록 실패!", "출고수량이 재고수량보다 많습니다.", "error");
				});
			}
			
		}); // 그리드 끝
	}); // ready 끝

</script>

</html>