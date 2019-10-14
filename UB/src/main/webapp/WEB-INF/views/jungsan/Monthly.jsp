<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Select a Date Range</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    var dateFormat = "yy-mm-dd",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	몬뜨리 리스트 입니다
	즉 월마감 리스트 입니다.
	<label for="from">From</label>
	<input type="text" id="from" name="from">
	<label for="to">to</label>
	<input type="text" id="to" name="to">
	
	<h2 align="center">Monthly List</h2><br><br>

	<div class="container" align="center">
		<table border="5" style="width: 100%;">
			<tr bgcolor="gray" align="center">
				<td>날짜</td>
				<td>현금</td>
				<td>카드</td>
				<td>총매출</td>
				<td>순매출</td>
				<td>업무시간</td>
				<td>지출</td>
				<td>포인트사용가</td>
				<td>환불</td>
				<td>환불이유</td>
				<td>직급</td>
				<td>차액</td>
			</tr>	
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td> 
				<td></td>
				<td></td>
				<td></td>
				<td></td> 
				<td>포스 입력 금액 - 매니저 입력금액</td>
			</tr>
		</table>
	</div>
	<button type="button"><a href="Daily.html">일마감</a></button>
	<button type="button"><a href="View_jungsan.html">현황 그래프 보기</a></button>
</body>
</html>