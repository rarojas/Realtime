<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="Minutales">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Minutales</title>
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
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="<c:url value="/resources/js/angularjs/angular.min.js" />"></script>
<script
	src="<c:url value="/resources/js/twitter-bootstrap/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/sbadmin/js/sb-admin-2.js" />"></script>
<script
	src="<c:url value="/resources/js/angular-loading-bar/loading-bar.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angularjs/angular-resource.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angularjs/angular-route.min.js" />"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script
	src="<c:url value="/resources/js/n3-charts/line-chart.min.js" />"></script>
<script src="<c:url value="/resources/js/appMinutales/app.js" />"></script>
<script src="http://code.highcharts.com/stock/highstock.js"></script>

</head>
<body ng-controller="MainCtrl">
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
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
				</ul>
			</div>
		</div>
		</nav>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Minutales</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form class="form form-inline" name="form_minutal"
						ng-submit="getData()">
						<fieldset>
							<div class="form-group">
								<label>Sitio</label> <select class="form-control" name="sitio"
									required ng-model="sitio"
									ng-options="s.id as s.sitio for s in sitios | orderBy :'sitio'">
									<option value="">Sitios...</option>
								</select>
							</div>
							<div class="form-group">
								<label>Variables</label> <select class="form-control"
									name="variable" ng-model="variable"
									ng-options="v.id as (v.componente + '-' +v.variable) for v in variables | orderBy :'variables'">
									<option value="">Variable...</option>
								</select>
							</div>
							<div class="form-group">
								<label>Inicio</label> <input type="datetime-local"
									ng-model="inicio" class="form-control" name="inicio">
							</div>
							<div class="form-group">
								<label>Fin</label> <input type="datetime-local" ng-model="fin"
									class="form-control" name="fin">
							</div>
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-download"></i> Obtener datos
							</button>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- 			<div class="row"> -->
			<!-- 				<div class="col-lg-12" style="min-height: 400px;"> -->
			<!-- - 					<linechart data="minutales" options="options"></linechart> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="row">
				<div class="col-lg-12">
					<div id="container" style="height: 400px; min-width: 310px"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>