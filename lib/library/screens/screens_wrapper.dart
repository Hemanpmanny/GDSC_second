import 'package:flutter/material.dart';
import 'package:groupchat/library/screens/home/home_screen.dart';
import 'package:groupchat/library/screens/market/market_screen.dart';
import 'package:groupchat/library/screens/profile/profile_screen.dart';

class ScreensWrapper extends StatefulWidget {
  const ScreensWrapper({Key? key}) : super(key: key);

  @override
  _ScreensWrapperState createState() => _ScreensWrapperState();
}

class _ScreensWrapperState extends State<ScreensWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MarketScreen(),
    // const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          showUnselectedLabels: false,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined, size: 25),
              label: 'Book Store',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.person_outline,
            //     size: 25,
            //   ),
            //   label: 'Profile',
            // ),
          ],
        ),
      ),
    );
  }
}
