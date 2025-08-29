import 'package:budget_app/transactionmodel.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';
import 'report.dart';
import 'dart:async';

class Dashboard extends StatefulWidget {
    final List<Transactionmodel> transactions;
  final Function(Transactionmodel) onAddTransaction;
  final double monthly_budget;
  final void Function(double) onSetBudget;

  //for the quotes
  

  Dashboard({required this.transactions, required this.onSetBudget, required this.onAddTransaction, required this.monthly_budget});
  @override
  
  State<Dashboard> createState() => _DashboardState();
  
}

class _DashboardState extends State<Dashboard> {
int CurrentQuoteIndex=0;
double _opacity=1.0;

  List<String> Quotes =[
    "Do not save what is left after spending; spend what is left after saving",
    "Small savigs today lead to big gains tomorrow",
    "A budget tells your money where to go instead of wondering where it went"
  ];
  //for quotes
  void initState(){
    super.initState();

    //timer
     Timer.periodic(Duration(seconds: 5), (timer) {
    // Step 1: fade out current quote
    setState(() {
      _opacity = 0.0;
    });

    // Step 2: after fade out, change quote + fade in
    Future.delayed(Duration(milliseconds: 500), () {
      if (!mounted) return; // safety check
      setState(() {
        CurrentQuoteIndex = (CurrentQuoteIndex + 1) % Quotes.length;
        _opacity = 1.0;
      });
    });
  });
  }

  double get totalIncome => widget.transactions
    .where((t) => t.transactiontype == "Income").fold(0.0, (sum, t) => sum + t.amount);

double get totalExpense => widget.transactions
    .where((t) => t.transactiontype == "Expenses").fold(0.0, (sum, t) => sum + t.amount);

double get balance => totalIncome - totalExpense;




    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      backgroundColor: Colors.purple,
     leading: Builder(
       builder: (context) {
         return IconButton(
          icon:Icon(Icons.menu,color:Colors.white),
          onPressed:(){
            Scaffold.of(context).openDrawer();
          }
          );
       }
     ),
  
      ),
      drawer:Drawer(
        child:Column(children: [
          //logo
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 223, 120, 241),
              radius: 50,
             backgroundImage: AssetImage('assets/images/logo.jpeg')),
          ),
            
            Text("TrackFunds",style: TextStyle(fontWeight:FontWeight.bold,fontSize:25),),
            SizedBox(height:15),
          ListTile(
            leading: Icon(Icons.wallet),
            title:Text("My Debts"),
            
          ), 
          //settings
          ListTile(
            leading:
              Icon(Icons.settings),
              title:Text("Settings"),
              onTap:(){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/settings');
              }
          ),
          ListTile(
            leading:
            Icon(Icons.info),
            title:Text("About"),
            onTap:(){
              Navigator.pushNamed(context,'/about');
            }
          ),
          ListTile(
            leading:
            Icon(Icons.logout),
            title:Text("Logout"),
            onTap:(){

            }
          )
        ],)
      ),
           
      
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(children: [
              //logo
              
             Text("Current Balance: ${balance.toStringAsFixed(0)} UGX",style:TextStyle(fontWeight:FontWeight.bold)),SizedBox(height:25),
            Row(
              children: [
                Expanded(child: Text("Income: ${totalIncome.toStringAsFixed(0)} UGX",style:TextStyle(fontWeight:FontWeight.bold))),
                SizedBox(width: 25),
                Expanded(child: Text("Expenses: ${totalExpense.toStringAsFixed(0)} UGX",style:TextStyle(fontWeight:FontWeight.bold))),
              ],
            ),
            
             SizedBox(height:15) ,
              
                 AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity:_opacity,
                 
                
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration:BoxDecoration(

                    color:const Color.fromARGB(255, 213, 69, 238),
                    borderRadius:BorderRadius.circular(15),
                    boxShadow:[
                      BoxShadow(
                            color:Colors.purple.withAlpha(180),
                            blurRadius: 10,
                            offset:Offset(0,5)

                      )
                    ]
                  ),
                  child:Row(children: [
                    Icon(Icons.savings),
                    SizedBox(height:15),
                    Expanded(child: Text(
                      Quotes[CurrentQuoteIndex],
                      style:TextStyle(fontSize:16,fontStyle: FontStyle.italic,color:const Color.fromARGB(255, 250, 245, 245))
                    )
                    ),
                  ],)
                  
                  )
                          
                  ),
              SizedBox(height:25),
                ElevatedButton(
                  child:Text("Add Transaction",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize:20)),
                 
                onPressed: () async {
              final tx = await Navigator.push<Transactionmodel>(
                context,
                MaterialPageRoute(builder: (_) => AddTransaction()),
              );
            
              if (tx != null) {
               widget.onAddTransaction(tx);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:const Color.fromARGB(255, 221, 79, 247)
            ),
                )
              
            ],),
          ),
        ),
      )
    );
  }
}