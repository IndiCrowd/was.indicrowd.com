<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<title>회원 정보 보기</title>
	</head>
	
	<body>
		
		<div id="page-title">
		
			<h2>${command.nickname}</h2>
		
		</div>
	
		<div id="wrapper" class="full">
				
				<p>
					username : ${command.username}
				</p>
				<p>
					nickname : ${command.nickname}
				</p>
				<p>
					email : ${command.email}
				</p>
				<p>
					joinDate : ${command.joinDate}
				</p>
				<p>
					lastLoginDate : ${command.lastLoginDate}
				</p>
				<p>
					loginCount : ${command.loginCount}
				</p>
				<p>
					energy : ${command.energy}
				</p>
				
				<t:signed>
					<t:notSocialSigned>
					<div class="form-actions">
						<a href="${pageContext.request.contextPath}/user/update" class="btn btn-large">회원 정보 수정</a>
					</div>
					</t:notSocialSigned>
				</t:signed>
			
		</div>

	</body>
</html>
