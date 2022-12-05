import 'package:capstone_kuliku/presentation/pages/list_kuli_page.dart';
import 'package:capstone_kuliku/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  static const String _placeText = 'Place';
  final List<Widget> _listWidget = [
    const MainPage(),
    const ListKuliPage(),
    const AccountPage()
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
        backgroundColor: const Color(0xff002f48),
        selectedItemColor: const Color(0xFFdefbff),
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
