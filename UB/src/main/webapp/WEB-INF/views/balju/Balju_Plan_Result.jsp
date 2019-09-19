<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
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

<title>발주 계획 현황</title>
</head>
<body>
	<div id="jsGrid"></div>
	jsGrid 생성을 합니다.
	<script>
	$.ajax({
		type:"POST",
	    url:"${path}/balju_Plan_Result",
	  })
		.done(function(json){ 	
			$("#jsGrid").jsGrid({
			width : "100%",
			height : "400px",
			autoload : true,
			//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
			sorting : true,
			//그리드 헤더 클릭시 sorting이 되게함
			data : json,
			//clients를 생성된 배열를 연결함.
			fields : [ {
				name : "ORDPL_ORDLIN_NUM",
				type : "text",
				width : 150
			}, {
				name : "ORPLIN_DATE",
				type : "text",
				width : 50
			}, {
				name : "ORDPL_ONUM",
				type : "text",
				width : 200
			}, {
				name : "ORDPL_PRODUCT_CODE",
				type : "text",
				width : 50
				sorting : false
			}, {
				name : "ORDPL_QT",
				type : "text",
				width : 50
				sorting : false
			}, {
				name : "ORDPL_WR",
				type : "text",
				width : 50
				/* title : "Is Married", */
				sorting : false
			}, {
				name : "ORDPL_STAT",
				type : "text",
				width : 50
				sorting : false
			}, {
				name : "ORDPL_END",
				type : "text",
				width : 50
				sorting : false
			}, { 
				type: "control" 
			}
			 ]});
		//grid에 표현될 필드 요소
		 });
	</script>
	<script>
		//버튼 클릭시 grid에 데이터를 추가
		$("#add").click(function() {
			alert("grid 데이터 추가");

			var insert_item = {};
			//데이터를 추가를 위해서 json object 생성
			insert_item.Name = $("#Name").val();
			insert_item.Age = parseInt($("#Age").val());
			insert_item.Address = $("#Address").val();
			insert_item.Country = $("#Country").val();
			insert_item.Married = $('#Married').is(":checked") ? true : false;
			//grid에 넣을 데이터를 object의 만들기

			$("#jsGrid").jsGrid("insertItem", insert_item);
			//jsGrid에 insert_item object 추가
		});
	</script>


	
	<!-- <div id="jsGrid"></div>
	jsGrid 생성을 합니다.
	<script>
		//grid에 들어갈 초기 내용
		var clients = [ {
			"Name" : "Otto Clay",
			"Age" : 25,
			"Country" : 1,
			"Address" : "Ap #897-1459 Quam Avenue",
			"Married" : false
		}, {
			"Name" : "Connor Johnston",
			"Age" : 45,
			"Country" : 2,
			"Address" : "Ap #370-4647 Dis Av.",
			"Married" : true
		}, {
			"Name" : "Lacey Hess",
			"Age" : 29,
			"Country" : 3,
			"Address" : "Ap #365-8835 Integer St.",
			"Married" : false
		}, {
			"Name" : "Timothy Henson",
			"Age" : 56,
			"Country" : 1,
			"Address" : "911-5143 Luctus Ave",
			"Married" : true
		}, {
			"Name" : "Ramona Benton",
			"Age" : 32,
			"Country" : 3,
			"Address" : "Ap #614-689 Vehicula Street",
			"Married" : false
		} ];

		var update_item = {};
		//수정할 데이터의 값을 임시적으로 갖고 있을 jsonobj

		$("#jsGrid").jsGrid({
			width : "100%",
			height : "400px",

			autoload : true,
			//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
			sorting : true,
			//그리드 헤더 클릭시 sorting이 되게함
			data : clients,
			//clients를 생성된 배열를 연결함.

			fields : [ {
				name : "Name",
				type : "text",
				width : 150
			}, {
				name : "Age",
				type : "number",
				width : 50
			}, {
				name : "Address",
				type : "text",
				width : 200
			}, {
				name : "Married",
				type : "checkbox",
				title : "Is Married",
				sorting : false
			} ],
			//grid에 표현될 필드 요소
			//그리드안에 row를 두번 클릭하면
			//input 값을 넣어줌
			rowDoubleClick : function(args) {
				var getData = args.item;
				update_item = getData;

				console.log(update_item);
				$("#Name").val(getData.Name);
				$("#Age").val(getData.Age);
				$("#Address").val(getData.Address);
				$("#Country").val(getData.Country);
				$('#Married').prop("checked", getData.Married);
			}
		});

		//버튼 클릭시 grid에 데이터를 업데이트
		$("#update").click(function() {
			alert("grid 데이터 업데이트");

			var insert_item = {};
			//데이터를 업데이트를 위해서 json object 생성
			insert_item.Name = $("#Name").val();
			insert_item.Age = parseInt($("#Age").val());
			insert_item.Address = $("#Address").val();
			insert_item.Country = $("#Country").val();
			insert_item.Married = $('#Married').is(":checked") ? true : false;
			//grid에 넣을 데이터를 object의 만들기

			$("#jsGrid").jsGrid("updateItem", update_item, insert_item);
			//jsGrid에 insert_item object 업데이트
		});
	</script> -->




</body>
</html>