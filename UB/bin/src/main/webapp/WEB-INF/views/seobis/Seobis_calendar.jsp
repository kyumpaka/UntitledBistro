<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
  <title>캘린더</title>

<!-- <link href='/assets/demo-to-codepen.css' rel='stylesheet' /> -->

  <style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
      background-color: #fefefe;
    }
    #calendar {
      max-width: 98%;
      margin: 40px auto;
      background-color: #fefefe;
    }
      .fc-sat { color:blue; }
      .fc-sun { color:red;  }
  </style>

<!-- 소스 -->
<link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
  <link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
  <link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />
<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/core/locales/ko.js'></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <!-- <script src='fullcalendar/core/locales/ko.js'></script> -->
  <script>
   document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      selectable: true,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth'
      },
      locale: 'ko',
      events: [ // 디비꺼 캘린더에 표시
    	  <c:forEach items="${Seobis_reserveSelect}" var="Seobis_reserveSelect">
    	  {
    	    title: <c:if test="${Seobis_reserveSelect.reserve_member_id != null}">'${Seobis_reserveSelect.reserve_member_id}'</c:if>
    	           <c:if test="${Seobis_reserveSelect.reserve_name != null}">'${Seobis_reserveSelect.reserve_name}'</c:if>,
    	    url: '${path}/Seobis/nck?reserve_num=${Seobis_reserveSelect.reserve_num}',
    	    start: '<fmt:formatDate pattern="yyyy-MM-dd" value="${Seobis_reserveSelect.reserve_date}" />',
    	    allDay: true
    	  },
    		</c:forEach>
        ],
      dateClick: function(info) {
	    	var date = new Date();
	    	  
	   	    var year = date.getFullYear(); //년도
	   	    var month = date.getMonth()+1; //월
	   	    var day = date.getDate(); //일
	   	 
	   	    if ((day+"").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
	   	        day = "0" + day;
	   	    }
	   	 	var strArray = info.dateStr.split('-');
	   	 	if(year <= strArray[0]) { // 년 비교
	   	 		if(month <= strArray[1]) { // 월 비교
	   	 			if(day <= strArray[2]) { // 일 비교
				        var width = 360;
						var height = 800;
						var popupX = (window.screen.width / 2) - (width / 2);
						var popupY = (window.screen.height / 2) - (height / 2);
						window.open('${path}/Seobis/Seobis_newCalendar?date='+info.dateStr ,'예약하기','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
	   	 			} else {
	   			   	 	swal({
	   						title: "과거는 예약할 수 없습니다.",
	   						icon: "warning",
	   						button: "닫기",
	   					});
	   		   	 	}
	   	 		} else {
			   	 	swal({
						title: "과거는 예약할 수 없습니다.",
						icon: "warning",
						button: "닫기",
					});
		   	 	}
	   	 	} else {
		   	 	swal({
					title: "과거는 예약할 수 없습니다.",
					icon: "warning",
					button: "닫기",
				});
	   	 	}
      },
      eventClick: function(info) {
          var eventObj = info.event;

          if (eventObj.url) {
        	var width = 360;
      		var height = 800;
      		var popupX = (window.screen.width / 2) - (width / 2);
      		var popupY = (window.screen.height / 2) - (height / 2);
      		window.open(eventObj.url,'예약확인','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
            info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
          }
      }
    });
    
    calendar.render();
  });

</script>
</head>

<body>
	<div id='calendar'></div>
</body>
</html>
