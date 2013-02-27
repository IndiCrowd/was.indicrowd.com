/**
 * @author 심영재
 */

RTW = {};

RTW.sock = undefined;
RTW.connected = false;
RTW.connectId = undefined;
RTW.connectedUserInfos = undefined;
RTW.readyJoins = [];
RTW.handlers = {};
RTW.connectHandlers = {};

RTW.addConnectHandler = function(namespace, id, handler) {
	if (RTW.connectHandlers[namespace] == undefined) {
		RTW.connectHandlers[namespace] = {};
	}
	if (RTW.connectHandlers[namespace][id] == undefined) {
		RTW.connectHandlers[namespace][id] = [];
	}
	RTW.connectHandlers[namespace][id].push(handler);
};

RTW.init = function(sock) {
	sock.onopen = function() {

		RTW.sock = sock;
		RTW.connected = true;

		for ( var i in RTW.readyJoins) {
			RTW.send(RTW.readyJoins[i]);
		}
	};

	// 등록된 핸들러 실행
	sock.onmessage = function(e) {
		var data = JSON.parse(e.data);

		if (data.connectId !== undefined && data.connectedUserInfos !== undefined) {
			RTW.connectId = data.connectId;
			RTW.connectedUserInfos = data.connectedUserInfos;

			for ( var namespace in RTW.connectedUserInfos) {
				var connectedUserInfos = RTW.connectedUserInfos[namespace];
				for ( var id in connectedUserInfos) {
					if (RTW.connectHandlers[namespace] != undefined) {
						if (RTW.connectHandlers[namespace][id] != undefined) {
							for ( var i = 0; i < RTW.connectHandlers[namespace][id].length; i++) {
								RTW.connectHandlers[namespace][id][i](connectedUserInfos[id]);
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

			if (RTW.handlers[namespace] != undefined) {
				if (RTW.handlers[namespace][id] != undefined) {
					if (RTW.handlers[namespace][id][handlerName] != undefined) {
						for ( var i = 0; i < RTW.handlers[namespace][id][handlerName].length; i++) {
							RTW.handlers[namespace][id][handlerName][i](object);
						}
					}
				}
			}
		}
	};
};

RTW.send = function(data) {
	if (RTW.connected) {
		RTW.sock.send(JSON.stringify(data));
	}
};

RTW.join = function(namespace, id, connectHandler, disconnectHandler) {
	if(USER_ID == undefined){
		USER_ID = "";
	}
	var d = {
		namespace : namespace,
		id : id,
		userId : USER_ID
	};

	if (RTW.connected) {
		RTW.send(d);
	} else {
		RTW.readyJoins.push(d);
	}

	RTW.addHandler(namespace, id, 'connect', function(data) {
		if (RTW.connectedUserInfos[data.namespace] === undefined) {
			RTW.connectedUserInfos[data.namespace] = {};
		}
		if (RTW.connectedUserInfos[data.namespace][data.id] === undefined) {
			RTW.connectedUserInfos[data.namespace][data.id] = {};
		}
		RTW.connectedUserInfos[data.namespace][data.id][data.connectId] = data.userInfo;
		if (connectHandler !== undefined) {
			connectHandler(data);
		}
	});

	RTW.addHandler(namespace, id, 'disconnect', function(data) {
		delete RTW.connectedUserInfos[data.namespace][data.id][data.connectId];
		if (disconnectHandler !== undefined) {
			disconnectHandler(data);
		}
	});
};

// 핸들러 등록
RTW.addHandler = function(namespace, id, handlerName, handler) {
	if (RTW.handlers[namespace] == undefined) {
		RTW.handlers[namespace] = {};
	}
	if (RTW.handlers[namespace][id] == undefined) {
		RTW.handlers[namespace][id] = {};
	}
	if (RTW.handlers[namespace][id][handlerName] === undefined) {
		RTW.handlers[namespace][id][handlerName] = [];
	}
	RTW.handlers[namespace][id][handlerName].push(handler);
};
