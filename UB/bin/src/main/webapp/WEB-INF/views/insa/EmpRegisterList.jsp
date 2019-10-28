<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/Admin/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근무 일지</title>




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
                  <div class="page-title"></div>
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
                     <strong class="card-title">직원 목록</strong>
                  </div>
                  <div class="card-body">
                     <table id="Emplist" class="table table-striped table-bordered">
                        <!-- <table id="Emplist" class="table table-striped table-bordered table-hover"> -->
                        <thead>
                           <tr>
                              <th>이름</th>
                              <th>사번</th>
                              <th>나이</th>
                              <th>전화번호</th>
                              <th>주민1</th>
                              <th>주민2</th>
                              <th>직급</th>
                              <th>입사날짜</th>
                              <th>재직여부</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="b" items="${EmpRegisterList}">

                              <tr>
                                 <td>${b.empregister_name}</td>
                                 <td><a
                                    href="/UntitledBistro/insa/EmpRegisterRead?empregister_empnum=${b.empregister_empnum }"
                                    onclick="window.open(this.href, '_blank', 'width=700,height=600,toolbars=no,scrollbars=yes'); return false;">${b.empregister_empnum }</a></td>
                                 <td>${b.empregister_age }</td>
                                 <td>${b.empregister_tel }</td>
                                 <td>${b.empregister_jumin }</td>
                                 <td><c:if
                                       test="${b.empregister_jumin2 ne null && b.empregister_jumin2!=''}">
               ${fn:substring(b.empregister_jumin2,1,fn:length(b.empregister_jumin2)-4)}******</c:if>
                                 </td>
                                 <td>${b.empregister_grade    }</td>
                                 <td><fmt:formatDate value="${b.empregister_entryday }"
                                       pattern="yyyy-MM-dd" /></td>
                                 <td>${b.empregister_leavecompany }</td>

                              </tr>

                           </c:forEach>
                        </tbody>
                     </table>
                     <button
                        onclick="window.open('EmpRegisterInsertForm','insert','width=1700,height=1000,location=no,status=no,scrollbars=yes');">사원등록</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
           <div class="clearfix"></div>


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
        <script src="${path}/resources/Admin/assets/js/init/datatables-init.js"></script> 
   <script type="text/javascript">
   
   
   
   
   
   
   
   
   
   
   
   
      $('#Emplist').DataTable({ // 페이징 처리, 검색, show entries
    	    pageLength : 10,
            bPaginate : true,
            bLengthChange : true,
            lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ],
            bAutoWidth : false,
            processing : true,
            ordering : true,
            serverSide : false,
            searching : true,
            bStateSave : true,
            "iDisplayLength" : 10,
            "language" : {
           	 search : "   검색: ",
                "paginate": {
                    "next": "다음",
                    "previous": "이전"
                }
            },
         });
      function EmpRegisterRead(empnum) {
         //alert("삭제")
         location.href = "/UntitledBistro/EmpRegisterRead?empregister_empnum="
               + empnum;
      }

      function list() {
         alert("등록완료");
         window.location.href = window.location.href;
         window.location.replace('EmpRegisterList');

      }

      function EmpRegisterRead(empnum) {
         //alert("삭제");
         location.href = "/UntitledBistro/EmpRegisterRead?empregister_empnum="
               + empnum;
      }

      function list() {
         alert("등록완료");
         window.location.href = window.location.href;
         window.location.replace('EmpRegisterList');

      }
   </script>
</body>
</html>