<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
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

	<style type="text/css">
		.external-pager {
            margin: 10px 0;
        }
        .external-pager .jsgrid-pager-current-page {
            background: #c4e2ff;
            color: #fff;
        }
	</style>

<title>JSP</title>
</head>
<body>
	<h1>grid 선택 테스트공간</h1>
	<h4>특별관리</h4>
	
	<h1>Custom View</h1>
    <div class="config-panel">
        <label><input id="heading" type="checkbox" checked /> Heading</label>
        <label><input id="filtering" type="checkbox" /> Filtering</label>
        <label><input id="inserting" type="checkbox" /> Inserting</label>
        <label><input id="editing" type="checkbox" /> Editing</label>
        <label><input id="paging" type="checkbox" checked /> Paging</label>
        <label><input id="sorting" type="checkbox" checked /> Sorting</label>
        <label><input id="selecting" type="checkbox" /> Selecting</label>
    </div>
	
<!-- jsGrid 생성을 합니다.-->
	<div id="externalPager" class="external-pager"></div>
   	<div id="jsGrid"></div>
	<script>
		$.ajax({
			type:"get",
			url:"/UntitledBistro/jaego/gridSelectAll",
		})
		.done(function(json) {
			$("#jsGrid").jsGrid({
				width : "70%",
				height : "400px",
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				// 페이징 처리
				paging:true,
				pageSize : 5,
				pageButtonCount : 5,
				
				pagerContainer: "#externalPager",
                pagerFormat: "current page: {pageIndex} &nbsp;&nbsp; {first} {prev} {pages} {next} {last} &nbsp;&nbsp; total pages: {pageCount} total items: {itemCount}",
                pagePrevText: "<",
                pageNextText: ">",
                pageFirstText: "<<",
                pageLastText: ">>",
               /*  pageNavigatorNextText: "&#8230;",
                pageNavigatorPrevText: "&#8230;", */
				
				
				//json 배열을 데이터에 연결함.
				data : json, 
				//grid에 표현될 필드 요소
				fields : [ {
					name : "item_no",
					type : "number",
					title: "재고번호",
					align: "center",
					width : 100
				}, {
					name : "item_product_code",
					type : "text",
					title: "품목코드",
					width : 100
				}, {
					name : "item_qty",
					type : "text",
					title: "재고수량",
					width : 100
				} ]
			
			});
		});
		
		$(".config-panel input[type=checkbox]").on("click", function() {
            var $cb = $(this);
            $("#jsGrid").jsGrid("option", $cb.attr("id"), $cb.is(":checked"));
        });
		
	</script>
</body>
</html>