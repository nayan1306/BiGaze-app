// ignore_for_file: deprecated_member_use

import 'package:bigaze/ui/page/charts/line_chart.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:bigaze/widgets/profilecard.dart';
import 'package:bigaze/widgets/profilecardplaceholder.dart';
import 'package:bigaze/widgets/profileproctorcard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/ui/page/result_page.dart';
import 'package:bigaze/ui/page/scanner_page.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
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
        body: AnimatedBackground(
          behaviour: SpaceBehaviour(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
          vsync: this,
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProfileCard(
                    imagePath: 'assets/images/test_assets/profile_demo.jpeg',
                    name: 'Vikaṭa Bālakaḥ',
                    userId: 'vikaṭabālakaḥ13',
                    additionalInfo: 'Additional Information',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExamStatisticsWidget(
                      proctoredSessions: 65, highestScore: 92.19),
                  SizedBox(
                    height: 20,
                  ),
                  // ----------------------------------------------------------
                  ProfileCardPlaceholder(
                    child: Text(
                      "Comparative Analysis",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ProfileCardPlaceholder(
                    child: SizedBox(
                      height: 250,
                      child: LineChartWidget(),
                    ),
                  )

                  // -----------------------------------------------------------
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
