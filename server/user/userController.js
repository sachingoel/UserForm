'use strict'
const User = require('./User');
const Boom = require('boom');
const Joi = require('joi');
const Inert = require('inert');


exports.register = (server,options,next)=>{
	server.route([
		{
			method:'GET',
			path:'/',
			handler:(request,reply)=>{
				reply.file('./public/index.html')
				}
		},
		{
			method:'POST',
			path:'/basic',
			handler:(request,reply)=>{
				let user = new User(request.payload);
				console.log('user Dto ', request.payload);

				console.log("user obtained is",user);
					
					user.save((err,user)=>{
						if(err){
							throw Boom.badRequest(err)
						}
						reply('Basic information added succesfully')
					})
			},
			config:{
				validate:{
					payload:{
						name:Joi.string().required().min(5).max(25),
						age:Joi.number().required().greater(17).less(66),
						gender:Joi.string(),
						email:Joi.string().email(),	
						dob:Joi.date(),
						address:Joi.object(),
						academics:Joi.object({tenth:Joi.object(),twelve:Joi.object()}),
						// extracurricular:Joi.object([{activity:Joi.string(),year:Joi.object(),award:Joi.string()}])
						// extracurricular:Joi.array().items(Joi.object())
						extracurricular:Joi.any()
					}
				}
			}
		}
		
	])
next();
}

exports.register.attributes ={
	name:'user-routes',
	version:'1.0.0'
}
