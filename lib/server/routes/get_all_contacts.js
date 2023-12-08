const express=require("express");
const contactModel=require("../models/contact");

const GetAllContacts=express.Router();

GetAllContacts.get("/all-contacts",async(req,res)=>{

    try{

    
    const allContacts= await contactModel.find({});

    res.json(allContacts)
    }catch(e){

        res.status(500).json({error:e.message})
    }







})