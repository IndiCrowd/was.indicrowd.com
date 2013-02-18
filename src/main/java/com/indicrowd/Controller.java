package com.indicrowd;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.indicrowd.realtimeweb.ConnectUser;
import com.indicrowd.realtimeweb.RealtimeWebServer;

@org.springframework.stereotype.Controller
public class Controller extends AbstractController {

	static private Map<String, Long> connectedUserIds = new HashMap<String, Long>();

	static public Map<String, Long> getConnectedUserIds() {
		return connectedUserIds;
	}

	@RequestMapping("/signin")
	public void signin() {
	}

	@RequestMapping("/")
	public String main() {
		return "main";
	}

	@RequestMapping("/__/realtimeweb/connect")
	public void __connect(@RequestParam String namespace, @RequestParam String id, @RequestParam String connectId) {

		ConnectUser connectUser = new ConnectUser();
		connectUser.setConnectId(connectId);

		if (authService.isAuthenticated()) {
			Long userId = authService.getUserId();
			connectedUserIds.put(connectId, userId);
			connectUser.setUserId(userId);
		}

		RealtimeWebServer.send(namespace, id, "connect_user", connectUser);
	}

	@RequestMapping("/band/home")
	public String bandHome() {
		return "band/home";
	}

	@RequestMapping("/jwp")
	public String jwp() {
		return "jwp";
	}

}
