import 'package:capstone_kuliku/presentation/pages/list_kuli_page.dart';
import 'package:capstone_kuliku/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  static const String _placeText = 'Place';
  final List<Widget>  _listWidget = [
    const ListKuliPage(),
    const SignUpPage()
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: _placeText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: _placeText,
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF342343),
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
  
 
}