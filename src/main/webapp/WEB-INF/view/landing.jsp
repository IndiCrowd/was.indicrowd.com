<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html>

<head>
	<title>세계최초 온라인 콘서트 서비스</title>
	
	<style>
	html, body {
		padding:0;
		margin:0;
		width:100%;
		height:100%;
	}
	
	#bodyContainer {
		width: 100%;
	}
	
	.landing h1 {
		margin:0;
		padding:0;
		padding-top:2em;
		font-family:sans-serif;
		color:#fff;
	}

	.landing {
		width:100%;
		text-align:center;
		background-size: 100% 100%;
	}
	
	.landing .wrapper {
		width: 100%;
		height: 100%;
	}
	
	.landing .content {
		padding: 30px;
		border-radius: 15px;
		background: rgba(0, 0, 0, .5);
		float: none;
	     margin-left: auto;
	     margin-right: auto;
	}

	.odd {
		background:#f90;
	}
	
	#under-footer {
		position: fixed;
		width: 100%;
		bottom: 0;
	}
	</style>
</head>
<body>
	
	<div class="landing" style="background-image: url('${pageContext.request.contextPath}/img/landing/1.jpg');">
	<table class="wrapper"><tr><td>
		<div class="content span6">
			<div class="flex-video widescreen">
				<iframe src="http://www.youtube.com/embed/n7Q4_IWGlOs"
											width="480" height="256" frameborder="0" webkitAllowFullScreen
											mozallowfullscreen allowFullScreen></iframe>
			</div>
		</div>
	</td></tr></table>
	</div>
	<div class="landing" style="background-image: url('${pageContext.request.contextPath}/img/landing/2.jpg');">
	<table class="wrapper"><tr><td>
		<div class="content span6">
			<div class="flex-video widescreen">
				<iframe src="http://www.youtube.com/embed/FgAaUI6n44I"
											width="480" height="256" frameborder="0" webkitAllowFullScreen
											mozallowfullscreen allowFullScreen></iframe>
			</div>
		</div>
	</td></tr></table>	
	</div>
	<div class="landing" style="background-image: url('${pageContext.request.contextPath}/img/landing/3.jpg');">
	<table class="wrapper"><tr><td>
		<div class="content span6">
			<div class="flex-video widescreen">
				<iframe src="http://www.youtube.com/embed/x6VHNkwL-qw"
											width="480" height="256" frameborder="0" webkitAllowFullScreen
											mozallowfullscreen allowFullScreen></iframe>
			</div>
		</div>
	</td></tr></table>
	</div>
	<div class="landing" style="background-image: url('${pageContext.request.contextPath}/img/landing/4.jpg');">
	<table class="wrapper"><tr><td>
		<div class="content span6">
			<div class="flex-video widescreen">
				<iframe src="http://www.youtube.com/embed/xrrpiApmMTQ"
											width="480" height="256" frameborder="0" webkitAllowFullScreen
											mozallowfullscreen allowFullScreen></iframe>
			</div>
		</div>
	</td></tr></table>
	</div>
	
	<script type="text/javascript">
	$(function() {
		var layers = $('.landing');
		
		var f = function() {
			layers.css({
				height: $(window).height()
			});
		};
		
		$(window).resize(f);
		f();
		
		var activeLayer = 0;
		var animateUpSettings = {
			duration: 200,
			done: function() {
				document.body.style.overflow = 'auto';
			}
		};
		var animateDownSettings = {
			duration: 200,
			easing: 'sqrt',
			done: animateUpSettings.done
		};
	
		var s = skrollr.init({
			render: function(info) {
				if(this.isAnimatingTo()) {
					return;
				}
	
				var lastOffset = this.relativeToAbsolute(layers.get(activeLayer), 'top', 'top');
	
				if(this.getScrollTop() === lastOffset) {
					return;
				}
	
				document.body.style.overflow = 'hidden';
	
				//Make sure to start animating at the last snap pos
				this.setScrollTop(lastOffset);
	
				if(info.direction === 'down') {
					if(activeLayer + 1 < layers.length) {
						
						activeLayer++;
	
						var offset = this.relativeToAbsolute(layers.get(activeLayer), 'top', 'top');
	
						//Move down slow with nice easing
						this.animateTo(offset, animateDownSettings);
					}
				} else if(activeLayer > 0) {
					activeLayer--;
	
					var offset = this.relativeToAbsolute(layers.get(activeLayer), 'top', 'top');
	
					//Move up very fast
					this.animateTo(offset, animateUpSettings);
				}
			}
		});
	});
	</script>

	</body>
</html>
	