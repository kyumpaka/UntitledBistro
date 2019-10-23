<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.0/css/ui.jqgrid.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jumun/jumun.css">
</head>
<body>
	<div class="card-body card-block">
		<div class="row form-group">
			<div class="col-2">
				<select id="searchType" class="form-control" onchange="dateSearch()">
					<option value="All">전체검색</option>
					<option value="payment_Table">테이블</option>
					<option value="payment_Member_Id">아이디</option>
					<option value="payment_State">상태</option>
					<option value="payment_Date">날짜</option>
				</select>
			</div>
			<div class="col-8" id="dateText">
				<input type="text" id="searchData" class="form-control">
			</div>
			<div class="col-2">
				<input type="button" value="검색" id="search" class="btn btn-outline-primary">
			</div>
		</div>
	</div>
	<table id="grid"></table>
	<div id="pager"></div>
	<br>
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<strong class="card-title">판매 상세 내역</strong>
			</div>
			<div class="table-stats order-table ov-h">
				<table class="table">
					<tr>
						<td align="center">내역을 선택해주세요.</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<br><br>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.0/jquery.jqgrid.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#grid").jqGrid({
		url:'salesSearch.do',
        datatype: "json",
        loadtext : '로딩중..',
        autowidth:true,
        colNames:['번호','테이블', '결제일', '현금', '카드', '할인', '포인트', '아이디', '상태', ' '],
        colModel:[
            {name:'payment_No', width:70, align:'center', sortable:false},
            {name:'payment_Table', width:70, align:'center'},
            {name:'payment_Date', formatter: "date", formatoptions: { srcformat: 'u1000', newformat: "Y년 m월 d일 h시 i분 s초" }, width:280, align:'center'},
            {name:'payment_Cash', align:'center', formatter:'currency',formatoptions: { defaultValue: '', thousandsSeparator: ',', suffix: '원', decimalPlaces: 0 }},
            {name:'payment_Card', align:'center', formatter:'currency',formatoptions: { defaultValue: '', thousandsSeparator: ',', suffix: '원', decimalPlaces: 0 }},
            {name:'payment_Discount', align:'center', formatter:'currency',formatoptions: { defaultValue: '', thousandsSeparator: ',', suffix: '원', decimalPlaces: 0 }},
            {name:'payment_Point', align:'center', formatter:'currency',formatoptions: { defaultValue: '', thousandsSeparator: ',', suffix: '점', decimalPlaces: 0 }},
            {name:'payment_Member_Id', align:'center'},
            {name:'payment_State', align:'center'},
            {name:'payment_Sales_No', width:80, align:"center", formatter: delButton }
        ],
        caption: "판매 내역",
        sortname: 'payment_Date',
        sortorder: 'desc',
        loadonce : true,
        pager: '#pager',
        rowNum: 10,
        rowList: [10, 20, 30],
        viewrecords: true,
        emptyrecords: "내역이 없습니다.",
        onSelectRow : function (rowid) {
        	   var no = jQuery("#grid").getRowData(rowid).payment_No;
        	   $.ajax({
	     			  url: 'salesDetailsByNo.do',
	     			  type: 'post',
	     			  data: {sales_No:no},
	     			  dataType: 'json',
	     			  success : function(result) {
		     			 var price = 0;
	     				 var view = '<thead><tr><th>메뉴명</th><th>수량</th><th>금액</th></tr></thead>';
	     				 for(var i = 0; i < result.length; i++){
		     				 view += '<tbody><tr><td><span id="sd_Menu_Code">'+result[i].sd_Menu_Code+'</span></td>';
		     				 view += '<td><span id="sd_Qty">'+result[i].sd_Qty+'</span></td>';
		     				 view += '<td><span id="sd_Price">'+result[i].sd_Price+'</span></td></tr></tbody>';
		     				 price += (result[i].sd_Qty * result[i].sd_Price);
	     				 }
		     			 view += '<tr><td>합계 : '+price+'원</td></tr>';
		     			 $(".table").html(view);
	     			  }
     		   });
        }
    });

	$('#grid').parents('div.ui-jqgrid-bdiv').css("min-height","220px");
})

function delButton(cellvalue, options, rowObject) {
	var no = cellvalue;
	return '<input type="button" onclick="payCancle('+no+')" value="환불"/>';
}

function payCancle(no) {
	$.ajax({
		  url: 'paymentCancle.do',
		  type: 'post',
		  data: {payment_No:no},
		  dataType: 'json',
		  success : function(result) {
			  swal({
				  title: "환불 처리되었습니다.",
				  icon: "success",
				  button: "닫기",
				}).then(() => {
					$("#grid").setGridParam({datatype : "json"}).trigger("reloadGrid");
				  });
			  
		  }
  });
}

$("#search").on("click",function(){
   var data = $("#searchData").val()
   var searchType = $("#searchType").val();
   var predatepicker = $("#predatepicker").val();
   var postdatepicker = $("#postdatepicker").val();

   if(predatepicker > postdatepicker) {
	   swal({
			  title: "잘못된 날짜입력입니다.",
			  icon: "warning",
			  button: "닫기",
			});
   } else {
	   var postData  = {'data':data , 'searchType':searchType, 'predatepicker':predatepicker, 'postdatepicker':postdatepicker};
	
	   $("#grid").jqGrid("clearGridData", true);
	
	   $("#grid").setGridParam({
	  	 datatype	: "json",
	  	 postData	: postData,
	   }).trigger("reloadGrid");
   }
})
	
function dateSearch() {
	var type = $("select[id=searchType]").val();
	var frm = "";
	if(type == 'payment_Date') {
		frm = '<div class="row"><input type="text" id="predatepicker" class="form-control-my">&nbsp;&nbsp;~&nbsp;&nbsp;';
		frm += '<input type="text" id="postdatepicker" class="form-control-my"></div>';
		$("#dateText").html(frm);
		$("#predatepicker").datepicker({
			 showButtonPanel: true, 
	         currentText: '오늘 날짜', 
	         closeText: '닫기', 
	         dateFormat: "yymmdd"});
		$("#postdatepicker").datepicker({
			 showButtonPanel: true, 
	         currentText: '오늘 날짜', 
	         closeText: '닫기', 
	         dateFormat: "yymmdd"});
	} else if(type == 'payment_State') {
		frm = '<select id="searchData" class="form-control"><option value="성공">성공</option><option value="환불">환불</option></select>';
		$("#dateText").html(frm);
	} else {
		frm = '<input type="text" id="searchData" class="form-control">';
		$("#dateText").html(frm);
	}
}
</script>
</body>
</html>