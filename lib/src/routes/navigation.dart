import 'package:flutter/material.dart';
import 'package:temp_customer_app/src/features/day2day/day2day.dart';
import 'package:temp_customer_app/src/features/orders/order.dart';
import 'package:temp_customer_app/src/features/profile/profile.dart';
import '../features/homscreen/homescreen.dart';
import '../features/product/product.dart'; // Correct path for importing HomeScreen

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  // List of screens for each navigation item
  final List<Widget> _screens = [
    HomeScreen(),
    Products_screen(),
    Day2day(),
    FoodOrderTrackingScreen(),
    AccountManagementScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Day2Day'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
