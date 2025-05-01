import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/login_screen.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Locationstate(),
      child: MaterialApp(
        home: const LoginScreen(),
      )
    )
  );
}