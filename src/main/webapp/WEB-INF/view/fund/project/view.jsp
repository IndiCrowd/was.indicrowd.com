<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>프로젝트 보기</title>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>프로젝트 보기</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
			
				<p>
					title : ${command.title}
				</p>
				<p>
					summary : ${command.summary}
				</p>
				<p>
					content : ${command.content}
				</p>
				<p>
					creator : ${command.creator.nickname}
				</p>
				<p>
					createDate : ${command.createDate}
				</p>
				<p>
					genres :
					<c:forEach items="${command.genres}" var="genre">
						${genre.tag.repTagInput.tagInputStr}
					</c:forEach>
				</p>
				<p>
					startDate : ${command.startDate}
				</p>
				<p>
					endDate : ${command.endDate}
				</p>
				<p>
					targetFigure : ${command.targetFigure}
				</p>
				<p>
					contact : ${command.contact}
				</p>
				<p>
					opened : ${command.opened}
				</p>
				
				<a href="<c:url value="/fund/project/${command.id}/invest" />">후원하기</a>
			</div>
		</div>

	</body>
</html>
