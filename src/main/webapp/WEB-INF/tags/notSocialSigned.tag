<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="isAuthenticated()">
<c:if test="${!signedUserInfo.socialUser}">
<jsp:doBody />
</c:if>
</sec:authorize>
<sec:authorize access="isAnonymous()">
<jsp:doBody />
</sec:authorize>