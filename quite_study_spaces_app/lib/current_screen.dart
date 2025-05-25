/*
  current_screen.dart

  This acts as a central screen controller for the app.
  Listens to screen_state.dart and displays screens depending on 
  current screenStatus.

  If screenStatus is 'homeScreen', it loads the navBar widget, which wraps home screen
  in a navigation bar, allowing switching between homescreen, profile and favourites.

  This code can be easily added to, along with a status in screen_state.dart.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/login_screen.dart';
import 'package:quite_study_spaces_app/screens/signup_screen.dart';
import 'package:quite_study_spaces_app/widgets/nav_bar.dart';
import 'states/screen_state.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key});

  @override
  Widget build(context) {
    return Consumer<ScreenState>(
        builder: (context, state, child){
          return Container(
            color: const Color(0xffF2D3AC),
            child: switch(state.screenStatus) {
              "login" => LoginScreen(),
              "signUp" => SignupScreen(),
              //homescreen runs through navbar wrapper.
              "homeScreen" => const navBar(),
              _ => LoginScreen(),
            }
          );
        }
    );
  }
}