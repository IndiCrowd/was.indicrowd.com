package com.indicrowd.rtw;

import java.util.HashMap;

import org.vertx.java.core.Handler;
import org.vertx.java.core.buffer.Buffer;
import org.vertx.java.core.sockjs.SockJSSocket;

import com.indicrowd.XStreamJsonSingleton;
import com.thoughtworks.xstream.XStream;

public class ServerHandler implements Handler<SockJSSocket> {

	private XStream xstream = XStreamJsonSingleton.getInstance();
	private RTWService service;

	public ServerHandler(RTWService service) {
		
		xstream.setMode(XStream.ID_REFERENCES);
		
		this.service = service;
	}

	@Override
	public void handle(SockJSSocket sock) {

		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("connectId", sock.writeHandlerID);
		data.put("connectedUserInfos", service.getConnectedUserInfos());

		sock.writeBuffer(new Buffer(xstream.toXML(data)));

		// 접속
		sock.dataHandler(new ConnectHandler(service, sock));

		// 연결 해제
		sock.endHandler(new DisconnectHandler(service, sock));
	}

}
