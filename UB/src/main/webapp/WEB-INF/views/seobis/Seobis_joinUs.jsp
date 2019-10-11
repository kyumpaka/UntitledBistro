<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${path}/resources/Admin/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${path}/resources/Admin/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
                 <body>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>회원 등록 양식</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="Seobis_createMember" method="post"  class="form-horizontal">
                                                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">아이디</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_id" name="member_id" placeholder="아이디 입력" class="form-control"><small class="form-text text-muted">대소문자, 숫자 사용</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">이름</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_name" name="member_name" placeholder="이름 입력" class="form-control"><small class="form-text text-muted">8자 이내</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">이메일</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="member_email" name="member_email" placeholder="이메일 입력!! 형식은 아이디@도메인 입니다." class="form-control" ><small class="help-block form-text"></small></div>
                                    </div>
                                       <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">생일</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_birth" name="member_birth" placeholder="ex) 1995-12-21" class="form-control"><small class="form-text text-muted"></small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class="form-control-label">성별</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="radio">
                                                    <label for="radio1" class="form-check-label ">
                                                        <input type="radio" id="member_gender" name="member_gender" value="남성" class="form-check-input">남성
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio2" class="form-check-label ">
                                                        <input type="radio" id="member_gender" name="member_gender" value="여성" class="form-check-input">여성
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">전화</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="member_phone1" name="member_phone1" placeholder="ex) 010-1111-1111" class="form-control" ><small class="form-text text-muted">사용하는 번호를 입력하세요</small></div>
                                    </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm" onclick="CheckNull();">
                                    <i class="fa fa-dot-circle-o"></i> 회원가입
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> 다시입력
                                </button>
                            </div>
                            </form>
                        </div>
                        </div>
                        </div>
                                
<script type="text/javascript">
function CheckNull() {
	var member_id = $("input[name=member_id]").val();
	console.log(member_id);
	var member_name = $("#member_name").val();
	var member_email = $("#member_email").val();
	var member_gender = $("#member_gender").val();
	var member_phone1 = $("#member_phone1").val();
	var member_birth = $("#member_birth").val();
/*     var yy = member_birth.substr(0,2);        // 년도
    var mm = member_birth.substr(2,2);        // 월
    var dd = member_birth.substr(4,2);        // 일 */
	
	//아이디 입력여부 검사
	if(member_id.length == 0){
		alert("아이디를 입력해 주세요");
		$("#member_id").focus();
		return false;
	}
	console.log(member_id);
	//아이디 공백여부 검사
	if(member_id.indexOf(" ") >= 0){
		alert("아이디에 공백을 사용할 수 없습니다.")
		$("#member_id").focus();
		return false;
	}
	
	//아이디 영문대소문자, 숫자 검사
	for(i = 0; i < member_id.length; i++){
		ck = member_id.charAt(i)
		if(!(ck >= '0' && ch <= '9') &&!(ck >= 'a' && ch <= 'z') &&!(ck >= 'A' && ck <= 'Z')){
			alert("아이디는 대소문자, 숫자만 입력 가능합니다.")
		$("#member_id").focus();
		return false;
		}
	}
	
	//아이디 길이 체크
	if(member_id.length<4 || member_id.length>10){
		alert("아이디를 4~10자까지 입력해 주세요.");
		$("#member_id").focus();
		$("#member_id").select();
		return false;
	}
	
	//이름 길이 체크
	if(member_id.length < 2){
		alert("이름을 2자 이상 입력해 주세요")
		$("#member_id").focus();
		return false;
	}
	
	if(member_name.length == 0){
		alert("이름을 입력해 주세요");
		$("#member_name").focus();
		return false;
	}
	
	 if(yy < "00" || yy > "99" || mm < "01" || mm > "12" || dd < "01" || dd > "31"){
		alert("주민번호 앞자리 형식의 생일을 입력하세요");
		member_birth = ""
		member_birth.focus()
		return false;
	 }
	 
	if(member_email.length == 0){
		alert("이메일을 입력하지 않았습니다.");
		$("#member_email").focus();
		return false;
	}
	
	if(member_phone1.length == 0){
		alert("전화를 입력해 주세요")
		$("#member_phone1").focus();
		return false;
	}
	
	if(confirm("회원 ID : " +member_id + "회원 등록을 하시겠습니까?")){
		alert("회원 ID : " + member_id + "회원 등록 성공했습니다");
		return true;
	}
} //checknull end
</script>
                    </body>
                    
                    <!-- pattern="(010)-\d{3,4}-\d{4}" required -->
                    <!-- pattern="\d(2,3)-\d{3,4}-\d{4}"> -->
                    <!-- required -->