var app = angular.module("Minutales", [ "ngResource", "ngRoute",
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
				data.push([ item.tagtimestamp, item.value, item.max,item.min ]);
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
					events : {},
				},
				yAxis : {
					floor : 0
				},
				series : [ {
					name : 'Variable',
					data : data,
					dataGrouping : {
						enabled : false
					}
				} ]
			});
		});
	};
	$scope.options = {
		series : [ {
			y : "value",
			label : "Variables",
			color : "#ff0000",
			thickness : "1px"
		} ],
		axes : {
			x : {
				type : 'date',
				key : 'tagtimestamp'
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

});
