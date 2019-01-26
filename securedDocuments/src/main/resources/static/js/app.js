var app = angular.module("eindiaApp", [ "ngRoute" ]);


app.config(function($routeProvider) {
	$routeProvider
		.when("/", {
			templateUrl : "login.html",
			controller : "loginCtrl"
		})
		.when("/documents", {
			templateUrl : "documents.html",
			controller : "documentsCtrl"
		}).when("/staffdashboard", {
			templateUrl : "staffdashboard.html",
			controller : "staffdashboardCtrl"
		})
		.when("/uploaduserdocs", {
			templateUrl : "uploaduserdocs.html",
			controller : "uploaduserdocsCtrl"
		})
		.when("/createuser", {
			templateUrl : "createUser.html",
			controller : "createUserCtrl"
		}).when("/staff-settings", {
			templateUrl : "staff-settings.html",
			controller : "staffsettingsCtrl"
		}).when("/tpdashboard", {
			templateUrl : "tpdashboard.html",
			controller : "tpdashboardCtrl"
		})
		
		.when("/viewDocs", {
			
			templateUrl : "viewDocs.html",
			controller : "viewDocsCtrl"
		}).when("/changetpsetting", {
			
			templateUrl : "changetpsetting.html",
			controller : "changetpsettingCtrl"
		})
		
		.when("/dashboard", {
			/*
			 * resolve : { "check" : function($location, $rootScope) { if
			 * (!$rootScope.isLoggedIn) { $location.path('/'); } } },
			 */
			templateUrl : "dashboard.html",
			controller : "dashboardCtrl"
		})
		.when("/user-setting", {
			/*
			 * resolve : { "check" : function($location, $rootScope) { if
			 * (!$rootScope.isLoggedIn) { $location.path('/'); } } },
			 */
			templateUrl : "user-setting.html",
				controller : "uploadFileController"
		});
});
app.filter('customSplitString', function() {
	  return function(input) {
	    var arr = input.split(',');
	    return arr;
	  };
	 });
app.controller("viewDocsCtrl", function($scope, $rootScope,$location,$http,$window) {
	$scope.show=true;
	$scope.username = $rootScope.username;
	$scope.userDetails=$rootScope.userData;
	$scope.logout = function() {
		$rootScope.userData='';
		$rootScope.isLoggedIn = false;
	}
	
$scope.openPan = function(a) {
		
		$scope.showDoc=a;
		console.log($scope.showDoc);
		
	}
	$scope.scanQrCode=function(){

		var file = $scope.uploadedFile;
		var url = "/api/uploadQr";

		var data = new FormData();
		data.append('uploadQr', file);
		console.log($scope.username)
		data.append('thirdparty', $scope.username);
	
		var config = {
			transformRequest : angular.identity,
			transformResponse : angular.identity,
			headers : {
				'Content-Type' : undefined
			}
		}

		
		
		$http.post(url, data, config).then(function(response) {
			$scope.show=true;
			// $location.path('/viewDocs');
			
			$scope.uploadResult =JSON.parse(response.data);
			$scope.userId=$scope.uploadResult.userId;
			console.log(userId);
			// $scope.uploadResult=$scope.uploadResult.split(",");
			console.log($scope.uploadResult);
			/*
			 * $scope.uploadResult = $scope.uploadResult.data.f;
			 * console.log($scope.uploadResult);
			 * console.log($scope.uploadResult.body); $scope.uploadResult =
			 * angular.toJson(response.data.body.dataList);
			 * console.log($scope.uploadResult);
			 * $scope.test=JSON.stringify($scope.uploadResult);
			 * 
			 * response.data.forEach(function(val, i) { console.log(i);
			 * $scope.test.push(i); });
			 */
			 
			console.log($scope.uploadResult);
		}, function(response) {
			console.log(response);
			$scope.uploadResult = response.data;
		});
	
		
	}
});

app.controller("staffdashboardCtrl", function($scope, $rootScope,$location,$http,$window) {
	$scope.username = $rootScope.username;
	$scope.userDetails=$rootScope.userData;
	$scope.logout = function() {
		$rootScope.userData='';
		$rootScope.isLoggedIn = false;
	}
});
app.controller("tpdashboardCtrl", function($scope, $rootScope,$location,$http,$window) {
	$scope.username = $rootScope.username;
	$scope.userDetails=$rootScope.userData;
	console.log($scope.userDetails);
	$scope.logout = function() {
		$rootScope.userData='';
		$rootScope.isLoggedIn = false;
	}
});
app.controller("uploaduserdocsCtrl", function($scope, $rootScope,$location,$http,$window) {
	$scope.genUser=$rootScope.generatedUser;
	console.log($scope.genUser);
	$scope.lType=$rootScope.lType;
	$scope.uploadResult='';
	console.log($scope.lType +'   '+$scope.username+'    ');
	$scope.doUploadFile = function() {
		var file = $scope.uploadedFile;
		var url = "/api/uploadfile";

		var data = new FormData();
		data.append('uploadfile', file);
		console.log($scope.username)
		data.append('userId', $scope.genUser);
		
		 if($scope.dou==='adhar'){ data.append('documentType', 'adhar'); }else
		  if($scope.dou==='pan') {data.append('documentType', 'pan'); }else
		  if($scope.dou==='voterId') {data.append('documentType', 'voterId'); }
		 
	/* data.append('documentType','adhar'); */
		var config = {
			transformRequest : angular.identity,
			transformResponse : angular.identity,
			headers : {
				'Content-Type' : undefined
			}
		}

		$http.post(url, data, config).then(function(response) {
			$scope.uploadResult = response.data;
			console.log($scope.uploadResult);
		}, function(response) {
			$scope.uploadResult = response.data;
		});
	};
	
});

app.controller("createUserCtrl", function($scope, $rootScope,$location,$http,$window,$filter) {
	$rootScope.generatedUser='';
	$scope.store = function() {
		/*
		 * String firstName; String middleName; String lastName; String dob;
		 * String gender; String caste; String address; String state; String
		 * district; String city; Integer pinCode; String emailId; String
		 * phoneNo;
		 */
		
		$scope.updatedDate=	 $filter('date')($scope.dob, "dd-MM-yyyy");
		$http({
			method : 'POST',
			url : 'http://localhost:9066/dbService/registerUser',
			data : {
				'firstName' : $scope.firstname,
				'middleName' : $scope.middlename,
				'lastName' : $scope.lastname,
				'dob':$scope.updatedDate,
				'gender':$scope.gender,
				'caste':$scope.caste,
				'state':$scope.state,
				'district':$scope.district,
				'city':$scope.city,
				'pinCode':$scope.pin,
				'emailId':$scope.email,
				'phoneNo':$scope.phone,
				'address':$scope.address
			}
		}).then(function onSuccess(response) {
			console.log(response.data.status);
			$scope.status = response.data.status;
			if ($scope.status != "success") {
				alert(response.data.status);
				// $rootScope.generatedUser=response.data.body.username;
			} else {
				alert('Registration successfull..');
				
				$rootScope.generatedUser=response.data.username;
				console.log($rootScope.generatedUser);
					$location.path('/uploaduserdocs');	
			}

		// alert(response.data.body.status);
		}).catch(function onError(response) {
			console.log(response.data.status);

		});
		
		
	
	}
	
});



app.controller("dashboardCtrl", function($scope, $rootScope,$location,$http,$window) {
	$scope.username = $rootScope.username;
	$scope.userDetails=$rootScope.userData;

	$scope.logout = function() {
		$rootScope.userData='';
		$rootScope.isLoggedIn = false;
	}
	
	$scope.changeUrl= function () { 
		$location.path('/user-setting');
	}	

});
app.controller("documentsCtrl", function($scope, $rootScope,$location,$http,$window) {
	$scope.showDoc='';
	$scope.docs='';
	$scope.username = $rootScope.username;
	$scope.userDetails=$rootScope.userData;
	$scope.openPan = function(a) {
		
		$scope.showDoc=a;
		console.log($scope.showDoc);
		
	}
	$scope.calculate=function(){
		if($scope.pan=true){
			$scope.docs=$scope.docs+'pan,';
		}
		if($scope.voterId=true){
			$scope.docs=$scope.docs+'voterId,';
		}
		if($scope.adhar=true){
			$scope.docs=$scope.docs+'adhar,';
		}
		
		console.log($scope.docs);
		$scope.docs=$scope.docs.substring(0, $scope.docs.length-1);
		console.log($scope.docs);
	}
	
});
app.controller('loginCtrl', function($scope, $http, $window, $location, $rootScope) {
	$scope.status = "";

	$scope.forgotPassword = function() {
		console.log($scope.fUsername);
		console.log($scope.fEmail);
		$http({
			method : 'POST',
			url : 'http://localhost:9066/dbService/recoverPassword',
			data : {
				'username' : $scope.fUsername,
				'email' : $scope.fEmail
			}
		}).then(function onSuccess(response) {
			console.log(response.data.body.status);
			$scope.status = response.data.body.status;
			if ($scope.status != "success") {
				alert(response.data.body.status);
			} else {
				alert('password has been sent to registered mail.. ')
			}

<<<<<<< HEAD
		// alert(response.data.body.status);
		}).catch(function onError(response) {
			// console.log(response.data.body.status);
=======
		//alert(response.data.body.status);
		}).catch(function onError(response) {
			//console.log(response.data.body.status);
>>>>>>> 7058d594bf76d0545a962eb0e865ee3ea83fc404

		});
		
	}

	$scope.login = function() {
		console.log($scope.lType);
		console.log($scope.username);
		console.log($scope.password);

		$http({
			method : 'POST',
			url : 'http://localhost:9066/dbService/getUserDetails',
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
				$rootScope.username = $scope.username;
				$rootScope.password = $scope.password;
				$rootScope.lType=$scope.lType;
				$rootScope.userData=response.data.body.dataList;
				$rootScope.isLoggedIn = true;
				if($scope.lType==='user'){
				$location.path('/dashboard');
				}else if($scope.lType==='staff'){
					console.log('instaff');
					$location.path('/staffdashboard');
				}else if($scope.lType==='thirdparty'){
					$location.path('/tpdashboard');
				}
			}

		// alert(response.data.body.status);
		}).catch(function onError(response) {
			// console.log(response.data.body.status);

		});



	};
});

// DIRECTIVE - FILE MODEL
app.directive('fileModel', ['$parse', function ($parse) {
    return {
       restrict: 'A',
       link: function(scope, element, attrs) {
          var model = $parse(attrs.fileModel);
          var modelSetter = model.assign;
          
          element.bind('change', function(){
             scope.$apply(function(){
                modelSetter(scope, element[0].files[0]);
             });
          });
       }
    };
}]); 

app.controller("userSettingCtrl", function($scope, $http, $window, $location, $rootScope) {
	$scope.lType=$rootScope.lType;
	$scope.reset='';
	$scope.changePassword=function(){
		console.log($scope.username +'    '+ $scope.password+ '    '+$scope.lType+'      '+$scope.newPassword);
	
		$http({
			method : 'POST',
			url : 'http://localhost:9066/dbService/resetPassword',
			data : {
				'username' : $scope.username,
				'password' : $scope.password,
				'loginType' : $scope.lType,
				'newPassword': $scope.newPassword
			}
		}).then(function onSuccess(response) {
			console.log(response.data.body.status);
			$scope.status = response.data.body.status;
			if ($scope.status != "success") {
				alert('unable to reset password');
			}else{
				$scope.reset='Password has been reset.';
				alert($scope.reset);
				
			}

		// alert(response.data.body.status);
		}).catch(function onError(response) {
			// console.log(response.data.body.status);

		});
		
	}

	$scope.doUploadFile = function() {
		var file = $scope.uploadedFile;
		var url = "/api/uploadfile";

		var data = new FormData();
		data.append('uploadfile', file);
		console.log($scope.username)
		data.append('userId', $scope.username);
		data.append('documentType', 'pic');

		var config = {
			transformRequest : angular.identity,
			transformResponse : angular.identity,
			headers : {
				'Content-Type' : undefined
			}
		}

		$http.post(url, data, config).then(function(response) {
			$scope.uploadResult = response.data;
		}, function(response) {
			$scope.uploadResult = response.data;
		});
	};
	
});

app.controller("staffsettingsCtrl", function($scope, $http, $window, $location, $rootScope) {
	$scope.lType=$rootScope.lType;
	$scope.reset='';
	$scope.changePassword=function(){
		console.log($scope.username +'    '+ $scope.password+ '    '+$scope.lType+'      '+$scope.newPassword);
	
		$http({
			method : 'POST',
			url : 'http://localhost:9066/dbService/resetPassword',
			data : {
				'username' : $scope.username,
				'password' : $scope.password,
				'loginType' : $scope.lType,
				'newPassword': $scope.newPassword
			}
		}).then(function onSuccess(response) {
			console.log(response.data.body.status);
			$scope.status = response.data.body.status;
			if ($scope.status != "success") {
				alert('unable to reset password');
			}else{
				$scope.reset='Password has been reset.';
				alert($scope.reset);
				
			}

		// alert(response.data.body.status);
		}).catch(function onError(response) {
			// console.log(response.data.body.status);

		});
		
	}

	$scope.doUploadFile = function() {
		var file = $scope.uploadedFile;
		var url = "/api/uploadfile";

		var data = new FormData();
		data.append('uploadfile', file);
		console.log($scope.username)
		data.append('userId', $scope.username);
		data.append('documentType', 'pic');

		var config = {
			transformRequest : angular.identity,
			transformResponse : angular.identity,
			headers : {
				'Content-Type' : undefined
			}
		}

		$http.post(url, data, config).then(function(response) {
			$scope.uploadResult = response.data;
		}, function(response) {
			$scope.uploadResult = response.data;
		});
	};
	
});


app.controller("changetpsettingCtrl", function($scope, $http, $window, $location, $rootScope) {
	$scope.lType=$rootScope.lType;
	$scope.reset='';
	$scope.changePassword=function(){
		console.log($scope.username +'    '+ $scope.password+ '    '+$scope.lType+'      '+$scope.newPassword);
	
		$http({
			method : 'POST',
			url : 'http://localhost:9066/dbService/resetPassword',
			data : {
				'username' : $scope.username,
				'password' : $scope.password,
				'loginType' : $scope.lType,
				'newPassword': $scope.newPassword
			}
		}).then(function onSuccess(response) {
			console.log(response.data.body.status);
			$scope.status = response.data.body.status;
			if ($scope.status != "success") {
				alert('unable to reset password');
			}else{
				$scope.reset='Password has been reset.';
				alert($scope.reset);
				
			}

		// alert(response.data.body.status);
		}).catch(function onError(response) {
			// console.log(response.data.body.status);

		});
		
	}

	$scope.doUploadFile = function() {
		var file = $scope.uploadedFile;
		var url = "/api/uploadfile";

		var data = new FormData();
		data.append('uploadfile', file);
		console.log($scope.username)
		data.append('userId', $scope.username);
		data.append('documentType', 'pic');

		var config = {
			transformRequest : angular.identity,
			transformResponse : angular.identity,
			headers : {
				'Content-Type' : undefined
			}
		}

		$http.post(url, data, config).then(function(response) {
			$scope.uploadResult = response.data;
		}, function(response) {
			$scope.uploadResult = response.data;
		});
	};
	
});




