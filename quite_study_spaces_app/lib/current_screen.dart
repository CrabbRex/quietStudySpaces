import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/home_screen.dart';
import 'package:quite_study_spaces_app/screens/login_screen.dart';
import 'package:quite_study_spaces_app/screens/signup_screen.dart';
import 'states/screen_state.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Consumer<ScreenState>(
        builder: (context, state, child){
          return Container(
            color: const Color(0xffF2D3AC),
            child: switch(state.screenStatus) {
              "login" => LoginScreen(),
              "signup" => SignupScreen(),
              "homeScreen" => const HomeScreen(),
              _ => const LoginScreen(),
            }
          );
        }
      )
    );
  }
}