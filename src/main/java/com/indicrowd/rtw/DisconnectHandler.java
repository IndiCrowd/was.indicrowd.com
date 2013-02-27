package com.indicrowd.rtw;

import java.util.Date;
import java.util.Map;
import java.util.Set;

import org.vertx.java.core.Handler;
import org.vertx.java.core.sockjs.SockJSSocket;

public class DisconnectHandler implements Handler<Void> {

	private RTWService service;
	private SockJSSocket sock;

	public DisconnectHandler(RTWService service, SockJSSocket sock) {
		this.service = service;
		this.sock = sock;
	}

	@Override
	public void handle(Void v) {

		String connectId = sock.writeHandlerID;

		for (String namespace : service.getSockets().keySet()) {
			Map<String, Set<SockJSSocket>> map = service.getSockets().get(namespace);
			if (map != null) {
				for (String id : map.keySet()) {
					Set<SockJSSocket> sockets = map.get(id);
					if (sockets != null) {
						for (SockJSSocket _sock : sockets) {
							if (_sock.equals(sock)) {
								sockets.remove(sock);

								Disconnect disconnect = new Disconnect();
								disconnect.setConnectId(connectId);
								disconnect.setNamespace(namespace);
								disconnect.setId(id);
								disconnect.setUserInfo(service.getConnectedUserInfos().get(namespace).get(id).get(connectId));
								disconnect.setCount(sockets.size());
								disconnect.setDisconnectDate(new Date());

								service.send(namespace, id, "disconnect", disconnect);

								service.getConnectedUserInfos().get(namespace).get(id).remove(connectId);

								if (sockets.size() == 0) {
									map.remove(sockets);
									if (map.size() == 0) {
										service.getSockets().remove(map);
									}
								}

								break;
							}
						}
					}
				}
			}
		}

	}

}
