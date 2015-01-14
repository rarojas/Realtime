<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html ng-app="Realtime">
<head>
<title>Home</title>
<link href="<c:url value="/resources/js/twitter-bootstrap/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/resources/js/tether/css/tether.css" />" rel="stylesheet" />
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
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="<c:url value="/resources/js/angularjs/angular.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angularjs/angular-resource.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angularjs/angular-route.min.js" />"></script>
<script src="<c:url value="/resources/js/app/app.js" />"></script>
<script src="<c:url value="/resources/js/underscore/underscore.js" />"></script>
<script src="<c:url value="/resources/js/tether/tether.js" />"></script>
<script
	src="<c:url value="/resources/js/angular-tooltip/angular-tooltip.js" />"></script>
<script
	src="<c:url value="/resources/js/n3-charts/line-chart.min.js" />"></script>
<style>
.circle {
	border-radius: 50%;
	width: 10px;
	height: 10px;
	/* width and height can be anything, as long as they're equal */
}
</style>
</head>
<body ng-controller="MainCtrl">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal">
					<fieldset>
						<legend>Tablero en Tiempo Real</legend>
						<div class="form-group">
							<label class="col-md-4 control-label">Cliente</label>
							<div class="col-md-8">
								<select ng-options="c.idcliente as c.cliente for c in Clientes"
									class="form-control" ng-model="form.idcliente" name="cliente"></select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Sitio</label>
							<div class="col-md-8">
								<select ng-options="c.idsitio as c.nombresitio for c in Sitios"
									class="form-control" ng-disable="form.idcliente == null"
									ng-model="form.idsitio" name="sitios"></select>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 text-center">
				<h2>Consumo por Sitio</h2>
				<h1>{{ConsumoSitio | number : 2 }}</h1>
				<h2>kWhr</h2>
			</div>
			<div class="col-md-3">
				<h2>Consumo de las últimas 12 horas</h2>
				<div>
					<linechart data="consumos" options="options" width="500"
						height="300"></linechart>
				</div>
			</div>
			<div class="col-md-3">
			  <canvas class="gauge" id="demanda" canvasid="demanda" value="demanda" max="40" min="0" unit="kWhr" title="Demanda Eléctrica">
                </canvas>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div>{{lastRefresh | date: 'yyyy/MM/dd hh:mm:ss'}}</div>
				<div ng-repeat="(key,data) in ArrayEquipos" class="col-md-2"
					style="display: inline-block">
					<!-- 		<div ng-include="'/realtime/resources/templates/directives/'+ key.trim().replace(' ','') +'.html'"></div> -->
					<table class="table table-condensed table-striped">
						<thead>
							<tr>
								<th colspan="5">{{key}}</th>
							</tr>
						</thead>
						<tr ng-repeat="v in data">
							<td>{{v.componente}}</td>
							<td><a my-tooltip ng-click="click()" data="v.lastMinute"
								label="{{v.variable}}" href> {{v.variable}} <span></span>
							</a></td>
							<td>
								<div class="circle" ng-style="{'background-color': getColor(v)}"></div>
							</td>
							<td>{{v.tagvalue | number :2 }}</td>
							<td ng-style="{color: v.diff < 0 ? 'red':'green'}">{{v.diff
								| number:2}}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
