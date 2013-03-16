function completeObjectReference(o) {

	var f1 = function(o) {
		var to = {};
		for ( var i in o) {
			if (Object.prototype.toString.call(o[i]) === '[object Array]' && o[i][0] === '@map') {

				var name = o[i][1];
				var value = o[i][2];

				if (typeof value === 'object') {
					to[name] = f1(value);
				} else {
					to[name] = value;
				}
			} else {
				to[i] = o[i];
			}
		}
		return to;
	};
	o = f1(o);

	var keyMap = {};
	var f2 = function(o) {
		if (o['@id'] !== undefined) {
			keyMap[o['@id']] = o;
			delete o['@id'];
		} else if (o['@reference'] !== undefined) {
			return keyMap[o['@reference']];
		}
		for ( var i in o) {
			if (typeof o[i] === 'object') {
				o[i] = f2(o[i]);
			}
		}
		return o;
	};
	return f2(o);
}

function GET(url, po, f) {

	if (f === undefined && typeof po === 'function') {
		f = po;
		po = {};
	}

	$.get(url, po, function(data) {
		if (f !== undefined) {
			f(completeObjectReference(data.command));
		}
	}, 'json');
}

function POST(url, po, f) {

	if (f === undefined && typeof po === 'function') {
		f = po;
		po = {};
	}

	$.post(url, po, function(data) {
		if (f !== undefined) {
			f(completeObjectReference(data.command));
		}
	}, 'json');
}

function PUT(url, po, f) {

	if (f === undefined && typeof po === 'function') {
		f = po;
		po = {};
	}

	$.ajax({
		type : 'PUT',
		url : url,
		data : po,
		dataType : 'json',
		success : function(data) {
			if (f !== undefined) {
				f(completeObjectReference(data.command));
			}
		}
	});
}

function DEL(url, po, f) {

	if (f === undefined && typeof po === 'function') {
		f = po;
		po = {};
	}

	$.ajax({
		type : 'DELETE',
		url : url,
		data : po,
		dataType : 'json',
		success : function(data) {
			if (f !== undefined) {
				f(completeObjectReference(data.command));
			}
		}
	});
}

function randomString(length) {
	var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'.split('');

	if (!length) {
		length = Math.floor(Math.random() * chars.length);
	}

	var str = '';
	for ( var i = 0; i < length; i++) {
		str += chars[Math.floor(Math.random() * chars.length)];
	}
	return str;
}

function userDisplayName(userInfo) {
	if (!userInfo.socialUser) {
		return userInfo.nickname;
	} else {
		return userInfo.socialDisplayName;
	}
}

function userProfilePhoto(userInfo) {
	if (!userInfo.socialUser) {
		return USER_FILE_BASE_URL + '/profilethumb/' + userInfo.id;
	} else {
		return userInfo.socialImageUrl;
	}
}
