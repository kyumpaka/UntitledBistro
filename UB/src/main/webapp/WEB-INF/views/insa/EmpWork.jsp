<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
     <script>
       /*  jQuery(function($){
            $("#EmpWorkTable").DataTable();
        });
         */
         $(document).ready(function() {
        	    $('#EmpWork').DataTable({
        	     scrollY:500,
        	     ajax: {
        	      "type" : "POST",
        	         "url" : "/EmpWork",
        	            "dataType": "JSON"
        	         },
        	        columns: [
        	                   { data: "schedule_no" },
        	                   { data: "schedule_empregister_empnum" },
        	                   { data: "Schedule_WorkingStart" },
        	                   { data: "Schedule_WorkingEnd" },
        	                   { data: "schedule_workingtime" }
        	               ]
        	    });
        	} );
 

 /* $(document).ready(function(){
     $('#EmpWork').dataTable({
         pageLength: 3,
         bPaginate: true,
         bLengthChange: true,
         lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
         bAutoWidth: false,
         processing: true,
         ordering: true,
         serverSide: false,
         searching: true,
         ajax : {
             "url":"/EmpWork",
             "type":"POST",
             "data": function (d) {
                 d.userStatCd = "NR";
             }
         },
         columns : [
        	    { data: "schedule_no" },
                { data: "schedule_empregister_empnum" },
                { data: "Schedule_WorkingStart" },
                { data: "Schedule_WorkingEnd" },
                { data: "schedule_workingtime" }
         ]

     });

}); */
    </script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:1280px; margin:0 auto;">
  <table id="EmpWork" class="table table-striped table-bordered" cellspacing="0" width="100%">
         <thead>
             <tr>
                 <th>번호</th>
                 <th>제목</th>
                 <th>작성자</th>
                 <th>작성일</th>
                 <th>조회수</th>
             </tr>
         </thead>
     </table>
 </div>

 
</body>
</html>