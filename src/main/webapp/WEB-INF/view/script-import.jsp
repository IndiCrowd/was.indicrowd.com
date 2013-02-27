<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>var USER_ID = '';</script>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal" />
<script>
USER_ID = '${principal.id}';
</script>
</sec:authorize>
<script src="<c:url value="/js/jquery-1.8.2.min.js" />"></script>
<script src="<c:url value="/js/$HTML.js" />"></script>
<script src="<c:url value="/js/sockjs-0.2.1.min.js" />"></script>
<script src="<c:url value="/js/json2.js" />"></script>
<script src="<c:url value="/js/RTW.js" />"></script>
<script>
$(function() {
	RTW.init(new SockJS('http://${pageContext.request.serverName}:9090/r'));
	RTW.join('IndiCrowd', 'init', function(data) {
		console.log('connect:', data);
	}, function(data) {
		console.log('disconnect:', data);
	});
});
</script>

<!--[if lt IE 9]>
<script src="<c:url value="/js/respond.min.js" />"></script>
<![endif]-->
<!-- start: Java Script -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<c:url value="/js/isotope.js" />"></script>
<script src="<c:url value="/js/jquery.imagesloaded.js" />"></script>
<script src="<c:url value="/js/bootstrap.js" />"></script>
<script src="<c:url value="/js/flexslider.js" />"></script>
<script src="<c:url value="/js/carousel.js" />"></script>
<script src="<c:url value="/js/jquery.cslider.js" />"></script>
<script src="<c:url value="/js/slider.js" />"></script>
<script src="<c:url value="/js/fancybox.js" />"></script>
<script src="<c:url value="/js/twitter.js" />"></script>
<script src="<c:url value="/js/jquery.placeholder.min.js" />"></script>

<script src="<c:url value="/js/jquery-easing-1.3.js" />"></script>
<script src="<c:url value="/js/layerslider.kreaturamedia.jquery.js" />"></script>

<script src="<c:url value="/js/excanvas.js" />"></script>
<script src="<c:url value="/js/jquery.flot.js" />"></script>
<script src="<c:url value="/js/jquery.flot.pie.min.js" />"></script>
<script src="<c:url value="/js/jquery.flot.stack.js" />"></script>
<script src="<c:url value="/js/jquery.flot.resize.min.js" />"></script>

<script defer="defer" src="<c:url value="/js/modernizr.js" />"></script>
<script defer="defer" src="<c:url value="/js/retina.js" />"></script>
<script defer="defer" src="<c:url value="/js/custom.js" />"></script>
<!-- end: Java Script -->
