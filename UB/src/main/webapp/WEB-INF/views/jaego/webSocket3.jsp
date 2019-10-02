<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>에코</title>
<!-- <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    
    $(document).ready(function() {
        $('#sendBtn').click(function() { sendMessage(); });
    });
    
    var wsocket;
    function sendMessage() {

 /*
        WebSocket WebSocket(
        in DOMString url,
        in optional DOMString protocols
        );

        or

        WebSocket WebSocket(
        in DOMString url,
        in optional DOMString[] protocols
        );
        url
        연결할 URL 주소.
        웹소켓 서버가 응답할 수 있는 위치의 주소이여야 함.

        protocols Optional(옵셔널 파라미터)
        단일 프로토콜 문자열, 또는 프로토콜 문자열의 배열.
        이 문자열들은 서브 프로토콜을 지정하는데 사용.
        
        이를 통해 하나의 웹소켓 서버가 여러개의 웹 소켓 서브 프로토콜을 구현 하도록 해준다.
        (예를 들어, 하나의 서버가 두 개 이상의 커뮤니케이션 방식을 가지고 싶도록 하고 싶을 때)

        만약 지정하지 않으면 빈 문자열을 넣은 것으로 간주된다.
        이 생성자는 예외가 발생할 수 있다.
        */
        wsocket = new WebSocket("ws://localhost:8080/UntitledBistro/echo-ws");
        
        /* The onmessage property of the WindowEventHandlers is
           the EventHandler called whenever an object receives a message event. */ 
        wsocket.onmessage = onMessage;
    
        /* WebSocket 인터페이스의 연결상태가 readyState 에서CLOSED 로
           바뀌었을 때 호출되는 이벤트 리스너이다.
           이 이벤트 리스너는 "close"라는 이름의 CloseEvent를 받습니다.*/
        wsocket.onclose = onClose;
        
        /* WebSocket 인터페이스의 연결상태가 readyState 에서 OPEN으로 바뀌었을 때\
    호출되는 이벤트 리스너.
           연결 상태가 OPEN으로 바뀌었다는 말은 데이터를 주고 받을 준비가 되었다는 뜻.
           이 리스너가 처리하는 이벤트는 "open"이라는 이벤트 하나. */
        wsocket.onopen = function() {
        	console.log("111111111111111111111");
            wsocket.send( $("#message").val() );
        };
    }
    
    
    function onMessage(evt) {
        var data = evt.data;
        alert("서버에서 데이터 받음: " + data);
        wsocket.close();
    }
    
    
    function onClose(evt) {
        alert("연결 끊김");
    }
</script>
</head>
<body>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>