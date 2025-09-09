import 'package:flutter/material.dart';
import 'Services/auth_service.dart';

class login extends StatelessWidget{
  final TextEditingController usernamecontroller = TextEditingController();
   final TextEditingController passwordcontroller = TextEditingController();
  @override

  Widget build(BuildContext context){
    return Scaffold(
         appBar:AppBar(
          backgroundColor: Colors.purple,
          title:Text("The Budget App",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,
          color:const Color.fromARGB(255, 245, 233, 247)),)
         ),

         body:Form(
          child:Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Padding(padding: EdgeInsets.all(5)),
            Text('LOGIN',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
            TextFormField(
              controller:usernamecontroller,
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
              controller: passwordcontroller,
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
              
              onPressed:()async{
                final username = usernamecontroller.text;
                final password =passwordcontroller.text;

                final Result = await AuthService.login(username, password);

                if (Result['statusCode'==201]){
                  Navigator.pushNamed(context,'/Sign');
                }
                else{
                  final error = Result['body'];
                  ScaffoldMessenger.of(context).
                    showSnackBar(
                      SnackBar(content:Text(error.toString()))
                    );
                }
              },
              child:Text("LOG IN",style:TextStyle(color:Colors.purple,)),
            )
                     ],),
          )
    ));
  }

}