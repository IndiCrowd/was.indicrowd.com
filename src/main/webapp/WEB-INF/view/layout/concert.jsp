<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
		<!--[if IE]>
		<script src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
		<script type="text/javascript">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
		<title>IndiCrowd :: <decorator:title /></title>
		
		<style>
			@import url(<c:url value="/css/init.css" />);
		</style>
		
		<jsp:include page="../script-import.jsp" />
        <script type="text/javascript" src="<c:url value="/js/swfobject.js" />" ></script>
		<script type="text/javascript">
            // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
            var swfVersionStr = '11.1.0';
            // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
            var xiSwfUrlStr = '<c:url value="/swf/playerProductInstall.swf" />';
        </script>
		
		
		<link href='http://fonts.googleapis.com/css?family=Raleway:100' rel='stylesheet'>
		
		<style>
			html, body {
				background: #000;
			}
			#wrapper {
				height: 700px;
			}
			
			h1 { 
				font-size: 22px;
			  text-align: center;
			  text-transform: uppercase;
			  padding: 1px;
			  font-family: 'Raleway';
			  position: relative;
			  background: rgba(0, 0, 0, .5);
			}
			h1:before {
			  content: "";
			  position: absolute;
			  left: 50%;
			  top: -50px;
			  width: 600px;
			  margin-left: -300px;
			  margin-top: -220px;
			  height: 600px;
			  z-index: -1;
			}
			h1 a {
			  display: block;
			  padding: 20px;
			  text-decoration: none;
			  letter-spacing: 30px;
			  -webkit-animation: comein 1.5s 1 ease-in-out forwards;
			  -moz-animation: comein 1.5s 1 ease-in-out forwards;
			}
			@-webkit-keyframes comein {
			   0% { letter-spacing: 50px; color: rgba(255,255,255,0); }
			   70% { letter-spacing: 15px; }
			   100% { letter-spacing: 20px; color: rgba(255,255,255,1) }
			}
			@-moz-keyframes comein {
			   0% { letter-spacing: 50px; color: rgba(255,255,255,0); }
			   70% { letter-spacing: 15px; }
			   100% { letter-spacing: 20px; color: rgba(255,255,255,1) }
			}
			
			/*
			 *  François 'cahnory' Germain
			 */
			.ui-tooltip, .ui-tooltip-top, .ui-tooltip-right, .ui-tooltip-bottom, .ui-tooltip-left {
			  color:#ffffff;
			  cursor:normal;
			  display:-moz-inline-stack;
			  display:inline-block;
			  font-size:12px;
			  font-family:arial;
			  padding:.5em 1em;
			  position:relative;
			  text-align:center;
			  text-shadow:0 -1px 1px #111111;
			  -webkit-border-top-left-radius:4px ;
			  -webkit-border-top-right-radius:4px ;
			  -webkit-border-bottom-right-radius:4px ;
			  -webkit-border-bottom-left-radius:4px ;
			  -khtml-border-top-left-radius:4px ;
			  -khtml-border-top-right-radius:4px ;
			  -khtml-border-bottom-right-radius:4px ;
			  -khtml-border-bottom-left-radius:4px ;
			  -moz-border-radius-topleft:4px ;
			  -moz-border-radius-topright:4px ;
			  -moz-border-radius-bottomright:4px ;
			  -moz-border-radius-bottomleft:4px ;
			  border-top-left-radius:4px ;
			  border-top-right-radius:4px ;
			  border-bottom-right-radius:4px ;
			  border-bottom-left-radius:4px ;
			  -o-box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  -moz-box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  -khtml-box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  -webkit-box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  background-color:#3b3b3b;
			  background-image:-moz-linear-gradient(top,#555555,#222222);
			  background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0,#555555),color-stop(1,#222222));
			  filter:progid:DXImageTransform.Microsoft.gradient(startColorStr=#555555,EndColorStr=#222222);
			  -ms-filter:progid:DXImageTransform.Microsoft.gradient(startColorStr=#555555,EndColorStr=#222222);
			}
			.ui-tooltip:after, .ui-tooltip-top:after, .ui-tooltip-right:after, .ui-tooltip-bottom:after, .ui-tooltip-left:after {
			  content:"\25B8";
			  display:block;
			  font-size:2em;
			  height:0;
			  line-height:0;
			  position:absolute;
			}
			.ui-tooltip:after, .ui-tooltip-bottom:after {
			  color:#2a2a2a;
			  bottom:0;
			  left:1px;
			  text-align:center;
			  text-shadow:1px 0 2px #000000;
			  -o-transform:rotate(90deg);
			  -moz-transform:rotate(90deg);
			  -khtml-transform:rotate(90deg);
			  -webkit-transform:rotate(90deg);
			  width:100%;
			}
			.ui-tooltip-top:after {
			  bottom:auto;
			  color:#4f4f4f;
			  left:-2px;
			  top:0;
			  text-align:center;
			  text-shadow:none;
			  -o-transform:rotate(-90deg);
			  -moz-transform:rotate(-90deg);
			  -khtml-transform:rotate(-90deg);
			  -webkit-transform:rotate(-90deg);
			  width:100%;
			}
			.ui-tooltip-right:after {
			  color:#222222;
			  right:-0.375em;
			  top:50%;
			  margin-top:-.05em;
			  text-shadow:0 1px 2px #000000;
			  -o-transform:rotate(0);
			  -moz-transform:rotate(0);
			  -khtml-transform:rotate(0);
			  -webkit-transform:rotate(0);
			}
			.ui-tooltip-left:after {
			  color:#222222;
			  left:-0.375em;
			  top:50%;
			  margin-top:.1em;
			  text-shadow:0 -1px 2px #000000;
			  -o-transform:rotate(180deg);
			  -moz-transform:rotate(180deg);
			  -khtml-transform:rotate(180deg);
			  -webkit-transform:rotate(180deg);
			}
			
			#concert-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				left: 60px;
				top: 90px;
				width: 520px;
				height: 400px;
				z-index: 1000;
			}
			#concert {
				padding: 20px;
				line-height: 0;
			}
			
			#info-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 320px;
				height: 150px;
				left: 620px;
				top: 90px;
			}
			#info {
				padding: 20px;
				color: #fff;
			}
			#info p {
				padding: 3px;
			}
			#info label {
				padding-right: 10px;
			}
			
			#chat-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 320px;
				height: 418px;
				left: 620px;
				top: 260px;
			}
			#chat {
				padding: 20px;
			}
			
			#messages-wrapper {
				color: #fff;
				/* height: 300px; */
				overflow-y: scroll;
			}
			#messages {
			}
			.message {
				margin-bottom: 5px;
			}
			#form-wrapper {
			}
			
			#stage-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 520px;
				left: 60px;
				top: 510px;
			}
			#stage {
				padding: 16px;
				overflow: auto;
			}
			#stage img {
				background: rgba(255, 255, 255, .5);
				padding: 5px;
				margin: 4px;
				float: left;
			}
			
			#footer-wrapper {
				position: absolute;
				right: 10px;
				bottom: 10px;
			}
			#footer {
				color: #fff;
			}
		</style>
		
		<decorator:head />
		
	</head>
	
	<body>
		<decorator:body />
	</body>
	
</html>
