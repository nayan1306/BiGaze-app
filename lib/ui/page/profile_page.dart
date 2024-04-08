// ignore_for_file: deprecated_member_use

import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/ui/page/result_page.dart';
import 'package:bigaze/ui/page/scanner_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation based on index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResultsPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScannerPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
      // Add cases for other indexes as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the home page when the back button is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        return false; // Prevent the default back button behavior
      },
      child: Scaffold(
        appBar: const CommonAppBar(
          title: "Profile",
        ),
        bottomNavigationBar: CoolBottomNavigationBar(
          currentIndex: _currentIndex, // Pass current index
          onTap: _onItemTapped, // Handle tap event
        ),
        body: const Center(
          child: Text(
            'Profile Page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
