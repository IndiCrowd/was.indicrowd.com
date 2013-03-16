<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script>
	var USER_ID = '';
	var USER_FILE_BASE_URL = '<spring:eval expression="@userfileConfig.getProperty('baseUrl')" />';
</script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<script>
		USER_ID = '${principal.id}';
	</script>
</sec:authorize>
<script src="<c:url value="/js/jquery-1.8.2.min.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.10.1.custom.min.js" />"></script>
<script src="<c:url value="/js/$HTML.js" />"></script>
<script src="<c:url value="/js/sockjs-0.2.1.min.js" />"></script>
<script src="<c:url value="/js/json2.js" />"></script>
<script src="<c:url value="/js/RTW.js" />"></script>

<script src="<c:url value="/js/date.format.js" />"></script>
<script src="<c:url value="/js/IndiCrowd.js" />"></script>

<script>
	$(function() {
		RTW.init(new SockJS('http://${pageContext.request.serverName}:9190/r'));
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

<script src="<c:url value="/js/jquery.spritely.js" />"></script>
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
<!--  script for perfectum -->

<script src="<c:url value="/js/jquery-migrate-1.0.0.min.js" />"></script>

<script src="<c:url value="/js/jquery-ui-1.10.0.custom.min.js" />"></script>

<script src="<c:url value="/js/jquery.ui.touch-punch.js" />"></script>

<script src="<c:url value="/js/jquery.cookie.js" />"></script>

<script src="<c:url value="/js/fullcalendar.min.js" />"></script>

<script src="<c:url value="/js/jquery.dataTables.min.js" />"></script>


<script src="<c:url value="/js/jquery.chosen.min.js" />"></script>

<script src="<c:url value="/js/jquery.uniform.min.js" />"></script>

<script src="<c:url value="/js/jquery.cleditor.min.js" />"></script>

<script src="<c:url value="/js/jquery.noty.js" />"></script>

<script src="<c:url value="/js/jquery.elfinder.min.js" />"></script>

<script src="<c:url value="/js/jquery.raty.min.js" />"></script>

<script src="<c:url value="/js/jquery.iphone.toggle.js" />"></script>

<script src="<c:url value="/js/jquery.uploadify-3.1.min.js" />"></script>

<script src="<c:url value="/js/jquery.gritter.min.js" />"></script>

<script src="<c:url value="/js/jquery.masonry.min.js" />"></script>

<script src="<c:url value="/js/jquery.knob.js" />"></script>

<script src="<c:url value="/js/jquery.sparkline.min.js" />"></script>



<script>
	$('.datepicker').datepicker();
</script>

<script>
	var CONTEXT_PATH = '${pageContext.request.contextPath}';
</script>
<script src="<c:url value="/js/preview.js" />"></script>
<script src="<c:url value="/js/tag.js" />"></script>
<script src="<c:url value="/js/js2form.js" />"></script>
<script src="<c:url value="/js/form2js.js" />"></script>
<!-- end: Java Script -->
