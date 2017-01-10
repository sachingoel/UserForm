angular.module( 'app' ).factory('UserService',($http)=>{
	return{

			submitDetails: function(userDto){	
				console.log('user DTO is',userDto)
					return $http.post('http://localhost:3333/basic',userDto)
			 }


	};
});