const plugins=[
	{
		register : require('./user/userController')
	},
	{
		register: require('inert')
	}
];

module.exports = plugins ;
