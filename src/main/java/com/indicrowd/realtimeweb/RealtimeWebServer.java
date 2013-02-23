package com.indicrowd.realtimeweb;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Component;
import org.vertx.java.core.Handler;
import org.vertx.java.core.SimpleHandler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.buffer.Buffer;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;
import org.vertx.java.core.sockjs.SockJSServer;
import org.vertx.java.core.sockjs.SockJSSocket;

import com.indicrowd.user.model.UserInfo;

/**
 * @author 심영재
 */
@Component
public class RealtimeWebServer {

	private static final HashMap<String, HashMap<String, List<SockJSSocket>>> SOCKET_MAP = new HashMap<String, HashMap<String, List<SockJSSocket>>>();
	private static final int PORT = 9090;

	private static Map<String, Map<String, Map<String, UserInfo>>> connectedUserInfos = new HashMap<String, Map<String, Map<String, UserInfo>>>();

	static {

		Vertx vertx = Vertx.newVertx();
		HttpServer server = vertx.createHttpServer();
		SockJSServer sockJSServer = vertx.createSockJSServer(server);
		JsonObject config = new JsonObject().putString("prefix", "/r");

		sockJSServer.installApp(config, new Handler<SockJSSocket>() {

			private String connectId;

			@Override
			public void handle(final SockJSSocket sock) {

				sendConnectIdToMe(sock);

				// 접속
				sock.dataHandler(new Handler<Buffer>() {
					public void handle(Buffer buffer) {

						connectId = sock.writeHandlerID;

						JsonObject json = new JsonObject(buffer.toString());
						String namespace = json.getString("namespace");
						String id = json.getString("id");
						Long userId = null;
						UserInfo userInfo = null;

						if (json.getString("userId") != null) {
							userId = Long.parseLong(json.getString("userId"));
							userInfo = UserInfo.findUserInfo(userId);
							
							if (connectedUserInfos.get("namespace") == null) {
								connectedUserInfos.put(namespace, new HashMap<String, Map<String, UserInfo>>());
							}
							if (connectedUserInfos.get("namespace").get("id") == null) {
								connectedUserInfos.get("namespace").put(id, new HashMap<String, UserInfo>());
							}
							connectedUserInfos.get("namespace").get("id").put(connectId, userInfo);
						}

						HashMap<String, List<SockJSSocket>> map = SOCKET_MAP.get(namespace);
						if (map == null) {
							map = new HashMap<String, List<SockJSSocket>>();
							SOCKET_MAP.put(namespace, map);
						}
						List<SockJSSocket> sockets = map.get(id);
						if (sockets == null) {
							sockets = new ArrayList<SockJSSocket>();
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

						send(namespace, id, "connect", connect);

						System.out.println("=== RealtimeWeb Server Connected(" + namespace + "." + id + ":" + sock + ") ===");

					}
				});

				// 연결 해제
				sock.endHandler(new Handler<Void>() {
					@Override
					public void handle(Void v) {

						for (String namespace : SOCKET_MAP.keySet()) {
							HashMap<String, List<SockJSSocket>> map = SOCKET_MAP.get(namespace);
							if (map != null) {
								for (String id : map.keySet()) {
									List<SockJSSocket> sockets = map.get(id);
									if (sockets != null) {
										for (SockJSSocket _sock : sockets) {
											if (_sock.equals(sock)) {
												sockets.remove(sock);

												Disconnect disconnect = new Disconnect();
												disconnect.setConnectId(connectId);
												disconnect.setNamespace(namespace);
												disconnect.setId(id);
												disconnect.setUserInfo(connectedUserInfos.get("namespace").get("id").get(connectId));
												disconnect.setCount(sockets.size());
												disconnect.setDisconnectDate(new Date());

												send(namespace, id, "disconnect", disconnect);

												connectedUserInfos.get("namespace").get("id").remove(connectId);

												System.out.println("=== RealtimeWeb Server Disconnected(" + namespace + "." + id + ":" + sock + ") ===");

												if (sockets.size() == 0) {
													map.remove(sockets);
													if (map.size() == 0) {
														SOCKET_MAP.remove(map);
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
				});
			}
		});
		server.listen(PORT);

		System.out.println("=== RealtimeWeb Server Running...(port:" + PORT + ") ===");

	}

	private static final ObjectMapper mapper = new ObjectMapper();

	private static void sendConnectIdToMe(final SockJSSocket sock) {

		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("isMe", true);
		data.put("connectId", sock.writeHandlerID);
		data.put("connectedUserInfos", connectedUserInfos);

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
			sock.drainHandler(new SimpleHandler() {
				public void handle() {
					sock.resume();
				}
			});
		}
	}

	public static boolean send(String namespace, Object _id, String handlerName, Object object) {

		String id = _id.toString();

		if (SOCKET_MAP.get(namespace) != null && SOCKET_MAP.get(namespace).get(id) != null) {

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

			for (final SockJSSocket sock : SOCKET_MAP.get(namespace).get(id)) {
				if (!sock.writeQueueFull()) {
					sock.writeBuffer(new Buffer(json));
				} else {
					sock.pause();
					sock.drainHandler(new SimpleHandler() {
						public void handle() {
							sock.resume();
						}
					});
				}
			}
			return true;
		}
		return false;
	}

}
