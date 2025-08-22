import 'package:flutter/material.dart';
import 'report.dart';
import 'dashboard.dart';
import 'transactionmodel.dart';
import 'budgets.dart';
import 'transaction.dart';
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<Transactionmodel> _transactions=[];
  void _addTransaction(Transactionmodel tx) {
    setState(() {
      _transactions.add(tx);
    });
  }


  double get totalIncome =>
    _transactions.where((t) => t.transactiontype == "Income").fold(0.0, (sum, t) => sum + t.amount);

double get totalExpense =>
    _transactions.where((t) => t.transactiontype == "Expenses").fold(0.0, (sum, t) => sum + t.amount);

double get balance => totalIncome - totalExpense;




  //method that updtes the new selected index
  void _Navigate(int index){
    setState((){
      _selectedIndex = index;
    });
  }

//keeps track of current page to display
int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List _pages=[
  //home page
   Dashboard(
    transactions:_transactions,
    onAddTransaction:_addTransaction),
  //budgets page
  Budget(),
  //reports page
  Reports(transactions: _transactions),
];
    return Scaffold(
      body:_pages[_selectedIndex],
      
       bottomNavigationBar: BottomNavigationBar(
        currentIndex:_selectedIndex,
        onTap:_Navigate,
          items: [
            //for Dashboard
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label:'Home',
            ),
            BottomNavigationBarItem( 
              icon: Icon(Icons.favorite),
              label:'Budgets'
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.analytics),
                label:'Reports'
                )
          ],
        ),
    );
  }
}


