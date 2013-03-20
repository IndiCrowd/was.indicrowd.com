<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TEST</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		
		<script>
		
		$(function() {	
			
			RTW.addHandler('Concert', '${command.id}', 'userState', function(userState) {
				var userImg = '<c:url value="/img/concert/" />profile4.jpg';
				
				$('#user-' + userState.userID).each(function() {
					if (userState.cameraState) {
						openStreamUser(userState.userID, userImg);
					} else {
						var img = $IMG({
							id : 'user-' + userState.userID,
							src: userImg
						});
						
						$(this).replaceWith(img).hide().fadeIn();
					}
				});
				
			});
			
			var openStreamUser = function(userId, userImg)
			{			
				// open the flash Stream User
				var replaceId = 'user-' + userId;
		        var flashvars = {};
				flashvars.clientStreamStr = userId;
				flashvars.clientDefaultImage = userImg;
				
		        var params = {};
		        params.quality = 'high';
		        params.allowscriptaccess = 'sameDomain';
		        params.allowfullscreen = 'true';
		        
		        var attributes = {};
		        attributes.id = replaceId;
		        attributes.align = 'middle';
		        
		        var res = swfobject.embedSWF(
		            '<c:url value="/swf/StreamUser.swf" />', replaceId, 
		            '100', '100', 
		            swfVersionStr, xiSwfUrlStr, 
		            flashvars, params, attributes);
		        
		        return $('#'+replaceId);
			};
			
			
			var openStreamPublisher = function() {
		        var flashvars = {};
		        flashvars.pubStreamStr = '${command.id}';
		        
		        var params = {};
		        params.quality = 'high';
	            params.bgcolor = 'transparent';
		        params.allowscriptaccess = 'sameDomain';
		        params.allowfullscreen = 'true';
		        
		        var attributes = {};
		        attributes.id = 'StreamPublisher';
		        attributes.align = 'middle';

		        swfobject.embedSWF(
		            '<c:url value="/swf/StreamPublisher.swf" />', 'StreamPublisher', 
		            '480', '360', 
		            swfVersionStr, xiSwfUrlStr, 
		            flashvars, params, attributes);
		        
		        return $('#StreamPublisher');
			};

			openStreamPublisher();
			
			
		});
		
		function resizeStreamPublisher(width, height)
		{
			$('#StreamPublisher').width(width);
			$('#StreamPublisher').height(height);
		}
		
		</script>
	</head>
	
	<body>
		
		<div id="StreamPublisher"></div>
					
	</body>
</html>
