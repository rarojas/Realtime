var app = angular.module("Resumen", [
		'ngResource', 'ngRoute', 'blockUI'
]);
app.factory("ResumenServices", function($resource) {
	var api = {};
	api.Resumen = $resource('/realtime/api/Resumen', {}, {
		ConsumoByMonth : {
			url : '/realtime/api/ConsumosByMonth/:month/:year',
			isArray : true
		},
		FPByMonth : {
			url : '/realtime/api/FPByMonth/:month/:year',
			isArray : true
		}
	});
	return api;
});
app.controller("MainCtrl", function($scope, ResumenServices, $filter) {
	$scope.GetData = function() {
		$scope.consumos = ResumenServices.Resumen.ConsumoByMonth($scope.form);
	};
	$scope.years = [{
			text : '2015',
			value : 2015
		}
	];
	$scope.months = [
			{
				text : 'Enero',
				value : 1
			}, {
				text : 'Febrero',
				value : 2
			}, {
				text : 'Marzo',
				value : 3
			}
	];
});