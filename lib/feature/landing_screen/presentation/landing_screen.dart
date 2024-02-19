import 'package:ecommerce/feature/cart_screen/presentation/cart_screen.dart';
import 'package:ecommerce/feature/dashboard_screen/presentation/dashboard_screen.dart';
import 'package:ecommerce/feature/product_screen/presentation/product_screen.dart';
import 'package:ecommerce/feature/profile_screen/presentation/profile_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  // Screens for bottom navigation bar
  final List<Widget> _screens = [
    DashboardScreen(),
    ProductScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            tooltip: 'Dashboard', // finder: byTooltip('Dashboard')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Product',
            tooltip: 'Product', // finder: byTooltip('Product')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            tooltip: 'Cart', // finder: byTooltip('Cart')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile', // finder: byTooltip('Profile')
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
