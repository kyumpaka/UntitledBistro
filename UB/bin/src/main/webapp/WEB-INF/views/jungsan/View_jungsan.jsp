<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- 그래프시작 -->
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
       width: 550,
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
          ['총 매출',${befor_cash+befor_card},${today_card+today_cash}],
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
         ['지난주 월요일', 10, 4, 2],
         ['어제', ${menucount_drink}, ${menucount_cooking}, ${menucount_soup}],
         ['현재', ${menucount_total}, 11, 3],
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
<!-- 그래프 종료 -->



<meta charset="UTF-8">
<title></title>
</head>
<body>
<h2 align="center">매출 현황 그래프</h2><br>
	
	<div id="container" style="margin-top: 20px; margin-left: 100px;">
	<table border="5" style="width: 95%;">
			<tr bgcolor="gray" align="center">
				<td>금일 매출</td>
				<td>현금</td>
				<td>카드</td>
				<td>포인트</td>
			</tr>	
			<tr align="center" style="color: red">
				<td>${today_cash+today_card}</td> 
				<td>${today_cash}</td>
				<td>${today_card}</td>
				<td>-${today_point}</td>
			</tr>
		</table>
	</div>
	<br>
	<div id="container" style="padding-left:50px; padding-top: 20px;">
		<div class="row">
			<div class="col-md-6">
 				<div id="columnchart_material" style="width: 600px; height: 700px; padding-left: 30px;"></div>
 			</div>
 				<!-- 막대 그래프 -->
 			<div class="col-md-6" style="padding-left: 30px;">
 				<div id="barchart_material" style="width: 550px; height: 350px;"></div>
 				<!-- 누운 그래프 -->
  			<div id="line_top_x" style="margin-top: 50px;"></div>
 			</div>
		</div>
	</div>
	
	
	
	<div id="food" align="center" style="padding:50px;">
	<button type="button" class="btn btn-primary"><a href="Daily.html">DailyList</a></button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-dark"><a href="Monthly.html">MonthlyList</a></button>
</div>

		


</body>
</html>