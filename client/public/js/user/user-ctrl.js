angular.module('user',[]).config(($stateProvider)=>{
		$stateProvider.state('user',{
			url:'/testuser',
			templateUrl: '/js/user/user.tpl',
			controller: 'UserCtrl'
		});
}).controller('UserCtrl',function($scope,$state,UserService){
		console.log('UserCtrl');
$scope.userCtrl = {
	user:{}
}

 $scope.divs=[1];


		$scope.submitDetails = function(){
			if($scope.userCtrl.user.academics.tenth.board === 'Other'){
				$scope.userCtrl.user.academics.tenth.board=$scope.userCtrl.tenOtherBoard;
			}

			if($scope.userCtrl.user.academics.twelve.board === 'Other'){
				$scope.userCtrl.user.academics.twelve.board=$scope.userCtrl.tweOtherBoard;
			}

			UserService.submitDetails($scope.userCtrl.user).success((response)=>{
				alert('Your details are submitted successfully')
				$state.reload()
			}).error((response)=>{
				console.log('Error in user data submision ',response)
			})
		};


		$scope.calculateAge = function calculateAge(birthday) { 
    		var ageDifMs = Date.now() - new Date(birthday).getTime(); // parse string to date
    		var ageDate = new Date(ageDifMs); // miliseconds from epoch
    		return Math.abs(ageDate.getUTCFullYear() - 1970);
		};

		$scope.toggle = function(arg){
			$scope.toggleShow=arg;
		};

		$scope.addDivs = function(){
			$scope.divs.push({});
		}

		$scope.removeDivs = function(){
			$scope.divs.splice();
		}

})

