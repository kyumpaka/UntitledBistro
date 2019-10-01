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
      dateClick: function(info) {
        alert('clicked ' + info.dateStr); /* info.dateStr : 클릭날짜 */
        var memberId = prompt("아이디를 입력하세요.");
        calendar.addEvent({
            title: memberId,
            start: info.dateStr,
            allDay: true
          });
      },
      select: function(info) {
       /*  alert('selected ' + info.startStr + ' to ' + info.endStr); */ /* info.endStr : 클릭 다음 날짜 */
      }
    });

    calendar.render();
  });