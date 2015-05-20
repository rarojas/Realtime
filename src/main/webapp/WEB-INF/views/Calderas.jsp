<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:Master>
	<jsp:attribute name="title">Calderas</jsp:attribute>
	<jsp:attribute name="controller">MainCtrl</jsp:attribute>
	<jsp:attribute name="app">Calderas</jsp:attribute>
	<jsp:attribute name="header">	
	<script src="<c:url value="/resources/js/appCalderas/app.js" />"></script>
	<script src="<c:url value="/resources/js/appCalderas/directives.js" />"></script>
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
	<style>
.circle {
	border-radius: 50%;
	width: 10px;
	height: 10px;
	/* width and height can be anything, as long as they're equal */
}
</style>	
	</jsp:attribute>
	<jsp:body>		
	<div class="container-fluid">
		<div class="row">	
			<div class="col-md-12">
			 <h2>Reporte en tiempo Real de Calderas</h2>				
			</div>
		</div>			
		<div class="row">	
			<div class="col-md-1">	
				<div class="row">
					<div viewlocation data="center"></div>					
				</div>		
			</div>
			<div class="col-md-4 text-center">		
				<img alt="" src="resources/img/icons/caldera.png"
						class="image image-responsive" style="height: 200px">
			</div>
			<div class="col-md-3">
				<div suministro data="data"></div>				
			</div>
			<div class="col-md-3">
				<div secuencia  data="data"></div>				
			</div>
		</div>	
		<div class="row">	
			<div class="col-md-3 text-center col-xs-6">				
				<div class="row">
					<div class="col-md-12">					
					<div class="panel panel-default">
						<div class="panel-heading">Oxígeno</div>
						<canvas class="gauge" id="oxigeno" canvasid="oxigeno" width="150"
									value="data.oxigeno" max="100" min="0" unit="%" title=""></canvas>
						</div>
					</div>
				</div>			
			</div>
			<div class="col-md-3  col-xs-6 text-center">
					<div class="row">
					<div class="col-md-12">					
						<div class="panel panel-default">
							<div class="panel-heading">Modulación</div>								
								<canvas class="gauge" id="modulacion" canvasid="modulacion"
									value="data.modulacion" max="100" min="0" unit="%" title=""
									width="150"></canvas>
								</div>Modulación
						</div>
				</div>			
			</div>
			<div class="col-md-3 col-xs-6 text-center">
					<div class="row">
					<div class="col-md-12">					
						<div class="panel panel-default">
							<div class="panel-heading">Eficiencia</div>	
							<canvas class="gauge" id="eficiencia" canvasid="eficiencia"
									value="data.eficiencia" max="100" min="0" unit="%" title=""
									width="150"></canvas>
							</div>
					</div>
				</div>			
			</div>			
			<div class="col-md-3  text-center col-xs-6">
					<div class="row">
						<div class="col-md-12">					
							<div class="panel panel-default">
								<div class="panel-heading">Demanda</div>	
								w<canvas class="gauge" id="demanda" canvasid="demanda"
									value="data.demanda" max="50" min="0" unit="KW" title=""
									width="150"></canvas>	
						</div>
					</div>					
				</div>
			</div>	
		</div>
		<div class="row">			
			<div class="row">
			<div class="col-md-6">
				<div id="container"
							style="min-width: 310px; height: 400px; margin: 0 auto" linegraph
							idsitio="1000043"
							title="Demanda Electrica de las Ultimas 12 horas"></div>
			</div>
			<div class="col-md-6">
				<div style="min-width: 310px; height: 400px; margin: 0 auto"
							linegraph idsitio="1000029"
							title="Demanda de Vapor de las ultimas 12 horas"></div>
			</div>
					
			</div>
		</div>
	</div>		
	</jsp:body>
</t:Master>