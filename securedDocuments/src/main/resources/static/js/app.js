var app = angular.module("eindiaApp", [ "ngRoute" ]);
app.config(function($routeProvider) {
	$routeProvider
		.when("/", {
			templateUrl : "login.html",
			controller : "loginCtrl"
		})
		.when("/dashboard", {
			resolve:{
				"check": function($location,$rootScope){
					if(!$rootScope.isLoggedIn){
						$location.path('/');
					}
				}
				
			},
			templateUrl : "dashboard.html",
			controller : "londonCtrl"
		})
		.when("/paris", {
			templateUrl : "paris.htm",
			controller : "parisCtrl"
		});
});

app.controller("londonCtrl", function($scope,$rootScope) {
	$scope.msg = "I love London";
	
	  $scope.getUser= function() {
	        return $rootScope.username;
	    };
	    
});
app.controller("parisCtrl", function($scope) {
	$scope.msg = "I love Paris";
});
app.controller('loginCtrl', function($scope, $http, $window, $location,$rootScope) {
	$scope.status = "";
	$scope.login = function() {
		console.log($scope.lType);
		console.log($scope.username);
		console.log($scope.password);

		$http({
			method : 'POST',
			url : 'http://localhost:8080/dbService/getUserDetails',
			data : {
				'username' : $scope.username,
				'password' : $scope.password,
				'loginType' : $scope.lType
			}
		}).then(function onSuccess(response) {
			console.log(response.data.body.status);
			$scope.status = response.data.body.status;
			if ($scope.status != "success") {
				alert(response.data.body.status);
			} else {
				$rootScope.username=$scope.username;
				$rootScope.password=$scope.password;
				$rootScope.isLoggedIn=true;
				$location.path('/dashboard');
			}

		//alert(response.data.body.status);
		}).catch(function onError(response) {
			//console.log(response.data.body.status);

		});



	};
});