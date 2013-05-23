<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">if (window.location.hash == '#_=_')window.location.hash = '';</script>
<script>
	var USER_ID = '';
	var USER_FILE_BASE_URL = '<spring:eval expression="@userfileConfig.getProperty('baseUrl')" />';
	
	// ie에서 콘솔이 없을 때.
	if (window.console === undefined || console.log === undefined || console.log.apply === undefined) {
		window.console = {
			log : function() {
				
			}
		};
	}
</script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<script>
		USER_ID = '${principal.id}';
	</script>
</sec:authorize>
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
<script >
function autoBlurFucntion() {if(event.srcElement.tagName=="A") document.body.focus();}
document.onfocusin=autoBlurFucntion;
function popup(url, title, w, h) {
	var left = (screen.width / 2) - (w / 2);
	var top = (screen.height / 2) - (h / 2) - 40;
	return window
			.open(url,title,'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width='+ w+ ', height='+ h+ ', top='+ top+ ', left=' + left);
}
function goConcert(id){
	popup('<c:url value="/concert" />/'+id, 'Concert', 1000, 700);
}
function goConcertAdmin(id){
	popup('<c:url value="/concert" />/'+id+"/admin", 'Concert', 1000, 700);
}
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
<script src="<c:url value="/js/jquery-ui-timepicker-addon.js" />"></script>

<script defer="defer" src="<c:url value="/js/modernizr.js" />"></script>
<script defer="defer" src="<c:url value="/js/retina.js" />"></script>
<script defer="defer" src="<c:url value="/js/custom.js" />"></script>

<script>
	$('.datepicker').datepicker();
	
	try{
		
	$('.datetimepicker').datetimepicker();
	$('.cleditor').cleditor({
		width: 600,
		height: 400
	});
	$("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform();
	
	} catch(e) {console.log(e);}
</script>

<script>
	var CONTEXT_PATH = '${pageContext.request.contextPath}';
</script>
<script src="<c:url value="/js/preview.js" />"></script>
<script src="<c:url value="/js/tag.js" />"></script>
<script src="<c:url value="/js/js2form.js" />"></script>
<script src="<c:url value="/js/form2js.js" />"></script>
<!-- end: Java Script -->

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-40115412-1', 'indicrowd.com');
  ga('send', 'pageview');

</script>
