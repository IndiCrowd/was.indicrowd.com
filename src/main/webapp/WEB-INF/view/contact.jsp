<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>제안/문의하기</title>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>제안/문의하기</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				
				<!-- start: Wrapper -->	
				<div id="wrapper" class="full" style="margin-top: 30px">
					
					<!-- start: Row -->
					<div class="row-fluid">
					
						<!-- start: Contact Form -->
						<div class="span9 separate">
							
							<h3>저희에게 제안, 문의사항을 보내주세요!</h3>
							<p>
								IndiCrowd 공식 페이스북 <a href="http://www.facebook.com/IndiCrowd" target="_blank">http://www.facebook.com/IndiCrowd</a> 또는 indicrowd@gmail.com 으로 제안, 문의사항을 주세요!<br>
								<%--아니면, 아래의 폼을 작성해 주셔도 됩니다! :) --%>
							</p>
							<img src="${pageContext.request.contextPath}/img/g.jpg" style="width: 100%;" class="img-polaroid">
							
		
							<!-- start: Contact Form -->
							<%--
							<div id="contact-form">
		
								<form method="post" action="">
									
									<fieldset>
										
										<div class="row-fluid">
											
												<input class="span4" tabindex="1" id="name" name="name" type="text" value="" placeholder="이름: ..." >
											
												<input class="span4" tabindex="2" id="email" name="email" type="text" value="" placeholder="이메일: ...">
											
												<input class="span4" tabindex="3" id="www" name="www" type="text" value=""placeholder="사이트: ...">
										
										</div>	
		
										<div class="row-fluid">
											
												<textarea class="span12" tabindex="4" id="message" name="message" rows="12" placeholder="메시지: ..."></textarea>					
										
										</div>
		
										<div class="actions">
											<button tabindex="5" type="submit" class="btn">메일 보내기</button>
										</div>
										
									</fieldset>
		
								</form>
		
							</div>
							 --%>
							<!-- end: Contact Form -->
							
							</div>
							<div class="span3">
		
								<!-- start: Contact Info -->
								
								<h3>연락처</h3>
								
								<p>
									<i class="fa-icon-home"></i> <b>IndiCrowd</b>
								</p>
								<p>
									<i class="fa-icon-map-marker"></i> 대한민국 서울특별시
								</p>
								<p>
									<i class="fa-icon-envelope"></i> Email: indicrowd@gmail.com
								</p>
								<p>
									<i class="fa-icon-globe"></i> Web: www.indicrowd.com
								</p>	
								<!-- end: Contact Info -->
		
								<!-- start: Social Sites -->
								<div class="social_profiles">
									<a href="http://www.facebook.com/IndiCrowd" target="_blank" class="social-facebook"></a>
									<a href="javascript:alert('트위터는 준비중입니다.'); void(0)" class="social-twitter"></a>
								</div>
								<!-- end: Social Sites -->
		
							</div>
							
							</div>
							<!-- end: Row -->
		
						</div>
						<!-- end: Contact Form -->
						
					</div>
					<!-- end: Row -->
					
				</div>
				<!-- end: Wrapper  -->	
				
			</div>
		</div>

	</body>
</html>
