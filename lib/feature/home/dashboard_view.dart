import 'package:candito5_week/feature/home/home_view.dart';
import 'package:candito5_week/screens/current_lift_screen.dart';
import 'package:candito5_week/screens/cycle_view.dart';
import 'package:candito5_week/screens/lifts_screen.dart';
import 'package:candito5_week/screens/profile_page.dart';
import 'package:candito5_week/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(1);
  final PageController _pageController = PageController(initialPage: 1);

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex.value = value;
    });
    _pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (context, int index, child) {
        return Scaffold(
          body: PageView(
            
            controller: _pageController,
            children: <Widget>[
              const CycleView(),
              HomeView(
                index: _selectedIndex,
                pageController: _pageController,
              ),
              const ProfilePage(),
            ],
          ),
          backgroundColor: Colors.black,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset('assets/icons/Group 4.png'),
                icon: Image.asset('assets/icons/inactiverunicon.png'),
                label: 'Current Cycle',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset('assets/icons/home_page_icon.png'),
                icon: Image.asset('assets/icons/inactivehomeicon.png'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/example_profile_icon.png'),
                activeIcon:
                    Image.asset('assets/icons/example_profile_icon.png'),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex.value,
            onTap: _onTappedBar,
          ),
        );
      },
    );
  }
}
