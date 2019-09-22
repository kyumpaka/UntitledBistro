<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 발주서의 기능은 기본적으로 발주계획작성과 흡사하다 다만 핵심적으로

	발주서 조회나 발주서 현황과의 연계와
	1. 발주계획에 입력이 완료된 데이터를 불러와서 적용시킬수 있어야 한다. 
	   이 경우에는 [새창으로 발주계획서를 조회하여 체크박스 선택을 통해서 [적용]버튼으로 적용한다.
	2. 발주서 전표를 출력하는 테이블이 필요하고 이를 인쇄할수 있는 기능도 지원해야한다
	3. 추가적으로 pdf excel email fax로 할수 있는지 여부를 체크한다.
	
	발주서에서의 상단버튼은 발주계획작성과 동일하여
	[주요발주품목] (balju_save)
	 [소요에서는] 
	 [안전재고(혹은적정재고)] 전체 재고량과 안전재고량을 계산, 발주량을 조절할수 있는 방식을 고려해야한다.
	 
	하단메뉴는 [저장] [저장 및 전표 출력] [다시작성] [발주현황]을 적용한다 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/balju/plan" method="post">
		품목코드 : <input type="text" id="Product_code">
		품목수량 : <input type="text" id="QT">
		작성자 : <input type="text" id="WR">
		진행상태 : <input type="text" id="STAT">
		완료여부 : <input type="text" id="END">
	
	</form>
</body>
</html>