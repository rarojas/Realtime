<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="Resumen">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Resumen por sitio</title>
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
	<link href="<c:url value="/resources/js/angular-blockui/angular-block-ui.min.css" />" rel="stylesheet" />
	<script src="<c:url value="/resources/js/angularjs/angular.min.js" />"></script>
	<script src="<c:url value="/resources/js/angular-blockui/angular-block-ui.min.js" />"></script>
	<script
		src="<c:url value="/resources/js/angularjs/angular-resource.min.js" />"></script>
	<script
		src="<c:url value="/resources/js/angularjs/angular-route.min.js" />"></script>
	<script src="<c:url value="/resources/js/appResumen/app.js" />"></script>
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
					<h1 class="page-header">Resumen de Sitios</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form class="form-inline " name="formResumen" role="form"
						ng-submit="GetData()">
						<fieldset>
							<i class="fa fa-calendar-o fa-2x"></i>
							<div class="form-group">
								<label class="control-label">Año</label> <select
									class="form-control " ng-model="form.year"
									ng-options="y.value as y.text for y in years">
									<option value="">Seleciona un año...</option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">Mes</label> <select
									class="form-control" ng-model="form.month"
									ng-options="m.value as m.text for m in months">
									<option value="">Seleciona un mes...</option>
								</select>
							</div>
							<button class="btn btn-primary" type="submit">
								<i class="fa fa-download"></i> Obtener Datos
							</button>
						</fieldset>
					</form>
				</div>
			</div>
			<div class="row">
<!-- 				<div class="col-lg-6 col-md-6"> -->
<!-- 					<table class="table table-condensed table-bordered table-striped "> -->
<!-- 						<thead> -->
<!-- 							<tr> -->
<!-- 								<th>Sitio</th> -->
<!-- 								<th>Consumo</th> -->
<!-- 								<th>Factor de Potencia</th> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
<!-- 						<tbody> -->
<%-- 							<c:forEach items="${resumen}" var="row"> --%>
<!-- 								<tr> -->
<%-- 									<td><label>${row.sitio}</label></td> --%>
<%-- 									<td><span>${row.consumo}</span></td> --%>
<%-- 									<td><span>${row.fp}</span></td> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
				<div class="col-lg-6 col-md-6">
					<table class="table table-condensed table-bordered table-striped ">
						<thead>
							<tr>
								<th>Sitio</th>
								<th>Consumo</th>
								<th>Factor de Potencia</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="c in consumos">
								<td><label>{{c.sitio}}</label></td>
								<td>{{c.consumo | number : 2}} KWHR</td>
								<td><span ng-style="{color: c.fp < 0.9 ? 'red':'green' }">{{c.fp}}</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
		</div>
	</div>
</body>
</html>