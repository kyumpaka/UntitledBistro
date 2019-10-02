<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>JSP</title>
</head>
<body>

<button id="wsBtn">웹소켓 테스트</button>

</body>
<script type="text/javascript">
/* 
var webSocket = new WebSocket("ws://localhost:8080/UntitledBistro/realTime-ws");
webSocket.onopen = onOpen;
webSocket.onmessage = onMessage;
webSocket.onclose = onClose;

function onOpen(event) {
	console.log("웹 연결");
}

function onMessage(evnet) {
	console.log("웹 메시지 받음 : " + event.data);
}

function onClose(event) {
	console.log("웹 닫음");
}
 */
$("#wsBtn").on("click",function() {
	webSocket.send("1");
});
</script>

</html>