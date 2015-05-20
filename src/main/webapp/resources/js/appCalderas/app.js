var app = angular.module("Calderas", [
		'ngResource', 'ui.bootstrap', 'AngularGM'
]);




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
				title : {	text : scope.title
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
				series : [
					{
						name : 'Demanda',
						data : []
					}
				]
			});
			scope.chart = $(element).highcharts();
			;
		},
		controller : function($scope, $interval, $timeout, CalderaService) {
			CalderaService.Calderas.Demanda({
				idsitio : $scope.idsitio
			}, function(response) {
				angular.forEach(response, function(item) {
					$scope.chart.series[0].addPoint([
							item.tagtimestamp, item.value
					], false);
				});
				$scope.chart.redraw();
			});
			
		}
	};
});

app.controller("MainCtrl", function($scope, CalderaService, $interval) {
	$scope.data = {
		oxigeno : 0,
		modulacion : 0,
		eficiencia : 0,
		demanda : 0
	};
	$scope.center = {
		lat : 20.673792,
		log : -103.3354131
	};
	$interval(function() {
		CalderaService.Calderas.Values(function(response) {
			$scope.data = response;
		});
	}, 5000);
});