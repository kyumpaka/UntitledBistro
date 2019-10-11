package com.bit.UntitledBistro.model.jaego.websocket;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class RealTimeWebSocketHandler extends TextWebSocketHandler{

	private static final Logger logger = LoggerFactory.getLogger(RealTimeWebSocketHandler.class);
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>(); 
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("웹소켓 " + session.getId() + " 연결");
		users.put(session.getId(), session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("웹소켓 " + session.getId() + "로부터 " + message.getPayload() + "의 메시지 받음");
		for(WebSocketSession ws : users.values()) {
			logger.info("웹소켓 유저들 : " + ws.getId()); 
			ws.sendMessage(message);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("웹소켓 " + session.getId() + " 닫음");
		users.remove(session.getId());
	}
	
}
