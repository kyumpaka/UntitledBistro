<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<!-- 그래프 시작 -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
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
var chart = am4core.create("chartdiv", am4charts.XYChart3D);

// Add data
chart.data = [{
  "날짜": "어제 매출",
  "visits": "${befor_cash+befor_card+befor_point}"
}, {
  "날짜": "오늘 매출",
  "visits": "${today_cash+today_card+today_point}"
}, {
  "날짜": "어제 현금",
  "visits": "${befor_cash}"
}, {
  "날짜": "오늘 현금",
  "visits": "${today_cash}"
}, {
  "날짜": "어제 카드",
  "visits": "${befor_card}"
}, {
  "날짜": "오늘 카드",
  "visits": "${today_card}"
}, {
  "날짜": "어제 포인트",
  "visits": "${befor_point}"
}, {
  "날짜": "오늘 포인트",
"visits": "${today_point}"
}];

// Create axes
let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "날짜";
categoryAxis.renderer.labels.template.rotation = 270;
categoryAxis.renderer.labels.template.hideOversized = false;
categoryAxis.renderer.minGridDistance = 20;
categoryAxis.renderer.labels.template.horizontalCenter = "right";
categoryAxis.renderer.labels.template.verticalCenter = "right";
categoryAxis.tooltip.label.rotation = 270;
categoryAxis.tooltip.label.horizontalCenter = "right";
categoryAxis.tooltip.label.verticalCenter = "right";

let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.title.fontWeight = "bold";

// Create series
var series = chart.series.push(new am4charts.ColumnSeries3D());
series.dataFields.valueY = "visits";
series.dataFields.categoryX = "날짜";
series.name = "Visits";
series.tooltipText = "{categoryX}: [bold]{valueY}";
series.columns.template.fillOpacity = .8;

var columnTemplate = series.columns.template;
columnTemplate.strokeWidth = 2;
columnTemplate.strokeOpacity = 1;
columnTemplate.stroke = am4core.color("#FFFFFF");

columnTemplate.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
})


chart.cursor = new am4charts.XYCursor();
chart.cursor.lineX.strokeOpacity = 0;
chart.cursor.lineY.strokeOpacity = 0;

}); // end am4core.ready()
</script>
<!-- 그래프 끝 -->
<title></title>
</head>
<body>

<h2 align="center">매출 현황</h2><br><br>
	
	<div class="container" align="center">
		<table border="5" style="width: 100%;">
		
			<c:forEach var="dto" items="${jungsan_state}">
				<tr bgcolor="gray" align="center">
					<td>매출</td>
					<td>현금</td>
					<td>카드</td>
					<td>포인트</td>
				</tr>
				<tr align="center" style="color: red;">
					<td>${dto.to_total}</td>
					<td>${dto.to_cash}</td>
					<td>${dto.to_card}</td>
					<td>${dto.to_point}</td>
				</tr>	
				<tr bgcolor="gray" align="center">
					<td>어제 매출 대비</td>
					<td>어제 현금 대비</td>
					<td>어제 카드 대비</td>
					<td>어제 포인트 포인트</td>
				</tr>
				<tr align="center" style="color: green;">
					<td>${dto.to_total-dto.before_total}</td>
					<td>${dto.to_cash-dto.before_cash}</td>
					<td>${dto.to_card-dto.before_card}</td>
					<td>${dto.to_point-dto.before_point}</td>
				</tr>
			</c:forEach>
				<tr bgcolor="gray" align="center">
					<td>근무 인원</td>
					<td>인권비</td>
					<td>근무진행시간</td>
					<td>발주비용</td>
				</tr>
				<tr align="center" style="color: blue;">
					<td>${personnel}</td>
					<td>${employee + parttime}</td>
					<td>${worketime}</td>
					<td>${expenditure}</td>
				</tr>	
		</table>
	</div>
	
	<div id="chartdiv" style="margin-top: 20px;"></div>
</body>
</html>