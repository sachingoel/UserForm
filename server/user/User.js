const mongoose = require('mongoose');
const Schema = mongoose.Schema;
var ObjectId = Schema.ObjectId;

var addressSubSchema = {
	"subaddress": String,
	"city": String,
	"state": String,
	"country": String,
	"zipcode" :{type: Number, minlength:6 , maxlength:6}
}
const UserModel = new Schema({
	"name":{ type:String , trim:true , required:true },
	"age":{ type:Number, min:18, max:65},
	"gender":{ type:String , enum: ['Male','Female','Other']},
	"email":{type:String,required:true},
	"DOB":{type:Date},
	"address": addressSubSchema,
	"academics":{
		"tenth":{
			"marks":{type: Number},
			"board":{type: String}
		},
		"twelve":{
			"marks":{type: Number},
			"board":{type: String}
		}
	},
	"extracurricular":[{
		"activity":{type:String},
		"year":{
			"from":{type : Date},
			"to":{type: Date}
		},
		"award":{type :String}
	}],
	"created_on":{type: Date,default: Date.now()},
	"modified_on":{type: Date}
});

module.exports= mongoose.model('User',UserModel);