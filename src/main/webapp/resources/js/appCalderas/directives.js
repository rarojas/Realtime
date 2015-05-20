app.factory("CalderaService", function($resource) {
	var apiUrl = "api/calderas"
	return {
		Calderas : $resource("api/calderas/:id", {}, {
			Suministro : {
				url : apiUrl + '/suministro/:idsitio'
			},
			Demanda : {
				url : apiUrl + '/demanda/:idsitio',
				isArray : true
			},
			Values : {
				url : apiUrl + '/values'
			},
		})
	};
});


app.directive('secuencia', function() {
	return {
		templateUrl : 'resources/templates/directives/Calderas/Secuencia.html',
		restrict : "AEC",
		scope : {
			id : "@"
			,data:"="	
		},
		link : function(scope, element, attrs, controller) {
		},
		controller : function($scope, $interval, CalderaService) {
		}
	};
});

app.directive('suministro', function() {
	return {
		templateUrl : 'resources/templates/directives/Calderas/Suministro.html',
		restrict : "AEC",
		scope : {
			id : "@",
			data:"="
		},		
		controller : function($scope, $interval, CalderaService) {
			console.log($scope.data);
			$scope.getData = function() {
				CalderaService.Calderas.Suministro({
					idsitio : 'UBC0000014'
				}, function(response) {
					$scope.suministro = response;
				});
			};
			$scope.getData();
			$interval($scope.getData, 5000);
		}
	};
});

app.directive('semaforo', function() {
	return {
		templateUrl : 'resources/templates/directives/Calderas/Semaforo.html',
		restrict : "AEC",
		scope : {
			variable : "@"
		},
		link : function(scope, element, attrs, controller) {
		},
		controller : function($scope, $interval) {
			$scope.getColor = function(row) {
				if (row.tagvalue < row.umbral01) return 'red';
				if (row.tagvalue >= row.umbral01 && row.tagvalue < row.umbral02)
					return 'yellow';
				if (row.tagvalue >= row.umbral02 && row.tagvalue < row.umbral03)
					return 'green';
				if (row.tagvalue >= row.umbral03 && row.tagvalue < row.umbral04)
					return 'yellow';
				if (row.tagvalue >= row.umbral04 && row.tagvalue < row.umbral05)
					return 'red';
				return 'purple';
			};
		}
	};
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
			scope.x = scope.canvas.width / 2;
			scope.canvas.height = scope.x;
			scope.y = scope.canvas.height;
			scope.radius = scope.x / 2;
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
						- (5 * $scope.title.length), 30);
				$scope.context.beginPath();
				$scope.context.arc($scope.x, $scope.y, $scope.radius,
						$scope.startAngle, $scope.endAngle, $scope.counterClockwise);
				$scope.context.lineWidth = $scope.x;
				var grd = $scope.context.createLinearGradient(0, $scope.y,
						$scope.canvas.width - 30, 30);
				grd.addColorStop(0, '#77bc1f');
				grd.addColorStop(1, '#e2231a');
				$scope.context.strokeStyle = grd;
				$scope.context.stroke();
				
				$scope.context.beginPath();
				$scope.context.arc($scope.x, $scope.y, $scope.radius / 2,
						$scope.startAngle, $scope.endAngle, $scope.counterClockwise);
				$scope.context.lineWidth = $scope.radius;
				$scope.context.strokeStyle = "#344251";
				$scope.context.stroke();
				
				$scope.context.fillStyle = '#fff';
				$scope.context.font = "15px GloberBook";
				$scope.context.textBaseline = 'bottom';
				$scope.context.fillText($scope.rendervalue.toFixed(2) + ' '
						+ $scope.unit, $scope.x * 0.8, $scope.y);
				var range = $scope.max;
				var centerT = pointCircle({
					x : $scope.x,
					y : $scope.y
				}, $scope.radius, Math.PI * (-0.5 - ($scope.rendervalue / range)));
						$scope.context.save();
				$scope.context.translate(centerT.x, centerT.y);
				$scope.context.fillStyle = "#fff";
				$scope.context.rotate(Math.PI * (+0.5 + ($scope.rendervalue / range)));
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
					}, $scope.x * 0.85, Math.PI * (-0.5 - (j / 8)));
					$scope.context.save();
					$scope.context.translate(center.x, center.y);
					$scope.context.rotate(Math.PI * (-0.5 + (j / 8)));
					$scope.context.beginPath();
					$scope.context.fillStyle = "#fff";
					$scope.context.font = "12px GloberBook";
					$scope.context.textBaseline = 'middle';
					if (j === 0)
						$scope.context.fillText(j === 0 ? 0 : ((range * j) / 8).toFixed(1),
								2, -5);
					else if (j === 8)
						$scope.context.fillText(j === 0 ? 0 : ((range * j) / 8).toFixed(1),
								-12, -5);
					else
						$scope.context.fillText(j === 0 ? 0 : ((range * j) / 8).toFixed(1),
								-10, -5);
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


app.directive(
				'viewlocation',
				function() {
					return {
						template : '<button class="btn btn-primary" ng-click="ViewMap()"><i class="fa fa-map-marker fa-2x"></i></button>',
						restrict : "AEC",
						replace:true,
						transclude: true,
						scope : {
							data : "="
						},
						controller : function($scope, $interval, $modal) {
							$scope.ViewMap = function() {
								var modalInstance = $modal
										.open({
											size : 'lg',
											backdrop : 'static',
											templateUrl : '/realtime/resources/templates/directives/ViewMap.html',
											resolve : {
												center : function() {
													return [ $scope.data ];
												}
											},
											controller : function($scope,
													center, $timeout,
													$modalInstance) {
												$scope.sitios = center;
												$scope.sitio = center[0];
												$scope.close = function() {
													$modalInstance.close();
												}
												$scope.optionsMaps = {
													map : {
														center : new google.maps.LatLng(
																center[0].lat,
																center[0].log),
														zoom : 6,
														mapTypeId : google.maps.MapTypeId.ROADMAP
													}
												};
												$timeout(
														function() {
															$scope.optionsMaps.map.center = new google.maps.LatLng(
																	center[0].lat,
																	center[0].log);
															$scope
																	.$broadcast(
																			'gmMapResize',
																			'MapSitios');
														}, 100);
												$scope.triggerOpenInfoWindow = function(
														sitio) {
													$scope.markerEvents = [
															{
																event : 'openinfowindow',
																ids : [ sitio.nombresitio ]
															}, ];
												};
											}
										});
							};
						}
					};
				});