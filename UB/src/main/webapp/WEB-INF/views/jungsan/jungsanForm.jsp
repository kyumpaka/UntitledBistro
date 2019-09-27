<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	 google.charts.load('current', {'packages':['line']});
     google.charts.setOnLoadCallback(drawChart);

   	function drawChart() {

     var data = new google.visualization.DataTable();
     data.addColumn('number', '시간별 매출');
     data.addColumn('number', '어제 매출');
     data.addColumn('number', '오늘 매출');

     data.addRows([
       [12,  37.8, 80.8],
       [11,  30.9, 69.5],
       [10,  25.4,   57],
       [9,  11.7, 18.8],
       [8,  11.9, 17.6],
       [7,   8.8, 13.6],
       [6,   7.6, 12.3],
       [5,  12.3, 29.2],
       [4,  16.9, 42.9],
       [3, 12.8, 30.9],
       [2,  5.3,  7.9],
       [1,  6.6,  8.4],
     ]);

     var options = {
       width: 900,
       height: 300,
       axes: {
         x: {
            0 : {side: 'top'} 
         }
       }
     };

     var chart = new google.charts.Line(document.getElementById('line_top_x'));

     chart.draw(data, google.charts.Line.convertOptions(options));
   }
 </script>

<script type="text/javascript">
     google.charts.load('current', {'packages':['bar']});
     google.charts.setOnLoadCallback(drawChart);
     
     function drawChart() {
       var data = google.visualization.arrayToDataTable([
         ['매출', '어제 비율', '현재 비율'],
          ['총 매출',${total_card},${total_cash}],
         ['카드 매출',${befor_card},${today_card}],
         ['현금 매출',${befor_cash},${today_cash}],
       ]);

       var options = {
         vAxis:{format:'Decimal'}
       };

       var chart = new google.charts.Bar(document.getElementById('barchart_material'));

       chart.draw(data, google.charts.Bar.convertOptions(options));
     }
   </script>
<script type="text/javascript">
   
     google.charts.load('current', {'packages':['bar']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
       var data = google.visualization.arrayToDataTable([
         ['day', '주류', '요리', '탕'],
         ['지난주 월요일', 1000, 400, 200],
         ['어제', 1170, 460, 250],
         ['현재', 660, 1120, 300],
       ]);

       var options = {
       		vAxis:{format:'Decimal'}
        /*  chart: {
           title: 'Company Performance',
           subtitle: 'Sales, Expenses, and Profit: 2014-2017',
         } */
       };

       var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

       chart.draw(data, google.charts.Bar.convertOptions(options));
     }
     </script>

<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="head" style="float:right;">
	<select>
		<option value="당일">당일 통계</option>
		<option value="메뉴별">메뉴별 통계</option>
		<option value="시간별">시간별 통계</option>
		<option value="날짜별">날짜별 통계</option>
		<option value="월별">월별 통계</option>
		<option value="결제별">{결재 방법 통계}</option>
	</select>
</div>
<div id="container" style="padding-left:50px; padding-top: 50px;">
	<div class="row">
		<div class="col-xd-6">
 			<div id="columnchart_material" style="width: 600px; height: 700px; padding-left: 30px;"></div>
 		</div>
 				<!-- 막대 그래프 -->
 		<div class="col-xd-6" style="padding-left: 30px;">
 			<div id="barchart_material" style="width: 900px; height: 350px;"></div>
 				<!-- 누운 그래프 -->
  			<div id="line_top_x" style="margin-top: 50px;"></div>
 		</div>
	</div>
</div>
<div id="food" align="center" style="padding:50px;">
	<button type="button" class="btn btn-primary" onclick="javascript:location.href='/day.jsp';">일마감</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-dark" onclick="javascript:location.href='/month.jsp';">월마감</button>
</div>

<table>
	<tr><td>어제 카드 결제가 : </td> <td>${befor_card}</td></tr>
	<tr><td>어제 현금 결제가 : </td> <td>${befor_cash}</td></tr>
	<tr><td>오늘 카드 결제가 : </td> <td>${today_card}</td></tr>
	<tr><td>오늘 현금 결제가 : </td> <td>${today_cash}</td></tr>
	<tr><td>총 카드 결제가 : </td> <td>${total_card}</td></tr>
	<tr><td>총 현금 결제가 : </td> <td>${total_cash}</td></tr>
	<tr><td>총 결제가 : </td> <td>${timeto_jungsan}</td></tr>
</table>
</body>

</html>