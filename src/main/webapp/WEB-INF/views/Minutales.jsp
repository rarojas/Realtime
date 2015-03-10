<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:Master>
	<jsp:attribute name="title">Resumen de Minutales</jsp:attribute>
	<jsp:attribute name="controller">MainCtrl</jsp:attribute>
	<jsp:attribute name="app">Minutales</jsp:attribute>
	<jsp:attribute name="header">
	<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
	<script
			src="<c:url value="/resources/js/twitter-bootstrap/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/sbadmin/js/sb-admin-2.js" />"></script>
	<script
			src="<c:url value="/resources/js/angular-loading-bar/loading-bar.min.js" />"></script>
	<script	src="<c:url value="/resources/js/angularjs/angular-route.min.js" />"></script>
	<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.4.0/lodash.min.js" charset="utf-8"></script>	
	<script
			src="<c:url value="/resources/js/n3-charts/line-chart.min.js" />"></script>
	<script src="<c:url value="/resources/js/appMinutales/app.js" />"></script>
	<script src="http://code.highcharts.com/stock/highstock.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>	
	<script src="<c:url value="/resources/js/angularjs-dropdown/angularjs-dropdown-multiselect.min.js" />"></script>
	<script src="<c:url value="/resources/js/appMinutales/app.js" />"></script>
	</jsp:attribute>	
	<jsp:body>
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
<!-- 								<div class="form-group"> -->
<!-- 									<label>Variables</label> <select class="form-control" -->
<!-- 								name="variable" ng-model="variable" -->
<!-- 								ng-options="v.id as (v.componente + '-' +v.variable) for v in variables | orderBy :'variables'"> -->
<!-- 										<option value="">Variable...</option> -->
<!-- 									</select>									 -->
<!-- 								</div> -->
								<div class="form-group">
									<label>Variables</label> 
								 <div ng-dropdown-multiselect="" options="variables" selected-model="variable1" extra-settings="example4settings" ></div>
								</div>
								<div class="form-group">
									<label>Equipos</label> 
								 <div ng-dropdown-multiselect="" options="equipos" selected-model="equipos1" extra-settings="equipossettings" ></div>
								</div>
								<div class="form-group">
									<label>Inicio</label> <input type="date" ng-model="inicio"
								class="form-control" name="inicio">
								</div>
								<div class="form-group">
									<label>Fin</label> <input type="date" ng-model="fin"
								class="form-control" name="fin">
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-download"></i> Obtener datos
								</button>
							</fieldset>
						</form>
					</div>
				</div>				
				<div class="row">
					<div class="col-lg-12">
						<div id="container" style="height: 400px; min-width: 310px"></div>
					</div>
				</div>					
	</jsp:body>
</t:Master>