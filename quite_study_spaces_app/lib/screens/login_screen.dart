import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Quiet Study Spaces"), actions: [],),
    );
  }
}