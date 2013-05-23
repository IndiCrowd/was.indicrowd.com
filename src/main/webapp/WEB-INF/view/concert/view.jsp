<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>${command.title}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		
		<script>
		$(function() {
			
			var isMobile = function() {
				
				if (navigator.userAgent.match(/iPhone|iPod|iPad/i) != null) {
					return 'ios';
				}
				
				if (navigator.userAgent.match(/Android/i) != null) {
					return 'android';
				}
				
				if (navigator.userAgent.match(/Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null) {
					return 'mobile';
				}
					
				
				return null;
			};
			
			
			
			var openStreamSubscriber = function ()
			{
				// open the flash StreamPublisher
		        var flashvars = {};
		        flashvars.urlPrefix = '${pageContext.request.contextPath }';
		        flashvars.serverSubscribeStr = '${command.id}';
		        
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
			

			RTW.addHandler('Concert', '${command.id}', 'concertState', function(concertState) {
				
				console.log(concertState);
				
				$('#StreamSubscriber').each(function(index) {
					this.changeState(concertState);
				});
				
				
			});

			var openStreamUserPublisher = function() {
				var imgSrc = '<c:if test="${principal.socialImageUrl == null}"><spring:eval expression="@userfileConfig.baseUrl" />/profilethumb/${principal.id}</c:if>';
				<c:if test="${principal.socialImageUrl != null}">imgSrc = '${principal.socialImageUrl}';</c:if>
				
		        var flashvars = {};
		        flashvars.urlPrefix = '${pageContext.request.contextPath }';
		        flashvars.clientPublishStr = '${principal.id}';
				flashvars.clientDefaultImage = imgSrc;
		        
		        var params = {};
		        params.quality = 'high';
	            params.bgcolor = 'transparent';
		        params.allowscriptaccess = 'sameDomain';
		        params.allowfullscreen = 'true';
		        
		        var attributes = {};
		        attributes.id = 'userface';
		        attributes.align = 'middle';
		        
		        swfobject.embedSWF(
		            '<c:url value="/swf/StreamUserPublisher.swf" />', 'userface', 
		            '280', '150', 
		            swfVersionStr, xiSwfUrlStr, 
		            flashvars, params, attributes);
		        
		        return $('#userface');
			};
			

			
			var mobile = isMobile();
			if (mobile == null) {
				openStreamSubscriber();
				openStreamUserPublisher();
			} else if ( mobile == 'ios') {
				$VIDEO({
					width: '480',
					height: '360',
					src: 'http://indicrowd.com:1935/live/ngrp:${command.id}_mobile/playlist.m3u8',
					controls: 'true'
				}).appendTo('#StreamSubscriber');		
			} else if ( mobile == 'android') {
				$VIDEO({
					width: '480',
					height: '360',
					src: 'rtsp://indicrowd.com:1935/ngrp:${command.id}_mobile',
					controls: 'true'
				}).appendTo('#StreamSubscriber');
			} else {
				alert.show('지원하지 않는 웹 브라우져입니다.');
			}
 
		});


		function resizeStreamPublisher(width, height)
		{
			$('#userface').width(width);
			$('#userface').height(height);
		}
		
		function userCamState(state) {
			POST('<c:url value="/concert/${command.id}/userState.json" />', {
				userID: '${principal.id}',
				cameraState: state
			});
		}
		
		</script>
	</head>
	
	<body>
		
		<div id="StreamSubscriber"></div>
		
	</body>
</html>
