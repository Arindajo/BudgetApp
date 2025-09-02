import 'package:flutter/material.dart';
import 'navbar.dart';
import 'dart:async';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:5),(){
     
      Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context)=>Navbar())
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Padding(
        padding:EdgeInsets.all(10.0),
        
         child: CircleAvatar(
          
          backgroundImage: AssetImage("assets/images/logo.jpeg"),
          radius:40
         ),
       ),
       Text("TrackFunds",style:TextStyle(fontSize:35,fontWeight:FontWeight.bold),textAlign:TextAlign.center),
       SizedBox(height:10),
       Text("Spend Wisely, Save ffortlessly",style:TextStyle(fontSize:20),textAlign:TextAlign.center)

      ],)
    );
  }
}