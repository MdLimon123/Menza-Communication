import 'package:flutter/material.dart';
import 'package:flutter_extension/views/base/bottom_menu.dart';
import 'package:flutter_extension/views/screen/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomMenu(
        menuIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
