<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ attribute name="userInfo" required="true" type="kr.co.siterush.user.UserInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:if test="${!userInfo.socialUser}">
<spring:eval expression="@userfileConfig.getProperty('baseUrl')" />/profilethumb/${userInfo.id}
</c:if>
<c:if test="${userInfo.socialUser}">
${userInfo.socialImageUrl}
</c:if>