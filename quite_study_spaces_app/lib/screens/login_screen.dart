import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/main.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/services/profile_service.dart';
import 'package:quite_study_spaces_app/widgets/background.dart';
import 'package:quite_study_spaces_app/widgets/quiet_Button.dart';

class LoginScreen extends StatefulWidget {
  final AuthService authService;

  const LoginScreen({super.key, required this.authService});

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

                    
                    final result = await widget.authService.logIn(
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
