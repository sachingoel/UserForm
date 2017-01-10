var myApp = angular.module('app', ['ui.router','user']).config( function( $urlRouterProvider, $locationProvider ) {
	$urlRouterProvider.otherwise( '/testuser' );
		// $locationProvider.html5Mode({enabled: true,requireBase: false});
		} ).run(function($http){
			console.log('agular app is running');
			$http.defaults.headers.common['Access-Control-Allow-Origin'] = '*';
  // Send this header only in post requests. Specifies you are sending a JSON object
  $http.defaults.headers.post['dataType'] = 'json'
});

	myApp.controller('AppCtrl', ['$scope', '$http', function($scope, $http) {
		console.log("AppCtrl");
	}]);