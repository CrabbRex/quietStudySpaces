import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/favourites_screen.dart';
import 'package:quite_study_spaces_app/screens/home_screen.dart';
import 'package:quite_study_spaces_app/screens/profile_screen.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';

class navBar extends StatelessWidget {
  const navBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenState = Provider.of<ScreenState>(context);

    final screen = [
      const favouriteScreen(),
      const HomeScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      //display the screen based on above list with index.
      body: screen[screenState.selectedNavIndex],
      //Add nav bar onto bottom of page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenState.selectedNavIndex,
        onTap: (index) => screenState.changeTab(index),
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withValues(alpha: 0.6),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ]
      ),
    );
  }
}