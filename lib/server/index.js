const express=require("express");
const mongoose=require("mongoose");
const AddContactRoute=require("./routes/contact");
const GetAllContacts=require("./routes/get_all_contacts")
const app=express();
const port=8000;

const database="mongodb+srv://jerrito0240:streak0240845898@cluster0.hgcaxc8.mongodb.net/?retryWrites=true&w=majority"
app.use(AddContactRoute);
app.use(GetAllContacts);

mongoose.connect(database).then(()=>{

    console.log("Success");
}


).catch((e)=>
{
    console.log(e);
}

)

app.get("/",(req,res)=>{


    res.send("<h1>Hello</h1>");

});

app.listen(port,"0.0.0.0",()=>{
console.log(`Server is listening to port ${port}`)
});

//154.160.16.54/32