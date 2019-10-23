<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="path" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">



	function sub() {
	    var member_grade = $("#member_grade").val();
	    var member_point = $("#member_point").val();

	    //등급 길이 체크
		if(member_grade.length < 4){
			swal("등급 이름이 너무 짧습니다.");
			$("#member_grade").focus();
			return false;
		}
		
		 //등급 입력여부 검사
		if(member_grade.length == 0){
			swal("등급을 입력해 주세요.");
			$("#member_grade").focus();
			return false;
		}
		
		 //등급 공백 검사
		if(member_grade.indexOf(" ") >= 0){
			swal("등급에 공백을 사용할 수 없습니다.");
			$("#member_grade").focus();
			return false;
		}
		
		 //유효값 검사
		if((member_grade.toLowerCase() == "gold") || (member_grade.toLowerCase() == "silver") || (member_grade.toLowerCase() == "bronze")){
		} 
		else {
			swal("Bronze, Silver, Gold 등급 중 하나를 입력하세요.");
			member_grade = ""
			$("#member_grade").focus();
			return false;
		}
		
		 //문자 길이 검사
		if(member_grade.length < 4 || member_grade.length > 6 || member_grade.length == 5){
			swal("등급 문자열 길이가 부적합 합니다.");
			$("#member_grade").focus();
			return false;
		}
		
		//포인트 입력여부 검사
		if(member_point.length == 0){
			swal("포인트를 입력해 주세요.");
			$("#member_point").focus();
			return false;
		}
		
		if(member_point.length > 10){
			swal("포인트 길이가 부적합 합니다.");
			$("#member_grade").focus();
			return false;
		}
		//포인트 공백 검사
		if(member_point.indexOf(" ") >= 0){
			swal("포인트에 공백을 사용할 수 없습니다.");
			$("#member_point").focus();
			return false;
		}
		
		//포인트 숫자 검사
		for(i = 0; i < member_point.length; i++){
			ch = member_point.charAt(i)
			if(!(ch >= '0' && ch <= '9')){
				swal("포인트는 숫자만 입력해 주세요");
			$("#member_point").focus();
			return false;
			}
		}
		
		swal({
		   	  title: "회원 ID : ${Seobis_memberSelect.member_id}을 수정하시겠습니까?",
		   	  icon: "warning",
		   	  buttons: true,
		   	  dangerMode: true,
		   	})
		.then((value) => {
			if(value) {
				if(false) swal("ss");
				realMod();
			}
		});
    };
    
    function realMod() {
    	swal("성공적으로 수정하였습니다.", {
     	      icon: "success",
       	  
       	    })
		.then((value) => {
			if(value) {
				if(false) swal("ss");
				$("#edit").submit(); 
			}
		});
    }
</script>
    	
                 <body>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>등급 및 포인트 수정</strong>
                            </div>
                            <div class="card-body card-block">
                                <form id="edit" action="${path}/Seobis/pUpdate" method="post"  class="form-horizontal">
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">아이디</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_id" name="member_id"  value="${Seobis_memberSelect.member_id}" readonly="readonly" class="form-control"><small class="form-text text-muted"></small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">등급</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_grade" name="member_grade" value="${Seobis_memberSelect.member_grade}" class="form-control"><small class="form-text text-muted"></small></div>
                                    </div>
<!--                                     <div class="card-body">
                                        <select data-placeholder="등급을 선택하세요" class="standardSelect" tabindex="1">
                                        <option value="" label="default"></option>
                                        <option id="member_grade"  value="Bronze">Bronze</option>
                                        <option id="member_grade"  value="Silver">Silver</option>
                                        <option id="member_grade"  value="Gold">Gold</option>
                                        </select>
                                    </div> -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">포인트</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_point" name="member_point" value="${Seobis_memberSelect.member_point}" class="form-control" ><small class="form-text text-muted"></small></div>
                                    </div>
                            </form>
                            <div class="card-footer">
                                <button id="eidBtn" class="btn btn-primary btn-sm" onclick="sub()">
                                    <i class="fa fa-dot-circle-o"></i> 포인트 수정
                                </button>
                                <button class="btn btn-danger btn-sm">
                                 <a href="/UntitledBistro/Seobis/pList"><i class="fa fa-ban"></i> 뒤로가기</a>
                                </button>
                            </div>
                        </div>
                        </div>
                        </div>
                        
</body>
</html>