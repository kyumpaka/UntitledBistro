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

  <style>
    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }
    #calendar {
      max-width: 900px;
      margin: 40px auto;
    }
  </style>

<!-- 소스 -->
<link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
  <link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
  <link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />
<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>
  <script>
   document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      selectable: true,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      
      events: [ // 디비꺼 캘린더에 표시
    	  <c:forEach items="${HollyDay}" var="h">
    	  {
    	title: asd,
    	 url: '${path}/insa/nck?salary_empregister_empnum=${h.salary_empregister_empnum}',
    	start: '<fmt:formatDate pattern="yyyy-MM-dd" value="${h.salary_hollydaystart}" />',
	   	allDay: true
    		  
    	  },
    		</c:forEach>
        ],
      dateClick: function(info) {
        var width = 360;
		var height = 800;
		var popupX = (window.screen.width / 2) - (width / 2);
		var popupY = (window.screen.height / 2) - (height / 2);
		window.open('${path}/insa/Hollyday' ,'휴가등록','width='+width+',height='+height+',status=no,scrollbars=yes, left='+ popupX + ', top='+ popupY);
		
//         calendar.addEvent({
//             title: 새창에서 가져온 아이디or이름 추가하기,
//             start: info.dateStr,
//             allDay: true
//           });
        

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
      },
      select: function(info) {
       /*  alert('selected ' + info.startStr + ' to ' + info.endStr); */ /* info.endStr : 클릭 다음 날짜 */
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
