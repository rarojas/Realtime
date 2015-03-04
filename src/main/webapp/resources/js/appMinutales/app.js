var app = angular.module("Minutales", [ "ngResource", "ngRoute",'blockUI',
		"n3-line-chart" ]);
app.factory("Services", function($resource) {
	var api = {};
	api.Minutales = $resource("/realtime/api/Minutal", {}, {
		Minutales : {
			url : '/realtime/api/Minutal',
			isArray : true,
			method : 'POST'
		},
		Sitios : {
			url : '/realtime/api/Minutal/Sitios',
			isArray : true,
		},
		Variables : {
			url : '/realtime/api/Minutal/variables',
			isArray : true
		}
	});
	return api;
});
app.controller("MainCtrl", function($scope, Services) {
	$scope.sitios = Services.Minutales.Sitios();
	$scope.variables = Services.Minutales.Variables();
	$scope.getData = function() {
		var data = [];
		Services.Minutales.Minutales({
			sitio : $scope.sitio,
			variable : $scope.variable,
			inicio : new Date($scope.inicio),
			fin : new Date($scope.fin)
		}, function(response) {
			angular.forEach(response, function(item) {
				data.push([item.tagtimestamp, item.value, item.max,item.min]);
			});
			$('#container').highcharts('StockChart', {
				chart : {
					zoomType : 'x'
				},
				navigator : {
					adaptToUpdatedData : false,
					series : {
						data : data
					}
				},
				scrollbar : {
					liveRedraw : false
				},
				title : {
					text : 'Minutales'
				},
				subtitle : {
					text : ''
				},
				xAxis : {
					type : 'datetime',					
				},
				yAxis : {					
				},
				series : [ {
					name : 'Variable',
					data : data
					} ]
			});
		});
	};
});
