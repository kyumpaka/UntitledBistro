<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- ë°œì£¼?? ê²€?? ì°½ì—?œëŠ” ?¼ì?€ ?ˆëª©ì½”ë“œë§Œì„ ?…ë ¥ë°›ì•„?? ë°œì£¼ê±´ì— ?€?? ê²€?‰ì„ ì§„í–‰?œë‹¤.

	1.?…ë ¥ì°½ì— ì¡´ì¬?´ì•¼ ?˜ëŠ”ê²? 1?¼ì (?°ì´?¸ì??‰íŠ¸?ˆì¸ì§€) ?°ì´?¸í”¼ì»¤ë? ?µí•´?? ?¼ìë²”ìœ„ë¥? ì§€?•í•˜ê³?
	?ˆëª©ì½”ë“œë¥? ê³¨ë¼?? ?´ë‹¹ ?ˆëª©?? ì¡´ì¬?˜ëŠ” [ì§„í–‰?íƒœ]ì¹¼ëŸ¼?? [ì§„í–‰ì¤??? ?°ì´?°ë? ê²€?‰í•œ?? 
	
	2.?´ì—?€?´ì„œ ê¸ˆì¼,?„ì¼,ê¸ˆì£¼,?„ì£¼,ê¸ˆì›”,?„ì›”?? ?€?‘í•˜?? ê²€?‰ë²„?¼ì„ ê°ê° ?‘ì„±?œë‹¤.
	ajax ì²˜ë¦¬?? ??ª©?€ ?†ìœ¼ë©? ê²€?? ê²°ê³¼?? Balju_resultë¡? ?˜ê²¨ì¤€??-->


<head>
<!-- ?œí”Œë¦? link rel -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">


<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- ?œí”Œë¦? link rel -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid ?¬ìš©?? ?„í•œ jqueryë¥? cdn ?°ê²°-->
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid ?¬ìš©?? ?„í•œ ?„ìš”?? ?”ì†Œ cdn ?°ê²°-->
<meta charset="UTF-8">
<title>ë°œì£¼ ê³„íš ?‘ì„±</title>
</head>
<body>
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>ë°œì£¼?œê?ë¦?</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="${path}/balju/Balju_Mng_All" > ?„ì²´ </a></li>
								<li><a href="${path}/balju/Balju_Mng" > ì§„í–‰ì¤? </a></li>
								<li><a href="${path}/balju/Balju_Com" > ?„ë£Œ </a></li>
								<!-- <li class="active">Basic</li> -->
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header -->
	<div class="content">
		<div class="animated fadeIn">
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> ë°œì£¼ ?•ë³´ </h5><br> -->
			<div class="row">
				<!-- body -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							ë°œì£¼?? ê´€ë¦?<small><code> ?? ë¶€ë¶„ì? ? ì‹œ?€ê¸? </code></small>
						</div>
						<div class="card-body">
							<table class="table table-striped table-hover">
								<thead style="text-align: center;">
									<tr>
										<th width=25px;><input type="checkbox" name="checkAll" 
											id="checkAll_prime" onclick="checkAll()"></th>
										<th width=100px;>ë°œì£¼ë²ˆí˜¸</th>
										<th width=200px;>?¼ì</th>
										<th width=150px;>?´ë‹¹??</th>
										<th>?ˆëª©</th>
										<th>ì´? ê¸ˆì•¡</th>
										<th>ì¢…ê²°</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									<c:forEach var="Mng" items="${Mng_list}" varStatus="status">
										<tr>
											<td><input type="checkbox" name="checkRow"
												value="${status.count}"></td>
											<td>${Mng.ORDER_ORDIN_NUM}</td>
											<td>${Mng.ORPLIN_DATE}</td>
											<td>${Mng.ORDER_WR}</td>
											<td>${Mng.ORDER_PRODUCT_NAME}??${Mng.ORDER_PRODUCT_COUNT}ê°?</td>
											<td>${Mng.TOTAL_PR}</td>
											<td><input type="button" class="endBtn" 
													style="background-color: transparent !important;
													background-image: none !important;
													border-color: transparent;
													border: none;
													color: #007BFF;" value="${Mng.ORDER_END}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<button class="btn btn-dark btn-lg pull-left"
								style="margin-right: 20px;" onclick="location.href='${path}/balju/Balju'">? ê·œ</button>
							<button class="btn btn-dark btn-lg pull-left" 
								onclick="deleteCheck()">? íƒ?? œ</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
	
	
<script>
	//ì²´í¬ë°•ìŠ¤ ?„ì²´? íƒ
	function checkAll(){
		if($("#checkAll_prime").is(":checked")){
				$("input[name=checkRow]").prop("checked",true);
		}else{
				$("input[name=checkRow]").prop("checked",false);
			}
		}
</script>
<script>
	function deleteCheck(){
		var deleteRow =  new Array();
		var rowVal = new Object();
		var checkBox = $("input[name='checkRow']:checked");
		checkBox.each(function(idx){
			var tr = checkBox.parent().parent().eq(idx);
			var td = tr.children();

			rowVal = td.eq(1).text();
			//rowVal[idx] = $(this).val();
			console.log("rowValê°? ì²´í¬ : " + rowVal);
			deleteRow.push(rowVal)
			console.log("deleteRowê°? ì²´í¬ : " + deleteRow); 
			})
		console.log("deleteRowê°? ì²´í¬ : "+deleteRow);
		if(deleteRow==""){
			alert("?? œ?? ?€?ì„ ? íƒ?˜ì„¸??.");
			return false;
			}
		
		if(confirm("? íƒ?? ë°œì£¼?œë? ?? œ?˜ì‹œê² ìŠµ?ˆê¹Œ?")){
				$.ajax({
					method : "post",
					dataType : "json",
					data : JSON.stringify(deleteRow),
					contentType : "application/json",
					url : "${path}/balju/deleteBalju",
					success : function(result){
						var jsonResult = JSON.parse(JSON.stringify(result));
						if(jsonResult.result == "success"){
								alert(jsonResult.resultMsg);
								location.href="${path}/balju/Balju_Mng"
						}else if(jsonResult.result == "failure"){
								alert(jsonResult.resultMsg);
								return false;
							}
						//success end
						}
					//ajax end
					});
			//if confirm end
			}
		
		
		}
</script>
<script>
	$('.endBtn').click(function(){
	
	var ynParam = $(this).attr('value'); //ì¢…ê²°?´ëƒ ì·¨ì†Œ??
	var endVal = $(this); // ë²„íŠ¼?„ì¹˜
	var endParam = new Array();
	var data = new Object();
	
	console.log(ynParam);
	console.log(endVal);
	
		var tr = endVal.parent().parent();
		var td = tr.children();
		
				//ë°œì£¼ë²ˆí˜¸ td.eq(1)
		data.ORDIN_NUM = td.eq(1).text();
		
		console.log("dataê°? ì²´í¬ : " + data);
				//ì¢…ê²°ê°? ì¢…ê²°/ì·¨ì†Œ 
				
		if(ynParam == "ì¢…ê²°"){
			ynParam="ì·¨ì†Œ";
		}else if(ynParam == "ì·¨ì†Œ"){
			ynParam="ì¢…ê²°";
			}
				
		data.ORDIN_END = ynParam;
		console.log("dataê°? ì²´í¬ : " + data);
		
		endParam.push(data);
		console.log("endParamê°? ì²´í¬ : " + endParam);
		
	if(confirm("?´ë‹¹ ë°œì£¼?œì˜ ì¢…ê²°?¬ë?ë¥? ê²°ì • ?˜ì‹œê² ìŠµ?ˆê¹Œ?")){
			$.ajax({
				method : "post",
				dataType : "json",
				data : JSON.stringify(endParam),
				contentType : "application/json",
				url : "${path}/balju/BaljuEnd",
				success : function(result){
					var jsonResult = JSON.parse(JSON.stringify(result));
					if(jsonResult.result == "success"){
							alert(jsonResult.resultMsg);
							location.href="${path}/balju/Balju_Mng?isRiskItemCount=" + jsonResult.riskItemCount;
					}else if(jsonResult.result == "failure"){
							alert(jsonResult.resultMsg);
							return false;
					}
					//success end
				}
					
				//ajax end
			});
		//if confirm end
		}
	
	});
</script>
</body>
</html>

