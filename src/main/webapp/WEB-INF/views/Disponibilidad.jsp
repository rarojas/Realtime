<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:Master>
	<jsp:attribute name="title">Disponibilidad de Sitios</jsp:attribute>
	<jsp:attribute name="controller">MainCtrl</jsp:attribute>
	<jsp:attribute name="app">Disponibilidad</jsp:attribute>
	<jsp:attribute name="header">	
<script src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="//dylanfprice.github.io/angular-gm/1.0.0/angular-gm.min.js"></script>
	<script src="<c:url value="/resources/js/appDisponibilidad/app.js" />"></script>
	
	</jsp:attribute>
	<jsp:body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Disponibilidad de Sitios</h1>
		</div>
	</div>	
	<div class="row">	
		<div class="col-md-5">
		<table class="table table-condensed">
					<thead>
						<tr>
							<th>Sitio</th>
							<th>Código Postal</th>
							<th>Domicilio</th>
							<th>Latitud</th>
							<th>Longitud</th>
							<th><i class="fa fa-power-off "></i></th>
						</tr>
					</thead>
					<tr ng-repeat="s in sitios">
						<td>{{s.nombresitio}}</td>
						<td>{{s.codigopostal}}</td>
						<td>{{s.domicilio}}</td>
						<td>{{s.gpslatitud}}</td>
						<td>{{s.gpslongitud}}</td>
						<td><div class="circle"
								ng-style="{'background-color': s.disponibilidad ? 'green':'red'}"></div></td>
					</tr>
				</table>
		</div>			
		<div class="col-md-7">
		<div gm-info-window="infoWindow">		
		<h4>{{selectedSitio.nombresitio}}</h4>			
		<span>{{selectedSitio.domicilio}}</span>
		<div>Disponibilidad: <div class="circle" ng-style="{'background-color': selectedSitio.disponibilidad ? 'green':'red'}"></div></div>						
		</div>
		<gm-map gm-map-id="'myMap'" gm-center="options.center" gm-zoom="zoom"
					gm-map-options="options.map" style="width:500px;height:500px;">
                <gm-markers gm-objects="sitios" gm-id="object.idsitio"
					gm-position="{ lat: object.gpslatitud, lng: object.gpslongitud }"
					gm-marker-options="getMarkerOptions(object)"
					gm-events="markerEvents"
					gm-on-openinfowindow="selectedSitio = object; infoWindow.open(marker.getMap(), marker);"
					gm-on-click="triggerOpenInfoWindow(object)">
                </gm-markers>
            </gm-map>                                   
		</div>			
	</div>	
	
	</jsp:body>
</t:Master>