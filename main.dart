import 'package:flutter/material.dart';
import 'login.dart';
import 'settings.dart';
import 'sign.dart';
import 'home.dart';
import 'dashboard.dart';
import 'transaction.dart';
import 'report.dart';
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
        '/dashboard':(context)=>Dashboard(),
        '/transaction':(context)=>AddTransaction()
      },
       home: Reports(),
    );
  }
}




