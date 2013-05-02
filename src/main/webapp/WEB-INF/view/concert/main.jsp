<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>뜨거운 열기를 느껴라!</title>
	</head>

	<body>
	
		<div id="wrapper" class="full">
			<div id="content">
				<c:forEach items="${command.list}" var="command">
					<tr>
						<td><a
							href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);">${command.title}
								공연 보기</a> <br></td>
					</tr>
				</c:forEach>
			</div>
		</div>

	</body>
</html>
