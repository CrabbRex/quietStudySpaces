import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() {
    return _SignupScreen();
  }
}

class _SignupScreen extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, child) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: state.logOut,
            ),
            title: Text("Quiet Study Spaces"),
            actions: [],
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    //https://api.flutter.dev/flutter/material/ScaffoldMessenger-class.html
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please Enter a Valid Email and Password."),
                      duration: Duration(seconds: 2),
                    ));
                  }
                  state.signUp;
                },
                child: Text('Sign Up'),
              ),
            ],
          )));
    });
  }
}
