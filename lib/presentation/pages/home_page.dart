import 'package:capstone_kuliku/presentation/pages/account_page.dart';
import 'package:capstone_kuliku/presentation/pages/favorite_page.dart';
import 'package:capstone_kuliku/presentation/pages/list_kuli_page.dart';
import 'package:capstone_kuliku/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  static const String _homeText = 'Home';
  static const String _listText = 'List';
  static const String _starText = 'Favorite';
  static const String _accountText = 'Account';
  final List<Widget> _listWidget = [
    const MainPage(),
    const ListKuliPage(),
    const FavoriteKuliPage(),
    const AccountPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      backgroundColor: const Color(0xff002f48),
      icon: Icon(Icons.house),
      label: _homeText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: _listText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: _starText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: _accountText,
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
