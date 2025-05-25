/*
  login_screen.dart

  App starts of this screen.

  This screen allows user to login with email and password
  through Firebase Auth. It will also give logged in user Authz to access
  Firebase Firestore database.

  On Successfil login, updates screenstate to go to home screen.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/main.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/widgets/background.dart';

class LoginScreen extends StatefulWidget {
  //final AuthService authService;

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiet Study Spaces"),
        actions: [],
      ),
      body: Stack(
        children: [
          const backgroundWidget(),
          Consumer<ScreenState>(builder: (context, state, child) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), 
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: darkgreen,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), 
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: darkgreen,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                  ),
                ),
                SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text("Please Enter a Valid Email and Password."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }

                    final authService = Provider.of<AuthService>(context, listen: false);
                    final result = await authService.logIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    if (result == 'Sucess') {
                      
                      state.goToHomeScreen();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result!),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text('Log In'),
                ),
                SizedBox(height: 16),
                Text('Not a user?'),
                OutlinedButton(
                  onPressed: state.goToSignUp,
                  child: Text("Sign Up"),
                ),
                
              ],
            ));
          }),
        ],
      ),
    );
  }
}
