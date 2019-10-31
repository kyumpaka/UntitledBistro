<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
	
	#searchBackground {
		margin: auto;
		width: 600px;
		margin-top: 10px;
		margin-bottom: 5px;
		padding: 10px;
		background-color: #f3f0f0;
	}

	#jsGridBackground {
		margin: auto;
		width: 600px;
	}
	
	/* 디자인 수정부분 */
	label {
		font-weight: bold;
		margin-left: 10px;
	}
	
	#insertBtn, #listBtn {
		margin-top: 10px;
	}
</style>
	

	<!-- 페이지 제목 -->
	<div class="page-header">
	    <h1>
	    	<a href="">불량처리 입력(DEFECT_ITEM_INSERT)</a>
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
		<!-- 1줄(품목코드) 디자인 -->
		<div class="form-inline">
			
			<div id="search" class="form-group">
				<label for="product_code" class="text-dark">품목코드</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open" class="btn btn-light" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목코드 입력" id="product_code">
					<button id="codeSearchBtn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">검색</button>
				</div>
			</div>
			
			<div id="search" class="form-group">
				<label for="product_name" class="text-dark">품목명</label>
				<div class="col-10">
					<!-- 검색 모달창 열기버튼 -->
					<button id="open" class="btn btn-light" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목명 입력" id="product_name">
					<button id="nameSearchBtn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">검색</button>
				</div>
			</div>
			
		</div> <!-- form-inline end -->
		
	</div> <!-- searchBackground end -->
  

	<!-- jsGrid 생성을 합니다.-->
	<div id="jsGridBackground">
		<div id="jsGrid"></div> <!-- 그리드를 이용한 테이블 -->
		<div id="jsGridPage"></div> <!-- 그리드를 이용한 페이징 -->
		<button id="insertBtn" class="btn btn-primary btn-sm">등록</button>
		<button id="listBtn" class="btn btn-primary btn-sm">목록</button>
	</div>


<!-- 모달 검색창 -->
<script type="text/javascript">
	var productData;
	
	$.ajax({
		url : "${path}/jaego/gridProductSelectList",
		type : "get"
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
			
			//json 배열을 데이터에 연결
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
				
				// 그리드 입력창 해당셀에 값 적용
				$($("#jsGrid .jsgrid-insert-row input")[0]).val(product_code);
				$($("#jsGrid .jsgrid-insert-row input")[1]).val(product_name);
				
				$("#product_code").val("");
				$("#product_name").val("");
				$("#myModal").trigger("click"); // 강제 클릭
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
					if(filter.product_code !== "") filterData = valueTest(productData,"product_code",filter.product_code);
					if(filter.product_name !== "") filterData = valueTest(productData,"product_name",filter.product_name);
					return filterData;
				}
		
			} // controller end
			
		}); // jsGrid end
	}); // ajax end
	
	// 검색할 때 필터와 일치하는 데이터 제거하기
	function valueTest(arr,condition,value) {
		return $.grep(arr, function(i) {
			if(condition == "product_code") return i.product_code.indexOf(value) != -1;
			if(condition == "product_name") return i.product_name.indexOf(value) != -1;
		});
	}
	
	// 검색창을 새로 열때마다 품목데이터 초기화
	$("#open, #open2").on("click",function() {
		$("#productJsGrid").jsGrid({data:[], pageIndex: 1});
		$("#productJsGrid").jsGrid("loadData");
	});

	// 품목코드, 품목명 검색 버튼 클릭했을 경우 입력창 적용하기
	$("#codeSearchBtn, #nameSearchBtn").on("click",function() {
		var product_code = $("#product_code").val();
		var product_name = $("#product_name").val();
		
		$($("#productJsGrid input")[0]).val(product_code);
		$($("#productJsGrid input")[1]).val(product_name);
		
		$("#productJsGrid").jsGrid("loadData");
	});

</script>


<!-- 메인화면 기능 -->
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
			
            confirmDeleting : false,
            invalidNotify : true,
            
			// 비어있는 배열을 데이터에 연결.
			data : [], 
			
			// 그리드에 표현될 필드 요소
			fields : [ {
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
				width : 80,
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
				width : 80
			}, {
				name : "di_reason",
				type : "text",
				title: "불량이유",
				width : 150
			}, {
				// 그리드에서 제공하는 버튼 설정
				type: "control", editButton: true, modeSwitchButton: false   
			}]
			
		}); // 그리드 끝
	}); // ready 끝
	
	// 등록 버튼 클릭했을 경우 DB에 적용하기
	$("#insertBtn").on("click",function() {		
		
		$.ajax({
			url : "${path}/jaego/gridDefectItemInsert",
			type : "post",
			contentType : "application/json",
			// 배열객체를 json형태의 문자열로 변환하여 전달하기
			data : JSON.stringify($("#jsGrid").jsGrid("option","data"))
		})
		.done(function(count) {
			swal("등록 성공!", "불량재고 등록을 완료했습니다.", "success");
			webSocket.send(count);
			$("#jsGrid").jsGrid("clearInsert");
			$("#jsGrid").jsGrid({data : []});
			$("#jsGrid").jsGrid("loadData");
		})
		.fail(function() {
			swal("등록 실패!", "불량수량이 재고수량보다 많습니다.", "error");
		}); 
	});
	
	// 목록 버튼 클릭했을 경우 이동하기
	$("#listBtn").on("click",function() {
		window.location.href = "${path}/jaego/defect_item";
	});
</script>




</html>