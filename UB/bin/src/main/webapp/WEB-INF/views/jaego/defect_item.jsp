<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- datePicker -->
<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
	
<style type="text/css">
	#jsGrid {
		margin: auto;
	}
	
	/* 디자인 수정부분 */
	.form-inline {
		display: grid;
		margin-bottom: 8px;
	}
	
	/* jsGird 스크롤바 없애기 */
	.jsgrid-header-scrollbar {overflow: hidden;}
	.jsgrid-grid-body {overflow: hidden;}
	
	.form-group {
		display: flex;
		padding-bottom: 5px;
		padding-top: 5px;
	}
	.input-group date {
		margin-left: -4px;
	}
	
	/* 디자인 수정부분 */
	#yearInput {
		width: 79px;
		margin-right: 5px;
	}
	#year {
		width: 84px;
		margin-right: 5px;
	}
	#month {
		width: 80px;
		margin-right: 5px;
	}
	#day {
		width: 43px;
	}
	
	#searchBackground {
		margin: auto;
		width: 600px;
		margin-top: 10px;
		margin-bottom: 5px;
		padding: 10px;
		background-color: #f3f0f0;
	}
	#dateResult {
		text-align: right;
		font-weight: bold;
		padding-right: 1px;
	}
	#jsGridBackground {
		margin: auto;
		width: 600px;
	}
	#search, #search2 {
		display: inline-flex;
	}
	
	/* 디자인 수정부분 */
	label {
		font-weight: bold;
		margin-left: 10px;
	}
</style>
	
	<!-- 페이지 제목 -->
	<div class="page-header">
	    <h1>
	    	<a href="">불량처리 현황(DEFECT_ITEM)</a>
	    </h1>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">검색창</h4>
				</div> 
				
				<div class="modal-body">
					<div id="productJsGrid"></div>
					<div id="productPage"></div>
				</div> 
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div> 
				
			</div> <!-- Modal content end -->
		</div> <!-- modal-dialog end -->
	</div> <!-- Modal end -->
	

	<!-- 검색 회색바탕화면 -->
	<div id="searchBackground"> 
		<!-- 3줄(날짜,품목코드,품목명) 디자인 -->
		<div class="form-inline">
			<!-- 날짜 -->
			<div class="form-group" id="yy-mm-dd">
				<input type="text" id="yearInput" class="form-control"> <!-- 년도 직접입력 -->
				<select id="year" class="form-control"></select> <!-- 년도 -->
				<select id="month" class="form-control"> <!-- 월 -->
					<option value="01">1월
					<option value="02">2월
					<option value="03">3월
					<option value="04">4월
					<option value="05">5월
					<option value="06">6월
					<option value="07">7월
					<option value="08">8월
					<option value="09">9월
					<option value="10">10월
					<option value="11">11월
					<option value="12">12월
				</select> <input type="text" id="day" class="form-control" maxlength="2"> <!-- 일 -->
				<!-- 달력(datePicker) -->
				<div class="input-group date">
					<input type="hidden" class="form-control" id="date"> 
					<span class="input-group-addon"> 
						<i class="fa fa-calendar"></i>
					</span>
				</div>
			</div> <!-- 날짜 end -->
			
			<div id="search" class="form-group">
				<label for="product_code" class="text-dark">품목코드</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open" type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목코드 입력" id="product_code">
				</div>
			</div>
			
			<div id="search2" class="form-group">
				<label for="product_name" class="text-dark">품목명</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open2" type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목명 입력" id="product_name">
				</div>
			</div>

		</div> <!-- form-inline end -->
		
		<button type="button" id="searchBtn" class="btn btn-primary btn-sm">검색</button>
		<button type="button" id="cancle" class="btn btn-success btn-sm">취소</button>
		
	</div> <!-- searchBackground end -->
  

	<!-- jsGrid 생성을 합니다.-->
	<div id="jsGridBackground">
		<div id="dateResult"></div> <!-- 년월일 결과(작은글씨) -->
		<div id="jsGrid"></div> <!-- 그리드를 이용한 테이블 -->
		<div id="jsGridPage"></div> <!-- 그리드를 이용한 페이징 -->
		<button type="button" id="newBtn" class="btn btn-primary btn-sm">신규</button>
		<button type="button" id="editBtn" class="btn btn-primary btn-sm">수정</button>
		<button type="button" id="updateCompleteBtn" class="btn btn-primary btn-sm">완료</button>
		<button type="button" id="updateCancleBtn" class="btn btn-primary btn-sm">취소</button>
	</div>
	

<!-- 달력 유효성 및 기능 -->
<script type="text/javascript" src="${path}/resources/js/jaego/datePicker.js"></script>

<!-- 모달 검색창 -->
<script type="text/javascript">
	var productData;
	
	$.ajax({
		url : "${path}/jaego/gridProductSelectList",
		type : "get",
	})
	.done(function(json) {
		productData = json;
		
		$("#productJsGrid").jsGrid({
			width : "100%",
			height : "auto",
			// 데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
			autoload : true,
			
			// 그리드 헤더 클릭시 sorting이 되게함
			sorting : true,
			
			// 그리드 검색 입력창 표시
			filtering : true,
			
			// 페이징 기본설정
			paging:true,
			pageSize : 10,
			pageButtonCount : 5,
			
			// 커스텀 페이징 설정
			pagerContainer: "#productPage",
            pagerFormat: "{first} {prev} {pages} {next} {last}",
            pagePrevText: "<",
            pageNextText: ">",
            pageFirstText: "<<",
            pageLastText: ">>",
			
         	// json 배열을 데이터에 연결
			data : json, 
			
			// 그리드에 표현될 필드 요소
			fields : [ {
				name : "product_code",
				type : "text",
				title: "품목코드",
				width : 100
			}, {
				name : "product_name",
				type : "text",
				title : "품목명",
				width : 100
			}],
			
			// 특정 행을 클릭했을 경우
			rowClick: function(args) {
				var product_code = args.item.product_code;
				var product_name = args.item.product_name;
				
				$("#product_code").val(product_code);
				$("#product_name").val(product_name);
				$("#myModal").trigger("click"); // 강제 클릭 함수
			},
			
			// filtering 입력창에 엔터를 누를 경우
			controller : {
				loadData: function(filter) {
					// 검색할 값이 없는 경우
					if(filter.product_code === "" && filter.product_name === "") {
						return productData;
					}

					// 검색할 값이 있을 경우
					var filterData;
					if(filter.product_code !== "") filterData = valueTest(productData,"product_code",filter);
					if(filter.product_name !== "") filterData = valueTest(productData,"product_name",filter);
					return filterData;
				}
		
			} // controller end
			
		}); // jsGrid end
	}); // ajax end
	
	// 검색할 때 필터와 일치하는 데이터 제거하기
	function valueTest(arr,condition,filter) {
		return $.grep(arr, function(i) {
			if(condition == "product_code") return i.product_code.indexOf(filter.product_code) != -1;
			if(condition == "product_name") return i.product_name.indexOf(filter.product_name) != -1;
		});
	}
	
	// 검색창을 새로 열때마다 품목데이터 초기화
	$("#open, #open2").on("click",function() {
		$("#productJsGrid").jsGrid({data:productData, pageIndex: 1});
		$("#productJsGrid").jsGrid("loadData");
	});
	
</script>

<!-- 메인화면 기능 -->
<script type="text/javascript">
	
	var fieldsData = [ {
		name : "di_product_code",
		type : "text",
		title: "품목코드",
		width : 80,
		validate: function(value) {
			var isSame = false;
			$.grep(productData, function(i) {
				if(i.product_code == value) {
					isSame = true;
				}
			});
			if(!isSame) {
				swal({
					title: "품목코드 오류",
					text: "존재하지 않는 품목코드 입니다.",
					icon: "error",
					buttion: "확인"
				});
				return false;
			} else {
				return true;
			}
			
		} // validate end
	}, {
		name : "di_product_name",
		type : "text",
		title: "품목명",
		width : 100,
		validate: function(value) {
			if(value.length < 1) {
				swal({
					title: "품목명 오류",
					text: "적어도 한글자는 입력해야 합니다.",
					icon: "error",
					button: "확인"
				});
			} else {
				return true;
			}
		}
	}, {
		name : "di_qty",
		type : "number",
		title: "불량수량",
		width : 80,
		validate: function(value) {
			if(value == null) {
				swal({
					title: "불량수량 오류",
					text: "불량수량을 반드시 입력하세요.",
					icon: "error",
					button: "확인"
				});
			} else if(value <= 0) {
				swal({
					title: "불량수량 오류",
					text: "불량수량은 0이하로 등록할 수 없습니다.",
					icon: "error",
					button: "확인"
				});
			} else {
				return true;
			}
		}
	}, {
		name : "di_state",
		type : "text",
		title: "불량상태",
		width : 100
	}, {
		name : "di_reason",
		type : "text",
		title: "불량이유",
		width : 100
	}, {
		name : "di_date",
		type : "text",
		title: "불량날짜",
		width : 100
	}];
	
	var originalData;
	var updateData = [];
	var deleteData = [];
	var errorData =[];
	
	$(document).ready(function() {
		$("#updateCompleteBtn").hide();
		$("#updateCancleBtn").hide();
		
		$.ajax({
			type:"get",
			url:"${path}/jaego/gridDefectItemSelectList",
		})
		.done(function(json) {
			originalData = json.slice();
			$("#jsGrid").jsGrid({
				// 그리드 크기설정
				width : "100%",
				height : "auto",
				
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
                
				// json 배열을 데이터에 연결
				data : json, 
				
				// 그리드에 표현될 필드 요소
				fields : fieldsData,
				invalidNotify : true,
				// 수정 아이콘 누르면 수정배열에 담기
				onItemUpdated : function(args) {
					errorData.push(args.itemIndex);
					
					updateData.push(args.item);
				
					if(errorData.indexOf(args.itemIndex) != -1) {
						errorData.splice(errorData.indexOf(args.itemIndex),1);
					}
				},
				
				// 삭제 아이콘 누르면 삭제배열에 담기
				onItemDeleted : function(args) {
					var item = args.item
					deleteData.push(item);
					
					var index = updateData.indexOf(item);
					if(index != -1) updateData.splice(index, 1);
			
				}
			}); // 그리드 끝
		}); // ajax 끝
		
	}); // ready 끝
	
	// 데이터를 읽어와서 그리드에 표현하기
	function dataLoad(endDate, product_code, product_name) {
		
		$.ajax({
			type : "get", 
			url : "${path}/jaego/gridDefectItemSelectList",
			data : {"endDate" : endDate, "keyword" : product_code, "keyword2" : product_name},
		})
		.done(function(json) {
			$("#jsGrid").jsGrid({data:json, pageIndex: 1}); // 새로 받은 데이터 반영
			$("#jsGrid").jsGrid("loadData"); // 그리드에 데이터를 표현
		}); // ajax 끝
		
	} // dataLoad 끝
	
	// 검색 버튼 클릭했을 경우
	$("#searchBtn").click(function(){
		// 빨간 테두리 존재여부
		if($("#year").css("border") == "1px solid rgb(255, 0, 0)") {
			swal({
				  title: "잘못된 년도입력!",
				  text: "올바른 범위로 년도를 입력하세요.! (1900 ~ " + (year+1) + ")",
				  icon: "error",
				  button: "확인",
			});
			return;
		}
		
		// 바뀐 날짜 날짜화면에 보여주기
		var endDate = $("#date").val();
		$("#dateResult").text(endDate);	
				
		// 검색조건으로 그리드 다시 불러오기
		var product_code = $("#product_code").val();
		var product_name = $("#product_name").val();
		console.log("aaaa");
		console.log(product_code);
		console.log(product_name);
		dataLoad(endDate, product_code, product_name);
		
	}); // searchBtn.click 끝
	
	// 취소 버튼 클릭했을 경우 검색부분 값초기화
	$("#cancle").on("click",function(){
		dateBasic();
		$("#product_code").val("");
		$("#product_name").val("");
		
	}); // cancle.click 끝
	
	// 신규 버튼 클릭했을 경우 이동하기
	$("#newBtn").on("click",function() {
		window.location.href = "${path}/jaego/defect_itemInsert";
	});
	
	// 수정 버튼 클릭했을 경우
	$("#editBtn").on("click",function() {
		
		var filterFieldsData = fieldsData.slice();
		filterFieldsData.pop();
		filterFieldsData.push( {
			type: "control", editButton: true, modeSwitchButton: false   
		});
		
		$("#jsGrid").jsGrid({editing:true, fields:filterFieldsData});
		$("#jsGrid").jsGrid("loadData");
		
		$("#updateCompleteBtn").show();
		$("#updateCancleBtn").show();
		$("#editBtn").hide();
		
	});
	
	var both = false;
	var dummy = false;
	
	// 불량 테이블 수정함수
	function completeUpdate() {
		
		
		if(updateData != "" && updateData != null) {
			$.ajax({
				url : "${path}/jaego/gridDefectItemUpdates",
				type : "post",
				async : false,
				contentType : "application/json",
				data : JSON.stringify(updateData)
			})
			.done(function(count) {
				swal("수정 성공!", "불량테이블 수정을 완료되었습니다.", "success")
				.then((value) => {
					completeDelete();
				});
				updateData = [];
				webSocket.send(count);
			});
		}
	}
	
	// 불량 테이블 삭제함수
	function completeDelete() {
		console.log(deleteData);
		if(deleteData != "" && deleteData != null) {
			$.ajax({
				url : "${path}/jaego/gridDefectItemDeletes",
				type : "post",
				async : false,
				contentType : "application/json",
				data : JSON.stringify(deleteData)
			})
			.done(function(count) {
				swal("삭제요청 성공!", "작업요청을 완료되었습니다.", "success");
				deleteData = [];
				webSocket.send(count);
			});
		}
	}
	
	// 업데이트 완료 또는 취소 버튼 클릭했을 경우
	$("#updateCompleteBtn, #updateCancleBtn").on("click",function() {
		
		// 완료 버튼
		if(this.id == "updateCompleteBtn") {
			if(errorData.length != 0) {
				swal("수량오류","올바르게 수량을 고치세요","error");
				return;
			}
			
			$("#jsGrid").jsGrid({editing:false, fields:fieldsData});

			if(deleteData != "" && updateData != "") {
				both = true;
				completeUpdate();
			} else if(updateData != "") {
				completeUpdate();
			} else if(deleteData != "") {
				completeDelete();
			}
			
		// 취소 버튼
		} else if(this.id == "updateCancleBtn") {
			$("#jsGrid").jsGrid({editing:false, fields:fieldsData, data:originalData});
		}
	
		$("#jsGrid").jsGrid("loadData");
		originalData = $("#jsGrid").jsGrid("option","data").slice();
		
		$("#updateCompleteBtn").hide();
		$("#updateCancleBtn").hide();
		$("#editBtn").show();
	});
	
</script>