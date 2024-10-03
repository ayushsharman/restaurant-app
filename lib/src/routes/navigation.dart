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
    HomeScreen(), // HomeScreen for the first tab
    Products_screen(), // ProductsScreen for the second tab
    Day2day(), // Day2DayScreen for the third tab
    FoodOrderTrackingScreen(), // OrdersScreen for the fourth tab
    AccountManagementScreen(), // AccountScreen for the fifth tab (previously HomeScreen)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red, // Active color set to red
        unselectedItemColor: Colors.grey, // Inactive color set to grey
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the index when a tab is tapped
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

// Placeholder classes for other screens
class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Center(child: Text("Products Screen")),
    );
  }
}

class Day2DayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Day2Day")),
      body: Center(child: Text("Day2Day Screen")),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),
      body: Center(child: Text("Orders Screen")),
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: Center(child: Text("Account Screen")),
    );
  }
}
