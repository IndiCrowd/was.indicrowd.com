package com.indicrowd.rtw;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.buffer.Buffer;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;
import org.vertx.java.core.sockjs.SockJSServer;
import org.vertx.java.core.sockjs.SockJSSocket;

import com.indicrowd.user.model.UserInfo;

@Service
public class RTWService {

	private static final ObjectMapper mapper = new ObjectMapper();

	private Map<String, Map<String, Set<SockJSSocket>>> sockets = new HashMap<String, Map<String, Set<SockJSSocket>>>();
	private Map<String, Map<String, Map<String, UserInfo>>> connectedUserInfos = new HashMap<String, Map<String, Map<String, UserInfo>>>();

	@Autowired
	private Properties rtwConfig;

	public RTWService() {
		Vertx vertx = Vertx.newVertx();
		HttpServer server = vertx.createHttpServer();
		SockJSServer sockJSServer = vertx.createSockJSServer(server);
		JsonObject config = new JsonObject().putString("prefix", "/r");
		sockJSServer.installApp(config, new ServerHandler(this));
		server.listen(Integer.parseInt(rtwConfig.getProperty("port")));
	}

	public boolean send(String namespace, Object _id, String handlerName, Object object) {

		String id = _id.toString();

		if (sockets.get(namespace) != null && sockets.get(namespace).get(id) != null) {

			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("namespace", namespace);
			data.put("id", id);
			data.put("handlerName", handlerName);
			data.put("object", object);

			StringWriter writer = new StringWriter();
			try {
				mapper.writeValue(writer, data);
			} catch (IOException e) {
				e.printStackTrace();
			}

			String json = writer.toString();
			for (SockJSSocket sock : sockets.get(namespace).get(id)) {
				if (!sock.writeQueueFull()) {
					sock.writeBuffer(new Buffer(json));
				} else {
					sock.pause();
					sock.drainHandler(new ResumHandler(sock));
				}
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
