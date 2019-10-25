<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<!-- 그래프 시작 -->

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Styles -->
<style>
#chartdiv {
	width: 600px;
	height: 500px;
}

#chartdiv2 {
	width: 600px;
	height: 650px;
}

#chartdiv3 {
	width: 100%;
	height: 500px;
}
</style>

<!-- 메뉴 분포표 -->
<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.XYChart);


// Add data
chart.data = [{
  "category": "지난주",
  "주류": ${last_week_drink},
  "탕류": ${last_week_soup},
  "요리": ${last_week_drink},
}, {
  "category": "어제",
  "주류": ${befor_drink},
  "탕류": ${befor_soup},
  "요리": ${befor_cooking},
}, {
  "category": "오늘",
  "주류": ${menucount_drink},
  "탕류": ${menucount_soup},
  "요리": ${menucount_cooking},
}];

// Create axes
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "category";
categoryAxis.renderer.grid.template.location = 0;


var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.renderer.inside = true;
valueAxis.renderer.labels.template.disabled = true;
valueAxis.min = 0;

// Create series
function createSeries(field, name) {
  
  // Set up series
  var series = chart.series.push(new am4charts.ColumnSeries());
  series.name = name;
  series.dataFields.valueY = field;
  series.dataFields.categoryX = "category";
  series.sequencedInterpolation = true;
  
  // Make it stacked
  series.stacked = true;
  
  // Configure columns
  series.columns.template.width = am4core.percent(60);
  series.columns.template.tooltipText = "[bold]{name}[/]\n[font-size:14px]{categoryX}: {valueY}";
  
  // Add label
  var labelBullet = series.bullets.push(new am4charts.LabelBullet());
  labelBullet.label.text = "{valueY}";
  labelBullet.locationY = 0.5;
  
  return series;
}

createSeries("주류", "주류");
createSeries("탕류", "탕류");
createSeries("요리", "요리");

// Legend
chart.legend = new am4charts.Legend();

}); // end am4core.ready()
</script>

<!-- 메뉴 분포표 끝-->

<!-- 요일별 매출 -->
<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv2", am4charts.XYChart);

// Add data
chart.data = [{
	"day": "월요일",
  "sales": "${Monday}",
}, {
  "day": "화요일",
  "sales": "${Tuesday}"
}, {
  "day": "수요일",
  "sales": "${Wednesday}"
}, {
  "day": "목요일",
  "sales": "${Thursday}"
}, {
  "day": "금요일",
  "sales": "${Friday}"
}, {
  "day": "토요일",
  "sales": "${Saturday}"
},{
	  "day": "일요일",
	  "sales": "${Sunday}"
	}];

// Create axes
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "day";
categoryAxis.renderer.grid.template.location = 20;
categoryAxis.renderer.minGridDistance = 30;
categoryAxis.renderer.labels.template.horizontalCenter = "middle";
categoryAxis.renderer.labels.template.verticalCenter = "middle";
categoryAxis.tooltip.disabled = true;
categoryAxis.renderer.minHeight = 200;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.renderer.minWidth = 50;

// Create series
var series = chart.series.push(new am4charts.ColumnSeries());
series.sequencedInterpolation = true;
series.dataFields.valueY = "sales";
series.dataFields.categoryX = "day";
series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
series.columns.template.strokeWidth = 0;

series.tooltip.pointerOrientation = "vertical";

series.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
});

// Cursor
chart.cursor = new am4charts.XYCursor();

}); // end am4core.ready()
</script>
<!-- 요일별 매출 끝 -->

<!-- 시간별 매출 -->
<!-- Chart code -->
<script>
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("chartdiv3", am4charts.XYChart);

		// Add data
		chart.data = [ {
			"time" : "0",
			"yesterday" : "${yesterdaytoday_zero_Oclock}",
			"today" : "${today_zero_Oclock}",
		},{
			"time" : "1",
			"yesterday" : "${yesterday_one_Oclock}",
			"today" : "${today_one_Oclock}",
		}, {
			"time" : "2",
			"yesterday" : "${yesterday_two_Oclock}",
			"today" : "${today_two_Oclock}",
		}, {
			"time" : "3",
			"yesterday" : "${yesterday_three_Oclock}",
			"today" : "${today_three_Oclock}",
		}, {
			"time" : "4",
			"yesterday" : "${yesterday_four_Oclock}",
			"today" : "${today_four_Oclock}",
		}, {
			"time" : "5",
			"yesterday" : "${yesterday_five_Oclock}",
			"today" : "${today_five_Oclock}",
		}, {
			"time" : "6",
			"yesterday" : "${yesterday_six_Oclock}",
			"today" : "${today_six_Oclock}",
		}, {
			"time" : "7",
			"yesterday" : "${yesterday_seven_Oclock}",
			"today" : "${today_seven_Oclock}",
		}, {
			"time" : "8",
			"yesterday" : "${yesterday_eight_Oclock}",
			"today" : "${today_eight_Oclock}",
		}, {
			"time" : "9",
			"yesterday" : "${yesterday_nine_Oclock}",
			"today" : "${today_nine_Oclock}",
		}, {
			"time" : "10",
			"yesterday" : "${yesterday_ten_Oclock}",
			"today" : "${today_ten_Oclock}",
		}, {
			"time" : "11",
			"yesterday" : "${yesterday_eleven_Oclock}",
			"today" : "${today_eleven_Oclock}",
		}, {
			"time" : "12",
			"yesterday" : "${yesterday_twelve_Oclock}",
			"today" : "${today_twelve_Oclock}",
		}, {
			"time" : "13",
			"yesterday" : "${yesterday_thirteen_Oclock}",
			"today" : "${today_thirteen_Oclock}",
		}, {
			"time" : "14",
			"yesterday" : "${yesterday_fourteen_Oclock}",
			"today" : "${today_fourteen_Oclock}",
		}, {
			"time" : "15",
			"yesterday" : "${yesterday_fifteen_Oclock}",
			"today" : "${today_fifteen_Oclock}",
		}, {
			"time" : "16",
			"yesterday" : "${yesterday_sixteen_Oclock}",
			"today" : "${today_sixteen_Oclock}",
		}, {
			"time" : "17",
			"yesterday" : "${yesterday_seventeen_Oclock}",
			"today" : "${today_seventeen_Oclock}",
		}, {
			"time" : "18",
			"yesterday" : "${yesterday_eighteen_Oclock}",
			"today" : "${today_eighteen_Oclock}",
		}, {
			"time" : "19",
			"yesterday" : "${yesterday_nineteen_Oclock}",
			"today" : "${today_nineteen_Oclock}",
		}, {
			"time" : "20",
			"yesterday" : "${yesterday_twenty_Oclock}",
			"today" : "${today_twenty_Oclock}",
		}, {
			"time" : "21",
			"yesterday" : "${yesterday_twentyone_Oclock}",
			"today" : "${today_twentyone_Oclock}",
		}, {
			"time" : "22",
			"yesterday" : "${yesterday_twentytwo_Oclock}",
			"today" : "${today_twentytwo_Oclock}",
		}, {
			"time" : "23",
			"yesterday" : "${yesterday_twentythree_Oclock}",
			"today" : "${today_twentythree_Oclock}",
		}, {
			"time" : "24",
			"yesterday" : "",
			"today" : "",
		}];

		// Create category axis
		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "time";
		categoryAxis.renderer.opposite = true;

		// Create value axis
		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.renderer.inversed = true;
		valueAxis.renderer.minLabelPosition = 0.01;

		// Create series
		var series1 = chart.series.push(new am4charts.LineSeries());
		series1.dataFields.valueY = "yesterday";
		series1.dataFields.categoryX = "time";
		series1.name = "어제";
		series1.strokeWidth = 3;
		series1.bullets.push(new am4charts.CircleBullet());
		series1.tooltipText = "{name} 의 {valueY} 시 매출";
		series1.legendSettings.valueText = "{valueY}";
		series1.visible = false;

		var series2 = chart.series.push(new am4charts.LineSeries());
		series2.dataFields.valueY = "today";
		series2.dataFields.categoryX = "time";
		series2.name = '오늘';
		series2.strokeWidth = 3;
		series2.bullets.push(new am4charts.CircleBullet());
		series2.tooltipText = "{name} 의 {valueY} 시 매출";
		series2.legendSettings.valueText = "{valueY}";

		// Add chart cursor
		chart.cursor = new am4charts.XYCursor();
		chart.cursor.behavior = "zoomY";

		// Add legend
		chart.legend = new am4charts.Legend();

	}); // end am4core.ready()
</script>
<!-- 시간별 매출 끝 -->
<!-- 그래프 끝 -->

<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2 align="center">매출 현황 그래프</h2>
	<br>
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
				<td>${today_point}</td>
			</tr>
		</table>
	</div>
	<br>
	<div id="container" style="padding-left: 50px; padding-top: 20px;">
		<div class="row">
			<div class="col-md-6">
				<div id="chartdiv"></div>
			</div>
			<!-- 막대 그래프 -->
			<div class="col-md-6" style="padding-left: 30px;">
				<div id="chartdiv2"></div>
				<!-- 누운 그래프 -->
				
			</div>
			<div id="chartdiv3"></div>
		</div>
	</div>


	<div id="food" align="center" style="padding: 50px;">
		<button type="button" class="btn btn-primary">
			<a href="Daily.html"><b><font style="color: white">DailyList</font></b></a>
		</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-dark">
			<a href="Monthly.html"><b><font style="color: white">MonthlyList</font></b></a>
		</button>
	</div>




</body>
</html>