<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>${command.title}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		
		<script>
		
		$(function() {	
			
			RTW.addHandler('Concert', '${command.id}', 'userState', function(userState) {
				var userImg = userState.userInfo.socialImageUrl ? userState.userInfo.socialImageUrl : '<spring:eval expression="@userfileConfig.baseUrl" />/profilephoto/' + userState.userInfo.id;
				
				$('#user-' + userState.userID).each(function() {
					if (userState.cameraState) {
						openStreamUser(userState.userID, userImg);
					} else {
						var img = $IMG({
							id : 'user-' + userState.userID,
							style : {
								width: 50,
								height: 50
							},
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
		        flashvars.urlPrefix = '${pageContext.request.contextPath }';
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
		            '50', '50', 
		            swfVersionStr, xiSwfUrlStr, 
		            flashvars, params, attributes);
		        
		        return $('#'+replaceId);
			};
			
			
			var openStreamPublisher = function() {
		        var flashvars = {};
		        flashvars.urlPrefix = '${pageContext.request.contextPath }';
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
			
			

			RTW.addHandler('Concert', '${command.id}', 'concertState', function(concertState) {
				
				console.log(concertState);
				
				$('#StreamPublisher').each(function(index) {
					this.changeState(concertState);
				});
				
				
			});

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
