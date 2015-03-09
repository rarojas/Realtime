<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:Master>
	<jsp:attribute name="title">Resumen de Sitios</jsp:attribute>
	<jsp:attribute name="controller">MainCtrl</jsp:attribute>
	<jsp:attribute name="app">Resumen</jsp:attribute>
	<jsp:attribute name="header">
	<script src="<c:url value="/resources/js/appResumen/app.js" />"></script>
	</jsp:attribute>
	<jsp:body>
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
						<td class="text-right">{{c.consumo | number : 2}} KWHR</td>
						<td class="text-right"><span ng-style="{color: c.fp < 0.9 ? 'red':'green' }">{{c.fp | number : 2}}</span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12"></div>
	</div>
	</jsp:body>
</t:Master>