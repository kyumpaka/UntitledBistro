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
                                <strong>회원 정보 수정</strong>
                            </div>
                            <div class="card-body card-block">
                                <form id="edit" action="${path}/Seobis/update" method="post"  class="form-horizontal">
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">아이디</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_id" name="member_id"  value="${Seobis_memberSelect.member_id}" readonly="readonly" class="form-control"><small class="form-text text-muted">대소문자, 숫자 사용</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">이름</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_name" name="member_name" value="${Seobis_memberSelect.member_name}" class="form-control"><small class="form-text text-muted">8자 이내</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">이메일</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="member_email" name="member_email" value="${Seobis_memberSelect.member_email}" class="form-control" ><small class="help-block form-text"></small></div>
                                    </div>
                                       <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">생일</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_birth" name="member_birth" value="${Seobis_memberSelect.member_birth}" class="form-control"><small class="form-text text-muted"></small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class="form-control-label">성별</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="radio">
                                                    <label for="radio1" class="form-check-label ">
                                                        <c:if test="${Seobis_memberSelect.member_gender == '남성' }">
                                                        <input type="radio" id="member_gender" name="member_gender" value="남성" checked="checked" class="form-check-input">남성
                                                        </c:if>
                                                        <c:if test="${Seobis_memberSelect.member_gender != '남성' }">
                                                        <input type="radio" id="member_gender" name="member_gender" value="남성" class="form-check-input">남성
                                                        </c:if>
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio2" class="form-check-label ">
                                                       <c:if test="${Seobis_memberSelect.member_gender == '여성' }">
                                                        <input type="radio" id="member_gender" name="member_gender" value="여성" checked="checked" class="form-check-input">여성
                                                        </c:if>
                                                        <c:if test="${Seobis_memberSelect.member_gender != '여성' }">
                                                        <input type="radio" id="member_gender" name="member_gender" value="여성" class="form-check-input">여성
                                                        </c:if>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">이동전화</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_phone1" name="member_phone1" value="${Seobis_memberSelect.member_phone1}" class="form-control" ><small class="form-text text-muted">사용하는 번호를 입력하세요</small></div>
                                    </div>
                            </form>
                            <div class="card-footer">
                                <button id="eidBtn" class="btn btn-primary btn-sm" onclick="sub()">
                                    <i class="fa fa-dot-circle-o"></i> 회원수정
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> 다시입력
                                </button>
                            </div>
                        </div>
                        </div>
                        </div>
                        
</body>
</html>