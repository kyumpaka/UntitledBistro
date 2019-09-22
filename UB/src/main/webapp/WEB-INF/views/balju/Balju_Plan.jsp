<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
    <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<!-- 이 jsp 파일에서는 데이터입력 처리를 한다
	1. 첫째로 두개의 단으로 나누어서 입력 처리를 하며 
	  1단에서는 발주일자는 시스데이트로 처리하며 보여주기만 할뿐 직접적으로 입력값이 전달되지는 않는다
	  담당자 설정하는 부분이 있으며 이때는 아이디값을 바탕으로 해서 이름을 조회해서 넣어야한다
	  그다음 참조란이 있는데 이때는 2단의 테이블이 아니라 1단의 테이블에서 입력하며 현황조회에서도 1단에서 나오도록 한다
	 
	 [주요발주품목]에서는 다음의 데이터를 셀렉트해서 새창으로 띄워준다 [balju_save]
	 [소요에서는] bom항목을 띄워주며
	 [안전재고(혹은적정재고)]에서는 안전재고와 현재고를 출력하여 비교해준다. >>>>>>>>>>안전재고와 소요의 기능을 확인하자<<<<<<<<<<
	 
	 [저장]버튼은 데이터를 컨트롤러로 넘겨주며
	 [다시작성]은 인풋데이터를 클린 시켜준다
	 [계획현황]버튼은 balju_plan_result로 이동한다.
	 
	 
	 2. 2단에서는 발주항목을 작성하여야 하는데 이는 원하는 값만큼 늘어나야하므로 제이쿼리의 append를 이용하여 입력창을 늘려야 할것이다.
	 	또한 입력항목을 취합하여 json 타입으로 저장하여 컨트롤러로 보내야 하며(아마도.. 어떻게 해야되는지는 모름) 
	 	이를 리스트에 담아서 서비스단으로 보낸다.
	 	후에 매퍼에서 이를 forEach를 사용하여 다중 insert를 접목시켜줘야 할것같다.
	 	
	 	2단의 수량과 공급가액 하단에는 총수량 및 총 발주액을 표기해준다.
	 -->
	 
	 
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
<meta charset="UTF-8">
<script>
    //추가 버튼
    $(document).on("click","button[name=addStaff]",function(){
        var addStaffText =  '<tr name="trStaff">'+
            '   <td class="active col-md-1"><strong>정산담당자</strong></td>'+
            '   <td style="width:800px">'+
            '       <input type="text" class="form-control" name="staff_name" placeholder="성명">'+
            '       <input type="text" class="form-control" name="staff_contact" placeholder="연락처1">'+
            '       <input type="text" class="form-control" name="staff_contact2" placeholder="연락처2">'+
            '       <input type="text" class="form-control" name="staff_email" placeholder="이메일">'+
            '       <select class="form-control statusYn" name="staff_use_yn">'+
            '           <option value="Y">사용</option>'+
            '           <option value="N">미사용</option>'+
            '       </select>'+
            '       <button class="btn btn-default" name="delStaff">삭제</button>'+
            '   </td>'+
            '</tr>';
             
        var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
         
        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
         
    });
     
    //삭제 버튼
    $(document).on("click","button[name=delStaff]",function(){
         
        var trHtml = $(this).parent().parent();
         
        trHtml.remove(); //tr 테그 삭제
         
    });
</script>
<title>발주 계획 작성</title>
</head>
<body>

1231231231
	<form action="${path}/balju_Plan_Input" method="post">
	<label>품목코드 : </label>
		<input id="ORDPL_PRODUCT_CODE" name="ORDPL_PRODUCT_CODE" type="text" >
	<br>

	<label>품목수량 : </label>
		<input type="text" id="ORDPL_QT" name="ORDPL_QT">
	<br>

	<label>작성자 : </label>
		<input type="text" id="ORDPL_WR" name="ORDPL_WR">
	<br>

	<label>진행상태 : </label>
		<input type="text" id="ORDPL_STAT" name="ORDPL_STAT">
	<br>
	
	<label>완료여부 : </label>
		<input type="text" id="ORDPL_END" name="ORDPL_END">
	<br>

	<input type="submit" value="전송">
	</form>
	    <button name="addStaff">정산담당자 추가</button>
    <br>
    <br>
    <table border="1" style="width:950px">
        <tbody>
            <tr name="trStaff">
                <td style="width:150px"><strong>정산담당자</strong></td>
                <td style="width:800px">
                    <input type="text" name="staff_name" placeholder="성명">
                    <input type="text" name="staff_contact" placeholder="연락처1">
                    <input type="text" name="staff_contact2" placeholder="연락처2">
                    <input type="text" name="staff_email" placeholder="이메일">
                    <select name="staff_use_yn">
                        <option value="Y">사용</option>
                        <option value="N">미사용</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><strong>메모</strong></td>
                <td>
                    <textarea style="width:800px" name="memo" rows="3" placeholder="메모를 남겨주세요."></textarea>
                </td>
            </tr>
        </tbody>
    </table>
  

	<%-- <form action="${path}/balju_Plan_Input" method="post">
		품목코드 : <input type="text" id="ORDPL_PRODUCT_CODE" name="ORDPL_PRODUCT_CODE">
		품목수량 : <input type="text" id="ORDPL_QT" name="ORDPL_QT">
		작성자 : <input type="text" id="ORDPL_WR" name="ORDPL_WR">
		진행상태 : <input type="text" id="ORDPL_STAT" name="ORDPL_STAT">
		완료여부 : <input type="text" id="ORDPL_END" name="ORDPL_END">
	<input type="submit" value="전송">
	</form> --%>
</body>
</html>