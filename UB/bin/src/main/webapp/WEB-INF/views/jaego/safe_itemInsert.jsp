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
		padding-bottom: 10px;
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
	#search {
		display: inline-flex;
	}
	
	/* 디자인 수정부분 */
	label {
		font-weight: bold;
		margin-left: 10px;
	}
	
</style>
	
<title>JSP</title>
</head>
<body>
	<!-- 페이지 제목 -->
	<div class="page-header">
	    <h1>
	    	<a href="">안전재고 입력(SAFE_ITEM_INSERT)</a>
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
					<button id="open" type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-search"></i>
					</button>
					<input class="form-control" type="search" placeholder="검색할 품목코드 입력" id="product_code">
					<button id="applyBtn" class="btn btn-primary btn-sm">적용</button>
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
	
	
</body>



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
				// 그리드 입력창 해당셀에 값 적용
				$($("#jsGrid .jsgrid-insert-row input")[0]).val(product_code);
				
				$("#product_code").val(product_code);
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
	$("#open").on("click",function() {
		$("#productJsGrid").jsGrid({data:productData, pageIndex: 1});
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
            
            invalidNotify : true,
            
         	// 비어있는 배열을 데이터에 연결.
			data : [], 
			
			// 그리드에 표현될 필드 요소
			fields : [ {
				name : "si_product_code",
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
					}

					var isResult = false;
					if(isSame) {
						$.ajax({
							url: "${path}/jaego/gridSafeItemSelectProductCode",
							type: "get",
							async : false,
							data: {si_product_code : value},
							dataType: "text"
						})
						.done(function(result) {
							if(result != 'noData') {
								swal({
									title: "품목코드 오류",
									text: "품목코드 " + result + "는 이미 등록된 상태입니다.",
									icon: "error",
									buttion: "확인"
								});
							} else {
								isResult = true;
							}
						});
						
						if(isResult) {
							return true;
						}
					}
					
					
				} // validate end
			
			}, {
				name : "si_qty",
				type : "number",
				title: "안전수량",
				width : 80,
				validate : function(value) {
					if(value == null) {
						swal({
							title: "수량오류",
							text: "수량을 반드시 등록하세요.",
							icon: "error",
							button: "확인"
						});
					} else if(value <= 0) {
						swal({
							title: "수량오류",
							text: "0이하로 등록할 수 없습니다.",
							icon: "error",
							button: "확인"
						});
					} else {
						return true;
					}
				}
			}, {
				type: "control", editButton: true, modeSwitchButton: false   // show clear filter button
			}],
			
		}); // 그리드 끝
		
		
		
	}); // ready 끝
	
	// 등록 버튼 클릭했을 경우 DB에 적용하기
	$("#insertBtn").on("click",function() {
		$.ajax({
			url : "${path}/jaego/gridSafeItemInserts",
			type : "post",
			contentType : "application/json",
			// 배열객체를 json형태의 문자열로 변환하여 전달하기
			data : JSON.stringify($("#jsGrid").jsGrid("option","data"))
		})
		.done(function(count) {
			if(count != -1) {
				swal("등록 성공!", "안전재고 등록을 완료했습니다.", "success");
				webSocket.send(count);
			} else {
				sweetAlert("등록 실패!", "이미 등록한 품목코드가 있습니다.", "error");
				return;
			}
			$("#jsGrid").jsGrid("clearInsert");
			$("#jsGrid").jsGrid({data : []});
			$("#jsGrid").jsGrid("loadData");
			
		});
	});
	
	// 적용 버튼 클릭했을 경우 입력창 적용하기
	$("#applyBtn").on("click",function() {
		var product_code = $("#product_code").val();
		$($("#jsGrid .jsgrid-insert-row input")[0]).val(product_code);
	});
	
	// 목록 버튼 클릭했을 경우 이동하기
	$("#listBtn").on("click",function() {
		window.location.href = "${path}/jaego/safe_item";
	});

	
</script>

</html>