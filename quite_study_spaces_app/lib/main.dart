import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/current_screen.dart';
import 'package:quite_study_spaces_app/screens/login_screen.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScreenState(),
      child: MaterialApp(
        home: const CurrentScreen(),
      )
    )
  );
}