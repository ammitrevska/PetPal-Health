import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:petpal/screens/calendar.dart';
import 'package:petpal/screens/inicialization_screen.dart';
import 'package:petpal/screens/map_screen.dart';
import 'package:petpal/screens/medic_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const InitializePet(),
    const CalendarPage(),
    const MapScreen(),
    const MedicScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Show the current page
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromRGBO(249, 235, 162, 0.27),
        animationDuration: const Duration(milliseconds: 400),
        buttonBackgroundColor: const Color.fromRGBO(253, 197, 126, 1),
        items: const [
          Icon(Icons.home_rounded),
          Icon(Icons.calendar_today_rounded),
          Icon(Icons.pin_drop_rounded),
          Icon(Icons.local_hospital),
        ],
        onTap: (index) {
          // Handle onTap to update the current index
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
        
//Color.fromRGBO(243, 138, 0, 1)

