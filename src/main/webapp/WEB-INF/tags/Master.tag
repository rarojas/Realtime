<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="title" fragment="true"%>
<%@attribute name="app" fragment="true"%>
<%@attribute name="controller" fragment="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="<jsp:invoke fragment="app"/>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><jsp:invoke fragment="title" /></title>
<link
	href="<c:url value="/resources/js/twitter-bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/js/tether/css/tether.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/js/sbadmin/css/sb-admin-2.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/tether/css/tether-theme-basic.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/tether/css/tether-theme-arrows.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/tether/css/tether-theme-arrows-dark.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/twitter-bootstrap/css/bootstrap-theme.min.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/angular-loading-bar/loading-bar.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/angular-blockui/angular-block-ui.min.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/font-awesome/css/font-awesome.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/angular-blockui/angular-block-ui.min.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/angular-loading-bar/loading-bar.min" />"
	rel="stylesheet" />
<script src="<c:url value="/resources/js/jquery/jquery-2.1.3.min.js" />"></script>

<script src="<c:url value="/resources/js/angularjs/angular.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angular-blockui/angular-block-ui.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angularjs/angular-resource.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angularjs/angular-route.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angular-bootstrap/ui-bootstrap.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angular-bootstrap/ui-bootstrap-tpls.min.js" />"></script>
<script src="//maps.googleapis.com/maps/api/js?sensor=false/"></script>
<!--<script src="//dylanfprice.github.io/angular-gm/1.0.0/angular-gm.min.js"></script>-->
<script src="<c:url value="/resources/js/angularjs/angular-gm.min.js"/>"></script>
<script
	src="<c:url value="/resources/js/angular-loading-bar/loading-bar.min.js"/>"></script>
<jsp:invoke fragment="header" />
<style>
.circle {
	border-radius: 50%;
	width: 10px;
	height: 10px;
}
</style>
</head>
<body ng-controller="<jsp:invoke fragment="controller"/>">
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">Energy View</a>
		</div>
		<ul class="nav navbar-top-links navbar-right">
		</ul>
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-headercollapse">
				<ul class="nav" id="side-menu">
					<li><a href="/realtime/Resumen"><i
							class="fa fa-tachometer "></i> Resumen</a></li>
					<li><a href="/realtime"><i class="fa fa-play "></i>
							Realtime</a></li>
					<li><a href="/realtime/Minutales"><i class="fa fa-clock-o"></i>
							Minutales</a></li>
					<li><a href="/realtime/Disponibilidad"><i
							class="fa fa-power-off"></i> Disponibidlidad</a></li>
					<li><a href="/realtime/Plantas"><i class="fa fa-power-off"></i>
							Monitoreo de Plantas</a></li>
					<li><a href="/realtime/Calderas"> <i
							class="fa fa-power-off"></i> Monitoreo de Calderas
					</a></li>

				</ul>
			</div>
		</div>
		</nav>
		<div id="page-wrapper">
			<jsp:doBody></jsp:doBody>
		</div>
	</div>
</body>
</html>