import 'package:flutter/material.dart';

import 'account.dart';
import 'add_business.dart';
import 'home.dart';
class Nav extends StatefulWidget {
  static String route () => "/";
  const Nav({super.key, });



  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int index=0;
  List<Widget>pages=[
    Home(),
    AddBusiness(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.brown,
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex:index,
        onTap: (value) {setState(() {index=value;});},
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.purple,

        items: [
      BottomNavigationBarItem(icon: Icon(Icons.apps_sharp),label: "home"),
      BottomNavigationBarItem(icon: Icon(Icons.add_business_rounded),label:"account_ balance" ),
      BottomNavigationBarItem(icon: Icon(Icons.account_balance),label:"account" ),]),
     body: pages[index],);
  }
}
