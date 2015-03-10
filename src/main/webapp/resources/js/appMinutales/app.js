var app = angular.module("Minutales", [
		"ngResource", "ngRoute", 'blockUI', "n3-line-chart",
		'angularjs-dropdown-multiselect'
]);
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
		},
		Equipos : {
			url : '/realtime/api/Minutal/equipos',
			isArray : true
		}
	});
	return api;
});
app.controller("MainCtrl", function($scope, Services) {
	$scope.sitios = Services.Minutales.Sitios();
	$scope.variables = Services.Minutales.Variables();
	$scope.equipos = Services.Minutales.Equipos();
	$scope.variable1 = [];
	$scope.equipos1 = [];
	$scope.equipossettings = {
		displayProp : 'nombre',
		showCheckAll : false,
		showUncheckAll : false,
		externalIdProp : '',
		scrollable : true,
		selectionLimit : 5,
		enableSearch : true
	};
	$scope.example4settings = {
		displayProp : 'variable',
		showCheckAll : false,
		showUncheckAll : false,
		externalIdProp : '',
		scrollable : true,
		selectionLimit : 5,
		enableSearch : true
	};
	$scope.getData = function() {
		var series = [];
		var index = $scope.variable1.length * $scope.equipos1.length;
		angular.forEach($scope.equipos1, function(e) {
			angular.forEach($scope.variable1, function(i) {
				Services.Minutales.Minutales({
					sitio : $scope.sitio,
					variable : i.id,
					equipo : e.id,
					inicio : new Date($scope.inicio),
					fin : new Date($scope.fin)
				}, function(response) {
					var d = [];
					angular.forEach(response, function(item) {
						d.push([
								item.tagtimestamp, item.value
						]);
					});
					series.push({
						name : e.nombre + "-" + i.variable,
						data : d
					});
					index--;
					if (index == 0) {
						console.log(series);
						$('#container').highcharts('StockChart', {
							chart : {
								zoomType : 'x'
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
							yAxis : {},
							series : series
						});
					}
				});
			});
			
			// Services.Minutales.Minutales({
			// sitio : $scope.sitio,
			// variable : $scope.variable,
			// inicio : new Date($scope.inicio),
			// fin : new Date($scope.fin)
			// }, function(response) {
			// angular.forEach(response, function(item) {
			// data.push([
			// item.tagtimestamp, item.value, item.max, item.min
			// ]);
			// });
		});
	};
});
