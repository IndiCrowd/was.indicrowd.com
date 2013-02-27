package com.indicrowd.rtw;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;

import org.codehaus.jackson.map.ObjectMapper;
import org.vertx.java.core.Handler;
import org.vertx.java.core.buffer.Buffer;
import org.vertx.java.core.sockjs.SockJSSocket;

public class ServerHandler implements Handler<SockJSSocket> {

	private static final ObjectMapper mapper = new ObjectMapper();

	private RTWService service;

	public ServerHandler(RTWService service) {
		this.service = service;
	}

	@Override
	public void handle(SockJSSocket sock) {

		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("connectId", sock.writeHandlerID);
		data.put("connectedUserInfos", service.getConnectedUserInfos());

		StringWriter writer = new StringWriter();
		try {
			mapper.writeValue(writer, data);
		} catch (IOException e) {
			e.printStackTrace();
		}

		String json = writer.toString();
		if (!sock.writeQueueFull()) {
			sock.writeBuffer(new Buffer(json));
		} else {
			sock.pause();
			sock.drainHandler(new ResumHandler(sock));
		}

		// 접속
		sock.dataHandler(new ConnectHandler(service, sock));

		// 연결 해제
		sock.endHandler(new DisconnectHandler(service, sock));
	}

}
