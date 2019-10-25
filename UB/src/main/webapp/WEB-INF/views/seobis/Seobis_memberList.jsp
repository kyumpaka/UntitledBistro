<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/Admin/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    
     <style>
        #updatebutton{
  			border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;    
            margin-right:-4px;
        }
        #deletebutton{
  			border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;    
            margin-right:-4px;
        }
    	#btn_group button{
            background-color: dimgray;
            color: white;
            padding: 5px;
        }
        #btn_group button:hover{
            color: black;
            background-color: white;
        }
    </style>

</head>
<body>
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Bistro</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li class="active"><a href="${path}/Seobis/jUs">회원 등록</a></li>
                                    <li><a href="${path}/Seobis/Seobis_calendar">예약 관리</a></li>
                                    <li><a href="${path}/Seobis/pList">포인트 관리</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">회원 관리</strong>
                            </div>
                            <div class="card-body">
                                <table id="table" class="table table-striped table-bordered">
                                    <thead>
                                            <tr>
                                            	<th>ID</th>
                                            	<th>이름</th>
                                            	<th>성별</th>
                                            	<th>생일</th>
                                            	<th>이메일</th>
                                            	<th>전화번호</th>
                                            	<th>가입일</th>
                                            	<th>삭제</th>
                                            </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="b" items="${Seobis_memberList}">
											<tr>
												<td><div id="btn_group"><button id="updatebutton" onclick='location.href="${path}/Seobis/select?member_id=${b.member_id}"'>${b.member_id}</button></div></td>
												<td>${b.member_name}</td>
												<td>${b.member_gender}</td>
												<td>${b.member_birth}</td>
												<td>${b.member_email}</td>
												<td>${b.member_phone1}</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${b.member_reg}" /></td>
												<td><div id="btn_group"><button id="deletebutton" class="Seobis_MemberDelete" onclick="realDelete('${b.member_id}')">삭제</button></div></td>
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
        
        <div class="clearfix"></div>

    <!-- Scripts -->
<!--     <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> 이거 쓰면 메뉴 비활성화 됩니다  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
    <script src="${path}/resources/Admin/assets/js/main.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="${path}/resources/Admin/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="${path}/resources/Admin/assets/js/init/datatables-init.js"></script> 
    


    <script type="text/javascript">
    var table = $('#table').DataTable({
        "language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "검색: ",
            "zeroRecords": "일치하는 데이터가 없습니다.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": "다음",
                "previous": "이전"
            }
        },
    });

    
        $(document).ready(function() {
          $('#table-export').DataTable();
      } );
        	/* $(".Seobis_MemberDelete").on("click", function delet(){
               // var member_id = $(this).parent().parent().parent().children().eq(0).text();
                swal({
                	  title: "회원 ID : "+member_id+"을 삭제하시겠습니까?",
                	  icon: "warning",
                	  buttons: true,
                	  dangerMode: true,
                	})
                	.then((willDelete) => {
                	  if (willDelete) {
                		  $(location).attr("href", "${path}/Seobis_delete?member_id=" + member_id);
                	    swal("성공적으로 삭제하였습니다.", {
                	      icon: "success",
                	    });
                	  } else {
                	    swal("취소 되었습니다.");
                	  }
                	});
            }); */
        	
        	function realDelete(member_id) {
        		swal({
      		   	  title: "회원 ID : " + member_id + "을 삭제하시겠습니까?",
      		   	  icon: "warning",
      		   	  buttons: true,
      		   	  dangerMode: true,
      		   	})
      		.then((value) => {
      			if(value) {
      				realMod(member_id);
      			}
      		});
            };
            
        	function realMod(realId) {
            	swal("성공적으로 삭제하였습니다.", {
             	      icon: "success",
               	  	
               	    })
        		.then((value) => {
        			if(value) {
        				 $(location).attr("href", "${path}/Seobis/delete?member_id=" + realId);
        			}
        		});
            }
        	
        	
  </script>


</body>
</html>
