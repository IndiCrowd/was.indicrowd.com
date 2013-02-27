<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TEST</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	
	<body>
		
		<div id="wrapper">
		
			<h1><a href="#">${command.title}</a></h1>
		
			<div id="concert-wrapper">
				<div id="concert">
					<iframe width="480" height="360" src="http://www.youtube.com/embed/JFPcMlNml0s?autoplay=1" frameborder="0" allowfullscreen></iframe>
				</div>
			</div>
			
			<div id="info-wrapper">
				<div id="info">
					<p>
						<label>공연 이름</label> ${command.title}
					</p>
					<p>
						<label>시작 시간</label> 12:20
					</p>
					<p>
						<label>종료 시간</label> 14:20
					</p>
					<p>
						<label>밴드 정보</label> test
					</p>
				</div>
			</div>
			
			<div id="chat-wrapper">
				<div id="chat">
					<div id="messages-wrapper">
						<ul id="messages">
						</ul>
					</div>
					<div id="form-wrapper">
						<form>
							<input id="message">
							<input type="submit">
						</form>
					</div>
				</div>
			</div>
			
			<div id="stage-wrapper">
				<div id="stage">
				</div>
			</div>
		</div>
		<div id="footer-wrapper">
			<div id="footer">
				&copy; IndiCrowd
			</div>
		</div>
		
	</body>
</html>
