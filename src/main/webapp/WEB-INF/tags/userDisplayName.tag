<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ attribute name="userInfo" required="true" type="kr.co.siterush.user.UserInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:if test="${!userInfo.socialUser}">
${userInfo.nickname}
</c:if>
<c:if test="${userInfo.socialUser}">
${userInfo.socialDisplayName}
</c:if>