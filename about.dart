import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(children: [
          Text("More Information About Us"),

          Text("call the Developer: 0770947655")
        ],),
      )
    );
  }
}