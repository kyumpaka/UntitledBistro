<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
    <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
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