<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!-- start: CSS -->
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Serif">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Boogaloo">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Economica:700,400italic">
 
<link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/bootstrap-responsive.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/layerslider.css"/>" rel="stylesheet" type="text/css">

<!--[if lt IE 9 ]>
  <link href="css/styleIE.css" rel="stylesheet">
<![endif]-->

<!--[if IE 9 ]>
  <link href="css/styleIE9.css" rel="stylesheet">
<![endif]-->

<!-- end: CSS -->

 <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
 <!--[if lt IE 9]>
   <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
 <![endif]-->
 <style>
	@import url(<c:url value="/css/init.css" />);
</style>		
<script>
var contextPath = '${pageContext.request.contextPath}';
var USER_ID = undefined;
</script>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal" />
<script>
var USER_ID = '${principal.id}';
</script>
</sec:authorize>

<script src="<c:url value="/js/jquery-1.8.2.min.js"/>"></script>
<script src="<c:url value="/js/sockjs-0.2.1.min.js"/>"></script>
<script src="<c:url value="/js/json2.js"/>"></script>
<script src="<c:url value="/js/RealtimeWebClient.js"/>"></script>
<script>
$(function() {
	RealtimeWebClient.init(new SockJS('http://${pageContext.request.serverName}:9090/r'));
	RealtimeWebClient.join('IndiCrowd', 'init', function(id, count) {
		console.log('connect, id:' + id + ', count:' + count);
	}, function(id, count) {
		console.log('disconnect, id:' + id + ', count:' + count);
	});
});
</script>
