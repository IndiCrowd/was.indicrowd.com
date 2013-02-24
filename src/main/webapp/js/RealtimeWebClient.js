/**
 * @author 심영재
 */

RealtimeWebClient = {};

RealtimeWebClient.sock = undefined;
RealtimeWebClient.connected = false;
RealtimeWebClient.connectId = undefined;
RealtimeWebClient.connectedUserInfos = undefined;
RealtimeWebClient.readyJoins = [];
RealtimeWebClient.handlers = {};
RealtimeWebClient.connectHandlers = {};

RealtimeWebClient.addConnectHandler = function(namespace, id, handler) {
	if (RealtimeWebClient.connectHandlers[namespace] == undefined) {
		RealtimeWebClient.connectHandlers[namespace] = {};
	}
	if (RealtimeWebClient.connectHandlers[namespace][id] == undefined) {
		RealtimeWebClient.connectHandlers[namespace][id] = [];
	}
	RealtimeWebClient.connectHandlers[namespace][id].push(handler);
};

RealtimeWebClient.init = function(sock) {
	sock.onopen = function() {

		RealtimeWebClient.sock = sock;
		RealtimeWebClient.connected = true;

		if (window.console !== undefined && console.log !== undefined) {
			console.log('=== RealtimeWeb Server에 접속되었습니다. ===');
		}

		for ( var i in RealtimeWebClient.readyJoins) {
			RealtimeWebClient.send(RealtimeWebClient.readyJoins[i]);
		}
	};

	// 등록된 핸들러 실행
	sock.onmessage = function(e) {
		var data = JSON.parse(e.data);

		if (data.isMe === true) {
			RealtimeWebClient.connectId = data.connectId;
			RealtimeWebClient.connectedUserInfos = data.connectedUserInfos;

			for ( var namespace in RealtimeWebClient.connectedUserInfos) {
				var connectedUserInfos = RealtimeWebClient.connectedUserInfos[namespace];
				for ( var id in connectedUserInfos) {
					if (RealtimeWebClient.connectHandlers[namespace] != undefined) {
						if (RealtimeWebClient.connectHandlers[namespace][id] != undefined) {
							for ( var i = 0; i < RealtimeWebClient.connectHandlers[namespace][id].length; i++) {
								RealtimeWebClient.connectHandlers[namespace][id][i](connectedUserInfos[id]);
							}
						}
					}
				}
			}
		} else {

			var namespace = data.namespace;
			var id = data.id;
			var handlerName = data.handlerName;
			var object = data.object;

			if (RealtimeWebClient.handlers[namespace] != undefined) {
				if (RealtimeWebClient.handlers[namespace][id] != undefined) {
					if (RealtimeWebClient.handlers[namespace][id][handlerName] != undefined) {
						for ( var i = 0; i < RealtimeWebClient.handlers[namespace][id][handlerName].length; i++) {
							RealtimeWebClient.handlers[namespace][id][handlerName][i](object);
						}
					}
				}
			}
		}
	};
};

RealtimeWebClient.send = function(data) {
	if (RealtimeWebClient.connected) {
		RealtimeWebClient.sock.send(JSON.stringify(data));
	}
};

RealtimeWebClient.join = function(namespace, id, connectHandler, disconnectHandler) {
	var d = {
		namespace : namespace,
		id : id,
		userId : USER_ID
	};

	if (RealtimeWebClient.connected) {
		RealtimeWebClient.send(d);
	} else {
		RealtimeWebClient.readyJoins.push(d);
	}

	RealtimeWebClient.addHandler(namespace, id, 'connect', function(data) {
		if (RealtimeWebClient.connectedUserInfos[data.namespace] === undefined) {
			RealtimeWebClient.connectedUserInfos[data.namespace] = {};
		}
		if (RealtimeWebClient.connectedUserInfos[data.namespace][data.id] === undefined) {
			RealtimeWebClient.connectedUserInfos[data.namespace][data.id] = {};
		}
		RealtimeWebClient.connectedUserInfos[data.namespace][data.id][data.connectId] = data.userInfo;
		if (connectHandler !== undefined) {
			connectHandler(data);
		}
	});

	RealtimeWebClient.addHandler(namespace, id, 'disconnect', function(data) {
		delete RealtimeWebClient.connectedUserInfos[data.namespace][data.id][data.connectId];
		if (disconnectHandler !== undefined) {
			disconnectHandler(data);
		}
	});
};

// 핸들러 등록
RealtimeWebClient.addHandler = function(namespace, id, handlerName, handler) {
	if (RealtimeWebClient.handlers[namespace] == undefined) {
		RealtimeWebClient.handlers[namespace] = {};
	}
	if (RealtimeWebClient.handlers[namespace][id] == undefined) {
		RealtimeWebClient.handlers[namespace][id] = {};
	}
	if (RealtimeWebClient.handlers[namespace][id][handlerName] === undefined) {
		RealtimeWebClient.handlers[namespace][id][handlerName] = [];
	}
	RealtimeWebClient.handlers[namespace][id][handlerName].push(handler);
};
