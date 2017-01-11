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



		$scope.submitDetails = function(){
			UserService.submitDetails($scope.userCtrl.user).success((response)=>{
				alert('Your details are submitted successfully')
				$state.reload()
			}).error((response)=>{
				console.log('Error in user data submision ',response)
			})
		};


		$scope.calculateAge = function calculateAge(birthday) { // birthday is a string
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

