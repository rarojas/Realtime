/**
 * Disponbilidad de sitios
 */

var app = angular.module("Disponibilidad", [
		"ngResource", "ngRoute", "AngularGM"
]);
app.factory("DServices", function($resource) {
	var api = {};
	api.Sitios = $resource("/realtime/api/disponibilidad/sitios/:idcliente", {}, {});
	return api;
});
app.controller("MainCtrl", function($scope, DServices, $interval) {
	$scope.getData = function(){
		DServices.Sitios.query({
			idcliente : 'CTE0000001'
		},function(response){
			$scope.sitios = response;
		  $scope.$broadcast('gmMarkersUpdate', 'sitios');
		});
	};
	$scope.getData();
	$scope.timer = $interval(
			function() {
				$scope.getData();
			},10000);
	$scope.icons = {
			gray : 'http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_gray.png',
			green : 'http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_green.png',
			red : 'http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_red.png',
		}
	$scope.options = {
		map : {
			center : new google.maps.LatLng(19.473976, -99.199247),
			zoom : 6,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		},
		highlighted : {
			icon : $scope.icons.green
		},
		unhighlighted : {
			icon : $scope.icons.red
		},
	};
	
	$scope.getMarkerOptions = function(sitio) {
		var opts = {
			clickable : true,
			draggable : false,
			title : sitio.nombresitio,
			icon :'http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_gray.png'
		};
		
		return angular.extend(opts,
				sitio.disponibilidad ? $scope.options.highlighted
						: $scope.options.unhighlighted);
		
	};
	
	$scope.triggerOpenInfoWindow = function(sitio) {
		$scope.markerEvents = [
				{
					event : 'openinfowindow',
					ids : [
						sitio.idsitio
					]
				},
		];
	}
});
