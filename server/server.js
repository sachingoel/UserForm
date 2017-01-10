'use Strict';
const Hapi = require('hapi');
const mongoose = require('mongoose');
const plugins = require('./plugins');
const Path = require('path');

const server = new Hapi.Server();

server.connection({
	host:'localhost',
	port:3333,
	routes: {
		cors: {
			origin: ['/*','http://localhost:3333']
		}

	}
})


server.register(plugins,(err)=>{
	if(err){
		throw err;
	}
})

if(!module.parent){
server.start((err)=>{
	if(err){
		throw err;
	}

	mongoose.connect( 'mongodb://127.0.0.1/admitKard', {} , (err)=>{
		if(err){
			throw err;
		} 
	});

	console.log('AdmitKard server is running on ',server.info.uri);
});
}
