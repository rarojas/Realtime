var app = angular.module("Realtime",["ngResource", "ngRoute", 'n3-line-chart','tc.chartjs','angular-loading-bar']);

// app.directive(
// 'myTooltip',
// function($tooltip) {
// return {
// restrict : 'EA',
// scope : {
// data : "=",
// label : "@",
// },
// controller : function($scope) {
// console.log($scope.data);
// $scope.show = false;
// $scope.options = {
// series : [ {
// y : "tagvalue",
// label : $scope.label,
// color : "#ff0000",
// type : "line",
// thickness : "1px"
// }, ],
// axes : {
// x : {
// type : "linear",
// key : "x"
// },
// y : {
// type : "linear"
// },
// },
// lineMode : "bundle",
// tension : 0.7,
// tooltip : {
// mode : "scrubber"
// },
// drawLegend : true,
// drawDots : true,
// columnsHGap : 5
// }
// },
// link : function(scope, elem) {
// var tooltip = $tooltip({
// target : elem,
// scope : scope,
// template : '<div><h1>Last Minute</h1><linechart data="data" options="options"
// width="500" height="300"></linechart></div>'
// });
// elem.on("click", function() {
// if (scope.show)
// scope.show = false;
// else
// scope.show = true;
// });
// scope.$watch('show', function(value) {
// if (value) {
// tooltip.open();
// } else {
// tooltip.close();
// }
// })
// }
// };
// });

app.factory("RTServices", function($resource) {
	var api = {};
	api.Equipos = $resource("/realtime/Equipos", {}, {});
	api.Clientes = $resource("/realtime/Clientes", {}, {});
	api.Sitios = $resource("/realtime/sitios/:idcliente", {}, {
		SitioEquipos : {
			url : "/realtime/sitios/Equipos/:idsitio",
			isArray : true
		},
		ConsumoSitioLast12 : {
			url : "/realtime/sitio/consumolast12/:sitio",
			isArray : true
		},
		DatosGenerales : {
			url : "/realtime/sitio/DatosGenerales/:idsitio",
			isArray : true
		},
		ConsumoSitio : {
			url : "/realtime/sitio/consumo/:sitio",
			isArray : false
		}
	});
	return api;
});
app
		.controller(
				"MainCtrl",
				function($scope, RTServices, $interval, $filter) {
					
					$scope.mostrar = false;
					
					$scope.ExpandCollapse = function(){
						//alert("$scope.mostrar" + $scope.mostrar);
						if($scope.mostrar){
							$scope.mostrar = false;
						}else{
							$scope.mostrar = true;
						}
						
					};
					
					$scope.validarImagen = function(key){
						//alert("key: " + key);
						var descripcion = key;
						if(descripcion.contains('AIRE')){
							alert("Continene aire");
							return false;
						}else {
							return true;
						}
					};
					
					
					$scope.Clientes = RTServices.Clientes.query();
					$scope.Equipos = [];
					$scope.consumos = [];
					$scope.demandas = [];
					$scope.demanda = 0;
					$scope.getSitio = function(idsitio) {
						return $filter("filter")($scope.Sitios, function(item) {
							return item.idsitio === idsitio;
						}, true)[0];
					};
					$scope.colors = [{color:"#F7464A",highlight:"#FF5A5E"},
					                 {color:"#46BFBD",highlight:"#5AD3D1"},
					                 {color:"#FDB45C",highlight:"#FFC870"},
					                 {color:"#949FB1",highlight:"#A8B3C5"},
					                 {color:"#4D5360",highlight:"#616774"},
					                 {color:"#F7464A",highlight:"#FF5A5E"},
					                 {color:"#46BFBD",highlight:"#5AD3D1"},
					                 {color:"#FDB45C",highlight:"#FFC870"},
					                 {color:"#949FB1",highlight:"#A8B3C5"},
					                 {color:"#4D5360",highlight:"#616774"},
					                 {color:"#F7464A",highlight:"#FF5A5E"},
					                 {color:"#46BFBD",highlight:"#5AD3D1"},
					                 {color:"#FDB45C",highlight:"#FFC870"},
					                 {color:"#949FB1",highlight:"#A8B3C5"},
					                 {color:"#4D5360",highlight:"#616774"},
					                 {color:"#F7464A",highlight:"#FF5A5E"},
					                 {color:"#46BFBD",highlight:"#5AD3D1"},
					                 {color:"#FDB45C",highlight:"#FFC870"},
					                 {color:"#949FB1",highlight:"#A8B3C5"},
					                 {color:"#4D5360",highlight:"#616774"},
					                 {color:"#4D5360",highlight:"#616774"},
					                 {color:"#F7464A",highlight:"#FF5A5E"},
					                 {color:"#46BFBD",highlight:"#5AD3D1"},
					                 {color:"#FDB45C",highlight:"#FFC870"},
					                 {color:"#949FB1",highlight:"#A8B3C5"},
					                 {color:"#4D5360",highlight:"#616774"},
					                 {color:"#4D5360",highlight:"#616774"},
					                 {color:"#4D5360",highlight:"#616774"},
					                 {color:"#F7464A",highlight:"#FF5A5E"},
					                 {color:"#46BFBD",highlight:"#5AD3D1"},
					                 {color:"#FDB45C",highlight:"#FFC870"},
					                 {color:"#949FB1",highlight:"#A8B3C5"},
					                 {color:"#4D5360",highlight:"#616774"}];

					$scope.optionsDemandas = {
						// Sets the chart to be responsive
						responsive : false,
						// Boolean - Whether we should show a stroke on each
						// segment
						segmentShowStroke : true,
						// String - The colour of each segment stroke
						segmentStrokeColor : '#fff',
						// Number - The width of each segment stroke
						segmentStrokeWidth : 2,
						// Number - The percentage of the chart that we cut out
						// of the middle
						percentageInnerCutout : 50, // This is 0 for Pie charts
						// Number - Amount of animation steps
						animationSteps : 100,
						// String - Animation easing effect
						animationEasing : 'easeOutBounce',
						// Boolean - Whether we animate the rotation of the
						// Doughnut
						animateRotate : true,
						// Boolean - Whether we animate scaling the Doughnut
						// from the centre
						animateScale : false,
						legendTemplate : '<ul class="tc-chart-js-legend"><% for (var i=0; i<segments.length; i++){%><li><span style="background-color:<%=segments[i].fillColor%>"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>'
					};

					$scope.options = {
						series : [ {
							y : "consumo",
							label : "Consumos",
							color : "#ff0000",
							type : "column",
							thickness : "1px"
						} ],
						axes : {
							x : {
								type : "linear",
								key : 'hora',
								labelFunction : function(value) {
									return value + ':00';
								}
							},
							y : {
								type : "linear"
							}
						},
						lineMode : "cardinal",
						tension : 0.7,
						tooltip : {
							mode : "scrubber"
						},
						drawLegend : true,
						drawDots : true,
						columnsHGap : 5
					};
					$scope.$watch("form.idcliente",
							function(newValue, oldValue) {
								$scope.Sitios = RTServices.Sitios.query({
									idcliente : newValue
								});
							});
					$scope.getColor = function(row) {
						if (row.tagvalue < row.umbral01)
							return 'red';
						if (row.tagvalue > row.umbral01
								&& row.tagvalue < row.umbral02)
							return 'yellow';
						if (row.tagvalue > row.umbral02
								&& row.tagvalue < row.umbral03)
							return 'green';
						if (row.tagvalue > row.umbral03
								&& row.tagvalue < row.umbral04)
							return 'yellow';
						if (row.tagvalue > row.umbral04
								&& row.tagvalue < row.umbral05)
							return 'red';
						return 'purple';
					};
					$scope.$watch("form.idsitio",
									function(newValue) {
										if (!newValue)
											return;
										$scope.Equipos = [];
										$scope.sitio = $scope.getSitio(newValue);										
										RTServices.Sitios.DatosGenerales({idsitio : $scope.sitio.idsitio},function(response){
											$scope.DatosGenerales = response[0];																						
										});
										RTServices.Sitios
												.ConsumoSitio(
														{
															sitio : $scope.sitio.nombresitio
														},
														function(response) {
															$scope.ConsumoSitio = response.consumo;
														});
										RTServices.Sitios.ConsumoSitioLast12({
											sitio : $scope.sitio.nombresitio
										}, function(response) {
											$scope.consumos = response;
										});
										if ($scope.timer)
											$interval.cancel($scope.timer);
										$scope.timer = $interval(
												function() {
													RTServices.Sitios
															.SitioEquipos(
																	{
																		idsitio : newValue
																	},
																	function(
																			data) {
																		if ($scope.Equipos.length > 0) {
																			$scope.demandas = [];
																			for (var i = 0; i < data.length; i++) {
//																				if (!$scope.Equipos[i].lastMinute)
//																					$scope.Equipos[i].lastMinute = [];
																				$scope.Equipos[i].diff = $scope.Equipos[i].tagvalue
																						- data[i].tagvalue;
																				$scope.Equipos[i].tagvalue = data[i].tagvalue;
																				if (data[i].variable === 'DEMANDA') {
																					if (data[i].nombreequipo === 'ACOMETIDA')
																						$scope.demanda = data[i].tagvalue;
																					else
																						$scope.demandas
																								.push({
																									nombreequipo : data[i].nombreequipo,
																									tagvalue : data[i].tagvalue,
																									value :data[i].tagvalue,
																									label: data[i].nombreequipo,
																									color: $scope.colors[$scope.demandas.length].color,
																									highlight: $scope.colors[$scope.demandas.length].highlight
																								});

																				}
																			}
																		} else {
																			$scope.Equipos = data;
																		}
																		$scope.lastRefresh = new Date();
																		$scope.ArrayEquipos = _
																				.groupBy(
																						$scope.Equipos,
																						"nombreequipo");
																	});
												}, 5000);
									});
				});

app.directive('gauge', function() {
	return {
		restrict : "AEC",
		scope : {
			canvasid : "@",
			value : "=",
			max : "=",
			min : "=",
			unit : "@",
			title : "@"
		},
		link : function(scope, element, attrs, controller) {
			scope.canvas = document.getElementById(attrs.canvasid);
			scope.context = scope.canvas.getContext('2d');
			scope.x = 100;
			scope.y = scope.canvas.height;
			scope.radius = 75;
			scope.startAngle = 1 * Math.PI;
			scope.endAngle = 2 * Math.PI;
			scope.counterClockwise = false;
			scope.rendervalue = 0;
			scope.lastValue = 0;
		},
		controller : function($scope) {
			var pointCircle = function(point, distance, angle) {
				return {
					x : point.x + (Math.sin(angle) * distance),
					y : point.y + (Math.cos(angle) * distance)
				};
			};
			$scope.draw = function() {
				$scope.canvas.width = $scope.canvas.width;
				$scope.context.font = "20px GloberBook";
				$scope.context.textBaseline = 'center';
				$scope.context.fillText($scope.title, $scope.x
						- (4.5 * $scope.title.length), 30);
				$scope.context.beginPath();
				$scope.context.arc($scope.x, $scope.y, $scope.radius,
						$scope.startAngle, $scope.endAngle,
						$scope.counterClockwise);
				$scope.context.lineWidth = 45;
				var grd = $scope.context.createLinearGradient(0, $scope.y,
						$scope.canvas.width - 30, 30);
				grd.addColorStop(0, '#77bc1f');
				grd.addColorStop(1, '#e2231a');
				$scope.context.strokeStyle = grd;
				$scope.context.stroke();

				$scope.context.beginPath();
				$scope.context.arc($scope.x, $scope.y, 23, $scope.startAngle,
						$scope.endAngle, $scope.counterClockwise);
				$scope.context.lineWidth = 46;
				$scope.context.strokeStyle = "#344251";
				$scope.context.stroke();

				$scope.context.fillStyle = '#fff';
				$scope.context.font = "15px GloberBook";
				$scope.context.textBaseline = 'bottom';
				$scope.context.fillText($scope.rendervalue.toFixed(2) + ' '
						+ $scope.unit, $scope.x - 33, $scope.y);
				var range = $scope.max;
				var centerT = pointCircle({
					x : $scope.x,
					y : $scope.y
				}, 47, Math.PI * (-0.5 - ($scope.rendervalue / range)));
				$scope.context.save();
				$scope.context.translate(centerT.x, centerT.y);
				$scope.context.fillStyle = "#fff";
				$scope.context.rotate(Math.PI
						* (+0.5 + ($scope.rendervalue / range)));
				$scope.context.beginPath();
				$scope.context.moveTo(0, 15);
				$scope.context.lineTo(-10, 0);
				$scope.context.lineTo(10, 0);
				$scope.context.closePath();
				$scope.context.fill();
				$scope.context.restore();
				for (var j = 0; j < 9; j++) {
					var center = pointCircle({
						x : $scope.x,
						y : $scope.y
					}, 85, Math.PI * (-0.5 - (j / 8)));
					$scope.context.save();
					$scope.context.translate(center.x, center.y);
					$scope.context.rotate(Math.PI * (-0.5 + (j / 8)));
					$scope.context.beginPath();
					$scope.context.fillStyle = "#fff";
					$scope.context.font = "12px GloberBook";
					$scope.context.textBaseline = 'middle';
					if (j === 0)
						$scope.context.fillText(j === 0 ? 0 : ((range * j) / 8)
								.toFixed(1), 2, -5);
					else if (j === 8)
						$scope.context.fillText(j === 0 ? 0 : ((range * j) / 8)
								.toFixed(1), -12, -5);
					else
						$scope.context.fillText(j === 0 ? 0 : ((range * j) / 8)
								.toFixed(1), -10, -5);
					$scope.context.restore();
				}
			};

			$scope.$watch("value", function(val) {
				$scope.lastValue = $scope.value;
				$scope.value = val;
				var delay = 750;
				var diff = val - $scope.lastValue;
				var steps = 200;
				var step = diff / steps;
				var stepDelay = delay / steps;
				value = $scope.lastValue;
				var timer = setInterval(function() {
					$scope.rendervalue += step;
					$scope.draw();
					steps--;
					if (steps === 0) {
						clearInterval(timer);
						setTimeout(function() {
							$scope.rendervalue = parseFloat(val);
							$scope.draw();
						}, 0);
					}
				}, stepDelay);
				$scope.draw();
			});
			$scope.lastRefresh = new Date();
		}
	};
});
