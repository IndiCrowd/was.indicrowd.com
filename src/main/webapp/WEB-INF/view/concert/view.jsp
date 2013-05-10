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
			
			var hasFlash = function() {
				var ret = false;
				try {
				  var fo = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
				  if(fo) ret = true;
				}catch(e){
				  if(navigator.mimeTypes ["application/x-shockwave-flash"] != undefined) ret = true;
				}
				return ret;
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
				var imgSrc = '<c:if test="${principal.socialImageUrl == null}"><spring:eval expression="@userfileConfig.baseUrl" />/profilethumb/${principal.id} </c:if>';

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
			

			if (hasFlash()) {
				openStreamSubscriber();
				openStreamUserPublisher();
			} else {
				$VIDEO({
					width: '480',
					height: '360',
					src: 'http://indicrowd:1935/live/ngrp:${command.id}_all/playlist.m3u8',
					controls: 'true'
				}).appendTo('#StreamSubscriber');		
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
		
		$(function() {
			var $span = $SPAN({
				cls : 'ui-tooltip',
				style : {
					position : 'absolute',
					zIndex: 999999
				}
			}, '다른 사람들에게 본인의 모습을 보여주고 싶다면 클릭!').appendTo('body');
			$span.css({
				display : 'none',
				top: $('#userface-wrapper').offset().top - 20,
				left: $('#userface-wrapper').offset().left - 55
			});
			$span.fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn();
			setTimeout(function() {
				$span.fadeOut(function() {
					$(this).remove();
				});
			}, 20000);
		});
		
		</script>
	</head>
	
	<body>
		
		<div id="StreamSubscriber"></div>
		
	</body>
</html>
