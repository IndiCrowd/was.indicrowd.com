package com.indicrowd.rtw;

import org.vertx.java.core.SimpleHandler;
import org.vertx.java.core.sockjs.SockJSSocket;

public class ResumHandler extends SimpleHandler {

	private SockJSSocket sock;

	public ResumHandler(SockJSSocket sock) {
		this.sock = sock;
	}

	@Override
	protected void handle() {
		sock.resume();
	}

}
