package com.bit.UntitledBistro.model.jaego.websocket;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {

	private static final Logger logger = LoggerFactory.getLogger(SocketHandler.class);

    private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

    public SocketHandler (){
		super();
		logger.info("결과 : 111111111111111111111111111111111111111111111111111111");
		
		this.logger.info("create SocketHandler instance!");

    }

    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);
		logger.info("결과 : 2222222222222222222222222222222222222222222222222");
		sessionSet.remove(session);
		
		this.logger.info("remove session!");

    }

//  33333333333333333333333333333333333333333333333333333333333  
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		super.afterConnectionEstablished(session);
		sessionSet.add(session);
		logger.info("결과 : 333333333333333333333333333333333333333333333");
		logger.info("결과3 : " + session);
		logger.info("결과33 : " + sessionSet);
		
		this.logger.info("add session!");

    }

//  444444444444444444444444444444444444444444444444444444444444444  
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
    	
		super.handleMessage(session, message);
		logger.info("결과 : 4444444444444444444444444444444444444444444444444");
		this.logger.info("receive message:"+message.toString());
		sendMessage(message.toString());

    }


    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
    	logger.info("결과 : 55555555555555555555555555555555555555555555");
    	this.logger.error("web socket error!", exception);

    }


//	111111111111111111111111111111111111111111111111111111111
    @Override
    public boolean supportsPartialMessages() {
    	logger.info("결과 : 6666666666666666666666666666666666666666666666666666666666");
		this.logger.info("call method!");
		 
		return super.supportsPartialMessages();

    }


    public void sendMessage (String message){
    	logger.info("결과 : 7777777777777777777777777777777777777777777777");
		for (WebSocketSession session: this.sessionSet){
		
			if (session.isOpen()){
			
				try{
					
					session.sendMessage(new TextMessage(message));
					
				}catch (Exception ignored){
					
					this.logger.error("fail to send message!", ignored);
					
				} // try end
			
			} // if end
		
		} // for end

    } // sendMessage end



	@Override
	public void afterPropertiesSet() throws Exception {
		logger.info("결과 : 888888888888888888888888888888888888888888");
//		Thread thread = new Thread() {
//
//			int i = 0;
//
//			@Override
//			public void run() {
//
//				while (true) {
//
//					try {
//
//						sendMessage("send message index " + i++);
//
//						Thread.sleep(1000);
//
//					} catch (InterruptedException e) {
//
//						e.printStackTrace();
//
//						break;
//
//					}
//
//				}
//
//			}
//
//		};
//
//		thread.start();

	}

}
