<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['소주',     ${menucount_drink}],
          ['맥주',      11],
          ['요리',  ${menucount_cooking}],
          ['탕류', ${menucount_soup}],
          ['밥류',    9]
        ]);

        var options = {
          title: '매출 분포 표',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>


<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
    	  ["Element", "Density", { role: "style" } ],
          ["카드", ${befor_card}, "red"],
          ["현금", ${befor_cash}, "green"],
          ["총매출", ${befor_card+befor_cash}, "color: blue"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "어제 매출표",
        width: 450,
        height: 500,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
  </script>

<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["카드", ${today_card}, "red"],
        ["현금", ${today_cash}, "green"],
        ["총매출", ${today_card+today_cash}, "color: blue"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "오늘 매출표",
        width: 450,
        height: 500,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values2"));
      chart.draw(view, options);
  }
  </script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@include file="Show_list.jsp" %>

		<div class="row" align="left" style="margin-top: 30px; margin-bottom: 30px;">
			<div class="col-md-5">
				<div id="columnchart_values" style="margin-left: 60px;"></div>
			</div>
			<div class="col-md-4">
				<div id="piechart_3d" style="width: 400px; height: 500px; margin-left: -130px;"></div>
			</div>
			<div class="col-md-3">
				<div id="columnchart_values2" style="margin-left: -205px;"></div>
			</div>
		</div>

<h2 align="center">매니저 입력</h2>
	 <form name="form1" method="post" action="Day_DeadLineForm.html">
		<table style="width: 1200px; margin: auto;" border="1">
		
			<tr>
				<td>현금</td>
				<td><input type="number" name="jungsan_input_cash"/></td>
				<td>카드</td>
				<td><input type="number" name="jungsan_input_card"/></td>
				<td>포인트사용</td>
				<td><input type="number" name="jungsan_input_point"/></td>
			</tr>
			<tr>
				<td>지출</td>
				<td><input type="number" name="jungsan_input_expenditure"/></td>
				<td>근무시간</td>
				<td><input type="number" name="jungsan_input_worktime"/></td>
				<td>직급</td>
				<td><input type="text" name="jungsan_input_grade"/></td>
			</tr>
			<tr>
				<td>환불 유무</td>
				<td>환불 유<input type="radio">환불 무<input type="radio"></td>				
				<td>환불 금액</td>
				<td><input type="number" name="jungsan_input_refund"/></td>
				<td>환불내용</td>
				<td><textarea name="jungsan_input_reason"></textarea></td>
				</tr>
			</table>
			<div align="center">
				<input type="reset" value="취소"/>
				<input type="submit" value="저장"/>
			</div>
			</form>


</body>
</html>