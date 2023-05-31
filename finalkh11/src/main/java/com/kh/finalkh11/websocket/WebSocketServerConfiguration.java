package com.kh.finalkh11.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

//웹소켓 사용 설정 파일
@Configuration
@EnableWebSocket//웹소켓 사용 설정 활성화
public class WebSocketServerConfiguration implements WebSocketConfigurer {
	
	@Autowired
	private BasicWebsocketServer basicWebsocketServer;
	
	@Autowired
	private FreeWebSocketServer freeWebSocketServer;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		//만들어둔 웹소켓 서버를 등록하는 코드를 작성
		//- 어떠한 주소와도 겹치면 안된다(HTTP 포함)
		
		//BasicWebsocketServer를 
		//ws://localhost:8080/ws/basic 주소에서 사용하겠습니다
		registry.addHandler(basicWebsocketServer, "/ws/basic");
		registry.addHandler(freeWebSocketServer, "/ws/free")
		.addInterceptors(new HttpSessionHandshakeInterceptor())
		.withSockJS();
		
		
	}
	
}
