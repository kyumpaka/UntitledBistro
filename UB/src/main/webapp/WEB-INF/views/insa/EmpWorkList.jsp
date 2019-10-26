<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/Admin/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
   

<meta charset="UTF-8">
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
                     <strong class="card-title">근무 일지</strong>
                  </div>
                  <div class="card-body">
   <table id="WorkList" class="table table-striped table-bordered">
      <thead>
         <tr>
            <th>No</th>
            <th>사번</th>
            <th>출근시간</th>
            <th>퇴근시간</th>
            <th>일한시간</th>
         </tr>

      </thead>
      <tbody>

         <c:forEach var="b" items="${EmpWorkList}">

            <tr>
               <td>${b.schedule_no}</td>

               <td>${b.schedule_empregister_empnum }</td>
               <td><fmt:formatDate value="${b.schedule_workingstart }"
                     pattern="yyyy-MM-dd HH:mm:ss" /></td>
               <td><fmt:formatDate value="${b.schedule_workingend }"
                     pattern="yyyy-MM-dd HH:mm:ss" /></td>
               <td>${b.schedule_workingtime }시간</td>
            </tr>
         </c:forEach>
      </tbody>

   </table>
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
   
   
   
   
      $('#WorkList').DataTable({ // 페이징 처리, 검색, show entries
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
   </script>

</body>
</html>