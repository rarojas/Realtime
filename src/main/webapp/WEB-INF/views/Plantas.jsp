<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:Master>
	<jsp:attribute name="title">Monitoreo de Plantas de Emergencia</jsp:attribute>
	<jsp:attribute name="controller">MainCtrl</jsp:attribute>
	<jsp:attribute name="app">Plantas</jsp:attribute>
	<jsp:attribute name="header">	
	<script src="<c:url value="/resources/js/appPlantas/app.js" />"></script>
	<script src="<c:url value="/resources/js/appCalderas/directives.js" />"></script>
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
	</jsp:attribute>
	<jsp:body>		
	<div class="container-fluid">
		<div class="row">	
			<div class="col-md-12">
			 <h2>Monitoreo de Plantas de Emergencia</h2>				
			</div>		
		</div>
		<div class="row" ng-view></div>
	</div>
	</jsp:body>
</t:Master>