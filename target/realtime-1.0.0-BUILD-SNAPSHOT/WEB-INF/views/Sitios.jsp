<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html ng-app="Realtime">
<head>
<title>Ubicaciones de Sitios</title>
<link
	href="<c:url value="/resources/js/twitter-bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/twitter-bootstrap/css/bootstrap-theme.min.css" />"
	rel="stylesheet" />
<script src="<c:url value="/resources/js/angularjs/angular.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angularjs/angular-resource.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angularjs/angular-route.min.js" />"></script>
<script src="<c:url value="/resources/js/app/sitios.js" />"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.7.0/underscore-min.js"></script>
<script src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="//dylanfprice.github.io/angular-gm/1.0.0/angular-gm.min.js"></script>

</head>
<body ng-controller="SitiosCtrl">
	<div class="container-fluid">
		<h3>Sitios</h3>
		<div class="row">
			<div class="col-md-6">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>Sitio</th>
							<th>Código Postal</th>
							<th>Domicilio</th>
							<th>Latitud</th>
							<th>Longitud</th>
						</tr>
					</thead>
					<tr ng-repeat="s in Sitios">
						<td>{{s.nombresitio}}</td>
						<td>{{s.codigopostal}}</td>
						<td>{{s.domicilio}}</td>
						<td>{{s.gpslatitud}}</td>
						<td>{{s.gpslongitud}}</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6">
				<div gm-info-window="infoWindow">
					<h4>{{selectedSitio.nombresitio}}</h4>
					{{selectedSitio.domicilio}}
				</div>
				<gm-map gm-map-id="'infoWindows'" gm-center="center" gm-zoom="zoom"
					gm-map-options="options.map" class="map"> <gm-markers
					gm-objects="Sitios" gm-id="object.idsitio"
					gm-position="{ lat: object.gpslatitud, lng: object.gpslongitud }"
					gm-marker-options="{ title: object.nombresitio, clickable: true }"
					gm-events="markerEvents"
					gm-on-openinfowindow="selectedSitio = object; infoWindow.open(marker.getMap(), marker);"
					gm-on-click="triggerOpenInfoWindow(object)"> </gm-markers> </gm-map>
			</div>
		</div>
	</div>
</body>
</html>
