import 'package:flutter/material.dart';

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home"),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple,
        child:Column(children: [
          DrawerHeader(child: Icon(Icons.favorite)),

          ListTile(
            title:Text("S E T T I N G S"),
            leading:Icon(Icons.settings),
            onTap:(){

              Navigator.pop(context);
              Navigator.pushNamed(context,'/settings');
            },
          ),
          ListTile(
            leading:Icon(Icons.home),
            title:Text("H O M E"),
            onTap:(){
              Navigator.pushNamed(context,'/home');
            }
          ),
          ListTile(leading:Icon(Icons.help),
          title:Text("H E L P"),)
        ],)
      ),
      body:Column(children: [
        
      ],)
    );
  }
}