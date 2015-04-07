<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html ng-app="Realtime">
<head>
<title>Tablero en tiempo Real de Sitios</title>
<link href="<c:url value="/resources/css/estilos.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/js/twitter-bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/js/tether/css/tether.css" />"
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
<!--<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>-->
<script src="<c:url value="/resources/js/jquery/jquery-2.1.3.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="/resources/js/jquery/jquery-ui.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery/css/jquery-ui.css"/>">


<script src="<c:url value="/resources/js/Chart.js/Chart.min.js" />"></script>
<!--<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>-->
<script src="<c:url value="/resources/js/d3.v3/d3.v3.min.js"/>"></script>
<script src="<c:url value="/resources/js/angularjs/angular.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angular-loading-bar/loading-bar.min.js" />"></script>
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
<script
	src="<c:url value="/resources/js/tc-angular-chartjs/tc-angular-chartjs.min.js" />"></script>

<script
	src="<c:url value="/resources/js/angular-bootstrap/ui-bootstrap-tpls-0.13.0.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angular-bootstrap/ui-bootstrap-0.13.0.min.js" />"></script>


<script src="//maps.googleapis.com/maps/api/js?sensor=false/"></script>
<!--<script src="//dylanfprice.github.io/angular-gm/1.0.0/angular-gm.min.js"></script>-->

<script src="<c:url value="/resources/js/angularjs/angular-gm.min.js"/>"></script>
<script
	src="<c:url value="/resources/js/angular-blockui/angular-block-ui.min.js" />"></script>
<script
	src="<c:url value="/resources/js/angular-bootstrap/ui-bootstrap-tpls-0.13.0.min.js" />"></script>

<style>
.tc-chart-js-legend li span {
	width: 15px;
	height: 15px;
	display: block;
	float: left;
	margin-right: 10px;
}

.tc-chartjs-doughnut {
	float: left;
}

.tc-chart-js-legend {
	list-style-type: none;
	padding-left: 0px;
	text-align: left;
	float: left;
}
.circle {
	border-radius: 50%;
	width: 10px;
	height: 10px;
	/* width and height can be anything, as long as they're equal */
}

div.ui-tooltip {
    max-width: 100%;
    style="vertical-align: middle"
    }
</style>

<script type="text/javascript">
$(document).ready(function(){
	$( "span#showHideInformacion" ).on("mouseenter", function() {
		$("#datosGeneralesMenu").tooltip({
			items: "#datosGeneralesMenu", 
			content: $("#informacionTabla").html(),
			position: { 
				my: "center bottom-20",
	        	at: "center top",
				}
		});
		$("#datosGeneralesMenu").tooltip("open");
	  }).on( "mouseleave", function() {
		  $("#datosGeneralesMenu").tooltip("destroy");
	  });
});
</script>
</head>
<body ng-controller="MainCtrl">
	<table border="0" style="width: 100%; background-color: #445465; font-family: Calibri,Candara,Segoe,Segoe UI,Optima,Arial,sans-serif;">
		<tr style="width: 100%;">
		
		
			<td width="280px" align="center"><img alt="" width="150px;" height="65px"
				src="/realtime/resources/img/logos/LogoSelmec.jpg /"></td>
			<td width="855px" align="center">
			
			
				<div id="informacionSitio" class="informacionSitio">
					<table style="width: 80%; background-color: #445465;">
						<tr>
							<td height="10px"></td>
						</tr>					
						<tr style="">
							<td align="center" height="10px"><span><font
									color="#FFFFFF" size="5">{{sitio.nombresitio}}</font></span> <span><font
									color="#69BE28" size="5">|</font></span> <span><font
									color="#69BE28" size="5">{{sitio.clasificacionsitio}}</font></span></td>
							<td align="right"><font color="#FFFFFF" size="5" class="ng-binding">&nbsp;&nbsp;&nbsp;MARZO 2015</font></td>
						</tr>
						
						
						<tr>
							<td height="10px" align="center">
								<!-- <iframe src="http://free.timeanddate.com/clock/i4ieo7my/n155/tlmx4/fs12/tcff9/pc9f0/tt0/th1/tb1" frameborder="0" width="245" height="16"></iframe>
								<iframe>-->
									<!--src="http://free.timeanddate.com/clock/i4ieqff1/n155/tlmx4/fs12/tt0/th1"
									frameborder="0" width="245" height="16"></iframe>-->
							</td>
						</tr>
					</table>
				</div>
			</td>					
		<td width="200px" align="right" style="background-color: white;"><img alt=""
				ng-src="/realtime/resources/img/logos/{{sitio.idcliente}}.png"
				ng-show="sitio !== undefined">		
		</td>
		<td width="16px;" style="background-color: white;"></td>
		</tr>
	</table>
	
	
	<table class="tabla" style="width: 100%; background: transparent; font-family: Calibri,Candara,Segoe,Segoe UI,Optima,Arial,sans-serif;">
		<tr>
			<td style="height: 1px;">
			</td>
		</tr>
		
	<tr style="width: 300px;">
			<td align="left" width="115px">
				<div style="width: 115px;" align="left">
				<br>
					<span id="showHideInformacion" class="titulo-tabla">
						<div id="datosGeneralesMenu" style="width: 115px; cursor: pointer; color: rgb(105, 190, 40);">&nbsp;&nbsp;&nbsp;Datos Generales</div>
					</span>
				</div>
			</td>
			
			
			
				<td align="center" width="10px">
				<div style="width: 10px;" align="center" class="titulo-tabla">
				<br>
				|
				</div>
			</td>
			
			
			
			
			<td align="left" width="115px">
				<div style="width: 360px;" align="left">
				<br>
				<select ng-options="c.idsitio as c.nombresitio for c in Sitios"
											class="form-control" ng-disable="form.idcliente == null"
											ng-model="form.idsitio" name="sitios">
					<option value="" disabled selected>Sitios</option>
				</select>
				</div>
			</td>
			
			
			<td width="100%" align="right" style="background-color: white;">
				<table style="width: 100%; height: 38px; vertical-align: middle; background: transparent;">
					<tr>
						<td width="100%" height="38px"></td>
					    <td align="right" width="115px" height="30px"><button style="width: 115px; height: 30px; background-color: #344251; color: white; font-size: 12px; border: none;" ng-click="ViewMap()" type="button">UBICACI&Oacute;N</button></td>
						
					</tr>
				</table>
			</td>
			<td width="15px" style="background-color: white;">
			</td>
		</tr>
		
		
		
		
		<tr>
			<td width="701px" style="background-color: white;">
				
			</td>
			<td width="15px" style="background-color: white;">
			</td>
		</tr>
	</table>
			
	 	<!--  <tr>
			<td colspan="4" height="8px"></td>
		</tr>-->
		
	<div class="tabla" id="informacionTabla" style="display: none;">
		<table class="tabla" style="width: 100%;">
			<tr>
				<td width="400px" align="center">
					<table class="tabla" border="0" style="width: 350px;">
						<tr style="width: 100%">
							<td class="campo-tabla">Cliente:</td>
							<td class="campo-tabla-propiedad" style="width: 80%">
								{{DatosGenerales.cliente}}</td>
						</tr>
						<tr>
							<td class="campo-tabla">Regi&oacute;n:</td>
							<td class="campo-tabla-propiedad">
								{{DatosGenerales.zonaregion}}</td>
						</tr>					
						<tr>
							<td class="campo-tabla">Sitio:</td>
							<td class="campo-tabla-propiedad">
								{{DatosGenerales.nombresitio}}</td>
						</tr>
						<tr>
							<td class="campo-tabla">IP:</td>
							<td class="campo-tabla-propiedad">
								{{DatosGenerales.iprouter}}</td>
						</tr>
					</table>
					
				<td width="500px" align="center">
					<div>
						<table class="tabla" border="0" style="width: 90%;">
							<tr>
								<td style="width: 100px" class="campo-tabla">Responsable:</td>
								<td class="campo-tabla-propiedad">
									{{DatosGenerales.nombrecontacto}}</td>
							</tr>
							<tr>
								<td class="campo-tabla">Telefono:</td>
								<td class="campo-tabla-propiedad">
									{{DatosGenerales.telefono}}</td>
							</tr>
							<tr>
								<td class="campo-tabla">Puesto:</td>
								<td class="campo-tabla-propiedad">{{DatosGenerales.puesto}}
								</td>
							</tr>
							<tr>
								<td class="campo-tabla">Correo:</td>
								<td class="campo-tabla-propiedad">{{DatosGenerales.correo}}
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td width="80px"></td>
				<td width="" align="center">
				</td>
			</tr>
		</table>
	</div>							
	<br>
		<div class="col-md-12" style="font-family: Calibri,Candara,Segoe,Segoe UI,Optima,Arial,sans-serif;">
		<fieldset>
			<legend style="font-family: Calibri,Candara,Segoe,Segoe UI,Optima,Arial,sans-serif; color: rgb(105, 190, 40); font-weight: bold;">Tablero en Tiempo Real</legend>
			<table width="100%" cellspacing="0" cellpadding="0" align="center" border="0" style="padding-top: 5px; background-color: transparent;">      
			    <tr>
			       <td align="center">
			       	 <table width="70%" style="background-color: transparent;">
			          	<tr>
		                    <td>
								<div align="center">
									<table border="0" align="center" cellpadding="3" cellspacing="3" width="100%" style="background-color: transparent;">
										<tr>
											<td id="pintarDiagrama" width="100%" class="login" align="center">
												
											</td>			
										</tr>
									</table>		
								</div>
		                    </td> 
		                </tr>
		               </table> 
			        </td>
			    </tr>
		</table>
		</fieldset>
				<div class="col-md-6 text-right"></div>
	</div>	
	<table class="row" style="width: 100%">
		<tr align="center">
			<td>
				<h2>Consumo de las últimas 12 horas</h2>
			</td>
			<td>
				<h2>Demanda Eléctrica</h2>
			</td>
			<td>
				<h2>Distribución de demandas</h2>
			</td>
		</tr>
		<tr align="center">
			<td width="400px">
				<table style="width: 100%">
					<tr>
						<td class="col-md-3 text-center">
							<div>
								<linechart data="consumos" options="options"></linechart>
							</div>
						</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">
							<h2></h2>
						</td>
					</tr>
				</table>
			</td>
			<td width="200px" align="center">
				<div class="row">
					<div class="col-md-12 text-center">
						<canvas class="gauge" id="demanda" canvasid="demanda"
							value="demanda" max="50" min="0" unit="kW" title="" width="200%">
				                </canvas>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h3>Consumo del Sitio {{ConsumoSitio.consumo | number : 2 }}
							kWhr</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h3>Del periodo {{ConsumoSitio.inicio | date :'dd/MM/yyyy'}}
							a {{ ConsumoSitio.now | date :'dd/MM/yyyy' }}</h3>
					</div>
				</div>
			</td>
			<td width="400px">
				<div class="col-md-3" style="width: 100%">
					<canvas class="tc-chartjs-doughnut" tc-chartjs-doughnut
						chart-options="optionsDemandas" chart-data="demandas" auto-legend></canvas>
				</div>
			</td>
		</tr>
	</table>
	<br>
	<div class="row">
		<div class="col-md-12"
			style="vertical-align: middle; background-color: #F5F5F5;"
			align="center">

			<div style="font-weight: bold;" align="left">
				<font color="#445465" size="4">Informaci&oacute;n en tiempo
					real</font>
			</div>
			<!-- <div align="left">{{lastRefresh | date: 'yyyy/MM/dd hh:mm:ss'}}</div> -->
			<div ng-repeat="(key,data) in ArrayEquipos"
				style="display: inline-block; margin: 20px;" align="center">
				<!-- display: inline-block;   -->
				<!-- 		<div ng-include="'/realtime/resources/templates/directives/'+ key.trim().replace(' ','') +'.html'"></div> -->
				<table class="table table-condensed table-striped" border="0"
					style="border-botto<!-- </div> -->m: 10px; width: 300px; vertical-align: top; text-align: left; display: inline; margin: 20px; border-spacing: 20px;">
					<thead>
						<tr>
							<td colspan="1" class="campo-tabla-equipos" align="center">
								<img alt="" src="/realtime/resources/img/icons/Equipos/Acometida_icon.png"
								width="50px" ng-show="key.indexOf('ACOMETIDA') == 0"> <img
								alt=""
								src="/realtime/resources/img/icons/Equipos/AireAcondicionado_icon.png/"
								width="50px"
								ng-show="key.indexOf('AIRE') == 0 || key.indexOf('MINI') == 0 || key.indexOf('CUARTO') == 0">
								<img alt=""
								src="/realtime/resources/img/icons/Equipos/BancoDeBaterias_icon.png"
								width="50px" ng-show="key.indexOf('BANCO') == 0">
								<img alt=""
								src="/realtime/resources/img/icons/Equipos/AireAcondicionado_icon.png"
								width="50px"
								ng-show="key.indexOf('CONDICIONES AMBIENTALES') == 0"> <img
								alt="" src="/realtime/resources/img/icons/Equipos/PlantaDeCD_icon.png"
								width="50px" ng-show="key.indexOf('PLANTA DE CD') == 0"> <img
								alt=""
								src="/realtime/resources/img/icons/Equipos/energiaElectrica_icon.png"
								width="50px" ng-show="key.indexOf('ILUMINACION') == 0"> <img
								alt="" src="/realtime/resources/img/icons/Equipos/UPS_icon.png"
								width="50px" ng-show="key.indexOf('UPS') == 0"> <img
								alt=""
								src="/realtime/resources/img/icons/Equipos/PlantaDeEmergencia_icon.png"
								width="50px" ng-show="key.indexOf('PLANTA DE EMERGENCIA') == 0">
								<img alt="" src="/realtime/resources/img/icons/Equipos/Router_icon.png"
								width="50px" ng-show="key.indexOf('ROUTER') == 0">
							</td>
							<td class="campo-tabla-equipos" colspan="5">{{key}}</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="1" class="campo-tabla-equipos">Componente</td>
							<td colspan="1" class="campo-tabla-equipos">Variable</td>
							<td colspan="1" class="campo-tabla-equipos"></td>
							<td colspan="1" class="campo-tabla-equipos">Valor</td>
							<td colspan="1" class="campo-tabla-equipos">Unidad de Medida</td>
							<td colspan="1" class="campo-tabla-equipos"></td>
						</tr>
					</thead>
					<tr ng-repeat="v in data ">
						<td width="90px">{{v.componente}}</td>
						<td width="90px"><a my-tooltip ng-click="click()"
							data="v.lastMinute" label="{{v.variable}}" href>
								{{v.variable}} <span></span>
						</a></td>
						<td width="20px" align="center">
							<div class="circle" ng-style="{'background-color': getColor(v)}"></div>
						</td>
						<td align="right" width="50px">{{v.tagvalue | number :2 }}</td>
						<td align="right" width="50px">{{ UnidadMedida(v.variable) }}</td>
						<td align="right" width="50px"
							ng-style="{color: v.diff < 0 ? 'red':'green'}">{{v.diff |
							number:2}}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>