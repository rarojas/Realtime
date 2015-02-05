var app = angular.module("Realtime", [ "ngResource", "ngRoute", "AngularGM" ]);
app.factory("RTServices", function($resource) {
	var api = {};
	api.Equipos = $resource("/realtime/Equipos", {}, {});
	api.Clientes = $resource("/realtime/Clientes", {}, {});
	api.Sitios = $resource("/realtime/sitios/:idcliente", {}, {
		SitioEquipos : {
			url : "/realtime/Sitios/Equipos/:idsitio",
			isArray : true
		}
	});
	return api;
});
app.controller("SitiosCtrl", function($scope, RTServices, $interval) {
	$scope.Sitios = RTServices.Sitios.query({
		idcliente : 'CTE0000001'
	});
	$scope.options = {
		map : {
			center : new google.maps.LatLng(19.473976, -99.199247),
			zoom : 6,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
	};
	$scope.triggerOpenInfoWindow = function(sitio) {
		$scope.markerEvents = [ {
			event : 'openinfowindow',
			ids : [ sitio.idsitio ]
		}, ];
	}
});
