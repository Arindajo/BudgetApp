import 'package:flutter/material.dart';

class Debt extends StatelessWidget {
  const Debt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(

        children: [
          TextField(
            decoration:InputDecoration(
              labelText:"Debt Amount",
              hintText:"Enter Amount",
              border:OutlineInputBorder()
            )
          ),
          SizedBox(height:15),
            TextField(
            decoration:InputDecoration(
              labelText:"Name",
              hintText:"Enter Name",
              border:OutlineInputBorder()
            )
          ),
          SizedBox(height:15),
            TextField(
            decoration:InputDecoration(
              labelText:"Information",
              hintText:"Enter details",
              border:OutlineInputBorder()
            )
          ),
          SizedBox(height:15),
          Row(
            children:[
          ElevatedButton(
            child:Text("Edit"),
            onPressed: (){}, 
            
          ),SizedBox(width:10),
          ElevatedButton(
            child:Text("Save"),
            onPressed: (){}, 
            
          )
            ]
          )
        ],
      )
    );
  }
}