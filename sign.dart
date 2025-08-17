import 'package:flutter/material.dart';

class Sign extends StatelessWidget{
  @override
  Widget build(BuildContext context){
     return Scaffold(
      body:Form(child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        Text("Sign Up",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:Colors.purple)),
        Padding(padding:EdgeInsets.all(4)),
        TextFormField(
          decoration:InputDecoration(
            hintText:"Enter Username",
            labelText:"Username",
            prefixIcon:Icon(Icons.person),
            border:OutlineInputBorder()
          ),
          validator:(value){
            if(value==null||value.isEmpty){
              return "Please enter Username";
            }
            return null;
          }
        ),SizedBox(height:15),
      
      TextFormField(
        decoration:InputDecoration(
          hintText:"Enter Email",
          labelText:"Email",
          prefixIcon:Icon(Icons.email),
          border:OutlineInputBorder()
         ),
         validator:(value){
          if(value ==null||value.isEmpty){
            return "Please Enter Email";
          }
          // if (!value.contains(@)){
          //   return "Please enter valid Email";
          // }
           return null;
         }
      ),SizedBox(height:15),
      TextFormField(
        decoration:InputDecoration(
          hintText:"Enter Password",
          labelText:"Password",
          prefixIcon:Icon(Icons.lock),
          border:OutlineInputBorder(borderRadius:BorderRadius.circular(20))
         ),
         validator:(value){
          if(value ==null||value.isEmpty){
            return "Please Enter Password";
          }
          if (value.length<8){
            return "Password must be atleast 8  characters";
          }
           return null;
         }
      ),SizedBox(height:15),
      ElevatedButton(
        child:Text("SIGN UP",style:TextStyle(fontSize:20,color:Colors.purple)),
        onPressed:(){}
      )
      ],),)
     );
  }
}