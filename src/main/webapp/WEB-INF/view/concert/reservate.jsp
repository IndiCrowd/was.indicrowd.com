<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal" var="principal" />

	
		<div id="wrapper">
	
			<h1>콘서트 생성</h1> 
			
			<form:form>
				<form:hidden path="hallId" value="1" />
				<form:hidden path="bandId" value="5" />
				<fieldset>
					<c:if test="${fn:length(principal.userBand) gt 0}">
					
					<p>
						<label>
						<h5>Band</h5>
						<ul class="nav nav-pills">
								  <li class="active dropdown">
								  	<a class="dropdown-toggle"
								       data-toggle="dropdown"
								       href="#" >
								    <c:if test="${principal.userBand[0].imageFilePath ne ''}"><img border="0" width="22" height="22" src="${pageContext.request.contextPath}/img/band/${principal.userBand[0].imageFilePath }" /> </c:if>${principal.userBand[0].name }<b class="caret"></b></a>
								  	<ul class="dropdown-menu">
								      <c:forEach var="band" items="${principal.userBand }">
								      <!-- img url 썸네일 변환 후 url로 수정해줘야함. -->
								      <li class="active" ><a href="#"><c:if test="${band.imageFilePath ne ''}"><img border="0" width="22" height="22" src="${pageContext.request.contextPath}/img/band/${band.imageFilePath }" /> </c:if>${band.name }</a></li>
								      </c:forEach>
								    </ul>
								  </li>
								</ul>
					    </label>
					</p>
					</c:if>
					<p>
						<label>
							<h5>Title</h5>
							<form:input path="title" />
							<spring:bind path="title"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>공연 시작 날짜(ex)20130402)</h5>
							<form:input path="startDate" />
							<spring:bind path="startDate"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>공연 시작 시간(ex)1530)</h5>
							<form:input path="startTime" />
							<spring:bind path="startTime"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>공연시간(30분단위, ex)30,60,90)</h5>
							<form:input path="duration"/>
							<spring:bind path="duration"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>제한 관객 수</h5>
							<form:input path="audienceLimit"/>
							<spring:bind path="audienceLimit"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<button type="submit">생성</button>
					</p>
				</fieldset>
			</form:form>
		
		</div>
