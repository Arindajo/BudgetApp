import 'package:flutter/material.dart';
import 'report.dart';
import 'dashboard.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  //method that updtes the new selected index
  void _Navigate(int index){
    setState((){
      _selectedIndex = index;
    });
  }

//keeps track of current page to display
int _selectedIndex = 0;
final List _pages=[
  //home page
   Dashboard(),
  //budgets page
  Budgets(),
  //reports page
  Reports(),
];
  @override
  Widget build(BuildContext context) {
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


