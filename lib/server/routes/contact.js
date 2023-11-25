const express=require("express")
const ContactModel=require("../models/contact")
AddContactRoute=express.Router();

AddContactRoute.post("/create-contact",async(req,res)=>{

  try{
      const {first_name,last_name,email,id,phone_number}=req.body;
    const contact=new ContactModel({
        first_name,
        last_name,
        email,
        id,
        phone_number
    })

    await contact.save();
    res.json(contact);




}
    catch(e){
  res.status(500).json({err:e.message});
    }


})

module.exports=AddContactRoute;



