import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2026/view/homeScreen.dart';
import 'package:test_2026/view/CartScreen.dart';
import 'package:test_2026/view/profileScreen.dart';
import 'categegoryScreen.dart';


class MainScreen extends StatefulWidget {
  static const String route = "/main";
  const MainScreen({super.key});


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  List<Widget> mainList = [HomeScreen(), CategoryScreen(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainList[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.category),
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart_rounded),
            icon: Badge(child: Icon(Icons.shopping_cart_outlined)),
            label: 'Notifications',
          ),
          NavigationDestination(
            selectedIcon: Badge(label: Text('2'), child: Icon(Icons.person)),
            icon: Icon(Icons.person_2_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
