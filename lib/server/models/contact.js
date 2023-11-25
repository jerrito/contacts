const mongoose=require("mongoose");
const schema=mongoose.Schema({
    "first_name":{
        type:String,
        require:false,
       trim: true

    },
    "last_name":{
        type:String,
        require:false,
        trim:true },
     "phone_number":{
        type:String,
        require:true,
        trim:true
     } ,
     "id":{
        type:Number,
        require:true,
     },
     "email":{
        type:String,
        require:false,
        trim:true,
        validator:(value)=>{
            const re=/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(re);

        }
     }  
})

const ContactModel=mongoose.model("Contact",schema)

module.exports=ContactModel;