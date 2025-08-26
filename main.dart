import 'package:flutter/material.dart';

import 'settings.dart';
import 'sign.dart';
import 'home.dart';
import 'about.dart';
import 'transaction.dart';
import 'navbar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/settings':(context)=>Settings(),
        '/sign':(context)=>Sign(),
        '/home':(context)=>Home(),
     
        '/transaction':(context)=>AddTransaction(),
        '/about':(context)=>About()
      },
       home:Navbar(),
    );
  }
}




