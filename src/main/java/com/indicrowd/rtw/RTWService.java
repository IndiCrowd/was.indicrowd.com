package com.indicrowd.rtw;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.buffer.Buffer;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;
import org.vertx.java.core.sockjs.SockJSServer;
import org.vertx.java.core.sockjs.SockJSSocket;

import com.indicrowd.XStreamJsonSingleton;
import com.indicrowd.user.model.UserInfo;
import com.thoughtworks.xstream.XStream;

@Service
public class RTWService {

	private static final int PORT = 9190;

	private XStream xstream = XStreamJsonSingleton.getInstance();

	private Map<String, Map<String, Set<SockJSSocket>>> sockets = new HashMap<String, Map<String, Set<SockJSSocket>>>();
	private Map<String, Map<String, Map<String, UserInfo>>> connectedUserInfos = new HashMap<String, Map<String, Map<String, UserInfo>>>();

	public RTWService() {
		
		xstream.setMode(XStream.ID_REFERENCES);
		
		Vertx vertx = Vertx.newVertx();
		HttpServer server = vertx.createHttpServer();
		SockJSServer sockJSServer = vertx.createSockJSServer(server);
		JsonObject config = new JsonObject().putString("prefix", "/r");
		sockJSServer.installApp(config, new ServerHandler(this));
		server.listen(PORT);
		System.out.println("Starting RTW [\"rtw-" + PORT + "\"]");
	}

	public boolean send(String namespace, Object _id, String handlerName, Object object) {

		String id = _id.toString();
		
		if (sockets.get(namespace) != null && sockets.get(namespace).get(id) != null) {

			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("namespace", namespace);
			data.put("id", id);
			data.put("handlerName", handlerName);
			data.put("object", object);
			
			String json = xstream.toXML(data);
			for (SockJSSocket sock : sockets.get(namespace).get(id)) {
				sock.writeBuffer(new Buffer(json));
			}
			return true;
		}
		return false;
	}

	public Map<String, Map<String, Set<SockJSSocket>>> getSockets() {
		return sockets;
	}

	public Map<String, Map<String, Map<String, UserInfo>>> getConnectedUserInfos() {
		return connectedUserInfos;
	}

}
