var app = angular.module("Plantas", [ 'ngResource', 'ngRoute', 'ui.bootstrap',
		'AngularGM', "angular-loading-bar", 'blockUI' ]);

app.config(function(blockUIConfig) {
	blockUIConfig.requestFilter = function(config) {
		if (!config.block)
			return false
	};
});

app.config(function($routeProvider, $locationProvider) {
	$routeProvider.when('/', {
		controller : 'MainCtrl',
		templateUrl : 'resources/templates/Plantas/Plantas.html',
	}).when('/:idequipo', {
		templateUrl : 'resources/templates/Plantas/Planta.html',
		controller : 'PlantaCtrl'
	});
});

app.factory("PlantaServices", function($resource) {
	var urlApi = "api/Plantas"
	return {
		Plantas : $resource(urlApi, {}, {
			'query' : {
				method : 'GET',
				isArray : true,
				block : true
			},
			GetValues : {
				url : urlApi + "/GetValues/:idequipo"
			},
			GetSitioInfo : {
				url : urlApi + "/Sitio/:idequipo",
				block : true
			},
		})
	};
});

app.controller("MainCtrl", function($scope, PlantaServices) {
	$scope.plantas = PlantaServices.Plantas.query();
});

app.directive("linegraph", function() {
	return {
		restrict : 'AEC',
		scope : {
			interval : "=",
			idsitio : "@",
			title : "@"
		},
		link : function(scope, element, attrs, controller) {
			$(element).highcharts({
				chart : {
					zoomType : 'x'
				},
				title : {
					text : scope.title
				},
				xAxis : {
					type : 'datetime',
					title : {
						text : 'Fecha'
					}
				},
				yAxis : {
					title : {
						text : 'Demanda (KW)'
					},
					min : 0
				},
				tooltip : {
					headerFormat : '<b>{series.name}</b><br>',
					pointFormat : '{point.x:%e %b  %H:%M}: {point.y:.2f} KW'
				},
				plotOptions : {
					spline : {
						marker : {
							enabled : true
						}
					}
				},
				series : [ {
					name : 'Demanda',
					data : []
				} ]
			});
			scope.chart = $(element).highcharts();
			;
		},
		controller : function($scope, $interval, $timeout, CalderaService) {
			CalderaService.Calderas.Demanda({
				idsitio : $scope.idsitio
			}, function(response) {
				angular.forEach(response, function(item) {
					$scope.chart.series[0].addPoint([ item.tagtimestamp,
							item.value ], false);
				});
				$scope.chart.redraw();
			});

		}
	};
});

app.directive("plantainfo", function() {
	return {
		restrict : 'AEC',
		replace : true,
		templateUrl : 'resources/templates/Plantas/PlantaInfo.html',
		scope : {
			planta : "="
		},
		controller : function($scope, PlantaServices, $interval) {
			$scope.getData = function() {
				PlantaServices.Plantas.GetValues({
					idequipo : $scope.planta.idequipo
				}, function(response) {
					$scope.planta.data = response;
				});
			}
			$scope.getData();
			$scope.poller = $interval($scope.getData, 5000);
			$scope.$on("$destroy", function() {
				$interval.cancel($scope.poller);
			});
		},
		link : function(scope, element, attrs, controller) {

		}
	}
})

app.controller("PlantaCtrl", function($scope, PlantaServices, $routeParams,
		$interval) {
	$scope.planta = {
		id : 1,
		on : false
	};
	$scope.GetData = function() {
		PlantaServices.Plantas.GetValues({
			idequipo : $routeParams.idequipo
		}, function(response) {
			$scope.data = response;
		});
	};
	$scope.GetSitio = function() {
		$scope.sitio = PlantaServices.Plantas.GetSitioInfo({
			idequipo : $routeParams.idequipo
		});
		$scope.center = {
			lat : $scope.sitio.gpslatitud,
			log : $scope.sitio.gpslongitud,
		};
	};

	$scope.GetData();
	$scope.GetSitio();
	$scope.changeState = function() {
		$scope.locked = !$scope.locked;
	};

	$scope.locked = true;
	$scope.poller = $interval(function() {
		$scope.GetData();
	}, 5000);

	$scope.$on("$destroy", function() {
		$interval.cancel($scope.poller);
	});

});