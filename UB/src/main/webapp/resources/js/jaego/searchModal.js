/**
 * 
 */
var productData;
function gridProductAjax(path) {
	$.ajax({
		url : path + "/jaego/gridProductSelectList",
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
			
			// 특저 행을 클릭했을 경우
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
}	


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