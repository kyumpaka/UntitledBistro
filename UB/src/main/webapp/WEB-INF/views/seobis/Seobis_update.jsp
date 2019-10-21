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
		var member_name = $("#member_name").val();
		var member_email = $("#member_email").val();
		var member_birth = $("#member_birth").val();
		var member_gender = $(':radio[name="member_gender"]:checked').length;
		var member_phone1 = $("#member_phone1").val();
		var yy = member_birth.substr(0,2);        // 년도
	    var mm = member_birth.substr(2,2);        // 월
	    var dd = member_birth.substr(4,2);        // 일 */
	    var num1 = member_phone1.substr(0,3); //첫번째 번호 ex) 010
	    var num2 = member_phone1.substr(3,4); //두번째 번호 ex) 9999 -1
	    var num3 = member_phone1.substr(3,3) //두번째 번호 ex) 999 -2
	    var num4 = member_phone1.substr(7) //세번째 번호 ex) 8888 -1  
	    var num5 = member_phone1.substr(6) //세번째 번호 ex) 8888 - 2 
	    
	  //이름 길이 체크
		if(member_name.length < 2){
			swal("이름을 2자 이상 입력해 주세요");
			$("#member_id").focus();
			return false;
		}
		
		//이름 입력여부 검사
		if(member_name.length == 0){
			swal("이름을 입력해 주세요");
			$("#member_name").focus();
			return false;
		}
		
		 //이메일 입력여부 검사
		if(member_email.length == 0){
			swal("이메일을 입력하지 않았습니다.");
			$("#member_email").focus();
			return false;
		}
		
		//이메일 공백 검사
		if(member_email.indexOf(" ") >= 0){
			swal("이메일에 공백을 사용할 수 없습니다");
			$("#member_email").focus();
			return false;
		}
		
		//생일 입력여부 검사
		if(member_birth.length == 0){
			swal("생일을 입력해 주세요");
			$("#member_birth").focus();
			return false;
		}
		
		//생일 형식 검사	
		if(yy < '00' || yy > '99' || mm < '01' || mm > '12' || dd < '01' || dd > '31'){
			swal("정확히 입력해 주세요");
			member_birth = ""
			$("#member_birth").focus();
			return false;
		 }
		
		//성별 입력여부 검사
		if(member_gender < 1) {
			swal("성별을 체크해 주세요");
			return false;
		}
		
		 //전화 입력여부 검사
		if(member_phone1.length == 0){
			swal("전화를 입력해 주세요");
			$("#member_phone1").focus();
			return false;
		}
		
		 //전화 공백여부 검사
		if(member_phone1.indexOf(" ") >= 0){
			swal("전화에 공백을 사용할 수 없습니다");
			$("#member_phone1").focus();
			return false;
		}
		 //전화 문자 검사
		for(i = 0; i < member_phone1.length; i++){
			ch = member_phone1.charAt(i)
			if(!(ch >= '0' && ch <= '9')){
				swal("전화는 숫자만 입력해 주세요");
			$("#member_phone1").focus();
			return false;
			}
		}
			//전화 형식 검사
			if(member_phone1.length != 0){
				if(num1 != '010'){
					swal("앞자리는 010 입니다.");
					member_phone1 = ""
					$("#member_phone1").focus();
					return false;
				}
				if(num2.length < 3 || num2.length > 4 || num3.length < 3 || num3.length > 4){
					swal("두번째 자리 전화 범위값이 부적절 합니다.");
					member_phone1 = ""
					$("#member_phone1").focus();
					return false;
				}
				if(num4.length < 3 || num4.length > 4 || num5.length < 3) {
					swal("세번째 자리 전화 범위값이 부적절 합니다.");
					member_phone1 = ""
					$("#member_phone1").focus();
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
                                <strong>회원 정보 수정</strong>
                            </div>
                            <div class="card-body card-block">
                                <form id="edit" action="${path}/Seobis/update" method="post"  class="form-horizontal">
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">아이디</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_id" name="member_id"  value="${Seobis_memberSelect.member_id}" readonly="readonly" class="form-control"><small class="form-text text-muted"></small></div>
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