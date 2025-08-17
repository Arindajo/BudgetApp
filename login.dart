import 'package:flutter/material.dart';

class login extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
         appBar:AppBar(
          backgroundColor: Colors.purple,
          title:Text("The Budget App",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,
          color:const Color.fromARGB(255, 245, 233, 247)),)
         ),

         body:Form(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Padding(padding: EdgeInsets.all(5)),
          Text('LOGIN',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
          TextFormField(
            decoration:InputDecoration(
              labelText:"Username",
              prefixIcon:Icon(Icons.person),
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)))
            ,
            validator:(value){
              if(value == null||value.isEmpty){
                 return("please enter Username");
              }
              return null;
            }
          


          ),

         SizedBox(height:15),

          TextFormField(
            decoration:InputDecoration(
              labelText:"Password",
              prefixIcon:Icon(Icons.lock),
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            validator:(value){
              if(value ==null||value.isEmpty){
                return("please enter valid password");
              }
              if (value.length<8){
                return("Password must beatleast 8 characters");
              }
              
              return null;
            }
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            child:Text("LOG IN",style:TextStyle(color:Colors.purple,)),
            onPressed:(){}
          )
         ],)
    ));
  }

}