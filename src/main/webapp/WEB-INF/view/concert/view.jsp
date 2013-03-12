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

			var openStreamSubscriber = function ()
			{
				// open the flash StreamPublisher
		        var flashvars = {};
		        flashvars.serverSubscribeStr = '${command.id}';
		        flashvars.clientPublishStr = '${userId}';
		        // TODO: Change url that is client default image.
				flashvars.clientDefaultImage = '<c:url value="/img/concert/" />profile1.jpg';
		        
		        var params = {};
		        params.quality = 'high';
	            params.bgcolor = 'transparent';
		        params.allowscriptaccess = 'sameDomain';
		        params.allowfullscreen = 'true';
		        
		        var attributes = {};
		        attributes.id = 'StreamSubscriber';
		        attributes.name = 'StreamSubscriber';
		        attributes.align = 'middle';
		        
		        swfobject.embedSWF(
		            '<c:url value="/swf/StreamSubscriber.swf" />', 'StreamSubscriber', 
		            '480', '360', 
		            swfVersionStr, xiSwfUrlStr, 
		            flashvars, params, attributes);
		        
		        
		        return $('#StreamSubscriber');
			};
			
			openStreamSubscriber();
 
		});
		
		</script>
	</head>
	
	<body>
		
		<div id="StreamSubscriber"></div>
		
	</body>
</html>
