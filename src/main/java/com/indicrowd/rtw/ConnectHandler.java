package com.indicrowd.rtw;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.vertx.java.core.Handler;
import org.vertx.java.core.buffer.Buffer;
import org.vertx.java.core.json.JsonObject;
import org.vertx.java.core.sockjs.SockJSSocket;

import com.indicrowd.user.model.UserInfo;

public class ConnectHandler implements Handler<Buffer> {

	private RTWService service;
	private SockJSSocket sock;

	public ConnectHandler(RTWService service, SockJSSocket sock) {
		this.service = service;
		this.sock = sock;
	}

	@Override
	public void handle(Buffer buffer) {

		String connectId = sock.writeHandlerID;

		JsonObject json = new JsonObject(buffer.toString());
		String namespace = json.getString("namespace");
		String id = json.getString("id");

		Long userId = null;
		UserInfo userInfo = null;

		if (json.getString("userId") != null) {

			if (!json.getString("userId").equals("")) {
				userId = Long.parseLong(json.getString("userId"));
				userInfo = UserInfo.findUserInfo(userId);
			}

			if (service.getConnectedUserInfos().get(namespace) == null) {
				service.getConnectedUserInfos().put(namespace, new HashMap<String, Map<String, UserInfo>>());
			}
			if (service.getConnectedUserInfos().get(namespace).get(id) == null) {
				service.getConnectedUserInfos().get(namespace).put(id, new HashMap<String, UserInfo>());
			}
			service.getConnectedUserInfos().get(namespace).get(id).put(connectId, userInfo);
		}

		Map<String, Set<SockJSSocket>> map = service.getSockets().get(namespace);
		if (map == null) {
			map = new HashMap<String, Set<SockJSSocket>>();
			service.getSockets().put(namespace, map);
		}
		Set<SockJSSocket> sockets = map.get(id);
		if (sockets == null) {
			sockets = new HashSet<SockJSSocket>();
			map.put(id, sockets);
		}
		sockets.add(sock);

		Connect connect = new Connect();
		connect.setConnectId(connectId);
		connect.setNamespace(namespace);
		connect.setId(id);
		connect.setConnectId(connectId);
		connect.setUserInfo(userInfo);
		connect.setCount(sockets.size());
		connect.setConnectDate(new Date());

		service.send(namespace, id, "connect", connect);
	}

}
