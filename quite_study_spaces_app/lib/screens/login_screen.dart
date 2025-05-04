import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/login_screen.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/screens/home_screen.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiet Study Spaces"),
        actions: [],
      ),
      body: Consumer<ScreenState>(builder: (context, state, child) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "UserName"),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: state.logIn,
              child: Text('Log In'),
            ),
          ],
        ));
      }),
    );
  }
}
