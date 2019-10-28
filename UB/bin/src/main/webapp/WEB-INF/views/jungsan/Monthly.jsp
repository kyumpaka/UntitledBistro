<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Datepicker - Select a Date Range</title>
<!-- 그래프 시작 -->
<!-- Styles -->
<style>
#chartdiv {
	width: 100%;
	height: 350px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.XYChart);

		// Add data
		chart.data = [ {
			"Month" : "1월",
			"value" : ${Jan}
		}, {
			"Month" : "2월",
			"value" : ${Feb}
		}, {
			"Month" : "3월",
			"value" : ${Mar}
		}, {
			"Month" : "4월",
			"value" : ${Apr}
		}, {
			"Month" : "5월",
			"value" : ${May}
		}, {
			"Month" : "6월",
			"value" : ${Jun}
		}, {
			"Month" : "7월",
			"value" : ${Jul}
		}, {
			"Month" : "8월",
			"value" : ${Aug}
		}, {
			"Month" : "9월",
			"value" : ${Sept}
		}, {
			"Month" : "10월",
			"value" : ${Ock}
		}, {
			"Month" : "11월",
			"value" : ${Nov}
		}, {
			"Month" : "12월",
			"value" : ${Dec}
		} ];

		// Populate data
		for (var i = 0; i < (chart.data.length - 1); i++) {
			chart.data[i].valueNext = chart.data[i + 1].value;
		}

		// Create axes
		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "Month";
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.renderer.minGridDistance = 30;

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.min = 0;

		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.valueY = "value";
		series.dataFields.categoryX = "Month";

		// Add series for showing variance arrows
		var series2 = chart.series.push(new am4charts.ColumnSeries());
		series2.dataFields.valueY = "valueNext";
		series2.dataFields.openValueY = "value";
		series2.dataFields.categoryX = "Month";
		series2.columns.template.width = 1;
		series2.fill = am4core.color("#555");
		series2.stroke = am4core.color("#555");

		// Add a triangle for arrow tip
		var arrow = series2.bullets.push(new am4core.Triangle);
		arrow.width = 10;
		arrow.height = 10;
		arrow.horizontalCenter = "middle";
		arrow.verticalCenter = "top";
		arrow.dy = -1;

		// Set up a rotation adapter which would rotate the triangle if its a negative change
		arrow.adapter.add("rotation", function(rotation, target) {
			return getVariancePercent(target.dataItem) < 0 ? 180 : rotation;
		});

		// Set up a rotation adapter which adjusts Y position
		arrow.adapter.add("dy", function(dy, target) {
			return getVariancePercent(target.dataItem) < 0 ? 1 : dy;
		});

		// Add a label
		var label = series2.bullets.push(new am4core.Label);
		label.padding(10, 10, 10, 10);
		label.text = "";
		label.fill = am4core.color("#0c0");
		label.strokeWidth = 0;
		label.horizontalCenter = "middle";
		label.verticalCenter = "bottom";
		label.fontWeight = "bolder";

		// Adapter for label text which calculates change in percent
		label.adapter.add("textOutput", function(text, target) {
			var percent = getVariancePercent(target.dataItem);
			return percent ? percent + "%" : text;
		});

		// Adapter which shifts the label if it's below the variance column
		label.adapter.add("verticalCenter", function(center, target) {
			return getVariancePercent(target.dataItem) < 0 ? "top" : center;
		});

		// Adapter which changes color of label to red
		label.adapter.add("fill", function(fill, target) {
			return getVariancePercent(target.dataItem) < 0 ? am4core
					.color("#c00") : fill;
		});

		function getVariancePercent(dataItem) {
			if (dataItem) {
				var value = dataItem.valueY;
				var openValue = dataItem.openValueY;
				var change = value - openValue;
				return Math.round(change / openValue * 100);
			}
			return 0;
		}

	}); // end am4core.ready()
</script>
<!-- 그래프 끝 -->

<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2 align="center">Monthly List</h2><br><br>

	<div id="chartdiv"></div>
	
	
	<div class="container" align="center">
		<table border="5" style="width: 100%;">
			<tr bgcolor="gray" align="center">
				<td>순매출</td>
				<td>총매출</td>
				<td>현금</td>
				<td>카드</td>
				<td>포인트사용가</td>
				<td>지출</td>
				<td>업무시간</td>
				<td>환불</td>
				<td>날짜</td>
			</tr>	
			
			<c:forEach var="M" items="${MonthList}">
			<tr>
				<td>${M.month_real_sum}</td>
				<td>${M.month_sum}</td> 
				<td>${M.month_cash}</td>
				<td>${M.month_card}</td>
				<td>${M.month_point}</td>
				<td>${M.month_expenditure}</td>
				<td>${M.month_worktime}</td>
				<td>${M.month_refund}</td>
				<td><fmt:formatDate value="${M.month_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="10" align="right" style="color: red;">차액 : ${differenceList}</td>
			</tr>
		</table>
	</div>
	<button type="button"><a href="Daily.html">일마감</a></button>
	<button type="button"><a href="View_jungsan.html">현황 그래프 보기</a></button>
</body>
<script type="text/javascript">
	console.log("테스트");
	console.log("${differenceList}");
</script>
</html>