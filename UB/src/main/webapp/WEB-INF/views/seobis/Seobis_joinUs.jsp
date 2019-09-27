<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
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
                                <strong>회원 가입 양식</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="Seobis_createMember" method="post"  class="form-horizontal">
                                                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">아이디</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="member_id" placeholder="아이디 입력" class="form-control"><small class="form-text text-muted">This is a help text</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">이름</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="member_name" placeholder="이름 입력" class="form-control"><small class="form-text text-muted">This is a help text</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">이메일</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email-input" name="member_email" placeholder="이메일 입력" class="form-control" ><small class="help-block form-text">Please enter your email</small></div>
                                    </div>
                                       <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">생일</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="member_birth" placeholder="ex) 1995-12-21" class="form-control"><small class="form-text text-muted">This is a help text</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">성별</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="radio">
                                                    <label for="radio1" class="form-check-label ">
                                                        <input type="radio" id="radio1" name="member_gender" value="man" class="form-check-input">남성
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio2" class="form-check-label ">
                                                        <input type="radio" id="radio2" name="member_gender" value="girl" class="form-check-input">여성
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">이동전화</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="member_phone1" placeholder="ex) 010-1111-1111" class="form-control" ><small class="form-text text-muted">This is a help text</small></div>
                                    </div>
                                         <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">집전화</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="member_phone2" placeholder="ex) 02-222-2222" class="form-control" ><small class="form-text text-muted" >This is a help text</small></div>
                                    </div>
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">주소</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="member_addr1" placeholder="주소" class="form-control"><small class="form-text text-muted">This is a help text</small></div>
                                    </div>
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">상세 주소</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="member_addr2" placeholder="상세주소" class="form-control"><small class="form-text text-muted">This is a help text</small></div>
                                    </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
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
                                
                    </body>
                    
                    <!-- pattern="(010)-\d{3,4}-\d{4}" required -->
                    <!-- pattern="\d(2,3)-\d{3,4}-\d{4}"> -->
                    <!-- required -->