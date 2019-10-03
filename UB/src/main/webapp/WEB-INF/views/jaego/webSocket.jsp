<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML</title>
</head>
<body>

<script type="text/javascript">
		var wsUri = "ws://localhost:8080/UntitledBistro/websocket/echo.do";

	    function init() {
			console.log("결과 : 111111111111111111111111111");
	        output = document.getElementById("output");
	
	    }
	
	    function send_message() {
	    	console.log("결과 : 222222222222222222222222222");
	        websocket = new WebSocket(wsUri);
	
	        websocket.onopen = function(evt) {
	        	console.log("결과 : 33333333333333333333333");
	            onOpen(evt)
	
	        };
	
	        websocket.onmessage = function(evt) {
	        	console.log("결과 : 44444444444444444444444");
	            onMessage(evt)
	
	        };
	
	        websocket.onerror = function(evt) {
	        	console.log("결과 : 55555555555555555555555");
	            onError(evt)
	
	        };
	
	    }
	
	    function onOpen(evt) {
	    	console.log("결과 : 666666666666666666666666666");
	        writeToScreen("Connected to Endpoint!");
	
	        doSend(textID.value);
	
	    }
	
	    function onMessage(evt) {
	    	console.log("결과 : 777777777777777777777777777");
	        writeToScreen("Message Received: " + evt.data);
	
	    }
	
	    function onError(evt) {
	    	console.log("결과 : 888888888888888888888888888");
	        writeToScreen('ERROR: ' + evt.data);
	
	    }
	
	    function doSend(message) {
	    	console.log("결과 : 999999999999999999999999999");
	        //writeToScreen("Message Sent: " + message);
	
	        websocket.send(message);
	        document.getElementById("textID").value = "";
	        //websocket.close();
	
	    }
	
	    function writeToScreen(message) {
	    	console.log("결과 : 1010101010101010101010101010");
	        var pre = document.createElement("p");
	
	        pre.style.wordWrap = "break-word";
	
	        pre.innerHTML = message;
	
	        
	
	        output.appendChild(pre);
			
	    }
	
	    window.addEventListener("load", init, false);
	
	</script>
	
	<h1 style="text-align: center;">Hello World WebSocket Client</h1>
	
	<br>
	
	<div style="text-align: center;">
	
	    <form action="">
	
	        <input onclick="send_message()" value="Send" type="button">
	
	        <input id="textID" name="message" value="Hello WebSocket!" type="text"><br>
	
	    </form>
	
	</div>
	
	<div id="output"></div>

</body>
</html>